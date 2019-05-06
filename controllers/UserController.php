<?php

namespace app\controllers;
use app\models\user\ChangePassword;
use app\models\user\UserAdd;
use app\models\user\UserSearch;
use app\models\User;
use kartik\grid\EditableColumnAction;
use Yii;
use yii\helpers\ArrayHelper;
use yii\web\Response;
use yii\base\UserException;
use yii\filters\VerbFilter;
use yii\mail\BaseMailer;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\widgets\ActiveForm;

class UserController extends Controller
{
    private $_oldMailPath;
    public function actions(){
        return ArrayHelper::merge(parent::actions(),[
            'editStatus' => [
                'class' => EditableColumnAction::className(),
                'modelClass' => User::className(),
                'outputValue' => function ($model, $attribute, $key, $index) {
                    return User::$aStatus[$model->$attribute];
                },
            ],
        ]);
    }
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['post'],
                    'logout' => ['post'],
                    'activate' => ['post'],
                ],
            ],
        ];
    }
    public function actionValidateForm(){
        Yii::$app->response->format = Response::FORMAT_JSON;
        $model = new ChangePassword();
        $model->load(Yii::$app->request->post());
        return ActiveForm::validate($model);
    }
    /**
     * @inheritdoc
     */
    public function beforeAction($action)
    {
        if (parent::beforeAction($action)) {
            if (Yii::$app->has('mailer') && ($mailer = Yii::$app->getMailer()) instanceof BaseMailer) {
                /* @var $mailer BaseMailer */
                $this->_oldMailPath = $mailer->getViewPath();
                $mailer->setViewPath('@mdm/admin/mail');
            }
            return true;
        }
        return false;
    }

    /**
     * @inheritdoc
     */
    public function afterAction($action, $result)
    {
        if ($this->_oldMailPath !== null) {
            Yii::$app->getMailer()->setViewPath($this->_oldMailPath);
        }
        return parent::afterAction($action, $result);
    }
    public function actionIndex()
    {
        $searchModel = new UserSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }
    public function actionCreate()
    {
        $model = new UserAdd();
        if ($model->load(Yii::$app->getRequest()->post()) && $model->create()) {
            return $this->redirect(['index']);
        } else {
            return $this->renderAjax('create', [
                'model' => $model,
            ]);
        }
    }
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();
        return $this->redirect(['index']);
    }
    public function actionActivate($id)
    {
        /* @var $user User */
        $user = $this->findModel($id);
        if ($user->status == User::STATUS_INACTIVE) {
            $user->status = User::STATUS_ACTIVE;
            if ($user->save()) {
                return $this->redirect(['index']);
            } else {
                $errors = $user->firstErrors;
                throw new UserException(reset($errors));
            }
        }
        return $this->goBack();
    }
    protected function findModel($id)
    {
        if (($model = User::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }

    public function actionChangePassword()
    {
        $model = new ChangePassword();
        if (Yii::$app->request->isPost) {
            if ($model->load(Yii::$app->getRequest()->post()) && $model->reset()){
                Yii::$app->getSession()->setFlash('success', '重置成功，请退出重新登录！');
                sleep(2);
                Yii::$app->user->logout();
                return $this->goHome();
            }
        }
        return $this->render('changePassword', [
            'model' => $model,
        ]);
    }
}
