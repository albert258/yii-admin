<?php
/**
 * Created by yii-plist
 * Author Smiths
 * Created at 2019/5/5 18:04
 */

namespace app\models\user;


use Yii;
use yii\base\Model;

class ChangePassword extends Model
{
    public $oldPassword;
    public $newPassword;
    public $retypePassword;

    public function rules()
    {
        return [
            [['oldPassword', 'newPassword', 'retypePassword'], 'required'],
            [['oldPassword'], 'validatePassword'],
            [['newPassword'], 'string', 'min' => 6],
            [['retypePassword'], 'compare', 'compareAttribute' => 'newPassword'],
        ];
    }

    public function validatePassword()
    {
        /* @var $user User */
        $user = Yii::$app->user->identity;
        if (!$user || !$user->validatePassword($this->oldPassword)) {
            $this->addError('oldPassword', Yii::t('rbac-admin','Incorrect Old Password'));
        }
    }
    public function reset(){
        if ($this->validate()) {
            /* @var $user User */
            $user = Yii::$app->user->identity;
            $user->setPassword($this->newPassword);
            $user->generateAuthKey();
            if ($user->save()) {
                return true;
            }
        }
        return false;
    }
    public function attributeLabels()
    {
        return [
            'oldPassword' => Yii::t('rbac-admin', 'Old Password'),
            'newPassword' => Yii::t('rbac-admin', 'New Password'),
            'retypePassword' => Yii::t('rbac-admin', 'Retype Password'),
        ];
    }
}