<?php
/**
 * Created by yii-plist
 * Author Smiths
 * Created at 2019/5/5 16:38
 */

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use app\models\User;

/* @var $this yii\web\View */
/* @var $model mdm\admin\models\Menu */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="menu-form">
    <?php $form = ActiveForm::begin(); ?>
    <div class="row">
        <div class="col-sm-6">
            <?= $form->field($model, 'username')->textInput(['maxlength' => 32]) ?>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-6">
            <?= $form->field($model, 'email')->textInput(['maxlength' => 32]) ?>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-6">
            <?= $form->field($model, 'status')->dropDownList(User::$aStatus,['prompt' => '状态']) ?>
        </div>
    </div>
    <div class="form-group">
        <?=
        Html::submitButton($model->isNewRecord ? Yii::t('rbac-admin', 'Create') : Yii::t('rbac-admin', 'Update'), ['class' => $model->isNewRecord
                    ? 'btn btn-success' : 'btn btn-primary'])
        ?>
    </div>
    <?php ActiveForm::end(); ?>
</div>