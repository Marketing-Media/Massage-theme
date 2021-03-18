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
{strip}
{addJsDef isMobile=$mobile_device}
{addJsDef baseDir=$content_dir}
{addJsDef baseUri=$base_uri}
{addJsDef static_token=$static_token}
{addJsDef token=$token}
{addJsDef priceDisplayPrecision=$priceDisplayPrecision*$currency->decimals}
{addJsDef priceDisplayMethod=$priceDisplay}
{addJsDef roundMode=$roundMode}
{addJsDef currency=$currency}
{addJsDef currencyRate=$currencyRate|floatval}
{addJsDef currencySign=$currency->sign|html_entity_decode:2:"UTF-8"}
{addJsDef currencyFormat=$currency->format|intval}
{addJsDef currencyBlank=$currency->blank|intval}
{addJsDef isLogged=$is_logged|intval}
{addJsDef isGuest=$is_guest|intval}
{addJsDef page_name=$page_name|escape:'html':'UTF-8'}
{addJsDef contentOnly=$content_only|boolval}
{if isset($cookie->id_lang)}
	{addJsDef id_lang=$cookie->id_lang|intval}
{/if}
{addJsDefL name=FancyboxI18nClose}{l s='Close'}{/addJsDefL}
{addJsDefL name=FancyboxI18nNext}{l s='Next'}{/addJsDefL}
{addJsDefL name=FancyboxI18nPrev}{l s='Previous'}{/addJsDefL}
{addJsDef usingSecureMode=Tools::usingSecureMode()|boolval}
{addJsDef ajaxsearch=Configuration::get('PS_SEARCH_AJAX')|boolval}
{addJsDef instantsearch=Configuration::get('PS_INSTANT_SEARCH')|boolval}
{addJsDef quickView=$quick_view|boolval}
{addJsDef displayList=Configuration::get('PS_GRID_PRODUCT')|boolval}
{addJsDef highDPI=Configuration::get('PS_HIGHT_DPI')|boolval}
{/strip}

{* Structured Data Json - LD Microdata for Prestashop 1.6.X
*
* Add this code in your smarty global.tpl/header.tpl file to show Organization, WebPage, Website and Product Microdata in ld+json format.
* Requires Prestashop 'productcomments' module for review stars ratings.
* by Ruben Divall @rubendivall http://www.rubendivall.com 
*}

<!-- Facebook Pixel Code test-->

<!-- End Facebook Pixel Code -->

<script type="application/ld+json">
{ 
	"@context" : "http://schema.org",
	"@type" : "Organization",
	"name" : "{$shop_name|escape:'html':'UTF-8'}",
	"url" : "{if isset($force_ssl) && $force_ssl}{$base_dir_ssl}{else}{$base_dir}{/if}",
	"logo" : {
		"@type":"ImageObject",
		"url":"{$logo_url}"
	},
	"address": {
	 "@type": "PostalAddress",
	 "streetAddress": "478 boul. des Laurentides",
	 "addressLocality": "Laval",
	 "addressRegion": "QC",
	 "postalCode": "H7G2V1",
	 "addressCountry": "CA"
	 },
	  "contactPoint" : [
	 {
	 "@type": "ContactPoint",
	 "contactType": "customer support",
	 "telephone": "[+18669310920]",
	 "email": "info@massageboutik.com" 
	 },	
	 {
	 "@type": "ContactPoint",
	 "contactType": "customer support",
	 "telephone": "[+4509671970]",
	 "email": "info@massageboutik.com"
	 }],
	 "sameAs": [ 
	 "https://www.facebook.com/massageboutik"
	 ]
}
</script>
<script type="application/ld+json">
{
	"@context":"http://schema.org",
	"@type":"WebPage",
	"isPartOf": {
		"@type":"WebSite",
		"url":  "{if isset($force_ssl) && $force_ssl}{$base_dir_ssl}{else}{$base_dir}{/if}",
		"name": "{$shop_name|escape:'html':'UTF-8'}"
    },
	"name": "{$meta_title}",
	"url":  "{if isset($force_ssl) && $force_ssl}{$base_dir_ssl}{trim($smarty.server.REQUEST_URI,'/')}{else}{$base_dir}{trim($smarty.server.REQUEST_URI,'/')}{/if}"
}
</script>
{if $page_name =='index'}
<script type="application/ld+json">
{
	"@context": "http://schema.org",
	"@type":  "WebSite",
	"url":  "{if isset($force_ssl) && $force_ssl}{$base_dir_ssl}{else}{$base_dir}{/if}",
	"image" : {
	"@type":  "ImageObject",
	"url":  "{$logo_url}"
	},
	"potentialAction": {
		"@type": "SearchAction",
		"target": "{$link->getPageLink('search', null, null, null, false, null,  true)|escape:'html':'UTF-8'}?search_query={literal}{search_term}{/literal}",
		"query-input": "required name=search_term"
	}

}
</script>
{/if}

{if $page_name == 'product'}
	{if !$priceDisplay || $priceDisplay == 2}
		{assign var='productPrice' value=$product->getPrice(true, $smarty.const.NULL, 6)}
		{assign var='productPriceWithoutReduction' value=$product->getPriceWithoutReduct(false, $smarty.const.NULL)}
	{elseif $priceDisplay == 1}
		{assign var='productPrice' value=$product->getPrice(false, $smarty.const.NULL, 6)}
		{assign var='productPriceWithoutReduction' value=$product->getPriceWithoutReduct(true, $smarty.const.NULL)}
	{/if}
<script type="application/ld+json">
	{	
	"@context": "http://schema.org/",
	"@type": "Product",
	"name": "{$product->name}",
	"image": "{$link->getImageLink($product->link_rewrite, $cover.id_image, 'home_default')|escape:'html':'UTF-8'}",
	"description": "{$product->description_short|strip_tags|escape:'html':'UTF-8'}",
	{if $product->reference}
	"mpn": "{$product->reference|escape:'html':'UTF-8'}",
	{/if}
	{if $product->ean13}
	"gtin13": "{$product->ean13|escape:'html':'UTF-8'}",
	{/if}
	{if $product_manufacturer->name}
	"brand": {
		"@type": "Thing",
		"name": "{$product_manufacturer->name|escape:'html':'UTF-8'}"
	},
	{/if}
	{if $nbComments && $ratings.avg}
	"aggregateRating": {
	   	"@type": "AggregateRating",
		"ratingValue": "{$ratings.avg|round:1|escape:'html':'UTF-8'}",
		"reviewCount": "{$nbComments|escape:'html':'UTF-8'}"
	},
	{/if}
	"offers": {
		"@type": "Offer",
		"priceCurrency": "{$currency->iso_code}", 
		"price": "{$productPrice}",
		"itemCondition": "http://schema.org/NewCondition",
		{if $product->quantity > 0}"availability": "http://schema.org/InStock",{/if}
		"seller": {
			"@type": "Organization",
			"name": "{$shop_name|escape:'html':'UTF-8'}"
			}
	}
} 
</script>
{/if}
{** End of Structured Data Json - LD Microdata for Prestashop 1.6.X **}