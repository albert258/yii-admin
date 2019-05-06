<?php

use yii\helpers\Html;
//use yii\grid\GridView;
use mdm\admin\components\Helper;
use kartik\dynagrid\DynaGrid;
use kartik\editable\Editable;
use kartik\grid\GridView;
use app\models\User;
use yii\bootstrap\Modal;
use yii\helpers\Url;

/* @var $this yii\web\View */
/* @var $searchModel mdm\admin\models\searchs\User */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('rbac-admin', 'Users');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="user-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <p>
        <p></p>
    </p>
    <?php
    $columns = [
        ['class'=>'kartik\grid\SerialColumn', 'order'=>DynaGrid::ORDER_FIX_LEFT],
        'username',
        'email',
        [
            'attribute'=>'status',
            'value' => function ($model) {
                return User::$aStatus[$model->status];
            },
            'class'=>'kartik\grid\EditableColumn',
            'editableOptions' => [
                'asPopover' => false,
                'inputType' => Editable::INPUT_DROPDOWN_LIST,
                'data' => User::$aStatus,
                'formOptions' => ['action' => ['/user/editStatus']],
            ],
        ],
        [
            'attribute'=>'created_at',
            'value' => function($model){
                return date('Y-m-d H:i:s',$model->created_at);
            }
        ],
        [
            'class' => 'yii\grid\ActionColumn',
            'template' => Helper::filterActionColumn(['view', 'activate', 'delete']),
            'buttons' => [
                'activate' => function($url, $model) {
                    if ($model->status == 10) {
                        return '';
                    }
                    $options = [
                        'title' => Yii::t('rbac-admin', 'Activate'),
                        'aria-label' => Yii::t('rbac-admin', 'Activate'),
                        'data-confirm' => Yii::t('rbac-admin', 'Are you sure you want to activate this user?'),
                        'data-method' => 'post',
                        'data-pjax' => '0',
                    ];
                    return Html::a('<span class="glyphicon glyphicon-ok"></span>', $url, $options);
                }
            ]
        ],
    ];
    echo DynaGrid::widget([
        'columns'=>$columns,
        'storage'=>DynaGrid::TYPE_COOKIE,
        'theme'=>'panel-danger',
        'gridOptions'=>[
            'dataProvider'=>$dataProvider,
            'filterModel'=>$searchModel,
            'panel'=>['heading'=>'<h3 class="panel-title">' . $this->title .'</h3>'],
            'pjax' => true,
            'toolbar' => [
                [
                    'content' => Html::a('添加管理员', '#', [
                        'class' => 'btn btn-success ',
                        'data-toggle' => 'modal',
                        'data-target' => '#create-modal-user',
                        'id' => 'create'
                    ])
                ],
                [ 'content' => '{dynagrid}'],
                '{toggleData}',
            ]
        ],
        'options'=>['id'=>'dynagrid-users-list']
    ]);
    ?>
</div>

<?php
Modal::begin([
    'id' => 'create-modal-user',
    'header' => '<h4 align="center">添加管理员</h4>',
    'footer' => '<a href="#" class="btn btn-primary" data-dismiss="modal">关闭</a>',
    'headerOptions' => [
        'style' => 'background-color: #3c8dbc;'
    ],
    'bodyOptions' => [
        'class' => 'modal-body',

    ]
]);
Modal::end();
$requestUrl = Url::toRoute('create');
$js = <<<JS
    $(document).on('click', '#create', function (e) {
        $.get('{$requestUrl}', {},
            function (data) {
                $($('#create-modal-user').children().children().children()[1]).html(data);
            }  
        );
    });
JS;
$this->registerJs($js);
?>