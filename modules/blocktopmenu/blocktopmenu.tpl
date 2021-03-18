{if $MENU != ''}
	<!-- Menu -->
	<div id="block_top_menu" class="sf-contener clearfix col-lg-12">
		<div class="cat-title">{if $lang_iso == en}{l s="Menu" mod="blocktopmenu"}{else}MENU{/if}</div>
		<ul class="sf-menu clearfix menu-content">
			<li>
				<a href="{$link->getCategoryLink(183)}"><span class="icon"></span>{if $lang_iso == en}{l s="Shop by category" mod="blocktopmenu"}{else}Magasiner tout{/if}</a>
				<ul class="">
					{$MENU}
					{if $MENU_SEARCH}
						<li class="sf-search noBack" style="float:right">
							<form id="searchbox" action="{$link->getPageLink('search')|escape:'html':'UTF-8'}" method="get">
								<p>
									<input type="hidden" name="controller" value="search" />
									<input type="hidden" value="position" name="orderby"/>
									<input type="hidden" value="desc" name="orderway"/>
									<input type="text" name="search_query" value="{if isset($smarty.get.search_query)}{$smarty.get.search_query|escape:'html':'UTF-8'}{/if}" />
								</p>
							</form>
						</li>
					{/if}
				</ul>
			</li>
			<li><a href="{$link->getPageLink('manufacturer')|escape:'html':'UTF-8'}"><span class="icon"></span>{if $lang_iso == en}{l s="SHOP BY BRAND" mod="blocktopmenu"}{else}MAGASINER PAR MARQUE{/if}</a></li>
			<li><a href="{$link->getCategoryLink(156)|escape:'html':'UTF-8'}"><span class="icon"></span>{if $lang_iso == en}{l s="SALES & CLEARANCE" mod="blocktopmenu"}{else}PROMOTIONS & LIQUIDATION{/if}</a></li>
			{* <li><a href="{$link->getCategoryLink(69)|escape:'html':'UTF-8'}"><span class="icon"> </span>{if $lang_iso == en}{l s="WORKSHOP" mod="blocktopmenu"}{else}FORMATIONS{/if}</a></li> *}
			<li><a href="{$link->getCategoryLink(185)|escape:'html':'UTF-8'}"><span class="icon"></span>{if $lang_iso == en}{l s="LEASING" mod="blocktopmenu"}{else}LOCATION{/if}</a></li>
			<!--li><a href="{$link->getPageLink('contact', true)|escape:'html':'UTF-8'}"><span class="icon"></span>{if $lang_iso == en}{l s="CONTACT US" mod="blocktopmenu"}{else}CONTACTEZ-NOUS{/if}</a></li-->
		</ul> 
	</div>
	<!--/ Menu --> 
{/if}