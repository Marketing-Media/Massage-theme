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
	
	{include file="$tpl_dir./errors.tpl"}
	{if $errors|@count == 0}
		{if !isset($priceDisplayPrecision)}
			{assign var='priceDisplayPrecision' value=2}
		{/if}
		{if !$priceDisplay || $priceDisplay == 2}
			{assign var='productPrice' value=$product->getPrice(true, $smarty.const.NULL, 6)}
			{assign var='productPriceWithoutReduction' value=$product->getPriceWithoutReduct(false, $smarty.const.NULL)}
		{elseif $priceDisplay == 1}
			{assign var='productPrice' value=$product->getPrice(false, $smarty.const.NULL, 6)}
			{assign var='productPriceWithoutReduction' value=$product->getPriceWithoutReduct(true, $smarty.const.NULL)}
		{/if}
	<div  >
		<meta  content="{$link->getProductLink($product)}">
	
		<div class="primary_block row">
			{if !$content_only}
				<div class="container">
				
	
				</div>
			{/if}
			{if isset($adminActionDisplay) && $adminActionDisplay}
				<div id="admin-action" class="container">
					<p class="alert alert-info">{l s='This product is not visible to your customers.'}
						<input type="hidden" id="admin-action-product-id" value="{$product->id}" />
						<a id="publish_button" class="btn btn-default button button-small" href="#">
							<span>{l s='Publish'}</span>
						</a>
						<a id="lnk_view" class="btn btn-default button button-small" href="#">
							<span>{l s='Back'}</span>
						</a>
					</p>
					<p id="admin-action-result"></p>
				</div>
			{/if}
			{if isset($confirmation) && $confirmation}
				<p class="confirmation">
					{$confirmation}
				</p>
			{/if}
			<!-- left infos-->
			<div class="pb-left-column col-xs-12 col-sm-6 col-md-6">
				<!-- product img-->
				<div id="image-block" class="clearfix">
					{if $product->new}
						<span class="new-box">
							<span class="new-label">{l s='New'}</span>
						</span>
					{/if}
					{if $product->on_sale}
						<span class="sale-box no-print">
							<span class="sale-label">{l s='Sale!'}</span>
						</span>
					{elseif $product->specificPrice && $product->specificPrice.reduction && $productPriceWithoutReduction > $productPrice}
						<span class="discount">{l s='Reduced price!'}</span>
					{/if}
					{if $have_image}
						<span id="view_full_size">
							{if $jqZoomEnabled && $have_image && !$content_only}
								<a class="jqzoom" title="{if !empty($cover.legend)}{$cover.legend|escape:'html':'UTF-8'}{else}{$product->name|escape:'html':'UTF-8'}{/if}" rel="gal1" href="{$link->getImageLink($product->link_rewrite, $cover.id_image, 'thickbox_default')|escape:'html':'UTF-8'}">
									<img  src="{$link->getImageLink($product->link_rewrite, $cover.id_image, 'large_default')|escape:'html':'UTF-8'}" title="{if !empty($cover.legend)}{$cover.legend|escape:'html':'UTF-8'}{else}{$product->name|escape:'html':'UTF-8'}{/if}" alt="{if !empty($cover.legend)}{$cover.legend|escape:'html':'UTF-8'}{else}{$product->name|escape:'html':'UTF-8'}{/if}"/>
								</a>
							{else}
								<img id="bigpic"  src="{$link->getImageLink($product->link_rewrite, $cover.id_image, 'large_default')|escape:'html':'UTF-8'}" title="{if !empty($cover.legend)}{$cover.legend|escape:'html':'UTF-8'}{else}{$product->name|escape:'html':'UTF-8'}{/if}" alt="{if !empty($cover.legend)}{$cover.legend|escape:'html':'UTF-8'}{else}{$product->name|escape:'html':'UTF-8'}{/if}" width="{$largeSize.width}" height="{$largeSize.height}"/>
								{if !$content_only}
									<span class="span_link no-print">{l s='Expand'}</span>
								{/if}
							{/if}
						</span>
					{else}
						<span id="view_full_size">
							<img  src="{$img_prod_dir}{$lang_iso}-default-large_default.jpg" id="bigpic" alt="" title="{$product->name|escape:'html':'UTF-8'}" width="{$largeSize.width}" height="{$largeSize.height}"/>
							{if !$content_only}
								<span class="span_link">
									{l s='expand'}
								</span>
							{/if}
						</span>
					{/if}
				</div> <!-- end image-block -->
				{if isset($images) && count($images) > 0}
					<!-- thumbnails -->
					<div id="views_block" class="clearfix {if isset($images) && count($images) < 2}hidden{/if}">
						{if isset($images) && count($images) > 2}
							<span class="view_scroll_spacer">
								<a id="view_scroll_left" class="" title="{l s='Other views'}" href="javascript:{ldelim}{rdelim}">
									{l s='Previous'}
								</a>
							</span>
						{/if}
						<div id="thumbs_list">
							<ul id="thumbs_list_frame">
							{if isset($images)}
								{foreach from=$images item=image name=thumbnails}
									{assign var=imageIds value="`$product->id`-`$image.id_image`"}
									{if !empty($image.legend)}
										{assign var=imageTitle value=$image.legend|escape:'html':'UTF-8'}
									{else}
										{assign var=imageTitle value=$product->name|escape:'html':'UTF-8'}
									{/if}
									<li id="thumbnail_{$image.id_image}"{if $smarty.foreach.thumbnails.last} class="last"{/if}>
										<a{if $jqZoomEnabled && $have_image && !$content_only} href="javascript:void(0);" rel="{literal}{{/literal}gallery: 'gal1', smallimage: '{$link->getImageLink($product->link_rewrite, $imageIds, 'large_default')|escape:'html':'UTF-8'}',largeimage: '{$link->getImageLink($product->link_rewrite, $imageIds, 'thickbox_default')|escape:'html':'UTF-8'}'{literal}}{/literal}"{else} href="{$link->getImageLink($product->link_rewrite, $imageIds, 'thickbox_default')|escape:'html':'UTF-8'}"	data-fancybox-group="other-views" class="fancybox{if $image.id_image == $cover.id_image} shown{/if}"{/if} title="{$imageTitle}">
											<img class="img-responsive" id="thumb_{$image.id_image}" src="{$link->getImageLink($product->link_rewrite, $imageIds, 'cart_default')|escape:'html':'UTF-8'}" alt="{$imageTitle}" title="{$imageTitle}"{if isset($cartSize)} height="{$cartSize.height}" width="{$cartSize.width}"{/if}  />
										</a>
									</li>
								{/foreach}
							{/if}
							</ul>
						</div> <!-- end thumbs_list -->
						{if isset($images) && count($images) > 2}
							<a id="view_scroll_right" title="{l s='Other views'}" href="javascript:{ldelim}{rdelim}">
								{l s='Next'}
							</a>
						{/if}
					</div> <!-- end views-block -->
					<!-- end thumbnails -->
				{/if}
				{if isset($images) && count($images) > 1}
					<p class="resetimg clear no-print">
						<span id="wrapResetImages" style="display: none;">
							<a href="{$link->getProductLink($product)|escape:'html':'UTF-8'}" data-id="resetImages">
								<i class="icon-repeat"></i>
								{l s='Display all pictures'}
							</a>
						</span>
					</p>
				{/if}
			</div> <!-- end pb-left-column -->
			<!-- end left infos-->
	
			<!-- center infos -->
			<div class="pb-center-column col-xs-12 col-sm-6"> 
				{if $product->online_only}
					<p class="online_only">{l s='Online only'}</p>
				{/if}
				<h1 >{$product->name|escape:'html':'UTF-8'}</h1>
	
				{assign var="manpic" value="img/m/{$product_manufacturer->id_manufacturer}.jpg"}
	
				<div class="referencesmm {if file_exists($manpic)}extraPadd{/if}">
					<div class="logoimage">
						
						{if file_exists($manpic)}
						<a href="{$link->getManufacturerLink($product->id_manufacturer)}"><img src="{$content_dir}img/m/{$product_manufacturer->id_manufacturer}-medium_default.jpg" /></a>{/if}
					</div>
					<p id="product_reference"{if empty($product->reference) || !$product->reference} style="display: none;"{/if}>
						<label>{l s='Sku:'} </label> 
						<span class="editable"  
						content="{$product->reference|escape:'html':'UTF-8'}">{$product->reference|escape:'html':'UTF-8'}</span>
						{if !empty($product->reference) && $product->reference}
							<meta  content="{$product->reference}" />  <!-- If not have mpn, use the reference val. -->
						{/if}
						<meta  content="{if $product->manufacturer_name}{$product->manufacturer_name}{else}Massageboutik{/if}" />
						<meta  content="{$product->description|strip_tags}" />
	
	
					</p>
					{if !$product->is_virtual && $product->condition}
					
			{if $product->manufacturer_name}
					<p id="brand">
						<label>{l s="Brand"}</label>
						<span><a href="{$link->getManufacturerLink($product->id_manufacturer)}">
						{$product->manufacturer_name|escape:'htmlall':'UTF-8'}
					</a></span>
		{/if}
					</p>{/if}
					{if $product->available_for_order}
					{if $product->additional_shipping_cost > 0}
					<p>
						<label>{l s="Shipping"} </label>
						<span>
						   {l s=" Additional shipping fees"} {if $lang_iso == 'en'}${/if}{$product->additional_shipping_cost} {if $lang_iso == 'fr'}${/if}
					</span>
	
					</p>
					{else}
					<p>
						<label class="doublesize">{l s="Shipping"}</label>
						<span><a href="{$link->getCMSLink(1)}">
						   {l s="Free shipping on orders over $349.99 in Canada*"} <br>
						   {l s="Flat $14.99 shipping on everything else!"} 
							</a>
						</span>
						<span class="clearfix"></span>
					</p>
					{/if}
					{else}
						<p >
						<label class="doublesize">{l s="Rental solution"}</label>
						<span>
						   {l s="Daily, weekly, monthly or annual rental service. Call us or to come visit us directly in our store."}
					</span>
	
					</p>
					{/if}
				
				</div>
	
	
				{if $product->custom_info_a}
				<div class="mm-cust_service info_a">
					{$product->custom_info_a}			
				</div>
				{/if}
				
				{assign var=banprods value=[318,707]} {*Only display banner on this ids products*}
				{assign var=banbrand value=[15]} {*Only display banner on this ids brands*}
	
				{if (in_array($product->id, $banprods)) or (in_array($product->id_manufacturer,$banbrand))}
	
				<div class="mm-cust_service">
					<span class="cust_icon"></span>
					<div>
						<h4>{l s='Custom embroidery service'}</h4>
						<p>{l s='Have your logo, name or message embroidered on our clothes and accessories. Our embroidery is durable and professional quality. No minimum quantity.'}</p>
						<p><a href="{$link->getCMSLink('6', null)}" class="btn-Getmoreinfo">{l s='Get more information'}</a></p>
						<p><a href="{$link->getCMSLink('6', null)}" class="btn-Custyourp">{l s='Customize your product'}</a></p>
					</div>
	
	
				</div>
				{/if}
	
	
	
	
				
				{if ($product->show_price && !isset($restricted_country_mode)) || isset($groups) || $product->reference || (isset($HOOK_PRODUCT_ACTIONS) && $HOOK_PRODUCT_ACTIONS)}
				<!-- add to cart form-->
				<form id="buy_block"{if $PS_CATALOG_MODE && !isset($groups) && $product->quantity > 0} class="hidden"{/if} action="{$link->getPageLink('cart')|escape:'html':'UTF-8'}" method="post">
					<!-- hidden datas -->
					<p class="hidden">
						<input type="hidden" name="token" value="{$static_token}" />
						<input type="hidden" name="id_product" value="{$product->id|intval}" id="product_page_product_id" />
						<input type="hidden" name="add" value="1" />
						<input type="hidden" name="id_product_attribute" id="idCombination" value="" />
					</p>
	
	
					
					{if !$logged}
	
					{if $lang_iso == "fr" }
						{$ProTitle='PRIX PROFESSIONNEL'}
						{$ProTxt='Prix professionnel disponibles dans votre compte client.'}
						{$Probutton='Accéder à votre compte'}
						
	
					{else}
						{$ProTitle='Professional prices'}
						{$ProTxt='Professional prices available in your customer account.'}
						{$Probutton='Log in to your account'}
					{/if}
	
	
					{assign var="mm_SpecificProducts" value=[179,180,195]}
					{assign var=idbrands value=[24,26]} {*Only display banner on this ids brands*}
	
					
						{if (in_array($product->id, $mm_SpecificProducts)) || (in_array($product->id_manufacturer, $idbrands))}
						<div class="mm_pro-prices">
							<h4>{$ProTitle}</h4>
							<p>{$ProTxt}</p>
							<a href="{$link->getPageLink('my-account', true)|escape:'html':'UTF-8'}">{$Probutton}</a>
						</div>
						{/if}
					{/if}
	
	
					<div class="box-info-product">
						<div class="content_prices clearfix">
							{if $product->show_price && !isset($restricted_country_mode) && !$PS_CATALOG_MODE}
								<!-- prices -->
								<div>
									<p class="our_price_display"   >{strip}
										<meta  content="{'Y'|date}-12-31" />
										<meta  content="{$link->getProductLink($product)}">
	
										{*if $product->quantity > 0*}<link  href="https://schema.org/InStock"/>{*/if*}
	
										{if $priceDisplay >= 0 && $priceDisplay <= 2}
											<span id="our_price_display" class="price"  content="{$productPrice}">{convertPrice price=$productPrice|floatval}</span>
											{if $tax_enabled  && ((isset($display_tax_label) && $display_tax_label == 1) || !isset($display_tax_label))}
												{if $priceDisplay == 1} {l s='tax excl.'}{else} {l s='tax incl.'}{/if}
											{/if}
											<meta  content="{$currency->iso_code}" />
											{hook h="displayProductPriceBlock" product=$product type="price"}
										{/if}
									{/strip}</p>
									<p id="reduction_percent" {if $productPriceWithoutReduction <= 0 || !$product->specificPrice || $product->specificPrice.reduction_type != 'percentage'} style="display:none;"{/if}>{strip}
										<span id="reduction_percent_display">
											{if $product->specificPrice && $product->specificPrice.reduction_type == 'percentage'}-{$product->specificPrice.reduction*100}%{/if}
										</span>
									{/strip}</p>
									<p id="reduction_amount" {if $productPriceWithoutReduction <= 0 || !$product->specificPrice || $product->specificPrice.reduction_type != 'amount' || $product->specificPrice.reduction|floatval ==0} style="display:none"{/if}>{strip}
										<span id="reduction_amount_display">
										{if $product->specificPrice && $product->specificPrice.reduction_type == 'amount' && $product->specificPrice.reduction|floatval !=0}
											-{convertPrice price=$productPriceWithoutReduction|floatval-$productPrice|floatval}
										{/if}
										</span>
									{/strip}</p>
									<p id="old_price"{if (!$product->specificPrice || !$product->specificPrice.reduction)} class="hidden"{/if}>{strip}
										{if $priceDisplay >= 0 && $priceDisplay <= 2}
											{hook h="displayProductPriceBlock" product=$product type="old_price"}
											<span id="old_price_display"><span class="price">{if $productPriceWithoutReduction > $productPrice}{convertPrice price=$productPriceWithoutReduction|floatval}{/if}</span>{if $productPriceWithoutReduction > $productPrice && $tax_enabled && $display_tax_label == 1} {if $priceDisplay == 1}{l s='tax excl.'}{else}{l s='tax incl.'}{/if}{/if}</span>
										{/if}
									{/strip}</p>
									{if $priceDisplay == 2}
										<br />
										<span id="pretaxe_price">{strip}
											<span id="pretaxe_price_display">{convertPrice price=$product->getPrice(false, $smarty.const.NULL)}</span> {l s='tax excl.'}
										{/strip}</span>
									{/if}
								</div> <!-- end prices -->
								{if $packItems|@count && $productPrice < $product->getNoPackPrice()}
									<p class="pack_price">{l s='Instead of'} <span style="text-decoration: line-through;">{convertPrice price=$product->getNoPackPrice()}</span></p>
								{/if}
								{if $product->ecotax != 0}
									<p class="price-ecotax">{l s='Including'} <span id="ecotax_price_display">{if $priceDisplay == 2}{$ecotax_tax_exc|convertAndFormatPrice}{else}{$ecotax_tax_inc|convertAndFormatPrice}{/if}</span> {l s='for ecotax'}
										{if $product->specificPrice && $product->specificPrice.reduction}
										<br />{l s='(not impacted by the discount)'}
										{/if}
									</p>
								{/if}
								{if !empty($product->unity) && $product->unit_price_ratio > 0.000000}
									{math equation="pprice / punit_price" pprice=$productPrice  punit_price=$product->unit_price_ratio assign=unit_price}
									<p class="unit-price"><span id="unit_price_display">{convertPrice price=$unit_price}</span> {l s='per'} {$product->unity|escape:'html':'UTF-8'}</p>
									{hook h="displayProductPriceBlock" product=$product type="unit_price"}
								{/if}
							{/if} {*close if for show price*}
							{hook h="displayProductPriceBlock" product=$product type="weight" hook_origin='product_sheet'}
							{hook h="displayProductPriceBlock" product=$product type="after_price"}
							<div class="clear"></div>
						</div> <!-- end content_prices -->
						<div class="product_attributes clearfix">
							
							<!-- minimal quantity wanted -->
							<p id="minimal_quantity_wanted_p"{if $product->minimal_quantity <= 1 || !$product->available_for_order || $PS_CATALOG_MODE} style="display: none;"{/if}>
								{l s='The minimum purchase order quantity for the product is'} <b id="minimal_quantity_label">{$product->minimal_quantity}</b>
							</p>
							{if isset($groups)}
								<!-- attributes -->
								<div id="attributes">
									<div class="clearfix"></div>
									{foreach from=$groups key=id_attribute_group item=group}
										{if $group.attributes|@count}
											<fieldset class="attribute_fieldset">
												<label class="attribute_label" {if $group.group_type != 'color' && $group.group_type != 'radio'}for="group_{$id_attribute_group|intval}"{/if}>{$group.name|escape:'html':'UTF-8'}
												{assign var="groupName" value="group_$id_attribute_group"} : {if $group.group_type == 'color'} &nbsp;
													{foreach from=$group.attributes key=id_attribute item=group_attribute}
													
																
	
																{if ($group.default == $id_attribute)}
																<span class="colornamelabel">{$colors.$id_attribute.name|escape:'html':'UTF-8'}</span>
																{/if}
													{/foreach}			
															
																		
													
												{/if}	
													</label>											
												<div class="attribute_list">
													{if ($group.group_type == 'select')}
														<ul id="selectlist" class="clearfix">
															{assign var="default_colorpicker" value=""}
															{foreach from=$group.attributes key=id_attribute item=group_attribute}
																{assign var='img_color_exists' value=file_exists($col_img_dir|cat:$id_attribute|cat:'.jpg')}
																<li{if $group.default == $id_attribute} class="selected"{/if} class="">
																	<a href="{$link->getProductLink($product)|escape:'html':'UTF-8'}" id="color_{$id_attribute|intval}" name="{$colors.$id_attribute.name|escape:'html':'UTF-8'}" class="longlist_pick" title="{$colors.$id_attribute.name|escape:'html':'UTF-8'}">
																		{$group_attribute|escape:'html':'UTF-8'}
																	</a>
																</li>
																{if ($group.default == $id_attribute)}
																	{$default_colorpicker = $id_attribute}
																{/if}
															{/foreach}
														</ul>
														<input type="hidden" class="color_pick_hidden longselect" name="{$groupName|escape:'html':'UTF-8'}" value="{$group.default}" />
	
															
													{elseif ($group.group_type == 'color')}
														<ul id="color_to_pick_list" class="clearfix">
															{assign var="default_colorpicker" value=""}
															{foreach from=$group.attributes key=id_attribute item=group_attribute}
																{assign var='img_color_exists' value=file_exists($col_img_dir|cat:$id_attribute|cat:'.jpg')}
																<li class="{if $group.default == $id_attribute} selected {/if} col-sm-3">
																	<a href="{$link->getProductLink($product)|escape:'html':'UTF-8'}" id="color_{$id_attribute|intval}" name="{$colors.$id_attribute.name|escape:'html':'UTF-8'}" class="color_pick{if ($group.default == $id_attribute)} selected{/if}"{if !$img_color_exists && isset($colors.$id_attribute.value) && $colors.$id_attribute.value} style="background:{$colors.$id_attribute.value|escape:'html':'UTF-8'};"{/if} title="{$colors.$id_attribute.name|escape:'html':'UTF-8'}">
																		{if $img_color_exists}
																			<img src="{$img_col_dir}{$id_attribute|intval}.jpg" alt="{$colors.$id_attribute.name|escape:'html':'UTF-8'}" title="{$colors.$id_attribute.name|escape:'html':'UTF-8'}" width="20" height="20" />
																		{/if}
																	</a>
																</li>
																{if ($group.default == $id_attribute)}
																	{$default_colorpicker = $id_attribute}
																{/if}
															{/foreach}
														</ul>
														<input type="hidden" class="color_pick_hidden" name="{$groupName|escape:'html':'UTF-8'}" value="{$default_colorpicker|intval}" />
													{elseif ($group.group_type == 'radio')}
														<ul>
															{foreach from=$group.attributes key=id_attribute item=group_attribute}
																<li>
																	<input type="radio" class="attribute_radio" name="{$groupName|escape:'html':'UTF-8'}" value="{$id_attribute}" {if ($group.default == $id_attribute)} checked="checked"{/if} />
																	<span>{$group_attribute|escape:'html':'UTF-8'}</span>
																</li>
															{/foreach}
														</ul>
													{/if}
												</div> <!-- end attribute_list -->
											</fieldset>
										{/if}
									{/foreach}
								</div> <!-- end attributes -->
							{/if}
						</div> <!-- end product_attributes -->
						
						{hook h="displayMultiAccessoriesProduct"}
						<!-- quantity wanted -->
						<div class="addtocartbox"><div class="quantity">	
							 {if !$PS_CATALOG_MODE}
								 <p id="quantity_wanted_p"{if (!$allow_oosp && $product->quantity <= 0) || !$product->available_for_order || $PS_CATALOG_MODE} style="display: none;"{/if}>
									 <label for="quantity_wanted">{l s='Qty:'}</label>
									 <input type="number" min="1" name="qty" id="quantity_wanted" class="text" value="{if isset($quantityBackup)}{$quantityBackup|intval}{else}{if $product->minimal_quantity > 1}{$product->minimal_quantity}{else}1{/if}{/if}" />
									 
									 <span class="clearfix"></span>
								 </p>
							 {/if}
							 </div>					
							 <div class="box-cart-bottom">
								 <div{if (!$allow_oosp && $product->quantity <= 0) || !$product->available_for_order || (isset($restricted_country_mode) && $restricted_country_mode) || $PS_CATALOG_MODE} class="unvisible"{/if}>
									 <p id="add_to_cart" class="buttons_bottom_block no-print">
										 <button type="submit" name="Submit" class="exclusive">
											 <span>{if $content_only && (isset($product->customization_required) && $product->customization_required)}{l s='Customize'}{else}{l s='Add to cart'}{/if}</span>
										 </button>
									 </p>
								 </div>
								 
							 </div>
							 {if isset($HOOK_PRODUCT_ACTIONS) && $HOOK_PRODUCT_ACTIONS}{$HOOK_PRODUCT_ACTIONS}{/if}
						</div> <!-- end box-cart-bottom -->
					</div> <!-- end box-info-product -->
				</form>
				{/if}
							<script>
								
											$( '#add_to_cart' ).click(function() {
				fbq('track', 'AddToCart', {
					content_ids: 'CA{$product->id}',
					content_type: 'product',
				}); 
				})
				</script>
				{if ($display_qties == 1 && !$PS_CATALOG_MODE && $PS_STOCK_MANAGEMENT && $product->available_for_order)}
					<!-- number of item in stock -->
					<p id="pQuantityAvailable"{if $product->quantity <= 0} style="display: none;"{/if}>
						<span id="quantityAvailable">{$product->quantity|intval}</span>
						<span {if $product->quantity > 1} style="display: none;"{/if} id="quantityAvailableTxt">{l s='Item'}</span>
						<span {if $product->quantity == 1} style="display: none;"{/if} id="quantityAvailableTxtMultiple">{l s='Items'}</span>
					</p>
				{/if}
				<!-- availability or doesntExist -->
				<p id="availability_statut"{if !$PS_STOCK_MANAGEMENT || ($product->quantity <= 0 && !$product->available_later && $allow_oosp) || ($product->quantity > 0 && !$product->available_now) || !$product->available_for_order || $PS_CATALOG_MODE} style="display: none;"{/if}>
					{*<span id="availability_label">{l s='Availability:'}</span>*}
					<span id="availability_value" class="label{if $product->quantity <= 0 && !$allow_oosp} label-danger{elseif $product->quantity <= 0} label-warning{else} label-success{/if}">{if $product->quantity <= 0}{if $PS_STOCK_MANAGEMENT && $allow_oosp}{$product->available_later}{else}{l s='This product is no longer in stock'}{/if}{elseif $PS_STOCK_MANAGEMENT}{$product->available_now}{/if}</span>
				</p>
				{if $PS_STOCK_MANAGEMENT}
					{if !$product->is_virtual}{hook h="displayProductDeliveryTime" product=$product}{/if}
					<p class="warning_inline" id="last_quantities"{if ($product->quantity > $last_qties || $product->quantity <= 0) || $allow_oosp || !$product->available_for_order || $PS_CATALOG_MODE} style="display: none"{/if} >{l s='Warning: Last items in stock!'}</p>
				{/if}
				<p id="availability_date"{if ($product->quantity > 0) || !$product->available_for_order || $PS_CATALOG_MODE || !isset($product->available_date) || $product->available_date < $smarty.now|date_format:'%Y-%m-%d'} style="display: none;"{/if}>
					<span id="availability_date_label">{l s='Availability date:'}</span>
					<span id="availability_date_value">{if Validate::isDate($product->available_date)}{dateFormat date=$product->available_date full=false}{/if}</span>
				</p>
				<!-- Out of stock hook -->
				<div id="oosHook"{if $product->quantity > 0} style="display: none;"{/if}>
					{$HOOK_PRODUCT_OOS}
				</div>
				{if isset($HOOK_EXTRA_RIGHT) && $HOOK_EXTRA_RIGHT}{$HOOK_EXTRA_RIGHT}{/if}
				<!-- usefull links-->
				{if !$content_only}
					<ul id="usefull_link_block" class="usefullHidden">
						
						
						{if $HOOK_EXTRA_LEFT}{$HOOK_EXTRA_LEFT}{/if}
					</ul>
				{/if}
	
	
				<div class="talktoexpert">
					<div class="expert"><img src="{$img_dir}expert.png" alt=""></div>
					<div class="text">
						<strong>{l s="TALK TO AN EXPERT"}</strong>
						<span>{l s="We are here to help you"}</span>
					</div>
					<div class="butcont">
						<ul>
							<li><a href="tel:1-866-931-0920"><i class="icon-phone"></i></i>1-866-931-0920</a></li>
							<li><a href="http://m.me/massageboutik" target="_blank"><i class="fab fa-facebook-messenger"></i>Messenger</a></li>
						</ul>
					</div>
				</div>
				<div class="talktoexpert available">
					<div class="expert"><a href="{$link->getPageLink('contact-form.php')}" title="{l s='Contact Us' mod='blockcms'}"><img src="{$img_dir}available.svg" alt="" width="50px"></div></a>
					<div class="text"><a href="{$link->getPageLink('contact-form.php')}" title="{l s='Contact Us' mod='blockcms'}">
						<strong>{l s="If this item is not available,"}</strong>
						<span>{l s="Contact us for an order with our supplier."}</span></a>
					</div>
				</div>
	
				
			</div>
			<!-- end center infos-->
			<!-- pb-right-column-->
			<div class="pb-right-column col-xs-12 col-sm-4 col-md-3">
				
			</div> <!-- end pb-right-column-->
		</div> <!-- end primary_block -->
		{if !$content_only}
	{if (isset($quantity_discounts) && count($quantity_discounts) > 0)}
				<!-- quantity discount -->
				<section class="page-product-box">
					<h3 class="page-product-heading">{l s='Volume discounts'}</h3>
					<div id="quantityDiscount">
						<table class="std table-product-discounts">
							<thead>
								<tr>
									<th>{l s='Quantity'}</th>
									<th>{if $display_discount_price}{l s='Price'}{else}{l s='Discount'}{/if}</th>
									<th>{l s='You Save'}</th>
								</tr>
							</thead>
							<tbody>
							{foreach from=$quantity_discounts item='quantity_discount' name='quantity_discounts'}
								{if $quantity_discount.price >= 0 || $quantity_discount.reduction_type == 'amount'}
									{$realDiscountPrice=$productPriceWithoutReduction|floatval-$quantity_discount.real_value|floatval}
								{else}
									{$realDiscountPrice=$productPriceWithoutReduction|floatval-($productPriceWithoutReduction*$quantity_discount.reduction)|floatval}
								{/if}
								<tr id="quantityDiscount_{$quantity_discount.id_product_attribute}" class="quantityDiscount_{$quantity_discount.id_product_attribute}" data-real-discount-value="{convertPrice price = $realDiscountPrice}" data-discount-type="{$quantity_discount.reduction_type}" data-discount="{$quantity_discount.real_value|floatval}" data-discount-quantity="{$quantity_discount.quantity|intval}">
									<td>
										{$quantity_discount.quantity|intval}
									</td>
									<td>
										{if $quantity_discount.price >= 0 || $quantity_discount.reduction_type == 'amount'}
											{if $display_discount_price}
												{if $quantity_discount.reduction_tax == 0 && !$quantity_discount.price}
													{convertPrice price = $productPriceWithoutReduction|floatval-($productPriceWithoutReduction*$quantity_discount.reduction_with_tax)|floatval}
												{else}
													{convertPrice price=$productPriceWithoutReduction|floatval-$quantity_discount.real_value|floatval}
												{/if}
											{else}
												{convertPrice price=$quantity_discount.real_value|floatval}
											{/if}
										{else}
											{if $display_discount_price}
												{if $quantity_discount.reduction_tax == 0}
													{convertPrice price = $productPriceWithoutReduction|floatval-($productPriceWithoutReduction*$quantity_discount.reduction_with_tax)|floatval}
												{else}
													{convertPrice price = $productPriceWithoutReduction|floatval-($productPriceWithoutReduction*$quantity_discount.reduction)|floatval}
												{/if}
											{else}
												{$quantity_discount.real_value|floatval}%
											{/if}
										{/if}
									</td>
									<td>
										<span>{l s='Up to'}</span>
										{if $quantity_discount.price >= 0 || $quantity_discount.reduction_type == 'amount'}
											{$discountPrice=$productPriceWithoutReduction|floatval-$quantity_discount.real_value|floatval}
										{else}
											{$discountPrice=$productPriceWithoutReduction|floatval-($productPriceWithoutReduction*$quantity_discount.reduction)|floatval}
										{/if}
										{$discountPrice=$discountPrice * $quantity_discount.quantity}
										{$qtyProductPrice=$productPriceWithoutReduction|floatval * $quantity_discount.quantity}
										{convertPrice price=$qtyProductPrice - $discountPrice}
									</td>
								</tr>
							{/foreach}
							</tbody>
						</table>
					</div>
				</section>
			{/if}
			{if isset($product) && $product->description}
				<!-- More info -->
				<section class="page-product-box">
					<h3 class="page-product-heading strong">{if $lang_iso == en}{l s='More information'}{else}EN SAVOIR PLUS{/if}</h3>
					<!-- full description -->
					<div class="short-description" style="display: none">{$product->description_short}</div>
					<div  class="rte">{$product->description}</div>
				</section>
				<!--end  More info -->
			{/if}
			{if isset($product->newtab_name) && $product->newtab_name}
				<!-- MM New block with custom content "see product in BO" -->
				<section class="page-product-box">
					<h3 class="page-product-heading strong">{$product->newtab_name}</h3>
					<div class="rte">
						{$product->newtab_desc}
					</div>
				</section>
				<!--end Data sheet -->
			{/if}
			{if isset($features) && $features}
				<!-- Data sheet -->
				<section class="page-product-box">
					<h3 class="page-product-heading strong">{l s='Data sheet'}</h3>
					<table class="table-data-sheet">
						{foreach from=$features item=feature}
						<tr class="{cycle values="odd,even"}">
							{if isset($feature.value)}
							<td>{$feature.name|escape:'html':'UTF-8'}</td>
							<td>{$feature.value|escape:'html':'UTF-8'}</td>
							{/if}
						</tr>
						{/foreach}
					</table>
				</section>
				<!--end Data sheet -->
			{/if}
			
			{if isset($packItems) && $packItems|@count > 0}
			<section id="blockpack">
				<h3 class="page-product-heading">{l s='Pack content'}</h3>
				{include file="$tpl_dir./product-list.tpl" products=$packItems}
			</section>
			{/if}
			<!--HOOK_PRODUCT_TAB -->
			<section id="reviews" class="page-product-box">
				{$HOOK_PRODUCT_TAB}
				{if isset($HOOK_PRODUCT_TAB_CONTENT) && $HOOK_PRODUCT_TAB_CONTENT}{$HOOK_PRODUCT_TAB_CONTENT}{/if}
			</section>
	
			
			
			<!--end HOOK_PRODUCT_TAB -->
			{if isset($accessories) && $accessories}
				<!--Accessories -->
				<section class="page-product-box">
					<h3 class="page-product-heading">{l s='Accessories'}</h3>
					<div class="block products_block accessories-block clearfix">
						<div class="block_content">
							<ul class="product_list grid row clearfix">
	
								{foreach from=$accessories item=accessory name=accessories_list}
									{if ($accessory.allow_oosp || $accessory.quantity_all_versions > 0 || $accessory.quantity > 0) && $accessory.available_for_order && !isset($restricted_country_mode)}
										{assign var='accessoryLink' value=$link->getProductLink($accessory.id_product, $accessory.link_rewrite, $accessory.category)}
										<li class="ajax_block_product col-md-3 col-sm-4 col-xs-12   first-item-of-tablet-line first-item-of-mobile-line">
											<div class="product-container">
												<div class="left-block">
													<div class="product-image-container">
														<a href="{$accessoryLink|escape:'html':'UTF-8'}" title="{$accessory.legend|escape:'html':'UTF-8'}" class="product-image product_image">
															<img class="lazyOwl" src="{$link->getImageLink($accessory.link_rewrite, $accessory.id_image, 'home_default')|escape:'html':'UTF-8'}" alt="{$accessory.legend|escape:'html':'UTF-8'}" width="{$homeSize.width}" height="{$homeSize.height}"/>
														</a>
														<div class="hoverbuttons">
	
					<div class="functional-buttons clearfix">
						<div class="quick-view-wrapper">
							<a class="quick-view" href="http://localhost/massageboutik.com/fr/equipements-de-massage/314-table-nomad-proflex.html" rel="http://localhost/massageboutik.com/fr/equipements-de-massage/314-table-nomad-proflex.html">
								<i class="icon-eye-open"></i>
							</a>
						</div>
	
						<div class="wishlist">
							<a class="addToWishlist wishlistProd_314" href="#" data-rel="314" onclick="WishlistCart('wishlist_block_list', 'add', '314', false, 1); return false;">
	
							</a>
						</div>
	
						<div class="compare">
							<a class="add_to_compare" href="http://localhost/massageboutik.com/fr/equipements-de-massage/314-table-nomad-proflex.html" data-id-product="314"></a>
						</div>
					</div>
	
				</div>
														
													</div>
												</div>
												<div class="right-block">												
														<h5 class="product-name">
															<a href="{$accessoryLink|escape:'html':'UTF-8'}">
																{$accessory.name|truncate:50:'...':true|escape:'html':'UTF-8'}
															</a>
														</h5>
														<br>
														{*if $accessory.show_price && !isset($restricted_country_mode) && !$PS_CATALOG_MODE}
														<span class="price">
															{if $priceDisplay != 1}
															{displayWtPrice p=$accessory.price}
															{else}
															{displayWtPrice p=$accessory.price_tax_exc}
															{/if}
															{hook h="displayProductPriceBlock" product=$accessory type="price"}
														</span>
														{/if*}
														{hook h="displayProductPriceBlock" product=$accessory type="after_price"}
													
													<div class="clearfix" style="margin-top:5px">
														{if !$PS_CATALOG_MODE && ($accessory.allow_oosp || $accessory.quantity > 0) && isset($add_prod_display) && $add_prod_display == 1}
														<div class="no-print">
															<a class="button ajax_add_to_cart_button btn btn-default" href="{$link->getPageLink('cart', true, NULL, "qty=1&amp;id_product={$accessory.id_product|intval}&amp;token={$static_token}&amp;add")|escape:'html':'UTF-8'}" data-id-product="{$accessory.id_product|intval}" title="{l s='Add to cart'}">
																<span>{l s='Add to cart'}</span>
															</a>
														</div>
														{/if}
													</div>
	
													
												</div>
											</div>
										</li>
									{/if}
								{/foreach}
							</ul>
						</div>
					</div>
				</section>
				<!--end Accessories -->
			{/if}
			
			{if isset($HOOK_PRODUCT_FOOTER) && $HOOK_PRODUCT_FOOTER}{$HOOK_PRODUCT_FOOTER}{/if}
			<!-- description & features -->
			{if (isset($product) && $product->description) || (isset($features) && $features) || (isset($accessories) && $accessories) || (isset($HOOK_PRODUCT_TAB) && $HOOK_PRODUCT_TAB) || (isset($attachments) && $attachments) || isset($product) && $product->customizable}
				{if isset($attachments) && $attachments}
				<!--Download -->
				<section class="page-product-box">
					<h3 class="page-product-heading">{l s='Download'}</h3>
					{foreach from=$attachments item=attachment name=attachements}
						{if $smarty.foreach.attachements.iteration %3 == 1}<div class="row">{/if}
							<div class="col-lg-4">
								<h4><a href="{$link->getPageLink('attachment', true, NULL, "id_attachment={$attachment.id_attachment}")|escape:'html':'UTF-8'}">{$attachment.name|escape:'html':'UTF-8'}</a></h4>
								<p class="text-muted">{$attachment.description|escape:'html':'UTF-8'}</p>
								<a class="btn btn-default btn-block" href="{$link->getPageLink('attachment', true, NULL, "id_attachment={$attachment.id_attachment}")|escape:'html':'UTF-8'}">
									<i class="icon-download"></i>
									{l s="Download"} ({Tools::formatBytes($attachment.file_size, 2)})
								</a>
								<hr />
							</div>
						{if $smarty.foreach.attachements.iteration %3 == 0 || $smarty.foreach.attachements.last}</div>{/if}
					{/foreach}
				</section>
				<!--end Download -->
				{/if}
				{if isset($product) && $product->customizable}
				<!--Customization -->
				<section class="page-product-box">
					<h3 class="page-product-heading">{l s='Product customization'}</h3>
					<!-- Customizable products -->
					<form method="post" action="{$customizationFormTarget}" enctype="multipart/form-data" id="customizationForm" class="clearfix">
						<p class="infoCustomizable">
							{l s='After saving your customized product, remember to add it to your cart.'}
							{if $product->uploadable_files}
							<br />
							{l s='Allowed file formats are: GIF, JPG, PNG'}{/if}
						</p>
						{if $product->uploadable_files|intval}
							<div class="customizableProductsFile">
								<h5 class="product-heading-h5">{l s='Pictures'}</h5>
								<ul id="uploadable_files" class="clearfix">
									{counter start=0 assign='customizationField'}
									{foreach from=$customizationFields item='field' name='customizationFields'}
										{if $field.type == 0}
											<li class="customizationUploadLine{if $field.required} required{/if}">{assign var='key' value='pictures_'|cat:$product->id|cat:'_'|cat:$field.id_customization_field}
												{if isset($pictures.$key)}
													<div class="customizationUploadBrowse">
														<img src="{$pic_dir}{$pictures.$key}_small" alt="" />
															<a href="{$link->getProductDeletePictureLink($product, $field.id_customization_field)|escape:'html':'UTF-8'}" title="{l s='Delete'}" >
																<img src="{$img_dir}icon/delete.gif" alt="{l s='Delete'}" class="customization_delete_icon" width="11" height="13" />
															</a>
													</div>
												{/if}
												<div class="customizationUploadBrowse form-group">
													<label class="customizationUploadBrowseDescription">
														{if !empty($field.name)}
															{$field.name}
														{else}
															{l s='Please select an image file from your computer'}
														{/if}
														{if $field.required}<sup>*</sup>{/if}
													</label>
													<input type="file" name="file{$field.id_customization_field}" id="img{$customizationField}" class="form-control customization_block_input {if isset($pictures.$key)}filled{/if}" />
												</div>
											</li>
											{counter}
										{/if}
									{/foreach}
								</ul>
							</div>
						{/if}
						{if $product->text_fields|intval}
							<div class="customizableProductsText">
								<h5 class="product-heading-h5">{l s='Text'}</h5>
								<ul id="text_fields">
								{counter start=0 assign='customizationField'}
								{foreach from=$customizationFields item='field' name='customizationFields'}
									{if $field.type == 1}
										<li class="customizationUploadLine{if $field.required} required{/if}">
											<label for ="textField{$customizationField}">
												{assign var='key' value='textFields_'|cat:$product->id|cat:'_'|cat:$field.id_customization_field}
												{if !empty($field.name)}
													{$field.name}
												{/if}
												{if $field.required}<sup>*</sup>{/if}
											</label>
											<textarea name="textField{$field.id_customization_field}" class="form-control customization_block_input" id="textField{$customizationField}" rows="3" cols="20">{strip}
												{if isset($textFields.$key)}
													{$textFields.$key|stripslashes}
												{/if}
											{/strip}</textarea>
										</li>
										{counter}
									{/if}
								{/foreach}
								</ul>
							</div>
						{/if}
						<p id="customizedDatas">
							<input type="hidden" name="quantityBackup" id="quantityBackup" value="" />
							<input type="hidden" name="submitCustomizedDatas" value="1" />
							<button class="button btn btn-default button button-small" name="saveCustomization">
								<span>{l s='Save'}</span>
							</button>
							<span id="ajax-loader" class="unvisible">
								<img src="{$img_ps_dir}loader.gif" alt="loader" />
							</span>
						</p>
					</form>
					<p class="clear required"><sup>*</sup> {l s='required fields'}</p>
				</section>
				<!--end Customization -->
				{/if}
			{/if}
		{/if}
		<div class="content_sortPagiBar clearfix" style="display:none;">
					<div class="sortPagiBar clearfix">
						{include file="{$tpl_dir}product-compare.tpl"}
					</div>
				</div>
	</div> <!--  product wrapper -->
	{strip}
	{if isset($smarty.get.ad) && $smarty.get.ad}
		{addJsDefL name=ad}{$base_dir|cat:$smarty.get.ad|escape:'html':'UTF-8'}{/addJsDefL}
	{/if}
	{if isset($smarty.get.adtoken) && $smarty.get.adtoken}
		{addJsDefL name=adtoken}{$smarty.get.adtoken|escape:'html':'UTF-8'}{/addJsDefL}
	{/if}
	{addJsDef allowBuyWhenOutOfStock=$allow_oosp|boolval}
	{addJsDef availableNowValue=$product->available_now|escape:'quotes':'UTF-8'}
	{addJsDef availableLaterValue=$product->available_later|escape:'quotes':'UTF-8'}
	{addJsDef attribute_anchor_separator=$attribute_anchor_separator|escape:'quotes':'UTF-8'}
	{addJsDef attributesCombinations=$attributesCombinations}
	{addJsDef currentDate=$smarty.now|date_format:'%Y-%m-%d %H:%M:%S'}
	{if isset($combinations) && $combinations}
		{addJsDef combinations=$combinations}
		{addJsDef combinationsFromController=$combinations}
		{addJsDef displayDiscountPrice=$display_discount_price}
		{addJsDefL name='upToTxt'}{l s='Up to' js=1}{/addJsDefL}
	{/if}
	{if isset($combinationImages) && $combinationImages}
		{addJsDef combinationImages=$combinationImages}
	{/if}
	{addJsDef customizationId=$id_customization}
	{addJsDef customizationFields=$customizationFields}
	{addJsDef default_eco_tax=$product->ecotax|floatval}
	{addJsDef displayPrice=$priceDisplay|intval}
	{addJsDef ecotaxTax_rate=$ecotaxTax_rate|floatval}
	{if isset($cover.id_image_only)}
		{addJsDef idDefaultImage=$cover.id_image_only|intval}
	{else}
		{addJsDef idDefaultImage=0}
	{/if}
	{addJsDef img_ps_dir=$img_ps_dir}
	{addJsDef img_prod_dir=$img_prod_dir}
	{addJsDef id_product=$product->id|intval}
	{addJsDef jqZoomEnabled=$jqZoomEnabled|boolval}
	{addJsDef maxQuantityToAllowDisplayOfLastQuantityMessage=$last_qties|intval}
	{addJsDef minimalQuantity=$product->minimal_quantity|intval}
	{addJsDef noTaxForThisProduct=$no_tax|boolval}
	{if isset($customer_group_without_tax)}
		{addJsDef customerGroupWithoutTax=$customer_group_without_tax|boolval}
	{else}
		{addJsDef customerGroupWithoutTax=false}
	{/if}
	{if isset($group_reduction)}
		{addJsDef groupReduction=$group_reduction|floatval}
	{else}
		{addJsDef groupReduction=false}
	{/if}
	{addJsDef oosHookJsCodeFunctions=Array()}
	{addJsDef productHasAttributes=isset($groups)|boolval}
	{addJsDef productPriceTaxExcluded=($product->getPriceWithoutReduct(true)|default:'null' - $product->ecotax)|floatval}
	{addJsDef productPriceTaxIncluded=($product->getPriceWithoutReduct(false)|default:'null' - $product->ecotax * (1 + $ecotaxTax_rate / 100))|floatval}
	{addJsDef productBasePriceTaxExcluded=($product->getPrice(false, null, 6, null, false, false) - $product->ecotax)|floatval}
	{addJsDef productBasePriceTaxExcl=($product->getPrice(false, null, 6, null, false, false)|floatval)}
	{addJsDef productBasePriceTaxIncl=($product->getPrice(true, null, 6, null, false, false)|floatval)}
	{addJsDef productReference=$product->reference|escape:'html':'UTF-8'}
	{addJsDef productAvailableForOrder=$product->available_for_order|boolval}
	{addJsDef productPriceWithoutReduction=$productPriceWithoutReduction|floatval}
	{addJsDef productPrice=$productPrice|floatval}
	{addJsDef productUnitPriceRatio=$product->unit_price_ratio|floatval}
	{addJsDef productShowPrice=(!$PS_CATALOG_MODE && $product->show_price)|boolval}
	{addJsDef PS_CATALOG_MODE=$PS_CATALOG_MODE}
	{if $product->specificPrice && $product->specificPrice|@count}
		{addJsDef product_specific_price=$product->specificPrice}
	{else}
		{addJsDef product_specific_price=array()}
	{/if}
	{if $display_qties == 1 && $product->quantity}
		{addJsDef quantityAvailable=$product->quantity}
	{else}
		{addJsDef quantityAvailable=0}
	{/if}
	{addJsDef quantitiesDisplayAllowed=$display_qties|boolval}
	{if $product->specificPrice && $product->specificPrice.reduction && $product->specificPrice.reduction_type == 'percentage'}
		{addJsDef reduction_percent=$product->specificPrice.reduction*100|floatval}
	{else}
		{addJsDef reduction_percent=0}
	{/if}
	{if $product->specificPrice && $product->specificPrice.reduction && $product->specificPrice.reduction_type == 'amount'}
		{addJsDef reduction_price=$product->specificPrice.reduction|floatval}
	{else}
		{addJsDef reduction_price=0}
	{/if}
	{if $product->specificPrice && $product->specificPrice.price}
		{addJsDef specific_price=$product->specificPrice.price|floatval}
	{else}
		{addJsDef specific_price=0}
	{/if}
	{addJsDef specific_currency=($product->specificPrice && $product->specificPrice.id_currency)|boolval} {* TODO: remove if always false *}
	{addJsDef stock_management=$PS_STOCK_MANAGEMENT|intval}
	{addJsDef taxRate=$tax_rate|floatval}
	{addJsDefL name=doesntExist}{l s='This combination does not exist for this product. Please select another combination.' js=1}{/addJsDefL}
	{addJsDefL name=doesntExistNoMore}{l s='This product is no longer in stock' js=1}{/addJsDefL}
	{addJsDefL name=doesntExistNoMoreBut}{l s='with those attributes but is available with others.' js=1}{/addJsDefL}
	{addJsDefL name=fieldRequired}{l s='Please fill in all the required fields before saving your customization.' js=1}{/addJsDefL}
	{addJsDefL name=uploading_in_progress}{l s='Uploading in progress, please be patient.' js=1}{/addJsDefL}
	{addJsDefL name='product_fileDefaultHtml'}{l s='No file selected' js=1}{/addJsDefL}
	{addJsDefL name='product_fileButtonHtml'}{l s='Choose File' js=1}{/addJsDefL}
	{/strip}
	{/if}
	