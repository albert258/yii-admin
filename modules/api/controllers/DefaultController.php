<?php

namespace app\modules\api\controllers;

use yii\web\Controller;
use Yii;

/**
 * Default controller for the `api` module
 */
class DefaultController extends Controller
{
    /**
     * Renders the index view for the module
     */
    public function actionIndex()
    {
        Yii::$app->response->format='json';
        return ['status' => 0,'msg' => 'not allow'];
    }
}
