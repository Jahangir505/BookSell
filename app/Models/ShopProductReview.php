<?php
#app/Models/ShopSubscribe.php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ShopProductReview extends Model
{
    protected $fillable = ['product_id', 'user_id', 'review'];
    public $table           = 'shop_product_review';
    protected $guarded      = [];

    public function getReview($product_id=0, $user_id=0)
    {
        $review = $this->where('product_id', $product_id)
            ->where('user_id', $user_id);
        $review = $review->first();
        if ($review) {
            return $review->review;
        } else {
            return $review;
        }
    }

    public function getCustomerReview($product_id = 0) {
        $review = $this->where('product_id', $product_id);
        $review = $review->count();
        return $review;
    }

    public function getProductReview($product_id = 0) {
        $review = $this->where('product_id', $product_id);
        $review = $review->avg('review');
        $review = round($review, 2);
        return $review;
    }

    public function getReviewAll()
    {
        $review = $this;
        return $review;
    }
}
