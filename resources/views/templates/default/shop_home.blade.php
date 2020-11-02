@extends('templates.'.sc_store('template').'.shop_layout')

@section('main')

<div class="container home">
  {{-- <h2 class="title text-center"><span>{{ $title }}</span></h2> --}}
  <div class="row">
    <div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="0">
      <!-- Wrapper for carousel items -->
      <div class="carousel-inner">
        @if (!empty($vendorList))
        @foreach ($vendorList as $key => $vendor)
        @if ($key % 8 === 0)
        <div class="item carousel-item {{  ($key ==0)?'active':'' }}">
          <div class="row">
            @endif
            <div class="vendor-carusel"> 
              <div class="product-image-wrapper product-single">
                <div class="single-products">
                  <div class="vendor shopinfo text-center product-box-{{ $vendor->id }}">
                    <a href="{{ $vendor->getUrl() }}"><img src="{{ asset($vendor->getImage()) }}"
                        alt="{{ $vendor->name }}" /></a>
                    <a href="{{ $vendor->getUrl() }}">
                      <h3>{{ $vendor->name }}</h3>
                      <p><i class="fas fa-map-marker-alt"></i> {{ $vendor->address }}</p>
                    </a>
                  </div>
                </div>
              </div>
            </div>
            @if ($key % 8 == 7 || $key+1 == $vendorList->count())
          </div>
        </div>
        @endif
        @endforeach
        @endif
      </div>
      <!-- Carousel controls -->
      <a class="carousel-control left carousel-control-prev" href="#myCarousel" data-slide="prev">
        <i class="fa fa-angle-left"></i>
      </a>
      <a class="carousel-control right carousel-control-next" href="#myCarousel" data-slide="next">
        <i class="fa fa-angle-right"></i>
      </a>
    </div>
    <div style="clear: both; ">
      <ul class="pagination">
        <li><a href="{{ route('vendors') }}">View All <i class="fa fa-arrow-right"></i></a></li>
      </ul>
    </div>
  </div>
</div>





@foreach ($itemsList as $item)
@php
$products = $item->getProductsToVendor($item->id, $limit = sc_config('product_list'), $opt = 'random');
@endphp

