<?php
#app/Models/ShopDistrict.php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ShopDistrict extends Model
{
    public $table                    = 'shop_district';
    public $timestamps               = false;
    private static $getDistricts     = null;
    private static $getListDistricts = null;

    public static function getList()
    {
        if (self::$getListDistricts == null) {
            self::$getListDistricts = self::get()->keyBy('id');
        }
        return self::$getListDistricts;
    }

    public static function getArray()
    {
        if (self::$getDistricts == null) {
            self::$getDistricts = self::pluck('name', 'id')->all();
        }
        return self::$getDistricts;
    }

    public static function mapValue()
    {
        $listCountry = self::getArray();
        $new_arr     = [];
        foreach ($listCountry as $key => $value) {
            $new_arr[] = ['value' => $key, 'text' => $value];
        }
        return $new_arr;
    }

    public function country()
    {
        return $this->belongsTo('App\Models\ShopCountry');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function upazilas()
    {
        return $this->hasMany('App\Models\ShopUpazila');
    }
    
    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
}
