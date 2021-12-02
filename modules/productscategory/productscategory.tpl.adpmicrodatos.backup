{*
* 2007-2016 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2016 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}
{if $page_name !='index' && $page_name !='product'}
		{assign var='nbItemsPerLine' value=3}
		{assign var='nbItemsPerLineTablet' value=2}
		{assign var='nbItemsPerLineMobile' value=3}
	{else}
		{assign var='nbItemsPerLine' value=4}
		{assign var='nbItemsPerLineTablet' value=3}
		{assign var='nbItemsPerLineMobile' value=2}
	{/if}
{if count($categoryProducts) > 0 && $categoryProducts !== false}
<section class="page-product-box blockproductscategory">
	<h3 class="productscategory_h3 page-product-heading">
		{if $lang_iso == en}{l s="Other products in the same category:"}{else}Autres produits dans la même catégorie: {/if}
	</h3>
	<div id="productscategory_list" class="clearfix">
		<ul id="productscategory_list2" class="product_list grid row clearfix">
		{foreach from=$categoryProducts item='categoryProduct' name=categoryProduct}
			{math equation="(total%perLine)" total=$smarty.foreach.categoryProduct.total perLine=$nbItemsPerLine assign=totModulo}
		{math equation="(total%perLineT)" total=$smarty.foreach.categoryProduct.total perLineT=$nbItemsPerLineTablet assign=totModuloTablet}
		{math equation="(total%perLineT)" total=$smarty.foreach.categoryProduct.total perLineT=$nbItemsPerLineMobile assign=totModuloMobile}
		{if $totModulo == 0}{assign var='totModulo' value=$nbItemsPerLine}{/if}
		{if $totModuloTablet == 0}{assign var='totModuloTablet' value=$nbItemsPerLineTablet}{/if}
		{if $totModuloMobile == 0}{assign var='totModuloMobile' value=$nbItemsPerLineMobile}{/if}
			<li class="ajax_block_product col-md-3 col-sm-4 col-xs-12 {if $smarty.foreach.categoryProduct.iteration%$nbItemsPerLine == 0} last-in-line{elseif $smarty.foreach.categoryProduct.iteration%$nbItemsPerLine == 1} {/if}{if $smarty.foreach.categoryProduct.iteration > ($smarty.foreach.categoryProduct.total - $totModulo)} last-line{/if}{if $smarty.foreach.categoryProduct.iteration%$nbItemsPerLineTablet == 0} last-item-of-tablet-line{elseif $smarty.foreach.categoryProduct.iteration%$nbItemsPerLineTablet == 1} first-item-of-tablet-line{/if}{if $smarty.foreach.categoryProduct.iteration%$nbItemsPerLineMobile == 0} last-item-of-mobile-line{elseif $smarty.foreach.categoryProduct.iteration%$nbItemsPerLineMobile == 1} first-item-of-mobile-line{/if}{if $smarty.foreach.categoryProduct.iteration > ($smarty.foreach.categoryProduct.total - $totModuloMobile)} last-mobile-line{/if}">
				<div class="product-container" itemscope itemtype="https://schema.org/Product">
								<div class="left-block">
									<div class="product-image-container">
				<a href="{$link->getProductLink($categoryProduct.id_product, $categoryProduct.link_rewrite, $categoryProduct.category, $categoryProduct.ean13)}" class="lnk_img product-image " title="{$categoryProduct.name|htmlspecialchars}"><img class="img-responsive"  itemprop="image" src="{$link->getImageLink($categoryProduct.link_rewrite, $categoryProduct.id_image, 'home_default')|escape:'html':'UTF-8'}" alt="{$categoryProduct.name|htmlspecialchars}" /></a>
				<div class="hoverbuttons">
						<meta itemprop="brand" content="{$categoryProduct.manufacturer_name}" />
							<meta itemprop="description" content="
							{if !empty($categoryProduct.description)}
							{$categoryProduct.description|strip_tags}
							{else}							
							{$page.meta.description}
							{/if}" />

									{if !empty($categoryProduct.reference) && $categoryProduct.reference}
										<meta itemprop="sku" content="{$categoryProduct.reference}" />
										<meta itemprop="mpn" content="{$categoryProduct.reference}" />
									{/if}
						
							<div class="functional-buttons clearfix">
								<div class="quick-view-wrapper">
									<a class="quick-view" href="{$categoryProduct.link|escape:'html':'UTF-8'}" rel="{$categoryProduct.link|escape:'html':'UTF-8'}">
										<i class="icon-eye-open"></i>
									</a>
								</div>
									{hook h='displayProductListFunctionalButtons' product=$categoryProduct}
								{if isset($comparator_max_item) && $comparator_max_item}
									<div class="compare">
										<a class="add_to_compare" href="{$categoryProduct.link|escape:'html':'UTF-8'}" data-id-product="{$categoryProduct.id_product}"></a>
									</div>
								{/if}
							</div>
							
						</div>
						</div>
					
				</div>
				<div class="right-block">
				<h5 itemprop="name" class="product-name">
					<a href="{$link->getProductLink($categoryProduct.id_product, $categoryProduct.link_rewrite, $categoryProduct.category, $categoryProduct.ean13)|escape:'html':'UTF-8'}" title="{$categoryProduct.name|htmlspecialchars}">{$categoryProduct.name|escape:'html':'UTF-8'}</a>
				</h5>
				{if $ProdDisplayPrice && $categoryProduct.show_price == 1 && !isset($restricted_country_mode) && !$PS_CATALOG_MODE}
					<p class="price_display">
					{if isset($categoryProduct.specific_prices) && $categoryProduct.specific_prices
					&& ($categoryProduct.displayed_price|number_format:2 !== $categoryProduct.price_without_reduction|number_format:2)}

						<span class="price product-price special-price">{convertPrice price=$categoryProduct.displayed_price}</span>
						{if $categoryProduct.specific_prices.reduction && $categoryProduct.specific_prices.reduction_type == 'percentage'}
							<span class="price-percent-reduction small">-{$categoryProduct.specific_prices.reduction * 100}%</span>
						{/if}
						<span class="old-price">{displayWtPrice p=$categoryProduct.price_without_reduction}</span>

					{else}
						<span class="price product-price">{convertPrice price=$categoryProduct.displayed_price}</span>
					{/if}
					</p>
				{else}
				<br />
				{/if}
				<div class="clearfix" style="margin-top:5px">
					{if !$PS_CATALOG_MODE && ($categoryProduct.allow_oosp || $categoryProduct.quantity > 0)}
					<div class="button-container">
						<div class="no-print button-container">
							<a class="button ajax_add_to_cart_button btn btn-default" href="{$link->getPageLink('cart', true, NULL, "qty=1&amp;id_product={$categoryProduct.id_product|intval}&amp;token={$static_token}&amp;add")|escape:'html':'UTF-8'}" data-id-product="{$categoryProduct.id_product|intval}" title="{l s='Add to cart' mod='productscategory'}">
								<span>{l s='Add to cart' mod='productscategory'}</span>
							</a>
						</div>
					{/if}
					</div>
				</div>
				</div>
			</li>
		{/foreach}
		</ul>
	</div>
</section>
{/if}
<script>
$('#productscategory_list2').slick(
{
   dots: false,
  accessibility: false,
  speed: 600,
  autoplay: false,
  autoplaySpeed: 4500,
  slidesToShow: 4,
  slidesToScroll: 1,
  prevArrow : '<a class="slick-prev">Previous</a>',
  nextArrow: '<a class="slick-next">Next</a>',

  responsive: [
    {
      breakpoint: 1320, 
      settings: {
        slidesToShow: 4,
        slidesToScroll: 1,
      }
    },
    {
      breakpoint: 1000,
      settings: {
        slidesToShow: 4,
        slidesToScroll: 1
      }
    }, 
    {
      breakpoint: 768,
      settings: {
        slidesToShow: 2,
        slidesToScroll: 1
      }
    },
    {
      breakpoint: 480,
      settings: {
        slidesToShow: 2,
        slidesToScroll: 1
      }
    }
  ]
});
</script>
