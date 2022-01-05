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
{capture name=path}{l s='Contact'}{/capture}
<h1 class="page-heading bottom-indent">
	{l s='Customer service'} - {if isset($customerThread) && $customerThread}{l s='Your reply'}{else}{l s='Contact us'}{/if}
</h1>
{if isset($confirmation)}
	<p class="alert alert-success">{l s='Your message has been successfully sent to our team.'}</p>
	<ul class="footer_links clearfix">
		<li>
			<a class="btn btn-default button button-small" href="{if isset($force_ssl) && $force_ssl}{$base_dir_ssl}{else}{$base_dir}{/if}">
				<span>
					<i class="icon-chevron-left"></i>{l s='Home'}
				</span>
			</a>
		</li>
	</ul>
{elseif isset($alreadySent)}
	<p class="alert alert-warning">{l s='Your message has already been sent.'}</p>
	<ul class="footer_links clearfix">
		<li>
			<a class="btn btn-default button button-small" href="{if isset($force_ssl) && $force_ssl}{$base_dir_ssl}{else}{$base_dir}{/if}">
				<span>
					<i class="icon-chevron-left"></i>{l s='Home'}
				</span>
			</a>
		</li>
	</ul>
{else}
<div class="row contactdata">
	<div class="col-sm-4">
		<div class="col-xs-12 address">
			<h3>{l s="Massage Boutik"}  </h3>
			<p><strong><span class="store"><a href="https://www.google.ca/maps/place/Allez+Housses+inc./@45.569563,-73.6936357,17z/data=!3m1!4b1!4m5!3m4!1s0x4cc9221c4e290fe5:0xbcda3b0fbca133fd!8m2!3d45.5695593!4d-73.691447?hl={$lang_iso}">{l s="Visit our store"}</a></span></strong></p>
			<p><a href="https://www.google.ca/maps/place/Massageboutik.com/@45.5632882,-73.7075398,14z/data=!4m5!3m4!1s0x0:0x4fcea7e2fd88376e!8m2!3d45.5696275!4d-73.6914465?hl={$lang_iso}" target="_blank">{l s="478 boul. des Laurentides"} <br>
					{l s="Laval, Québec, Canada"} <br>
					H7G 2V1</a></p>
		</div>
		{*
		<div class="col-xs-12 hours">
			<h3>{if $lang_iso == en}{l s="Opening hours"}{else}Heures d'ouverture{/if}</h3>
			<p>
				<strong><!--{l s="Monday - Friday:"}-->{if $lang_iso=="fr"}Du lundi au jeudi:{else}Monday to Thursday:{/if}</strong> 7:30 am - 6:00 pm  <br>
										<strong><!--{l s="Saturday:"}-->{if $lang_iso=="fr"}Vendredi:{else}Friday:{/if}</strong> 9:00 am - 6:00 pm  <br>
										<strong><!--{l s="Sunday:"}-->{if $lang_iso=="fr"}Samedi:{else}Saturday:{/if}</strong> 10:00 am - 2:00 pm <br>
										<strong><!--{l s="Sunday:"}-->{if $lang_iso=="fr"}Dimanche:{else}Sunday:{/if}</strong> {if $lang_iso=="fr"}Fermé{else}{l s="Closed"}{/if}
			</p>
		</div>
		*}
		<div class="col-xs-12 Tel">
			<h3>{if $lang_iso == en}{l s="Phone"}{else}Téléphone{/if}</h3>
			<p>
				<a href="tel:1-866-931-0920">1-866-931-0920</a>
			</p>
		</div>
		<div class="col-xs-12 fb">
			<h3><img src="{$img_dir}fbm.svg" width="19px" alt="">{if $lang_iso == en}{l s="Message us on Facebook"}{else}Message sur Facebook{/if}</h3>
			<p>
				<a href="http://m.me/massageboutik" target="_blank">Facebook Messenger</a>
			</p>
		</div>
	</div>
	<div class="col-sm-8">
		<img src="https://www.massageboutik.com/img/cms/team-new-green.jpg" alt="Contact us" width="779" height="448">
	</div>