@if (count($products) !==0)
<div class="features_items home">

  <h2 class="title text-center"><span>{{ $item->name }}</span></h2>

  <div id="{{ $item->id }}" class="carousel slide" data-ride="carousel" data-interval="0">
    <!-- Wrapper for carousel items -->

    <div class="carousel-inner">
      @foreach ($products as $key => $product)

      @if ($key % 6 === 0)
      <div class="item carousel-item {{  ($key ==0)?'active':'' }}">
        <div class="row">
          @endif
          <div class="vendor-item">
            <div class="product-image-wrapper product-single">
              <div class="single-products">
                <div class="productinfo text-center product-box-{{ $product->id }}">
                  <a href="{{ $product->getUrl() }}"><img src="{{ asset($product->getThumb()) }}"
                      alt="{{ $product->name }}" /></a>

                  {!! $product->showPrice() !!}

                  

                  <a href="{{ $product->getUrl() }}">
                    <h5>{{ $product->name }}</h5>
                    <p>{{ $product->writer }}</p>
                  </a>
                  @if ($product->allowSale())
                  <a class="btn btn-default add-to-cart" onClick="addToCartAjax('{{ $product->id }}','default')"><i
                      class="fa fa-shopping-cart"></i>{{trans('front.add_to_cart')}}</a>
                  @else
                  &nbsp;
                  @endif
                  <p style="font-size: 10px; color: #999; text-transform: uppercase;">{{ $types[$product->type] }}</p>
                </div>
                <!--@if ($product->price != $product->getFinalPrice())-->
                <!--  <img src="{{ asset('templates/'.sc_store('template').'/images/home/sale.png') }}" class="new" alt="" />-->
                <!--{{--@elseif($product->type == SC_PRODUCT_NEW)-->
                <!--  <img src="{{ asset('templates/'.sc_store('template').'/images/home/new.png') }}" class="new" alt="" />-->
                <!-- @elseif($product->type == SC_PRODUCT_HOT)-->
                <!--<img src="{{ asset('templates/'.sc_store('template').'/images/home/hot.png') }}" class="new" alt="" /> --}}-->
                <!--@endif-->

               @if($product->promotionPrice['status_promotion'] == 1)
                   @php

                      $main = $product->price;
                      $promotion = $product->promotionPrice['price_promotion'];

                      

                      $promoPrice = $main-$promotion;
                      
                      $discount = $promoPrice * 100 / $main;

                      
                     //var_dump($discount);
                    @endphp
                    <span class="badg">{{round($discount)}}%</span>
                @endif
              </div>
              <div class="choose">
                <ul class="nav nav-pills nav-justified">
                  <li><a onClick="addToCartAjax({{ $product->id }},'wishlist')"><i
                    class="fa fa-plus-square"></i>{{trans('front.add_to_wishlist')}}</a></li>
                  {{-- <li><a onClick="addToCartAjax({{ $product->id }},'compare')"><i
                        class="fa fa-plus-square"></i>{{trans('front.add_to_compare')}}</a></li> --}}
                </ul>
              </div>
            </div>
          </div>
          @if ($key % 6 == 5 || $key+1 == $products->count())
        </div>
      </div>
      @endif
      @endforeach

    </div>
 
    <!-- Carousel controls -->
    <a class="carousel-control left carousel-control-prev" href="#{{ $item->id }}" data-slide="prev">
      <i class="fa fa-angle-left"></i>
    </a>
    <a class="carousel-control right carousel-control-next" href="#{{ $item->id }}" data-slide="next">
      <i class="fa fa-angle-right"></i>
    </a>
  </div>
</div>
@endif






{{-- @if (count($products) !==0)
<div class="features_items">

  <h2 class="title text-center">Product of {{ $item->name }} Shop</h2>

@foreach ($products as $key => $product)
<div class="col-sm-3 col-xs-6">
  <div class="product-image-wrapper product-single">
    <div class="single-products">
      <div class="productinfo text-center product-box-{{ $product->id }}">
        <a href="{{ $product->getUrl() }}"><img src="{{ asset($product->getThumb()) }}"
            alt="{{ $product->name }}" /></a>

        {!! $product->showPrice() !!}

        <a href="{{ $product->getUrl() }}">
          <p>{{ $product->name }}</p>
        </a>
        @if ($product->allowSale())
        <a class="btn btn-default add-to-cart" onClick="addToCartAjax('{{ $product->id }}','default')"><i
            class="fa fa-shopping-cart"></i>{{trans('front.add_to_cart')}}</a>
        @else
        &nbsp;
        @endif
      </div>
      <!--@if ($product->price != $product->getFinalPrice())-->
      <!--<img src="{{ asset('templates/'.sc_store('template').'/images/home/sale.png') }}" class="new" alt="" />-->
      <!--@elseif($product->type == SC_PRODUCT_NEW)-->
      <!--<img src="{{ asset('templates/'.sc_store('template').'/images/home/new.png') }}" class="new" alt="" />-->
      <!--@elseif($product->type == SC_PRODUCT_HOT)-->
      <!--<img src="{{ asset('templates/'.sc_store('template').'/images/home/hot.png') }}" class="new" alt="" />-->
      <!--@endif-->
    </div>
    <div class="choose">
      <ul class="nav nav-pills nav-justified">
        <li><a onClick="addToCartAjax({{ $product->id }},'wishlist')"><i
              class="fa fa-plus-square"></i>{{trans('front.add_to_wishlist')}}</a></li>
        <li><a onClick="addToCartAjax({{ $product->id }},'compare')"><i
              class="fa fa-plus-square"></i>{{trans('front.add_to_compare')}}</a></li>
      </ul>
    </div>
  </div>
</div>
@endforeach
@endif --}}

