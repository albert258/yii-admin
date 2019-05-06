<?php

namespace app\models;

use Yii;
use yii\base\NotSupportedException;
use yii\behaviors\TimestampBehavior;
use yii\db\ActiveRecord;
use yii\web\IdentityInterface;

class User extends ActiveRecord implements IdentityInterface
{
    const STATUS_INACTIVE = 0;
    const STATUS_ACTIVE = 10;
    public function behaviors()
    {
        return [
            'class' => TimestampBehavior::className(),
        ];
    }
    public static function tableName()
    {
        return 'user';
    }
    public static $aStatus = [
//        self::STATUS_INACTIVE => Yii::t('rbac-admin','Inactive'),
//        self::STATUS_ACTIVE => Yii::t('rbac-admin','Active'),
        0 => '未激活',
        10 => '已激活',
    ];
    public function rules()
    {
        return [
            ['status', 'in', 'range' => [self::STATUS_ACTIVE, self::STATUS_INACTIVE]],
        ];
    }
    /**
     * {@inheritdoc}
     */
    public static function findIdentity($id)
    {
        return static::findOne(['id' => $id, 'status' => self::STATUS_ACTIVE]);
    }

    /**
     * {@inheritdoc}
     */
    public static function findIdentityByAccessToken($token, $type = null)
    {
        throw new NotSupportedException('"findIdentityByAccessToken" is not implemented.');
    }

    /**
     * Finds user by username
     *
     * @param string $username
     * @return static|null
     */
    public static function findByUsername($username)
    {
        return static::findOne(['username' => $username, 'status' => self::STATUS_ACTIVE]);
    }

    /**
     * {@inheritdoc}
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * {@inheritdoc}
     */
    public function getAuthKey()
    {
        return $this->getPrimaryKey();
    }

    /**
     * {@inheritdoc}
     */
    public function validateAuthKey($authKey)
    {
        return $this->auth_key;
    }
    public function setPassword($password)
    {
        $this->password_hash = Yii::$app->security->generatePasswordHash($password);
    }
    public function generateAuthKey()
    {
        $this->auth_key = Yii::$app->security->generateRandomString();
    }
    /**
     * Validates password
     *
     * @param string $password password to validate
     * @return bool if password provided is valid for current user
     */
    public function validatePassword($password)
    {
        return Yii::$app->security->validatePassword($password, $this->password_hash);
    }
    public function attributeLabels()
    {
        return [
            'username' => Yii::t('rbac-admin', 'Username'),
            'status' => Yii::t('rbac-admin', 'Status'),
            'email' => Yii::t('rbac-admin', 'Email'),
            'created_at' => Yii::t('rbac-admin', 'Created At'),
        ];
    }
}
