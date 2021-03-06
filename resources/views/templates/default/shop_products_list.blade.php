@extends('templates.'.sc_store('template').'.shop_layout')

@section('center')
  <div class="features_items">
    <h2 class="title text-center"><span>{{ $title }}</span></h2>

    @isset ($itemsList)
      @if($itemsList->count())
      <div class="item-folder">
            @foreach ($itemsList as  $key => $item)
            <div class="col-sm-3 col-xs-12">
                <div class="item-folder-wrapper product-single">
                  <div class="single-products">
                    <div class="productinfo text-center product-box-{{ $item->id }}">
                      <a href="{{ $item->getUrl() }}"><img src="{{ asset($item->getThumb()) }}" alt="{{ $item->name }}" /></a>
                      <a href="{{ $item->getUrl() }}"><p>{{ $item->name }}</p></a>
                    </div>
                  </div>
                </div>
            </div>
            @endforeach
        <div style="clear: both; ">
        </div>
      </div>
      @endif
    @endisset

      @if (count($products) ==0)
        {{ trans('front.empty_product') }}
      @else
          @foreach ($products as  $key => $product)
          <div class="col-sm-3 col-xs-12">
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
                @if ($product->price != $product->getFinalPrice())
                <img src="{{ asset('templates/'.sc_store('template').'/images/home/sale.png') }}" class="new" alt="" />
                @elseif($product->type == SC_PRODUCT_NEW)
                <img src="{{ asset('templates/'.sc_store('template').'/images/home/new.png') }}" class="new" alt="" />
                {{-- @elseif($product->type == SC_PRODUCT_HOT)
                <img src="{{ asset('templates/'.sc_store('template').'/images/home/hot.png') }}" class="new" alt="" /> --}}
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
      @endif

    <div style="clear: both; ">
        <ul class="pagination">
          {{ $products->appends(request()->except(['page','_token']))->links() }}
      </ul>
    </div>
</div>
@endsection


@section('breadcrumb')
    <div class="breadcrumbs pull-left">
        <ol class="breadcrumb">
          <li><a href="{{ route('home') }}">Home</a></li>
          <li class="active">{{ $title }}</li>
        </ol>
      </div>
@endsection

@section('filter')
  <form action="" method="GET" id="filter_sort">
        <div class="pull-right">
        <div>
            @php
              $queries = request()->except(['filter_sort','page']);
            @endphp
            @foreach ($queries as $key => $query)
              <input type="hidden" name="{{ $key }}" value="{{ $query }}">
            @endforeach
          <select class="custom-select" name="filter_sort">
            <option value="">{{ trans('front.filters.sort') }}</option>
            <option value="price_asc" {{ ($filter_sort =='price_asc')?'selected':'' }}>{{ trans('front.filters.price_asc') }}</option>
            <option value="price_desc" {{ ($filter_sort =='price_desc')?'selected':'' }}>{{ trans('front.filters.price_desc') }}</option>
            <option value="sort_asc" {{ ($filter_sort =='sort_asc')?'selected':'' }}>{{ trans('front.filters.sort_asc') }}</option>
            <option value="sort_desc" {{ ($filter_sort =='sort_desc')?'selected':'' }}>{{ trans('front.filters.sort_desc') }}</option>
            <option value="id_asc" {{ ($filter_sort =='id_asc')?'selected':'' }}>{{ trans('front.filters.id_asc') }}</option>
            <option value="id_desc" {{ ($filter_sort =='id_desc')?'selected':'' }}>{{ trans('front.filters.id_desc') }}</option>
          </select>
        </div>
      </div>
  </form>

@endsection

@push('styles')
@endpush
@push('scripts')
  <script type="text/javascript">
    $('[name="filter_sort"]').change(function(event) {
      $('#filter_sort').submit();
    });
  </script>
@endpush
