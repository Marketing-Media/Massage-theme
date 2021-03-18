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
{if isset($orderProducts) && count($orderProducts)}
	<section id="crossselling" class="page-product-box">
		<h3 class="productscategory_h2 page-product-heading">
			{if $page_name == 'product'}
				{l s='Customers who bought this product also bought:' mod='crossselling'}
			{else}
				{l s='We recommend' mod='crossselling'}
			{/if}
		</h3>
		<div id="crossselling_list">
			<ul id="crossselling_list_car" class="clearfix product_list grid row">
				{foreach from=$orderProducts item='orderProduct' name=orderProduct}
								{math equation="(total%perLine)" total=$smarty.foreach.orderProduct.total perLine=$nbItemsPerLine assign=totModulo}
		{math equation="(total%perLineT)" total=$smarty.foreach.orderProduct.total perLineT=$nbItemsPerLineTablet assign=totModuloTablet}
		{math equation="(total%perLineT)" total=$smarty.foreach.orderProduct.total perLineT=$nbItemsPerLineMobile assign=totModuloMobile}
		{if $totModulo == 0}{assign var='totModulo' value=$nbItemsPerLine}{/if}
		{if $totModuloTablet == 0}{assign var='totModuloTablet' value=$nbItemsPerLineTablet}{/if}
		{if $totModuloMobile == 0}{assign var='totModuloMobile' value=$nbItemsPerLineMobile}{/if}
					<li class="ajax_block_product col-md-3 col-sm-4 col-xs-12 {if $smarty.foreach.orderProduct.iteration%$nbItemsPerLine == 0} last-in-line{elseif $smarty.foreach.orderProduct.iteration%$nbItemsPerLine == 1} {/if}{if $smarty.foreach.orderProduct.iteration > ($smarty.foreach.orderProduct.total - $totModulo)} last-line{/if}{if $smarty.foreach.orderProduct.iteration%$nbItemsPerLineTablet == 0} last-item-of-tablet-line{elseif $smarty.foreach.orderProduct.iteration%$nbItemsPerLineTablet == 1} first-item-of-tablet-line{/if}{if $smarty.foreach.orderProduct.iteration%$nbItemsPerLineMobile == 0} last-item-of-mobile-line{elseif $smarty.foreach.orderProduct.iteration%$nbItemsPerLineMobile == 1} first-item-of-mobile-line{/if}{if $smarty.foreach.orderProduct.iteration > ($smarty.foreach.orderProduct.total - $totModuloMobile)} last-mobile-line{/if}">
							<div class="product-container" itemscope itemtype="https://schema.org/Product">
								<div class="left-block">
									<div class="product-image-container">
										<a href="{$orderProduct.link}" title="{$orderProduct.name|htmlspecialchars}" class="product_img_link"><img class="img-responsive" src="{$orderProduct.image}" alt="{$orderProduct.name|htmlspecialchars}" /></a>
										<div class="hoverbuttons">
											<div class="functional-buttons clearfix">
												<div class="quick-view-wrapper">
													<a class="quick-view" href="{$orderProduct.link|escape:'html':'UTF-8'}" rel="{$orderProduct.link|escape:'html':'UTF-8'}">
														<i class="icon-eye-open"></i>
													</a>
												</div>
													{hook h='displayProductListFunctionalButtons' product=$orderProduct}
													<div class="compare">
														<a class="add_to_compare" href="" data-id-product=""></a>
													</div>
												
											</div>
											
										</div>
									</div>
								</div>
								<div class="right-block">
									<h5 itemprop="name">{$orderProduct.name|escape:'html':'UTF-8'}</h5>
								<div class="content_price">
						{if $crossDisplayPrice AND $orderProduct.show_price == 1 AND !isset($restricted_country_mode) AND !$PS_CATALOG_MODE}
							<p class="price_display">
								<span class="price product-price">{convertPrice price=$orderProduct.displayed_price}</span>
							</p>

						{/if}</div>
						<div class="button-container">
							{if !$PS_CATALOG_MODE && ($orderProduct.allow_oosp || $orderProduct.quantity > 0)}
								<div class="no-print">
									<a class="button ajax_add_to_cart_button btn btn-default" href="{$link->getPageLink('cart', true, NULL, "qty=1&amp;id_product={$orderProduct.id_product|intval}&amp;token={$static_token}&amp;add")|escape:'html':'UTF-8'}" data-id-product="{$orderProduct.id_product|intval}" title="{l s='Add to cart' mod='crossselling'}">
										<span>{l s='Add to cart' mod='crossselling'}</span>
									</a>
								</div></div>
							{/if}
						
					</li>
				{/foreach}
			</ul>
		</div>
	</section>
{/if}
<script>
$('#crossselling_list_car').slick(
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
