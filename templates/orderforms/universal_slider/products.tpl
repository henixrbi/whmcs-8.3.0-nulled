<link type="text/css" rel="stylesheet" href="{$BASE_PATH_CSS}/normalize.css" property="stylesheet">
<link type="text/css" rel="stylesheet" href="{assetPath file="ion.rangeSlider.css"}" property="stylesheet">
<link type="text/css" rel="stylesheet" href="{assetPath file="ion.rangeSlider.skinHTML5.css"}" property="stylesheet">
<link type="text/css" rel="stylesheet" href="{assetPath file="style.css"}" property="stylesheet">
{if $showSidebarToggle}
    <button type="button" class="btn btn-default btn-sm" id="btnShowSidebar">
        <i class="fas fa-arrow-circle-right"></i>
        {$LANG.showMenu}
    </button>
{/if}

<div class="row row-product-selection">
    <div class="col-md-3 sidebar product-selection-sidebar" id="universalSliderSidebar">
        {include file="orderforms/standard_cart/sidebar-categories.tpl"}
    </div>
    <div class="col-md-12">

        <div id="order-universal_slider">
            <div class="group-headlines">
                <h2 id="headline">
                    {if $productGroup.headline}
                        {$productGroup.headline}
                    {else}
                        {$productGroup.name}
                    {/if}
                </h2>
                {if $productGroup.tagline}
                    <h5 id="tagline">
                        {$productGroup.tagline}
                    </h5>
                {/if}
                {if $errormessage}
                    <div class="alert alert-danger">
                        {$errormessage}
                    </div>
                {elseif !$productGroup}
                    <div class="alert alert-info">
                        {lang key='orderForm.selectCategory'}
                    </div>
                {/if}
            </div>

            <div class="striped-container clearfix py-1">

                <div class="main-container">

                    {if $products}
                        <div class="product-selector">
                            <input type="text" id="product-selector" name="product-selector" value=""  title="product-selector"/>
                        </div>
                    {/if}

                    {foreach $products as $key => $product}
                        {$idPrefix = ($product.bid) ? ("bundle"|cat:$product.bid) : ("product"|cat:$product.pid)}
                        <div id="{$idPrefix}-container" class="product-container">
                            <div id="{$idPrefix}-feature-container" class="feature-container">
                                <div class="row">
                                    <div class="col-md-9">
                                        <div class="row">
                                            {foreach $product.features as $feature => $value}
                                                {$currentPercentages = $featurePercentages.$feature}
                                                <div id="{$idPrefix}-feature{$value@iteration}" class="col-sm-3 container-with-progress-bar text-center">
                                                    {$feature}
                                                    <span>{$value}</span>
                                                    <div class="progress small-progress">
                                                        <div class="progress-bar" role="progressbar" aria-valuenow="{$currentPercentages.$key}" aria-valuemin="0" aria-valuemax="100" style="width: {$currentPercentages.$key}%;">
                                                            <span class="sr-only">{$currentPercentages.$key}% Complete</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            {/foreach}
                                        </div>
                                    </div>
                                    <div id="{$idPrefix}-price" class="col-md-3 hidden-sm d-none d-md-block">
                                        <div class="price-container container-with-progress-bar text-center">
                                            {$product.name} {$LANG.orderprice}
                                            <span class="price-cont">
                                                {if $product.bid}
                                                    {$LANG.bundledeal}
                                                    {if $product.displayprice}
                                                        <br /><br /><span>{$product.displayPriceSimple}</span>
                                                    {/if}
                                                {elseif $product.paytype eq "free"}
                                                    {$LANG.orderfree}
                                                {elseif $product.paytype eq "onetime"}
                                                    {$product.pricing.onetime} {$LANG.orderpaymenttermonetime}
                                                {else}
                                                    {if $product.pricing.hasconfigoptions}
                                                        {$LANG.from}
                                                    {/if}
                                                    {$product.pricing.minprice.cycleText}
                                                    <br>
                                                    {if $product.pricing.minprice.setupFee}
                                                        <small>{$product.pricing.minprice.setupFee->toPrefixed()} {$LANG.ordersetupfee}</small>
                                                    {/if}
                                                {/if}
                                            </span>
                                            {if $product.qty eq "0"}
                                                <span id="{$idPrefix}-unavailable" class="order-button unavailable">
                                                    {$LANG.outofstock}
                                                </span>
                                            {else}
                                                <a href="{$product.productUrl}" class="order-button" id="{$idPrefix}-order-button">
                                                    {$LANG.ordernowbutton}
                                                </a>
                                            {/if}
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="{$idPrefix}-description" class="product-description">
                                <div class="row">
                                    <div class="col-sm-9 col-md-12">
                                        {if count($product.features) > 0}
                                            {if $product.featuresdesc}
                                                {$product.featuresdesc}
                                            {/if}
                                        {else}
                                            {$product.description}
                                        {/if}
                                    </div>
                                    <div class="col-sm-3 visible-sm d-block d-md-none">
                                        <div id="{$idPrefix}-price-small" class="price-container container-with-progress-bar text-center">
                                            {$product.name} {$LANG.orderprice}
                                            <span class="price-cont">
                                                {if $product.bid}
                                                    {$LANG.bundledeal}
                                                    {if $product.displayprice}
                                                        <br /><br /><span>{$product.displayPriceSimple}</span>
                                                    {/if}
                                                {elseif $product.paytype eq "free"}
                                                    {$LANG.orderfree}
                                                {elseif $product.paytype eq "onetime"}
                                                    {$product.pricing.onetime} {$LANG.orderpaymenttermonetime}
                                                {else}
                                                    {if $product.pricing.hasconfigoptions}
                                                        {$LANG.from}
                                                    {/if}
                                                    {$product.pricing.minprice.cycleText}
                                                    <br>
                                                    {if $product.pricing.minprice.setupFee}
                                                        <small>{$product.pricing.minprice.setupFee} {$LANG.ordersetupfee}</small>
                                                    {/if}
                                                {/if}
                                            </span>
                                            {if $product.qty eq "0"}
                                                <span id="{$idPrefix}-unavailable" class="order-button unavailable">
                                                {$LANG.outofstock}
                                            </span>
                                            {else}
                                                <a href="{$product.productUrl}" class="order-button" id="{$idPrefix}-order-button">
                                                    {$LANG.ordernowbutton}
                                                </a>
                                            {/if}
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    {/foreach}
                </div>
            </div>

            {if count($productGroup.features) > 0}
                <div class="group-features">
                    <div class="title">
                        <span class="primary-bg-color">
                            {$LANG.orderForm.includedWithPlans}
                        </span>
                    </div>
                    <ul class="list-features">
                        {foreach $productGroup.features as $features}
                            <li>{$features.feature}</li>
                        {/foreach}
                    </ul>
                </div>
            {/if}
        </div>
    </div>
