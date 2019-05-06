<?php
/**
 * Created by yii-plist
 * Author Smiths
 * Created at 2019/5/5 18:16
 */
use yii\helpers\Html;
use yii\bootstrap\ActiveForm;
use yii\helpers\Url;

/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */
/* @var $model \mdm\admin\models\form\ChangePassword */

$this->title = Yii::t('rbac-admin', 'Change Password');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="site-signup">
    <h1><?= Html::encode($this->title) ?></h1>

    <div class="row">
        <div class="col-lg-5">
            <?php $form = ActiveForm::begin([
                'id'                   => 'form-change',
                'enableAjaxValidation' => true,
                'validationUrl'        => Url::toRoute(['validate-form']),
            ]); ?>
            <div class="row">
                <div class="col-sm-6">
                    <?= $form->field($model, 'oldPassword')->passwordInput() ?>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6">
                    <?= $form->field($model, 'newPassword')->passwordInput() ?>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6">
                    <?= $form->field($model, 'retypePassword')->passwordInput() ?>
                </div>
            </div>
            <div class="form-group">
                <?= Html::submitButton(Yii::t('rbac-admin', 'Change'), ['class' => 'btn btn-primary', 'name' => 'change-button']) ?>
            </div>
            <?php ActiveForm::end(); ?>
        </div>
    </div>
</div>