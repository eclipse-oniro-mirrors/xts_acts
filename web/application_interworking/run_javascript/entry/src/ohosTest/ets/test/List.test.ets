/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import webJsunit from './WebJsunit.test';
import webJsunitTwo from './WebJsunitTwo.test';
import runJavaScript from './runJavaScript.test';
import jsMessageExt from './JsMessageExt.test';
import WebViewEnumAndFontLibrary from './WebViewEnumAndFontLibrary.test';
import runJavaScriptErrorCode from './RunJavaScriptErrorCode.test';
import jsMessageExtTwo from './JsMessageExtTwo.test';
import jsMessageExtThree from './JsMessageExtThree.test';
import jsMessageExtFour from './JsMessageExtFour.test';
import runJavaScriptExt from './RunJavaScriptExt.test';

import adsBlockManagerSetAdsBlockRulesParam from './AdsBlockManagerSetAdsBlockRulesParam.test';
import adsBlockManagerAddAdsBlockDisallowedListParam from './AdsBlockManagerAddAdsBlockDisallowedListParam.test';
import adsBlockManagerRemoveAdsBlockAllowedListParam from './AdsBlockManagerRemoveAdsBlockAllowedListParam.test';
import adsBlockManagerAddAdsBlockAllowedListParam from './AdsBlockManagerAddAdsBlockAllowedListParam.test';
import adsBlockManagerRemoveAdsBlockDisallowedListParam from './AdsBlockManagerRemoveAdsBlockDisallowedListParam.test';

import backForwardListGetItemAtIndexNullUndefined from './BackForwardListGetItemAtIndexNullUndefined.test';
import proxyConfigInsertProxyRuleParam from './ProxyConfigInsertProxyRuleParam.test';
import proxyConfigInsertBypassRuleParam from './ProxyConfigInsertBypassRuleParam.test';
import proxyConfigInsertDirectRuleParam from './ProxyConfigInsertDirectRuleParam.test';
import proxyControllerApplyProxyOverrideParam from './ProxyControllerApplyProxyOverrideParam.test';
import webDownloadItemDeserializeParam from './WebDownloadItemDeserializeParam.test';

import webMessageExtSetStringErrorCode from './WebMessageExtSetStringErrorCode.test';
import webMessageExtSetArrayBufferErrorCode from './WebMessageExtSetArrayBufferErrorCode.test';
import webMessageExtSetErrorErrorCode from './WebMessageExtSetErrorErrorCode.test';
import webMessageExtSetNumberNullUndefined from './WebMessageExtSetNumberNullUndefined.test';
import webMessagePortPostMessageEventExtErrorCode from './WebMessagePortPostMessageEventExtErrorCode.test';

import webSchemeHandlerResponseSetMimeTypeParam from './WebSchemeHandlerResponseSetMimeTypeParam.test';
import webSchemeHandlerResponseSetEncodingParam from './WebSchemeHandlerResponseSetEncodingParam.test';
import webSchemeHandlerResponseSetUrlParam from './WebSchemeHandlerResponseSetUrlParam.test';
import webSchemeHandlerResponseSetStatusParam from './WebSchemeHandlerResponseSetStatusParam.test';
import webSchemeHandlerResponseSetStatusTextParam from './WebSchemeHandlerResponseSetStatusTextParam.test';
import webSchemeHandlerResponseSetHeaderByNameParam from './WebSchemeHandlerResponseSetHeaderByNameParam.test';
import webSchemeHandlerResponseSetNetErrorCodeParam from './WebSchemeHandlerResponseSetNetErrorCodeParam.test';
import webSchemeHandlerResponseGetHeaderByNameParam from './WebSchemeHandlerResponseGetHeaderByNameParam.test';

import webResourceResponseSetResponseDataParam from './WebResourceResponseSetResponseDataParam.test';
import webResourceResponseSetResponseEncodingParam from './WebResourceResponseSetResponseEncodingParam.test';
import webResourceResponseSetResponseMimeTypeParam from './WebResourceResponseSetResponseMimeTypeParam.test';
import webResourceResponseSetResponseHeaderParam from './WebResourceResponseSetResponseHeaderParam.test';
import webResourceResponseSetReasonMessageParam from './WebResourceResponseSetReasonMessageParam.test';
import webResourceResponseSetResponseCodeParam from './WebResourceResponseSetResponseCodeParam.test';

export default function testsuite() {
  webJsunit()
  webJsunitTwo()
  runJavaScript()
  jsMessageExt()
  WebViewEnumAndFontLibrary()
  runJavaScriptErrorCode()
  jsMessageExtTwo()
  jsMessageExtThree()
  jsMessageExtFour()
  runJavaScriptExt()
  adsBlockManagerRemoveAdsBlockAllowedListParam()
  adsBlockManagerSetAdsBlockRulesParam()
  adsBlockManagerAddAdsBlockDisallowedListParam()
  adsBlockManagerAddAdsBlockAllowedListParam()
  adsBlockManagerRemoveAdsBlockDisallowedListParam()

  backForwardListGetItemAtIndexNullUndefined()
  proxyConfigInsertBypassRuleParam()
  proxyConfigInsertDirectRuleParam()
  proxyConfigInsertProxyRuleParam()
  proxyControllerApplyProxyOverrideParam()
  webDownloadItemDeserializeParam()

  webMessageExtSetStringErrorCode()
  webMessageExtSetArrayBufferErrorCode()
  webMessageExtSetErrorErrorCode()
  webMessageExtSetNumberNullUndefined()
  webMessagePortPostMessageEventExtErrorCode()

  webSchemeHandlerResponseSetUrlParam()
  webSchemeHandlerResponseSetStatusParam()
  webSchemeHandlerResponseSetStatusTextParam()
  webSchemeHandlerResponseSetHeaderByNameParam()
  webSchemeHandlerResponseSetMimeTypeParam()
  webSchemeHandlerResponseSetEncodingParam()
  webSchemeHandlerResponseSetNetErrorCodeParam()
  webSchemeHandlerResponseGetHeaderByNameParam()

  webResourceResponseSetReasonMessageParam()
  webResourceResponseSetResponseDataParam()
  webResourceResponseSetResponseEncodingParam()
  webResourceResponseSetResponseMimeTypeParam()
  webResourceResponseSetResponseHeaderParam()
  webResourceResponseSetResponseCodeParam()
}