</div>

	{include file="$tpl_dir./errors.tpl"}
	<form action="{$request_uri}" method="post" class="contact-form-box" enctype="multipart/form-data"> 
		<fieldset>
			<h3 class="page-subheading">{l s='send a message'}</h3>
			<div class="clearfix">
				<div class="col-xs-12 col-md-3">
					<div class="form-group selector1">
						<label for="id_contact">{l s='Subject Heading'}</label>
					{if isset($customerThread.id_contact) && $customerThread.id_contact && $contacts|count}
							{assign var=flag value=true}
							{foreach from=$contacts item=contact}
								{if $contact.id_contact == $customerThread.id_contact}
									<input type="text" class="form-control" id="contact_name" name="contact_name" value="{$contact.name|escape:'html':'UTF-8'}" readonly="readonly" />
									<input type="hidden" name="id_contact" value="{$contact.id_contact|intval}" />
									{$flag=false}
								{/if}
							{/foreach}
							{if $flag && isset($contacts.0.id_contact)}
									<input type="text" class="form-control" id="contact_name" name="contact_name" value="{$contacts.0.name|escape:'html':'UTF-8'}" readonly="readonly" />
									<input type="hidden" name="id_contact" value="{$contacts.0.id_contact|intval}" />
							{/if}
					</div>
					{else}
						<select id="id_contact" class="form-control" name="id_contact">
							<option value="0">{l s='-- Choose --'}</option>
							{foreach from=$contacts item=contact}
								<option value="{$contact.id_contact|intval}"{if isset($smarty.request.id_contact) && $smarty.request.id_contact == $contact.id_contact} selected="selected"{/if}>{$contact.name|escape:'html':'UTF-8'}</option>
							{/foreach}
						</select>
					</div>
						<p id="desc_contact0" class="desc_contact{if isset($smarty.request.id_contact)} unvisible{/if}">&nbsp;</p>
						{foreach from=$contacts item=contact}
							<p id="desc_contact{$contact.id_contact|intval}" class="desc_contact contact-title{if !isset($smarty.request.id_contact) || $smarty.request.id_contact|intval != $contact.id_contact|intval} unvisible{/if}">
								<i class="icon-comment-alt"></i>{$contact.description|escape:'html':'UTF-8'}
							</p>
						{/foreach}
					{/if}
					<p class="form-group">
						<label for="email">{l s='Email address'}</label>
						{if isset($customerThread.email)}
							<input class="form-control grey" type="text" id="email" name="from" value="{$customerThread.email|escape:'html':'UTF-8'}" readonly="readonly" />
						{else}
							<input class="form-control grey validate" type="text" id="email" name="from" data-validate="isEmail" value="{$email|escape:'html':'UTF-8'}" />
						{/if}
					</p>
					{if !$PS_CATALOG_MODE}
						{if (!isset($customerThread.id_order) || $customerThread.id_order > 0)}
							<div class="form-group selector1">
								<label>{l s='Order reference'}</label>
								{if !isset($customerThread.id_order) && isset($is_logged) && $is_logged}
									<select name="id_order" class="form-control">
										<option value="0">{l s='-- Choose --'}</option>
										{foreach from=$orderList item=order}
											<option value="{$order.value|intval}"{if $order.selected|intval} selected="selected"{/if}>{$order.label|escape:'html':'UTF-8'}</option>
										{/foreach}
									</select>
								{elseif !isset($customerThread.id_order) && empty($is_logged)}
									<input class="form-control grey" type="text" name="id_order" id="id_order" value="{if isset($customerThread.id_order) && $customerThread.id_order|intval > 0}{$customerThread.id_order|intval}{else}{if isset($smarty.post.id_order) && !empty($smarty.post.id_order)}{$smarty.post.id_order|escape:'html':'UTF-8'}{/if}{/if}" />
								{elseif $customerThread.id_order|intval > 0}
									<input class="form-control grey" type="text" name="id_order" id="id_order" value="{if isset($customerThread.reference) && $customerThread.reference}{$customerThread.reference|escape:'html':'UTF-8'}{else}{$customerThread.id_order|intval}{/if}" readonly="readonly" />
								{/if}
							</div>
						{/if}
						{if isset($is_logged) && $is_logged}
							<div class="form-group selector1">
								<label class="unvisible">{l s='Product'}</label>
								{if !isset($customerThread.id_product)}
									{foreach from=$orderedProductList key=id_order item=products name=products}
										<select name="id_product" id="{$id_order}_order_products" class="unvisible product_select form-control"{if !$smarty.foreach.products.first} style="display:none;"{/if}{if !$smarty.foreach.products.first} disabled="disabled"{/if}>
											<option value="0">{l s='-- Choose --'}</option>
											{foreach from=$products item=product}
												<option value="{$product.value|intval}">{$product.label|escape:'html':'UTF-8'}</option>
											{/foreach}
										</select>
									{/foreach}
								{elseif $customerThread.id_product > 0}
									<input  type="hidden" name="id_product" id="id_product" value="{$customerThread.id_product|intval}" readonly="readonly" />
								{/if}
							</div>
						{/if}
					{/if}
					{if $fileupload == 1}
						<p class="form-group">
							<label for="fileUpload">{l s='Attach File'}</label>
							<input type="hidden" name="MAX_FILE_SIZE" value="{if isset($max_upload_size) && $max_upload_size}{$max_upload_size|intval}{else}2000000{/if}" />
							<input type="file" name="fileUpload" id="fileUpload" class="form-control" />
						</p>
					{/if}
				</div>
				<div class="col-xs-12 col-md-9">
					<div class="form-group">
						<label for="message">{l s='Message'}</label>
						<textarea class="form-control" id="message" name="message">{if isset($message)}{$message|escape:'html':'UTF-8'|stripslashes}{/if}</textarea>
					</div>
				</div>
			</div>
			 <script src='https://www.google.com/recaptcha/api.js'></script>
				
			<div class="submit">
				<button type="submit" name="submitMessage" id="submitMessage" class="button btn btn-default button-medium"><span>{l s='Send'}<i class="icon-chevron-right right"></i></span></button>
			</div>
			<div class="g-recaptcha" data-sitekey="6LdSS1EUAAAAAEIJTa8uehZUjMfGPENDj3vUd04I"></div>
		</fieldset>
	</form>
{/if}
{addJsDefL name='contact_fileDefaultHtml'}{l s='No file selected' js=1}{/addJsDefL}
{addJsDefL name='contact_fileButtonHtml'}{l s='Choose File' js=1}{/addJsDefL}
