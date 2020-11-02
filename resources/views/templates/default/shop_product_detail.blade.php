@extends('templates.'.sc_store('template').'.shop_layout')

@section('center')
          <div class="product-details"><!--product-details-->
            <div class="col-sm-6">


              <div id="product-detail-image" class="carousel slide" data-ride="carousel">
                    <!-- Wrapper for slides -->
                    <div class="carousel-inner">
                      <div class="view-product item active"  data-slide-number="0">
                        <img src="{{ asset($product->getImage()) }}" alt="">
                      </div>
                    @if ($product->images->count())
                       @foreach ($product->images as $key=>$image)
                        <div class="view-product item"  data-slide-number="{{ $key + 1 }}">
                          <img src="{{ asset($image->getImage()) }}" alt="">
                        </div>
                        @endforeach
                    @endif
                    </div>
                  {{-- </div> --}}
              </div>
              @if ($product->images->count())
                    <!-- Controls -->
                    <a class="left item-control" style="display: inherit;" href="#product-detail-image" data-slide="prev">
                    <i class="fa fa-angle-left"></i>
                    </a>
                    <a class="right item-control" href="#product-detail-image" data-slide="next">
                    <i class="fa fa-angle-right"></i>
                    </a>
                @endif
            </div>

        <form id="buy_block" action="{{ route('cart.add') }}" method="post">
          {{ csrf_field() }}
          <input type="hidden" name="product_id" id="product-detail-id" value="{{ $product->id }}" />
            <div class="col-sm-6">
              <div class="product-information"><!--/product-information-->
                @if ($product->price != $product->getFinalPrice())
                <img src="{{ asset('templates/'.sc_store('template').'/images/home/sale2.png') }}" class="newarrival" alt="" />
                @elseif($product->type == SC_PRODUCT_NEW)
                <img src="{{ asset('templates/'.sc_store('template').'/images/home/new2.png') }}" class="newarrival" alt="" />
                {{-- @elseif($product->type == SC_PRODUCT_HOT)
                <img src="{{ asset('templates/'.sc_store('template').'/images/home/hot2.png') }}" class="newarrival" alt="" /> --}}
                @endif
                <p>{{ $review->getProductReview($product->id) }} out of 5 stars <br>{{ $review->getCustomerReview($product->id) }} customer reviews</p>
                <br>
                <h2  id="product-detail-name">{{ $product->name }}</h2>
                <h5 id="product-detail-name"><strong>Shop Name: </strong> {{ empty($shop->name)?'None':$shop->name }}</h5>
                <p>SKU: <span  id="product-detail-model">{{ $product->sku }}</span></p>
                <div id="product-detail-price">
                  {!! $product->showPrice() !!}
                </div>
                <span>
                  <label>{{ trans('product.quantity') }}:</label>
                  <input type="number" name="qty" value="1" min="1" />
                  <button type="submit" class="btn btn-fefault cart">
                    <i class="fa fa-shopping-cart"></i>
                    {{trans('front.add_to_cart')}}
                  </button>
                </span>
                <div  id="product-detail-attr">
                  @if ($product->attributes())
                  {!! $product->renderAttributeDetails() !!}
                  @endif
                </div>
                <b>{{ trans('product.availability') }}:</b>
                <span id="product-detail-available">
                    @if (sc_config('show_date_available') && $product->date_available >= date('Y-m-d H:i:s'))
                    {{ $product->date_available }}
                    @elseif($product->stock <=0 && sc_config('product_buy_out_of_stock') == 0)
                    {{ trans('product.out_stock') }}
                    @else
                    {{ trans('product.in_stock') }}
                    @endif
                </span>
                <br>
                <b>Writer Name:</b> <span id="product-detail-brand">{{ empty($product->writer)?'None':$product->writer }}</span><br>
                <b>Type:</b> <span id="product-detail-brand">{{ empty($types[$product->type])?'None':$types[$product->type] }}</span><br>
                <b>Category:</b> <span id="product-detail-brand">{{ empty($category->name)?'None':$category->name }}</span><br>
                <br>
                {{-- product review --}}

                
                <div class="rate">
                  <b>Rate This Product</b>
                  <br>
                  <input data-product_id="{{ $product->id }}" onChange="updateRating($(this));" type="radio" id="star5" name="rate" value="5" @if ($review && Auth::user()) {{ $review->getReview($product->id, Auth::user()->id) == 5 ? 'checked': '' }} @endif />
                  <label for="star5" title="text">5 stars</label>
                  <input data-product_id="{{ $product->id }}" onChange="updateRating($(this));" type="radio" id="star4" name="rate" value="4" @if ($review && Auth::user()) {{ $review->getReview($product->id, Auth::user()->id) == 4 ? 'checked': '' }} @endif />
                  <label for="star4" title="text">4 stars</label>
                  <input data-product_id="{{ $product->id }}" onChange="updateRating($(this));" type="radio" id="star3" name="rate" value="3" @if ($review && Auth::user()) {{ $review->getReview($product->id, Auth::user()->id) == 3 ? 'checked': '' }} @endif />
                  <label for="star3" title="text">3 stars</label>
                  <input data-product_id="{{ $product->id }}" onChange="updateRating($(this));" type="radio" id="star2" name="rate" value="2" @if ($review && Auth::user()) {{ $review->getReview($product->id, Auth::user()->id) == 2 ? 'checked': '' }} @endif />
                  <label for="star2" title="text">2 stars</label>
                  <input data-product_id="{{ $product->id }}" onChange="updateRating($(this));" type="radio" id="star1" name="rate" value="1" @if ($review && Auth::user()) {{ $review->getReview($product->id, Auth::user()->id) == 1 ? 'checked': '' }} @endif />
                  <label for="star1" title="text">1 star</label>
                </div>

              </div><!--/product-information-->
            </div>
          </div><!--/product-details-->
        </form>

          <div class="category-tab shop-details-tab"><!--category-tab-->
            <div class="col-sm-12">
              <ul class="nav nav-tabs">
                <li class="active"><a href="#details" data-toggle="tab">{{ trans('product.description') }}</a></li>
              </ul>
            </div>
            <div class="tab-content">
              <div class="tab-pane fade  active in" id="product-detail-content" >
                {!! sc_html_render($product->content) !!}
              </div>
            </div>
          </div><!--/category-tab-->
