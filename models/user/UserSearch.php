<?php
/**
 * Created by yii-plist
 * Author Smiths
 * Created at 2019/5/5 15:24
 */

namespace app\models\user;
use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;

class UserSearch extends Model
{
    public $id;
    public $username;
    public $email;
    public $status;
    public $created_at;
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'status','created_at'], 'integer'],
            [['username', 'email'], 'safe'],
        ];
    }
    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        /* @var $query \yii\db\ActiveQuery */
        $class = Yii::$app->getUser()->identityClass ? : 'mdm\admin\models\User';
        $query = $class::find();

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);
        if (!$this->validate()) {
            $query->where('1=0');
            return $dataProvider;
        }

        $query->andFilterWhere([
            'id' => $this->id,
            'status' => $this->status,
        ]);

        $query->andFilterWhere(['like', 'username', $this->username])
            ->andFilterWhere(['like', 'email', $this->email]);

        return $dataProvider;
    }
}