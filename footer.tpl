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
{if !isset($content_only) || !$content_only}
					</div><!-- #center_column -->
					{if isset($right_column_size) && !empty($right_column_size)}
						<div id="right_column" class="col-xs-12 col-sm-{$right_column_size|intval} column">{$HOOK_RIGHT_COLUMN}</div>
					{/if}
					</div><!-- .row -->
				</div><!-- #columns -->
			</div><!-- .columns-container -->
			{if isset($HOOK_FOOTER)}
				<!-- Footer -->
				<div class="footerwhite">
					<div class="container">
						{if $page_name == category || $page_name == product || $page_name == index}
						<div class="rowbanner product">
							<div class="container">
								<div class="col-xs-12 col-sm-6">
									<a href="{$link->getCategoryLink(156)|escape:'html':'UTF-8'}">
									<img src="{$img_dir}bannercat1{$lang_iso}.png" alt="Text" width="577" height="204"></a>
								</div>
								<div class="col-xs-12 col-sm-6">
									<a href="{$link->getPageLink('contact', true)|escape:'html':'UTF-8'}">
									<img src="{$img_dir}bannercat2{$lang_iso}.png" alt="Text" width="577" height="204"></a>
								</div>
							</div>
						</div>
						{/if}
					</div>
				</div>
				{if $page_name == index }
				<section class="SecCMS6">
					<div>
						<i></i>
						{if $lang_iso == fr}
						<h2><span>Service de broderie</span>personnalisé</h2>
						<p>Faites broder votre logo, prénom ou message sur nos vêtements et accessoires. Nos broderies sont durables et de qualité professionnelle. Aucune quantité minimum.</p>
						<p><a href="/fr/vetements-d-interieur/318-robe-de-chambre-kimono.html">Obtenez plus d'informations</a></p>
						{else}
						<h2><span>Custom embroidery</span>service</h2>
						<p>Have your logo, name or message embroidered on our clothes and accessories. Our embroidery is durable and of professional quality. No minimum quantity.
						</p>
						<p><a href="/en/lingerie/318-robe-de-chambre-kimono.html">Get more information</a></p>
						{/if}
					</div>
				</section>
				{/if}
				<div class="ads">
					<div class="container">
						{*{if $page_name == index || $page_name == authentication}
						<div class="rowbanner"> 
							<div class="container">
								<div class="col-xs-12 col-sm-6">
									<img src="{$img_dir}banneradtext{$lang_iso}.svg" alt="Text" class="desktoptext">
								<img src="{$img_dir}bannertextmobile{$lang_iso}.jpg" alt="Text" class="mobiletext">
									<div class="row">
										<div class=" col-sm-6  register"><div class="butt green"><a href="{$link->getPageLink('my-account', true)|escape:'html':'UTF-8'}" rel="nofollow" title="{l s='Log in to your customer account'}">{l s="REGISTER NOW"}</a></div></div>
										<div class=" col-sm-6 shop"><div class="butt"><a href="{$link->getCategoryLink(6)|escape:'html':'UTF-8'}">{l s="SHOP BY CATEGORY"}</a></div></div>
									</div>
								</div>
							</div>
						</div>
						{/if}*}
					<div class="row reasons">
						<div class="title">{l s="MORE REASONS TO SHOP AT"} <strong>MASSAGE BOUTIK</strong></div>
						<div class="col-sm-4 col-xs-12">
							<a href="{$link->getCMSLink(1)|escape:'html':'UTF-8'}"><div class="ico ico1"><img src="{$img_dir}reason1.svg" alt=""></div>
							<div class="reason">{l s="FLAT RATE SHIPPING"} <span>{l s="of"} <strong>{if $lang_iso == en}$14.99{/if}{if $lang_iso == fr}349.99${/if}</strong> {l s="on orders in Canada*"}</span></div>
							<div class="but">{l s="Learn More"}</div></a>
						</div>
						<div class="col-sm-4 col-xs-12">
							<a href="{$link->getCMSLink(1)|escape:'html':'UTF-8'}"><div class="ico ico2"><img src="{$img_dir}reason2.svg" alt=""></div>
							<div class="reason">{l s="FREE SHIPPING"} <span>{l s="on orders over"} <strong>{if $lang_iso == en}${/if}349.99{if $lang_iso == fr}${/if}</strong> {l s="in Canada*"}</span></div>
							<div class="but">{l s="Learn More"}</div></a>
						</div>
						<div class="col-sm-4 col-xs-12">
							<a href="{$link->getCMSLink(1)|escape:'html':'UTF-8'}"><div class="ico ico3"><img src="{$img_dir}reason3.svg" alt=""></div>
							<div class="reason">{l s="WORLDWIDE SHIPPING"} <span>{l s="We ship around the World."} </span></div>
							<div class="but">{l s="Learn More"}</div></a>
						</div>
					</div>
					</div>
				</div>
				<div id="footernews" class="newsletter-container">
					<div class="container">
						{hook h='displayFooterNews'}
					</div>
				</div>
				<div id="store">
				
					
					<div class="container">  
					<div class="row">
					<div class="title {if $lang_iso == fr} col-sm-7 {else}col-sm-6{/if} ">
									<img src="{$img_dir}shopinstore{$lang_iso}.svg" alt="Shop in Our Stores" height="27" class="storetitle"></div>
							</div>
						<div class="col-sm-6 col-xs-12">
							<div class="row">
									<div class="col-xs-12 col-sm-5 address">
										<h3>{l s="Laval"}</h3>
										<p><a href="https://www.google.ca/maps/place/Massageboutik.com/@45.5632882,-73.7075398,14z/data=!4m5!3m4!1s0x0:0x4fcea7e2fd88376e!8m2!3d45.5696275!4d-73.6914465?hl={$lang_iso}" target="_blank">{l s="478 boul. des Laurentides"} <br>
												{l s="Laval, Québec, Canada"} <br>
												H7G 2V1</a></p>
												<div class="buttonss">
										<a href="https://www.google.ca/maps/place/Massageboutik.com/@45.5632882,-73.7075398,14z/data=!4m5!3m4!1s0x0:0x4fcea7e2fd88376e!8m2!3d45.5696275!4d-73.6914465hl={$lang_iso}" target="_blank">{l s="View map"}</a> - 
										<a href="https://www.google.ca/maps/uv?hl={$lang_iso}&pb=!1s0x4cc9221c4dc5febf:0x4fcea7e2fd88376e!2m16!2m2!1i80!2i80!3m1!2i20!16m10!1b1!2m2!1m1!1e1!2m2!1m1!1e3!2m2!1m1!1e4!3m1!7e115!4s/maps/place/Massage%2BBoutik%2B478%2Bboul.%2Bdes%2BLaurentides%2BLaval,%2BQu%25C3%25A9bec,%2BCanada%2BH7G%2B2V1/@45.5695466,-73.6913731,3a,75y,176.85h,90t/data%3D*213m4*211e1*213m2*211s9tAxlvykDVgAAAQvPAkUmA*212e0*214m2*213m1*211s0x0:0x4fcea7e2fd88376e!5sMassage+Boutik+478+boul.+des+Laurentides+Laval,+Qu%C3%A9bec,+Canada+H7G+2V1+-+Google+Search&imagekey=!1e2!2s9tAxlvykDVgAAAQvPAkUmA&sa=X&ved=0ahUKEwi64N7T_9fQAhWFLSYKHd5JA84QoB8ImAUwZA" target="_blank">{l s="Virtual tour"}</a>
									</div>
									</div>
									 
									<div class="col-xs-12 col-sm-7 hours">
										<h3>{l s="Opening hours"}</h3>
										<p>
											<strong><!--{l s="Monday - Friday:"}-->{if $lang_iso=="fr"}Lundi au vendredi{else}Monday to Friday:{/if}</strong> 9:00 am - 6:00 pm <br>
											{* <strong><!--{l s="Saturday:"}-->{if $lang_iso=="fr"}Vendredi:{else}Friday:{/if}</strong> 9:00 am - 6:00 pm  <br> *}
											<strong><!--{l s="Sunday:"}-->{if $lang_iso=="fr"}Samedi:{else}Saturday:{/if}</strong> 9:00 am - 5:00 pm <br>
											<strong><!--{l s="Sunday:"}-->{if $lang_iso=="fr"}Dimanche:{else}Sunday:{/if}</strong> {l s="Closed"}
										</p>
									</div>
									
								</div>
								<div class="row">
									<div class="col-xs-12 col-sm-5 address">
										<h3>{l s="Montreal"}</h3>
										<p><a href="https://www.google.com/maps/place/Massageboutik.com/@45.5367597,-73.6071524,15z/data=!4m5!3m4!1s0x0:0x5508c744dde0990c!8m2!3d45.5367597!4d-73.6071524?hl={$lang_iso}" target="_blank">{l s="6696 avenue de Chateaubriand"} <br>
												{l s="Montreal, Quebec"} <br>
												H2S 2N7</a></p>
												<div class="buttonss">
										<a href="https://www.google.com/maps/place/Massageboutik.com/@45.5367597,-73.6071524,15z/data=!4m5!3m4!1s0x0:0x5508c744dde0990c!8m2!3d45.5367597!4d-73.6071524?hl={$lang_iso}" target="_blank">{l s="View map"}</a>
										
									</div>
									</div>
									 <div itemprop="geo" itemscope itemtype="http://schema.org/GeoCoordinates">
										<meta itemprop="latitude" content="45.5367597" />
										<meta itemprop="longitude" content="-73.6071524" />
									  </div>
									<div class="col-xs-12 col-sm-7 hours">
										<h3>{l s="Opening hours"}</h3>
										<p>
											<strong><!--{l s="Monday - Friday:"}-->{if $lang_iso=="fr"}Du lundi au vendredi: {else}Monday to Friday:{/if}</strong> 10:00 am - 6:00 pm <br>
											
											<strong><!--{l s="Sunday:"}-->{if $lang_iso=="fr"}Samedi:{else}Saturday:{/if}</strong>  11:00 am - 3:00 pm<br>
											<strong><!--{l s="Sunday:"}-->{if $lang_iso=="fr"}Dimanche:{else}Sunday:{/if}</strong> {l s="Closed"}
										</p>
									</div>
									
								</div>
						</div>
						<div class="col-sm-5 col-sm-push-1 col-xs-12">
							<img src="{$img_dir}storefooter.png" alt="Our store" class="responsive" width="471" height="263">
						</div>
					</div>
				</div>
				 
				<div class="footer-container">
					
					<footer id="footer"  class="container">
						{$HOOK_FOOTER}
						<div class="clearfix"></div>
						<div class="copyrights col-sm-12 row"> 
							<div class="logo col-sm-2 col-xs-12"><a href="http://www.allezhousses.com/{$lang_iso}/" target="_blank"><img src="{$img_dir}bottomlogo.png" width="170" height="80" alt="AllezHousses"></a></div>
							<div class="text col-sm-10 col-xs-12">
								<h5>{l s="Massageboutik.com, property of Allez Housses, specializes in the sale of massage tables, products and accessories."}</h5>
								<p>{l s="Allez Housses is a Canadian manufacturer of linen, lingerie, massage and treatment accessories since 2003. Our sales associates will answer your questions and help you discover a wide selection of products and massage equipment. In hopes of meeting you as customers and in working with you."}</p>
							</div>
						</div>
					</footer>
				</div><!-- #footer -->
				<div id="mmcopy">
					<div class="container">
						<div class="left ">
							{if $lang_iso == en}
								Massageboutik.com © All rights reserved | <a href="/en/sitemap">Sitemap</a>
							{else}
								Massageboutik.com © Tous les droits sont réservés | <a href="/fr/plan-du-site">Plan du site</a>
							{/if}
						</div><!--
						<div class="right"><a href="http://marketingmedia.ca" target="_blank">E-commerce Development Agency</a>: <img src="{$img_dir}mmlogo.svg" alt="Marketing Media" width="300" height="44"></div>-->
					</div>
				</div>
			{/if}
		</div><!-- #page -->
{/if}
{include file="$tpl_dir./global.tpl"} 
<div class="bottomright">
	<div class="text">	Questions? Facebook Messenger! <img src="{$img_dir}wfbm.svg" width="15" alt="" ></div> 
			<div class="float invisible" style="display: none; width:100%;">
				<div class="fb-page" data-href="https://www.facebook.com/massageboutik/" data-tabs="messages" data-width="340" data-small-header="true" data-hide-cover="false" data-show-facepile="true"><blockquote cite="https://www.facebook.com/massageboutik/" class="fb-xfbml-parse-ignore"><a href="https://www.facebook.com/massageboutik/">Allez Housses / Massage Boutik</a></blockquote></div>
			</div>
			<script type="text/javascript">
				$( ".bottomright .text" ).click(function() {
				  $(".invisible.float").slideToggle()
				});
				$( ".fbchat" ).click(function() {
				  $(".invisible.float").slideToggle()
				});
			</script>
		</div>

		<script type="text/javascript" src="//cdn.jsdelivr.net/jquery.slick/1.6.0/slick.min.js"></script>
		<link rel="stylesheet" property="stylesheet" type="text/css" href="//cdn.jsdelivr.net/jquery.slick/1.6.0/slick.css"/>
	</body>
</html>  