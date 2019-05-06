<?php

namespace app\modules\api\controllers;

use app\modules\api\models\UploadForm;
use yii\web\Controller;
use yii\web\UploadedFile;
use Yii;

/**
 * Default controller for the `api` module
 */
class UploadController extends Controller
{
    public $enableCsrfValidation = false;
    /**
     * Renders the index view for the module
     *
     */
    public function actionIndex()
    {
        $model = new UploadForm();
        if (Yii::$app->request->isPost){
            $model->ipafile = UploadedFile::getInstanceByName('ipafile');
            if (!$aResult = $model->upload()){
                foreach ($model->errors as $error) {
                    $msg = '';
                    $msg .= $error;
                }
                return $this->returnFailed($msg);
            }
            return $this->returnSuccess($aResult);
        }
        $data = $model->getData();
        return $this->returnSuccess($data);
    }
    /**
     *删除文件，
     */
    public function actionDelete(){
        if (!Yii::$app->request->isPost){
            $msg = "must post request";
            return $this->returnFailed($msg);
        }
        $model = new UploadForm();
        $model->identify = Yii::$app->request->post('identify','');
        $result = $model->delect();
        if (!$result){
            foreach ($model->errors as $error){
                $msg = '';
                $msg .= $error;
            }
            return $this->returnFailed($msg);
        }
        return $this->returnSuccess($result);
    }
    public function returnSuccess($data){
        $aReturnData = ['status' => 1,'data' => [],'msg' => ''];
        $aReturnData['data'] = $data;
        return $this->asJson($aReturnData);
    }
    public function returnFailed($msg){
        $aReturnData = ['status' => 0,'data' => [],'msg' => ''];
        $aReturnData['msg'] = $msg;
        return $this->asJson($aReturnData);
    }
}
