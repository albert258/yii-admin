<?php


namespace app\modules\api\models;
use yii\base\Model;
use Yii;
use yii\helpers\FileHelper;

class UploadForm extends Model
{
    public $errors = [];
    public $ipafile;
    public $identify;
    public $dir;
    public $_model = [
        'time' => "--",
        'md5'  => "--",
        'url'  => "--",
    ];
    public $_mapping = [
        'A' => 0,
        'B' => 1,
        'C' => 2,
        'D' => 3,
        'E' => 4,
    ];
    public function rules()
    {
        return [
            [['upload'], 'file', 'skipOnEmpty' => false, 'extensions' => 'ipa'],
            [['identify'],'string']
        ];
    }
    public function upload()
    {
        $this->identify = Yii::$app->request->post('identify','');
        if (empty($this->identify)){
            $this->errors[] = 'identify is empty';
            return false;
        }
        $aProductIdentify = explode('-',$this->identify);
        if (!$this->getDirPath($aProductIdentify)){
            $this->errors[] = 'mkdir failed';
            return false;
        }
        if ($this->ipafile->extension != 'ipa'){
            $this->errors[] = 'extension is not ipa';
            return false;
        }
        $file = $this->dir . '/' . strtolower($aProductIdentify[0]) . '_' . $aProductIdentify[1] . '.' . $this->ipafile->extension;
        if (is_file($file)) rename($file,$file . '.' .time() . '.' .'bak');
        if (!$this->ipafile->saveAs($file)){
            $this->errors[] = 'save file failed';
            return false;
        }
        $data = [
            'time' => date('Y-m-d H:i:s'),
            'md5'  => md5_file($file),
            'url'  => Yii::$app->params['plist_url'] . strtolower($aProductIdentify[0]) . '_' . $aProductIdentify[1] . '.' . 'plist',
        ];
        $cache = Yii::$app->cache;
        $sCacheKey = $this->getCacheKey($aProductIdentify[0]);
        $aCachedData = $cache->get($sCacheKey);
        $aCachedData[$this->_mapping[$aProductIdentify[1]]] = $data;
        $cache->set($sCacheKey,$aCachedData);
        return $aCachedData;
    }
    public function delect(){
        if ($this->identify === ""){
            $this->errors[] = 'identify is empty';
            return false;
        }
        $aProductIdentify = explode('-',$this->identify);
        $cache = Yii::$app->cache;
        $sCacheKey = $this->getCacheKey($aProductIdentify[0]);
        $aCachedData = $cache->get($sCacheKey);
        if ($aCachedData === false){
            $this->errors[] = 'no data delete';
            return false;
        }
        $aCachedData[$this->_mapping[$aProductIdentify[1]]] = $this->_model;
        $cache->set($sCacheKey,$aCachedData);
        return $aCachedData;
    }
    public function getDirPath($aProductIdentify){
        $this->dir = Yii::$app->params['upload_path'] . strtolower($aProductIdentify[0]) . '/' . $this->identify;
        return FileHelper::createDirectory($this->dir);
    }
    public function getCacheKey($sIdentify = null){
        if ($sIdentify === null){
            $sIdentify = Yii::$app->request->get('identify','PKW');
        }
        return 'upload_ipa_key_' . $sIdentify;
    }
    public function getData(){
        $sIdentify = Yii::$app->request->get('identify','PKW');
        $cache = Yii::$app->cache;
        $sCacheKey = $this->getCacheKey($sIdentify);
        $data = $cache->get($sCacheKey);
        if (!$data){
            foreach ($this->_mapping as $key => $item) {
                $this->_mapping[$sIdentify . '-' .$key] = $this->_model;
                unset($this->_mapping[$key]);
            }
            $aLdata = array_values($this->_mapping);
            $cache->set($sCacheKey,$aLdata);
            return $aLdata;
        }
        return $data;
    }
}