@if (count($products) !==0)
<div style="clear: both; ">
  <ul class="pagination">
    <li><a href="{{ $item->getUrl() }}">View All <i class="fa fa-arrow-right"></i></a></li>
  </ul>
</div>
@endif
@endforeach


  <div class="features_items home">
      <div class="container">
        <div class="row">
          @foreach($banner as $ban)
            <div class="col-sm-6">
              <div class="banner">
                <a href="{{$ban->url}}" target="_blank"><img src="{{ asset($ban->getThumb()) }}"
                      alt="" /></a>
              </div>
            </div>

            @endforeach
           
        </div>
      </div>
  </div>



<!-- Must Read 100 Books -->

@if (count($mustRead) !==0)
<div class="features_items home">

  <h2 class="title text-center"><span>Must Read 100 Books </span></h2>

  <div id="must-read-{{ $product->id }}" class="carousel slide" data-ride="carousel" data-interval="0">
    <!-- Wrapper for carousel items -->

    <div class="carousel-inner">
      @foreach ($mustRead as $active => $product)

      @if ($active % 6 === 0)
      <div class="item carousel-item {{  ($active ==0)?'active':'' }}">
        <div class="row">
          @endif
          <div class="vendor-item">
            <div class="product-image-wrapper product-single">
              <div class="single-products">
                <div class="productinfo text-center product-box-{{ $product->id }}">
                  <a href="{{ $product->getUrl() }}"><img src="{{ asset($product->getThumb()) }}"
                      alt="{{ $product->name }}" /></a>

                   {!! $product->showPrice() !!}
 
                  <a href="{{ $product->getUrl() }}">
                    <h5>{{ $product->name }}</h5>
                    <p>{{ $product->writer }}</p>
                  </a>
                  @if ($product->allowSale())
                  <a class="btn btn-default add-to-cart" onClick="addToCartAjax('{{ $product->id }}','default')"><i
                      class="fa fa-shopping-cart"></i>{{trans('front.add_to_cart')}}</a>
                  @else
                  &nbsp;
                  @endif
                  <p style="font-size: 10px; color: #999; text-transform: uppercase;">{{ $types[$product->type] }}</p>
                </div>
               <!--  @if ($product->price != $product->getFinalPrice())
                  <img src="{{ asset('templates/'.sc_store('template').'/images/home/sale.png') }}" class="new" alt="" />
                @elseif($product->type == SC_PRODUCT_NEW)
                  <img src="{{ asset('templates/'.sc_store('template').'/images/home/new.png') }}" class="new" alt="" />
                {{-- @elseif($product->type == SC_PRODUCT_HOT)
                <img src="{{ asset('templates/'.sc_store('template').'/images/home/hot.png') }}" class="new" alt="" /> --}}
                @endif -->

                @if($product->promotionPrice['status_promotion'] == 1)
                       @php

                          $main = $product->price;
                          $promotion = $product->promotionPrice['price_promotion'];

                          

                          $promoPrice = $main-$promotion;
                          
                          $discount = $promoPrice * 100 / $main;

                          
                         //var_dump($discount);
                        @endphp
                        <span class="badg">{{round($discount)}}%</span>
                    @endif
              </div>
              <div class="choose">
                <ul class="nav nav-pills nav-justified">
                  <li><a onClick="addToCartAjax({{ $product->id }},'wishlist')"><i
                    class="fa fa-plus-square"></i>{{trans('front.add_to_wishlist')}}</a></li>
                  {{-- <li><a onClick="addToCartAjax({{ $product->id }},'compare')"><i
                        class="fa fa-plus-square"></i>{{trans('front.add_to_compare')}}</a></li> --}}
                </ul>
              </div>
            </div>
          </div>
          @if ($key % 6 == 5 || $key+1 == $products->count())
        </div>
      </div>
      @endif



      @endforeach

    </div>
 
    <!-- Carousel controls -->
    <a class="carousel-control left carousel-control-prev" href="#{{ $product->id }}" data-slide="prev">
      <i class="fa fa-angle-left"></i>
    </a>
    <a class="carousel-control right carousel-control-next" href="#{{ $product->id }}" data-slide="next">
      <i class="fa fa-angle-right"></i>
    </a>
  </div>
