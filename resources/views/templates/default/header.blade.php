

<header id="header" class="not-print">
    <!--header-->
    <div class="header_top">
      <!--header_top-->
      <div class="container">
        <div class="row">
          <div class="col-xs-12 col-sm-6">
            <div class="contactinfo">
              <ul class="nav nav-pills">
                <li><a href="#"><i class="fa fa-phone"></i> {{ sc_store('phone') }}</a></li>
                <li><a href="#"><i class="fa fa-envelope"></i> {{ sc_store('email') }}</a></li>
              </ul>
            </div>
          </div>

          {{-- <div class="col-xs-2 toggle navbar-header page-scroll pull-right">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-2">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
          </div> --}}
          <div class="col-sm-6 col-xs-12 top-menu">
              {{-- <div class="btn-group locale">
                @if (count($languages)>1)
                <button type="button" class="btn btn-default dropdown-toggle usa" data-toggle="dropdown"><img src="{{ asset($languages[app()->getLocale()]['icon']) }}"
              style="height: 25px;">
              <span class="caret"></span>
              </button>
              <ul class="dropdown-menu">
                @foreach ($languages as $key => $language)
                <li><a href="{{ url('locale/'.$key) }}"><img src="{{ asset($language['icon']) }}"
                      style="height: 25px;"></a></li>
                @endforeach
              </ul>
              @endif
            </div>
            @if (count($currencies)>1)
            <div class="btn-group locale">
              <button type="button" class="btn btn-default dropdown-toggle usa" data-toggle="dropdown">
                {{ sc_currency_info()['name'] }}
                <span class="caret"></span>
              </button>
              <ul class="dropdown-menu">
                @foreach ($currencies as $key => $currency)
                <li><a href="{{ url('currency/'.$currency->code) }}">{{ $currency->name }}</a></li>
                @endforeach
              </ul>
            </div>
            @endif --}}

            <div class="contactinfo">
              <ul class="nav nav-pills pull-right">
                @if (!empty($layoutsUrl['topHeader']))
                @foreach ($layoutsUrl['topHeader'] as $url)
                <li><a {{ ($url->target =='_blank')?'target=_blank':''  }} href="{{ sc_url_render($url->url) }}"><i
                      class="fa fa-info-circle"></i> {{ sc_language_render($url->name) }} &nbsp; | </a></li>
                @endforeach
                @endif

                <li><a href="{{ route('bookRequest')  }}"><i class="fa fa-angle-double-right"></i> Book Request &nbsp; |
                  </a></li>


                @if(Auth::guard('sellerUser')->check())
                <li><a href="{{ route('seller.index') }}"><i class="fa fa-user"></i> {{ trans('front.seller_account') }}
                    &nbsp; |</a></li>
                <li><a href="{{ route('seller.logout') }}" rel="nofollow" onclick="event.preventDefault();
                    document.getElementById('logout-form').submit();"><i class="fa fa-power-off"></i>
                    {{ trans('front.logout') }}</a></li>
                <form id="logout-form" action="{{ route('seller.logout') }}" method="POST" style="display: none;">
                  @csrf
                </form>
                @else
                <li><a href="{{ route('sellerLogin') }}"><i class="fa fa-sign-in"></i> Seller Corner</a></li>
                @endif
              </ul>
            </div>
          </div>

      </div>
    </div>
    </div>
    <!--/header_top-->
    <nav class="navbar navbar-default navbar-shrink header-middle">
      <div class="container">
          <!-- Brand and toggle get grouped for better mobile display -->
          <div class="navbar-header page-scroll">
              <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                  <span class="sr-only">Toggle navigation</span>
                  <span class="icon-bar"></span>
                  <span class="icon-bar"></span>
                  <span class="icon-bar"></span>
              </button>
              <a href="{{ route('home') }}"><img style="width: 146px; height: auto" src="{{ asset(sc_store('logo')) }}"
                alt="" /></a>
          </div>
    
          <!-- Collect the nav links, forms, and other content for toggling -->
          <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
              <ul class="nav navbar-nav navbar-right">
                  <li class="hidden active">
                      <a href="#page-top"></a>
                  </li>
                  <li class="shop-menu"><a href="#">Discount</a></li>
                  <li class="shop-menu"><a href="#">Book Fair</a></li>
                  <li class="shop-menu dropdown"><a href="#">Category <span class="glyphicon glyphicon-chevron-down" style="font-size: 12px;"></span></a>
                    <div class="dropdown-content">
                      @if (!empty($parent_category))
                      @foreach ($parent_category as $item)
                      <a href="{{ $item->getUrl() }}">{{ $item->name }}</a>
                      @endforeach
                      @endif
                    </div>
                  </li>
                  <li class="shop-menu search">
                    <form class="search-header" id="searchbox" method="get" action="{{ route('search') }}">
                      <div class="input-group active-cyan-4 mb-4" style="position: relative;">
                        <input class="form-control product-search" type="text" placeholder="Search" aria-label="Search" name="keyword">
                        <button type="submit"><i class="fa fa-search"></i></button>
                        {{-- <input type="text" class="form-control" placeholder="{{ trans('front.search_form.keyword') }}..."
                        name="keyword"> --}}
                        <div id="search-result"></div>
                      </div>
                    </form>
                  </li>
                  <li class="shop-menu"><a href="{{ route('wishlist') }}"><span class="cart-qty  shopping-wishlist"
                    id="shopping-wishlist">{{ Cart::instance('wishlist')->count() }}</span><i class="fa fa-star"></i>
                      {{ trans('front.wishlist') }}</a></li>
                  {{-- <li class="shop-menu"><a href="{{ route('compare') }}"><span class="cart-qty shopping-compare"
                    id="shopping-compare">{{ Cart::instance('compare')->count() }}</span><i class="fa fa-crosshairs"></i>
                  {{ trans('front.compare') }}</a></li> --}}
                  <li class="shop-menu"><a href="{{ route('cart') }}"><span class="cart-qty shopping-cart"
                        id="shopping-cart">{{ $carts['count'] }}</span><i class="fa fa-shopping-cart"></i>
                      {{ trans('front.cart_title') }}</a>
                  </li>
                  @if(Auth::guard('web')->check())
                  <li class="shop-menu"><a href="{{ route('member.index') }}"><i class="fa fa-user"></i> {{ trans('front.account') }}</a>
                  </li>
                  <li class="shop-menu"><a href="{{ route('member.logout') }}" rel="nofollow" onclick="event.preventDefault();
                      document.getElementById('logout-form').submit();"><i class="fa fa-power-off"></i>
                      {{ trans('front.logout') }}</a></li>
                  <form id="logout-form" action="{{ route('member.logout') }}" method="POST" style="display: none;">
                    @csrf
                  </form>
                  @else
                  <li class="shop-menu"><a href="{{ route('login') }}"><i class="fa fa-lock"></i> {{ trans('front.login') }}</a></li>
                  @endif
              </ul>
          </div>
          <!-- /.navbar-collapse -->
      </div>
      <!-- /.container-fluid -->
    </nav>
    <!--/header-middle-->

    {{-- <div class="header-bottom"><!--header-bottom-->
      <div class="container">
        <div class="row">
          <div class="col-sm-9">
            <div class="navbar-header">
              <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
            </div>
            <div class="mainmenu pull-left">
              <ul class="nav navbar-nav collapse navbar-collapse">
                <li><a href="{{ route('home') }}" class="active">{{ trans('front.home') }}</a></li>
    <li class="dropdown"><a href="#">{{ trans('front.shop') }}<i class="fa fa-angle-down"></i></a>
      <ul role="menu" class="sub-menu">
        <li><a href="{{ route('product.all') }}">{{ trans('front.all_product') }}</a></li>
        <li><a href="{{ route('compare') }}">{{ trans('front.compare') }}</a></li>
        <li><a href="{{ route('cart') }}">{{ trans('front.cart_title') }}</a></li>
        <li><a href="{{ route('categories') }}">{{ trans('front.categories') }}</a></li>
        <li><a href="{{ route('brands') }}">{{ trans('front.brands') }}</a></li>
        <li><a href="{{ route('vendors') }}">{{ trans('front.vendors') }}</a></li>
      </ul>
    </li>

    <li><a href="{{ route('news') }}">{{ trans('front.blog') }}</a></li>

    @if (!empty(sc_config('Content')))
    <li class="dropdown"><a href="#">{{ trans('front.cms_category') }}<i class="fa fa-angle-down"></i></a>
      <ul role="menu" class="sub-menu">
        @php
        $cmsCategories = (new \App\Modules\Cms\Models\CmsCategory)->where('status',1)->get();
        @endphp
        @foreach ($cmsCategories as $cmsCategory)
        <li><a href="{{ $cmsCategory->getUrl() }}">{{ sc_language_render($cmsCategory->title) }}</a></li>
        @endforeach
      </ul>
    </li>
    @endif

    @if (!empty($layoutsUrl['menu']))
    @foreach ($layoutsUrl['menu'] as $url)
    <li><a {{ ($url->target =='_blank')?'target=_blank':''  }}
        href="{{ sc_url_render($url->url) }}">{{ sc_language_render($url->name) }}</a></li>
    @endforeach
    @endif
    </ul>
    </div>
    </div>
    </div>
    </div>
    </div>
    <!--/header-bottom--> --}}
  </header>
  <!--/header-->