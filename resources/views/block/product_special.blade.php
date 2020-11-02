  @php
    $productsSpecial = (new \App\Models\ShopProduct)->getProductsSpecial($limit = 1, $random = true)
  @endphp
  @if (!empty($productsSpecial))
              <div class="brands_products"><!--product special-->
                <h2>{{ trans('front.products_special') }}</h2>
                <div class="products-name">
                  <ul class="nav nav-pills nav-stacked">
                    @foreach ($productsSpecial as $key => $productSpecial)
                      <li>
                        <div class="product-image-wrapper product-single">
                          <div class="single-products">
                            <div class="productinfo text-center product-box-{{ $productSpecial->id }}">
                              <a href="{{ $productSpecial->getUrl() }}"><img src="{{ asset($productSpecial->getThumb()) }}"
                                  alt="{{ $productSpecial->name }}" /></a>
            
                              {!! $productSpecial->showPrice() !!}
            
                              <a href="{{ $productSpecial->getUrl() }}">
                                <h5>{{ $productSpecial->name }}</h5>
                                <p>{{ $productSpecial->writer }}</p>
                              </a>
                              @if ($productSpecial->allowSale())
                              <a class="btn btn-default add-to-cart" onClick="addToCartAjax('{{ $productSpecial->id }}','default')"><i
                                  class="fa fa-shopping-cart"></i>{{trans('front.add_to_cart')}}</a>
                              @else
                              &nbsp;
                              @endif
                              <p style="font-size: 10px; color: #999; text-transform: uppercase;">{{ $types[$productSpecial->type] }}</p>
                            </div>
                            @if ($productSpecial->price != $productSpecial->getFinalPrice())
                            <img src="{{ asset('templates/'.sc_store('template').'/images/home/sale.png') }}" class="new" alt="" />
                            @elseif($productSpecial->type == SC_PRODUCT_NEW)
                            <img src="{{ asset('templates/'.sc_store('template').'/images/home/new.png') }}" class="new" alt="" />
                            {{-- @elseif($productSpecial->type == SC_PRODUCT_HOT)
                            <img src="{{ asset('templates/'.sc_store('template').'/images/home/hot.png') }}" class="new" alt="" /> --}}
                            @endif
                          </div>
                          <div class="choose">
                            <ul class="nav nav-pills nav-justified">
                              <li><a onClick="addToCartAjax({{ $productSpecial->id }},'wishlist')"><i
                                class="fa fa-plus-square"></i>{{trans('front.add_to_wishlist')}}</a></li>
                              {{-- <li><a onClick="addToCartAjax({{ $productSpecial->id }},'compare')"><i
                                    class="fa fa-plus-square"></i>{{trans('front.add_to_compare')}}</a></li> --}}
                            </ul>
                          </div>
                        </div>
                      </li>
                    @endforeach
                  </ul>
                </div>
              </div><!--/product special-->
  @endif
