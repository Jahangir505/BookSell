<?php
#app/Models/ShopUpazila.php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ShopUpazila extends Model
{
    public $table = 'shop_upazila';
    public $timestamps               = false;
    private static $getUpazilas     = null;
    private static $getListUpazilas = null;

    public static function getList()
    {
        if (self::$getListUpazilas == null) {
            self::$getListUpazilas = self::get()->keyBy('id');
        }
        return self::$getListUpazilas;
    }

    public static function getArray()
    {
        if (self::$getUpazilas == null) {
            self::$getUpazilas = self::pluck('name', 'id')->all();
        }
        return self::$getUpazilas;
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
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function districts()
    {
        return $this->belongsTo('App\Models\ShopDistrict');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
}