</div>

<script type="text/javascript" src="{assetPath file="ion.rangeSlider.js"}"></script>
<script type="text/javascript">
    jQuery(document).ready(function(){
        var products = [],
            productList = [],
            startFrom = 0,
            startValue = null;
        {foreach $products as $product}
            products['{$product.name}'] = '{($product.bid) ? ("bundle"|cat:$product.bid) : ("product"|cat:$product.pid)}';
            productList.push('{$product.name}');
            {if $pid}
                {if ($pid == $product.pid)}
                    startValue = '{$product.name}';
                    startFrom = productList.indexOf('{$product.name}');
                {/if}
            {else}
                {if $product.isFeatured && !isset($featuredProduct)}
                    {$featuredProduct = true}
                    startValue = '{$product.name}';
                    startFrom = productList.indexOf('{$product.name}');
                {/if}
            {/if}
        {/foreach}
        jQuery("#product-selector").ionRangeSlider({
            type: "single",
            min: 1,
            max: {count($products)},
            step: 1,
            grid: true,
            grid_snap: true,
            keyboard: true,
            from: startFrom,
            {if count($products) == 1}
                disable: true,
            {else}
                onStart: function(data)
                {
                    if (startValue !== null) {
                        changeProduct(startValue);
                    } else {
                        changeProduct(data.from_value);
                    }

                },
                onChange: function (data)
                {
                    changeProduct(data.from_value);
                },
            {/if}
            values: productList
        });

        function changeProduct(productName) {
            var identifier = products[productName];
            jQuery(".product-container").hide();
            jQuery("#" + identifier + "-container").show();
        }

        {if count($products) eq 1}
            jQuery(".irs-single").text(productList[0]);
            jQuery(".irs-grid-text").text('');
        {/if}

        jQuery('#btnShowSidebar').click(function() {
            var productSidebar = jQuery(".product-selection-sidebar");
            if (productSidebar.is(":visible")) {
                jQuery('.row-product-selection').css('left','0');
                productSidebar.fadeOut();
                jQuery('#btnShowSidebar').html('<i class="fas fa-arrow-circle-right"></i> {$LANG.showMenu}');
            } else {
                productSidebar.fadeIn();
                jQuery('.row-product-selection').css('left','300px');
                jQuery('#btnShowSidebar').html('<i class="fas fa-arrow-circle-left"></i> {$LANG.hideMenu}');
            }
        });
    });
</script>
