/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import webOnAlertTest from './WebOnAlertTest.test'
import webViewControllerClearSslCacheTest from './WebViewControllerClearSslCacheTest.test'
import webViewControllerGetCertificateTest from './WebViewControllerGetCertificateTest.test'
import webViewControllerGetHitTestTest from './WebViewControllerGetHitTestTest.test'
import webViewControllerGetHitTestValueTest from './WebViewControllerGetHitTestValueTest.test'
import webOnConfirmTest from './WebOnConfirmTest.test'
import webOnConsoleTest from './WebOnConsoleTest.test'
import webOnPromptTest from './WebOnPromptTest.test'
import webCookieSaveCookieTest from './WebCookieSaveCookieTest.test'
import webCookieSetCookieTest from './WebCookieSetCookieTest.test'
import webCookieManagerGetCookieTest from './WebCookieManagerGetCookieTest.test'
import webCookieManagerSetCookieTest from './WebCookieManagerSetCookieTest.test'
import webCookieManagerIsCookieAllowedTest from './WebCookieManagerIsCookieAllowedTest.test'
import webCookieManagerSaveCookieAsyncTest from './WebCookieManagerSaveCookieAsyncTest.test'
import webViewControllerDeleteJavaScriptRegisterTest from './WebViewControllerDeleteJavaScriptRegisterTest.test'
import webViewControllerRegisterJavaScriptProxyTest from './WebViewControllerRegisterJavaScriptProxyTest.test'
import webOnSslErrorEventReceiveTest from './WebOnSslErrorEventReceiveTest.test'
import webGetLineNumberTest from './WebGetLineNumberTest.test'
import webGetMessageTest from './WebGetMessageTest.test'
import webGetMessageLevelTest from './WebGetMessageLevelTest.test'
import webGetSourceIdTest from './WebGetSourceIdTest.test'
import webJsResultHandleCancelTest from './WebJsResultHandleCancelTest.test'
import webJsResultHandleConfirmTest from './WebJsResultHandleConfirmTest.test'
import webJsResultHandlePromptConfirmTest from './WebJsResultHandlePromptConfirmTest.test'
import webSslErrorHandlerHandleCancelTest from './WebSslErrorHandlerHandleCancelTest.test'
import webSslErrorHandlerHandleConfirmTest from './WebSslErrorHandlerHandleConfirmTest.test'
import webViewControllerOnActiveTest from './WebViewControllerOnActiveTest.test'
import webViewControllerOnInactiveTest from './WebViewControllerOnInactiveTest.test'
import webViewControllerStopTest from './WebViewControllerStopTest.test'
import webViewControllerStoreWebArchiveTest from './WebViewControllerStoreWebArchiveTest.test'
import webHttpAuthHandlerCancelTest from './WebHttpAuthHandlerCancelTest.test'
import webHttpAuthHandlerConfirmTest from './WebHttpAuthHandlerConfirmTest.test'
import webHttpAuthHandlerIsHttpAuthInfoSavedTest from './WebHttpAuthHandlerIsHttpAuthInfoSavedTest.test'
import webOnHttpAuthRequestTest from './WebOnHttpAuthRequestTest.test'
import webRunJavaScriptTest from './WebRunJavaScriptTest.test'
import webViewControllerRunJavaScriptTest from './WebViewControllerRunJavaScriptTest.test'
import webViewControllerRunJavaScriptExtTest from './WebViewControllerRunJavaScriptExtTest.test'
import webViewControllerRemoveCacheTest from './WebViewControllerRemoveCacheTest.test'
import webViewControllerSetHttpDnsTest from './WebViewControllerSetHttpDnsTest.test'
import webViewControllerSetWebDebuggingAccessTest from './WebViewControllerSetWebDebuggingAccessTest.test'
import webViewControllerPageDownTest from './WebViewControllerPageDownTest.test'
import webViewControllerPageUpTest from './WebViewControllerPageUpTest.test'
import webViewControllerInitializeWebEngineTest from './WebViewControllerInitializeWebEngineTest.test'
import webCookieManagerDeleteEntireCookieTest from './WebCookieManagerDeleteEntireCookieTest.test'
import webCookieManagerDeleteSessionCookieTest from './WebCookieManagerDeleteSessionCookieTest.test'
import webCookieManagerExistCookieTest from './WebCookieManagerExistCookieTest.test'
import webCookieManagerIsThirdPartyCookieAllowedTest from './WebCookieManagerIsThirdPartyCookieAllowedTest.test'
import webCookieManagerPutAcceptCookieEnabledTest from './WebCookieManagerPutAcceptCookieEnabledTest.test'
import webCookieManagerPutAcceptThirdPartyCookieEnabledTest
  from './WebCookieManagerPutAcceptThirdPartyCookieEnabledTest.test'
