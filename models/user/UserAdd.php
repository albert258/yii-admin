<?php
/**
 * Created by yii-plist
 * Author Smiths
 * Created at 2019/5/5 17:19
 */

namespace app\models\user;


use Yii;
use yii\helpers\ArrayHelper;
use app\models\User;

class UserAdd extends User
{
    public $username;
    public $email;
    public $status;
    public $password = '123456';

    public function rules()
    {
        $class = Yii::$app->getUser()->identityClass;
        return [
            ['username', 'filter', 'filter' => 'trim'],
            ['username', 'required'],
            ['username', 'unique', 'targetClass' => $class, 'message' => 'This username has already been taken.'],
            ['username', 'string', 'min' => 4, 'max' => 32],

            ['email', 'filter', 'filter' => 'trim'],
            ['email', 'required'],
            ['email', 'email'],
            ['email', 'unique', 'targetClass' => $class, 'message' => 'This email address has already been taken.'],

            [['status'], 'integer'],
            ['status', 'in', 'range' => [User::STATUS_ACTIVE, User::STATUS_INACTIVE]]
        ];
    }
    /**
     * Signs user up.
     *
     * @return User|null the saved model or null if saving fails
     */
    public function create()
    {
        if ($this->validate()) {
            $user = new User();
            $user->username = $this->username;
            $user->email = $this->email;
            $user->status = ArrayHelper::getValue(Yii::$app->params, 'user.defaultStatus', User::STATUS_INACTIVE);
            $user->setPassword($this->password);
            $user->generateAuthKey();
            if ($user->save()) {
                return $user;
            }
        }
        return null;
    }
}