<?php

use app\components\Menu;
use mdm\admin\components\MenuHelper;
?>
<aside class="main-sidebar">

    <section class="sidebar">

        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="<?= $directoryAsset ?>/img/user2-160x160.jpg" class="img-circle" alt="User Image"/>
            </div>
            <div class="pull-left info">
                <p><?= Yii::$app->user->identity->username ?></p>

                <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
            </div>
        </div>

        <?php
        $callback = function($menu){
            $data = json_decode($menu['data'], true);
            $items = $menu['children'];
            $return = [
                'label' => $menu['name'],
                'url' => [$menu['route']],
            ];
            if ($data) {
                isset($data['visible']) && $return['visible'] = $data['visible'];
                isset($data['icon']) && $data['icon'] && $return['icon'] = $data['icon'];
                $return['options'] = $data;
            }
            (!isset($return['icon']) || !$return['icon']) && $return['icon'] = 'circle-o';
            $items && $return['items'] = $items;
            return $return;
        };
        echo Menu::widget(
            [
                'items' => MenuHelper::getAssignedMenu(Yii::$app->user->id,null,$callback),
            ]
        )
        ?>

    </section>

</aside>