import webViewControllerGetBackForwardEntriesTest from './WebViewControllerGetBackForwardEntriesTest.test'
import webViewControllerGetFaviconTest from './WebViewControllerGetFaviconTest.test'
import webViewStressWebContextMenu from './WebViewStressWebContextMenu.test'
import webViewStressForPageLoad from './WebViewStressForPageLoad.test'
import webViewStressPermissionRequest from './WebViewStressPermissionRequest.test'
import webViewStressWebViewController from './WebViewStressWebViewController.test'
import webViewStressWebAttribute from './WebViewStressWebAttribute.test'
import webStressScreenCaptureHandler from './WebStressScreenCaptureHandler.test'

export default function testsuite() {
  webViewControllerClearSslCacheTest()
  webOnAlertTest()
  webViewControllerGetCertificateTest()
  webViewControllerGetHitTestTest()
  webViewControllerGetHitTestValueTest()
  webOnPromptTest()
  webOnConfirmTest()
  webOnConsoleTest()
  webCookieSaveCookieTest()
  webCookieSetCookieTest()
  webCookieManagerGetCookieTest()
  webCookieManagerSetCookieTest()
  webCookieManagerIsCookieAllowedTest()
  webCookieManagerSaveCookieAsyncTest()
  webViewControllerDeleteJavaScriptRegisterTest()
  webViewControllerRegisterJavaScriptProxyTest()
  webOnHttpAuthRequestTest()
  webGetLineNumberTest()
  webGetMessageTest()
  webGetMessageLevelTest()
  webGetSourceIdTest()
  webJsResultHandleCancelTest()
  webJsResultHandleConfirmTest()
  webJsResultHandlePromptConfirmTest()
  webSslErrorHandlerHandleCancelTest()
  webSslErrorHandlerHandleConfirmTest()
  webViewControllerOnActiveTest()
  webViewControllerOnInactiveTest()
  webViewControllerStopTest()
  webOnSslErrorEventReceiveTest()
  webViewControllerStoreWebArchiveTest()
  webHttpAuthHandlerCancelTest()
  webHttpAuthHandlerConfirmTest()
  webHttpAuthHandlerIsHttpAuthInfoSavedTest()
  webRunJavaScriptTest()
  webViewControllerRunJavaScriptTest()
  webViewControllerRunJavaScriptExtTest()
  webViewControllerRemoveCacheTest()
  webViewControllerSetHttpDnsTest()
  webViewControllerSetWebDebuggingAccessTest()
  webViewControllerPageDownTest()
  webViewControllerPageUpTest()
  webViewControllerInitializeWebEngineTest()
  webCookieManagerDeleteEntireCookieTest()
  webCookieManagerDeleteSessionCookieTest()
  webCookieManagerExistCookieTest()
  webCookieManagerIsThirdPartyCookieAllowedTest()
  webCookieManagerPutAcceptCookieEnabledTest()
  webCookieManagerPutAcceptThirdPartyCookieEnabledTest()
  webViewControllerGetBackForwardEntriesTest()
  webViewControllerGetFaviconTest()
  webViewStressWebContextMenu()
  webViewStressForPageLoad()
  webViewStressPermissionRequest()
  webViewStressWebViewController()
  webViewStressWebAttribute()
  webStressScreenCaptureHandler()
}