@if ($productsToCategory->count())
          <div class="recommended_items"><!--recommended_items-->
            <h2 class="title text-center">{{ trans('front.recommended_items') }}</h2>

            <div id="recommended-item-carousel" class="carousel slide">
              <div class="carousel-inner">
               @foreach ($productsToCategory as  $key => $product_rel)
                @if ($key % 4 == 0)
                  <div class="item {{  ($key ==0)?'active':'' }}">
                @endif
                  <div class="col-sm-3">
                    <div class="product-image-wrapper product-single">
                      <div class="single-products">
                        <div class="productinfo text-center product-box-{{ $product_rel->id }}">
                          <a href="{{ $product_rel->getUrl() }}"><img src="{{ asset($product_rel->getThumb()) }}"
                              alt="{{ $product_rel->name }}" /></a>

                          {!! $product_rel->showPrice() !!}

                          <a href="{{ $product_rel->getUrl() }}">
                            <h5>{{ $product_rel->name }}</h5>
                            <p>{{ $product_rel->writer }}</p>
                          </a>
                          @if ($product_rel->allowSale())
                          <a class="btn btn-default add-to-cart" onClick="addToCartAjax('{{ $product_rel->id }}','default')"><i
                              class="fa fa-shopping-cart"></i>{{trans('front.add_to_cart')}}</a>
                          @else
                          &nbsp;
                          @endif
                          <p style="font-size: 10px; color: #999; text-transform: uppercase;">{{ $types[$product_rel->type] }}</p>
                        </div>
                        @if ($product_rel->price != $product_rel->getFinalPrice())
                        <img src="{{ asset('templates/'.sc_store('template').'/images/home/sale.png') }}" class="new" alt="" />
                        @elseif($product_rel->type == SC_PRODUCT_NEW)
                        <img src="{{ asset('templates/'.sc_store('template').'/images/home/new.png') }}" class="new" alt="" />
                        {{-- @elseif($product_rel->type == SC_PRODUCT_HOT)
                        <img src="{{ asset('templates/'.sc_store('template').'/images/home/hot.png') }}" class="new" alt="" /> --}}
                        @endif
                      </div>
                      <div class="choose">
                        <ul class="nav nav-pills nav-justified">
                          <li><a onClick="addToCartAjax({{ $product_rel->id }},'wishlist')"><i
                            class="fa fa-plus-square"></i>{{trans('front.add_to_wishlist')}}</a></li>
                          {{-- <li><a onClick="addToCartAjax({{ $product_rel->id }},'compare')"><i
                                class="fa fa-plus-square"></i>{{trans('front.add_to_compare')}}</a></li> --}}
                        </ul>
                      </div>
                    </div>
                  </div>
                @if ($key % 4 == 3)
                  </div>
                @endif
               @endforeach
              </div>
            </div>
          </div><!--/recommended_items-->
@endif


@endsection

@section('breadcrumb')
    <div class="breadcrumbs">
        <ol class="breadcrumb">
          <li><a href="{{ route('home') }}">Home</a></li>
          <li class="active">{{ $title }}</li>
        </ol>
      </div>
@endsection

@push('styles')

@endpush

@push('scripts')
<script type="text/javascript">
  $('.product-group').click(function(event) {
    if($(this).hasClass('active')){
      return;
    }
    $('.product-group').removeClass('active');
    $(this).addClass('active');
    var id = $(this).data("id");
      $.ajax({
          url:'{{ route("product.info") }}',
          type:'POST',
          dataType:'json',
          data:{id:id,"_token": "{{ csrf_token() }}"},
          beforeSend: function(){
              $('#loading').show();
          },
          success: function(data){
            console.log(data);
            $('#product-detail-name').html(data.name);
            $('#product-detail-model').html(data.sku);
            $('#product-detail-price').html(data.showPrice);
            $('#product-detail-brand').html(data.brand_name);
            $('#product-detail-image').html(data.showImages);
            $('#product-detail-available').html(data.availability);
            $('#product-detail-id').val(data.id);
            $('#product-detail-image').carousel();
            $('#loading').hide();
            window.history.pushState("", "", data.url);            
          }
      });

  });

  function updateRating(obj){
    var rating = obj.val();
    var product_id = obj.data('product_id');
    var id = obj.data('id');
        $.ajax({
        url: '{{ route('review') }}',
        type: 'POST',
        dataType: 'json',
        async: false,
        cache: false,
        data: {
            rating: rating,
            product_id: product_id,
            user_id: 8,
            _token:'{{ csrf_token() }}'},
        success: function(data){
            error= parseInt(data.error);
            if(error ===0)
            {
                    window.location.replace(location.href);
            }

            }
    });
  }
</script>
@endpush
