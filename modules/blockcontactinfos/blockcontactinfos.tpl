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

<!-- MODULE Block contact infos -->
<section id="block_contact_infos" class="footer-block col-xs-12 col-sm-4">
    <div>
        <h4><a href="{$link->getPagelink('contact')}">{l s='Contact us' mod='blockcontactinfos'}</a></h4>
        <ul class="">
           
            {if $blockcontactinfos_phone != ''}
                <li>
                    <i class="icon-phone"></i>{l s='Call us now:' mod='blockcontactinfos'} 
                    <span><a href="tel:4509671970">(450) 967-1970</a> <span>/</span> <a href="tel:1-866-931-092">1-866-931-092</a>0</span>
                </li>
            {/if}
            {if $blockcontactinfos_email != ''}
                <li>
                    <i class="icon-envelope-alt"></i>{l s='Email:' mod='blockcontactinfos'} 
                    <span>{mailto address=$blockcontactinfos_email|escape:'html':'UTF-8' encode="hex"}</span>
                </li>
            {/if}
        </ul>
        <div class="followus">
            <h4>{l s='Follow Us' mod='blockcontactinfos'} </h4>
            <ul>
                <li class="facebook">
                <a class="_blank" href="https://www.facebook.com/massageboutik">
                    <span></span>
                </a>
                </li>

                
                <li class="google-plus">
                <a class="_blank" href="https://www.google.ca/maps/uv?hl={$lang_iso}&pb=!1s0x4cc9221c4dc5febf:0x4fcea7e2fd88376e!2m16!2m2!1i80!2i80!3m1!2i20!16m10!1b1!2m2!1m1!1e1!2m2!1m1!1e3!2m2!1m1!1e4!3m1!7e115!4s/maps/place/Massage%2BBoutik%2B478%2Bboul.%2Bdes%2BLaurentides%2BLaval,%2BQu%25C3%25A9bec,%2BCanada%2BH7G%2B2V1/@45.5695466,-73.6913731,3a,75y,176.85h,90t/data%3D*213m4*211e1*213m2*211s9tAxlvykDVgAAAQvPAkUmA*212e0*214m2*213m1*211s0x0:0x4fcea7e2fd88376e!5sMassage+Boutik+478+boul.+des+Laurentides+Laval,+Qu%C3%A9bec,+Canada+H7G+2V1+-+Google+Search&imagekey=!1e2!2s9tAxlvykDVgAAAQvPAkUmA&sa=X&ved=0ahUKEwi64N7T_9fQAhWFLSYKHd5JA84QoB8ImAUwZA">
                    <span></span>
                </a>
                </li>


                <li class="instagram">
                <a class="_blank" href="https://www.instagram.com/massageboutik/">
                    <span></span>
                </a>
                </li>

            </ul>
        </div>
    </div>
</section>
<!-- /MODULE Block contact infos -->
