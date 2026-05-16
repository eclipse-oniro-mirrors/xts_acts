/*
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
import webviewNetworkProxy from './webviewNetworkProxy.test'
import WebCookieManager from './WebCookieManager.test'

import webviewControllerPostMessageParam from './WebviewControllerPostMessageParam.test';
import webviewControllerSearchAllAsyncParam from './WebviewControllerSearchAllAsyncParam.test';
import webviewControllerRunJavaScriptErrorCode from './WebviewControllerRunJavaScriptErrorCode.test';
import webviewControllerRunJavaScriptExtParam from './WebviewControllerRunJavaScriptExtParam.test';
import webviewControllerRunJavaScriptExtErrorCode from './WebviewControllerRunJavaScriptExtErrorCode.test';
import webviewControllerRemoveAllCacheParam from './WebviewControllerRemoveAllCacheParam.test';
import webviewControllerSetCustomUserAgentParam from './WebviewControllerSetCustomUserAgentParam.test';
import webviewControllerPrepareForPageLoadParam from './WebviewControllerPrepareForPageLoadParam.test';
import webviewControllerSetConnectionTimeoutParam from './WebviewControllerSetConnectionTimeoutParam.test';
import webviewControllerStartDownloadParam from './WebviewControllerStartDownloadParam.test';
import webviewControllerPostUrlParam from './WebviewControllerPostUrlParam.test';
import webviewControllerSetWebSchemeHandlerParam from './WebviewControllerSetWebSchemeHandlerParam.test';
import webviewControllerSetServiceWorkerWebSchemeHandlerParam from './WebviewControllerSetServiceWorkerWebSchemeHandlerParam.test';
import webviewControllerRemoveIntelligentTrackingPreventionBypassingListParam from './WebviewControllerRemoveIntelligentTrackingPreventionBypassingListParam.test';
import webviewControllerSetDownloadDelegateParam from './WebviewControllerSetDownloadDelegateParam.test';
import webviewControllerSetHostIPParam from './WebviewControllerSetHostIPParam.test';
import webviewControllerSetUrlTrustListParam from './WebviewControllerSetUrlTrustListParam.test';
import webviewControllerSetAppCustomUserAgentParam from './WebviewControllerSetAppCustomUserAgentParam.test';
import webviewControllerSetSocketIdleTimeoutParam from './WebviewControllerSetSocketIdleTimeoutParam.test';
import webviewControllerWarmupServiceWorkerParam from './WebviewControllerWarmupServiceWorkerParam.test';
import webviewControllerSetBackForwardCacheOptionsParam from './WebviewControllerSetBackForwardCacheOptionsParam.test';
import webviewControllerSetUserAgentForHostsParam from './WebviewControllerSetUserAgentForHostsParam.test';
import webviewControllerSetWebDebuggingAccessParamFalse from './WebviewControllerSetWebDebuggingAccessParamFalse.test';
import webviewControllerRegisterJavaScriptProxyParam from './WebviewControllerRegisterJavaScriptProxyParam.test';
import webviewControllerLoadDataParam from './WebviewControllerLoadDataParam.test';
import webviewControllerLoadUrlParam from './WebviewControllerLoadUrlParam.test';
import webDownloadManagerSetDownloadDelegateParam from './WebDownloadManagerSetDownloadDelegateParam.test';
import webDownloadManagerResumeDownloadParam from './WebDownloadManagerResumeDownloadParam.test';
import webviewControllerAddIntelligentTrackingParam from './WebviewControllerAddIntelligentTrackingParam.test';
import webviewControllerBackOrForwardErrorCode from './WebviewControllerBackOrForwardErrorCode.test';
import webviewControllerClearHostIPParam from './WebviewControllerClearHostIPParam.test';
import webviewControllerDeleteJavaScriptRegisterParam from './WebviewControllerDeleteJavaScriptRegisterParam.test';
import webviewControllerEnableBackForwardCacheParam from './WebviewControllerEnableBackForwardCacheParam.test';

export default function testsuite() {
  webviewNetworkProxy()
  WebCookieManager()
  webviewControllerPostMessageParam()
  webviewControllerSearchAllAsyncParam()
  webviewControllerRunJavaScriptErrorCode()
  webviewControllerRunJavaScriptExtParam()
  webviewControllerRunJavaScriptExtErrorCode()
  webviewControllerRemoveAllCacheParam()
  webviewControllerSetCustomUserAgentParam()
  webviewControllerPrepareForPageLoadParam()
  webDownloadManagerSetDownloadDelegateParam()
  webDownloadManagerResumeDownloadParam()
  webviewControllerAddIntelligentTrackingParam()
  webviewControllerBackOrForwardErrorCode()
  webviewControllerClearHostIPParam()
  webviewControllerDeleteJavaScriptRegisterParam()
  webviewControllerEnableBackForwardCacheParam()
  webviewControllerSetConnectionTimeoutParam()
  webviewControllerSetDownloadDelegateParam()
  webviewControllerPostUrlParam()
  webviewControllerSetWebSchemeHandlerParam()
  webviewControllerSetServiceWorkerWebSchemeHandlerParam()
  webviewControllerRemoveIntelligentTrackingPreventionBypassingListParam()
  webviewControllerStartDownloadParam()
  webviewControllerSetHostIPParam()
  webviewControllerWarmupServiceWorkerParam()
  webviewControllerSetUrlTrustListParam()
  webviewControllerSetBackForwardCacheOptionsParam()
  webviewControllerSetAppCustomUserAgentParam()
  webviewControllerSetUserAgentForHostsParam()
  webviewControllerSetSocketIdleTimeoutParam()
  webviewControllerSetWebDebuggingAccessParamFalse()
  webviewControllerRegisterJavaScriptProxyParam()
  webviewControllerLoadDataParam()
  webviewControllerLoadUrlParam()
}