</div>
@endif

<div style="clear: both; ">
  <ul class="pagination">
    <li><a href="https://bookimind.com/category/must-read-100-books_70">View All <i class="fa fa-arrow-right"></i></a></li>
  </ul>
</div>







@foreach ($category as $cat)

@if (count($cat->products) !==0)
<div class="category-items home">

  <h2 class="title text-center"><span>{{ $cat->name }}</span></h2>

  <div id="category-products-{{ $cat->id }}" class="carousel slide" data-ride="carousel" data-interval="0">
    <!-- Wrapper for carousel items -->
    @php
    $intent = 0;
    $product_loop = 0;
    @endphp
    <div class="carousel-inner">
        @foreach( $cat->products->chunk(6) as $active => $products )
            <div class="item carousel-item {{ ($active == 0)?'active':'' }}">
            <div class="row">
            @foreach ($products as $key => $product)
              <div class="vendor-item">
                <div class="product-image-wrapper product-single">
                  <div class="single-products">
                    <div class="productinfo text-center product-box-{{ $product->id }}">
                      <a href="{{ $product->getUrl() }}"><img src="{{ asset($product->getThumb()) }}"
                          alt="{{ $product->name }}" /></a>

                      {!! $product->showPrice() !!}
                      <a href="{{ $product->getUrl() }}">
                        <h5>{{ $product->name }}</h5>
                        <p>{{ $product->writer }}</p>
                      </a>
                      @if ($product->allowSale())
                      <a class="btn btn-default add-to-cart" onClick="addToCartAjax('{{ $product->id }}','default')"><i
                          class="fa fa-shopping-cart"></i>{{trans('front.add_to_cart')}}</a>
                      @else
                      &nbsp;
                      @endif
                      <p style="font-size: 10px; color: #999; text-transform: uppercase;">{{ $types[$product->type] }}</p>
                    </div>
                    <!--@if ($product->price != $product->getFinalPrice())-->
                    <!--<img src="{{ asset('templates/'.sc_store('template').'/images/home/sale.png') }}" class="new" alt="" />-->
                    <!--@elseif($product->type == SC_PRODUCT_NEW)-->
                    <!--<img src="{{ asset('templates/'.sc_store('template').'/images/home/new.png') }}" class="new" alt="" />-->
                    <!--{{-- @elseif($product->type == SC_PRODUCT_HOT)-->
                    <!--<img src="{{ asset('templates/'.sc_store('template').'/images/home/hot.png') }}" class="new" alt="" /> --}}-->
                    
                    <!--@endif-->

                    @if($product->promotionPrice['status_promotion'] == 1)
                       @php

                          $main = $product->price;
                          $promotion = $product->promotionPrice['price_promotion'];

                          

                          $promoPrice = $main-$promotion;
                          
                          $discount = $promoPrice * 100 / $main;

                          
                         //var_dump($discount);
                        @endphp
                        <span class="badg">{{round($discount)}}%</span>
                    @endif
                  </div>
                  <div class="choose">
                    <ul class="nav nav-pills nav-justified">
                      <li><a onClick="addToCartAjax({{ $product->id }},'wishlist')"><i
                        class="fa fa-plus-square"></i>{{trans('front.add_to_wishlist')}}</a></li>
                      {{-- <li><a onClick="addToCartAjax({{ $product->id }},'compare')"><i
                            class="fa fa-plus-square"></i>{{trans('front.add_to_compare')}}</a></li> --}}
                    </ul>
                  </div>
                </div>
              </div>
            @endforeach
            </div>
            </div>
        @endforeach

    </div>

    <!-- Carousel controls -->
    <a class="carousel-control left carousel-control-prev" href="#category-products-{{ $cat->id }}" data-slide="prev">
      <i class="fa fa-angle-left"></i>
    </a>
    <a class="carousel-control right carousel-control-next" href="#category-products-{{ $cat->id }}" data-slide="next">
      <i class="fa fa-angle-right"></i>
    </a>
  </div>
</div>
@endif


@if (count($cat->products) !==0)
<div style="clear: both; ">
  <ul class="pagination">
    <li><a href="{{ $cat->getUrl() }}">View All <i class="fa fa-arrow-right"></i></a></li>
  </ul>
</div>
@endif
@endforeach









<!-- Best Sell Carusel-->


@if (count($best_products) !==0)
<div class="features_items home">

  <h2 class="title text-center"><span>Best Selling </span></h2>

  <div id="{{ $cat->id }}" class="carousel slide" data-ride="carousel" data-interval="0">
    <!-- Wrapper for carousel items -->

    <div class="carousel-inner">
      @foreach ($best_products as $active => $product)

      @if ($active % 6 === 0)
      <div class="item carousel-item {{  ($active ==0)?'active':'' }}">
        <div class="row">
          @endif
          <div class="vendor-item">
            <div class="product-image-wrapper product-single">
              <div class="single-products">
                <div class="productinfo text-center product-box-{{ $product->id }}">
                  <a href="{{ $product->getUrl() }}"><img src="{{ asset($product->getThumb()) }}"
                      alt="{{ $product->name }}" /></a>

                   {!! $product->showPrice() !!}
 
                  <a href="{{ $product->getUrl() }}">
                    <h5>{{ $product->name }}</h5>
                    <p>{{ $product->writer }}</p>
                  </a>
                  @if ($product->allowSale())
                  <a class="btn btn-default add-to-cart" onClick="addToCartAjax('{{ $product->id }}','default')"><i
                      class="fa fa-shopping-cart"></i>{{trans('front.add_to_cart')}}</a>
                  @else
                  &nbsp;
                  @endif
                  <p style="font-size: 10px; color: #999; text-transform: uppercase;">{{ $types[$product->type] }}</p>
                </div>
                <!--@if ($product->price != $product->getFinalPrice())-->
                <!--  <img src="{{ asset('templates/'.sc_store('template').'/images/home/sale.png') }}" class="new" alt="" />-->
                <!--@elseif($product->type == SC_PRODUCT_NEW)-->
                <!--  <img src="{{ asset('templates/'.sc_store('template').'/images/home/new.png') }}" class="new" alt="" />-->
                <!--{{-- @elseif($product->type == SC_PRODUCT_HOT)-->
                <!--<img src="{{ asset('templates/'.sc_store('template').'/images/home/hot.png') }}" class="new" alt="" /> --}}-->
                <!--@endif-->
              </div>
              <div class="choose">
                <ul class="nav nav-pills nav-justified">
                  <li><a onClick="addToCartAjax({{ $product->id }},'wishlist')"><i
                    class="fa fa-plus-square"></i>{{trans('front.add_to_wishlist')}}</a></li>
                  {{-- <li><a onClick="addToCartAjax({{ $product->id }},'compare')"><i
                        class="fa fa-plus-square"></i>{{trans('front.add_to_compare')}}</a></li> --}}
                </ul>
              </div>
            </div>
          </div>
          @if ($key % 6 == 5 || $key+1 == $products->count())
        </div>
      </div>
      @endif
      @endforeach

    </div>
 
    <!-- Carousel controls -->
    <a class="carousel-control left carousel-control-prev" href="#{{ $product->id }}" data-slide="prev">
      <i class="fa fa-angle-left"></i>
    </a>
    <a class="carousel-control right carousel-control-next" href="#{{ $product->id }}" data-slide="next">
      <i class="fa fa-angle-right"></i>
    </a>
  </div>
</div>
@endif



@endsection



@push('styles')
@endpush

@push('scripts')

@endpush
