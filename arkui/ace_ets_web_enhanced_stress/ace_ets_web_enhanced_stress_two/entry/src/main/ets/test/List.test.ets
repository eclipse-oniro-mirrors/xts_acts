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

import webJsMessageExtGetArrayBufferTest from './WebJsMessageExtGetArrayBufferTest.test'
import webJsMessageExtGetArrayTest from './WebJsMessageExtGetArrayTest.test'
import webJsMessageExtGetBooleanTest from './WebJsMessageExtGetBooleanTest.test'
import webMessageExtGetBooleanTest from './WebMessageExtGetBooleanTest.test'
import webMessageExtGetArrayTest from './WebMessageExtGetArrayTest.test'
import webMessageExtGetErrorTest from './WebMessageExtGetErrorTest.test'
import webMessageExtGetNumberTest from './WebMessageExtGetNumberTest.test'
import webMessageExtGetStringTest from './WebMessageExtGetStringTest.test'
import webMessageExtSetArrayBufferTest from './WebMessageExtSetArrayBufferTest.test'
import webMessageExtSetArrayTest from './WebMessageExtSetArrayTest.test'
import webMessageExtSetBooleanTest from './WebMessageExtSetBooleanTest.test'
import webMessageExtSetErrorTest from './WebMessageExtSetErrorTest.test'
import webMessageExtSetNumberTest from './WebMessageExtSetNumberTest.test'
import webMessageExtSetStringTest from './WebMessageExtSetStringTest.test'
import webMessageExtSetTypeTest from './WebMessageExtSetTypeTest.test'
import webJsMessageExtGetNumberTest from './WebJsMessageExtGetNumberTest.test'
import webJsMessageExtGetStringTest from './WebJsMessageExtGetStringTest.test'
import webJsMessageExtGetTypeTest from './WebJsMessageExtGetTypeTest.test'
import webMessageExtGetArrayBufferTest from './WebMessageExtGetArrayBufferTest.test'
import webMessageExtGetTypeTest from './WebMessageExtGetTypeTest.test'
import webStorageGetOriginUsageTest from './WebStorageGetOriginUsageTest.test'
import webStorageDeleteAllDataTest from './WebStorageDeleteAllDataTest.test'
import webStorageDeleteOriginTest from './WebStorageDeleteOriginTest.test'
import webStorageGetOriginQuotaTest from './WebStorageGetOriginQuotaTest.test'
import webStorageGetOriginsTest from './WebStorageGetOriginsTest.test'
import webDataBaseDeleteHttpAuthCredentialsTest from './WebDataBaseDeleteHttpAuthCredentialsTest.test'
import webDataBaseExistHttpAuthCredentialsTest from './WebDataBaseExistHttpAuthCredentialsTest.test'
import webDataBaseSaveHttpAuthCredentialsTest from './WebDataBaseSaveHttpAuthCredentialsTest.test'
import webDataBaseGetHttpAuthCredentialsTest from './WebDataBaseGetHttpAuthCredentialsTest.test'
import webGeolocationPermissionsAllowGeolocationTest from './WebGeolocationPermissionsAllowGeolocationTest.test'
import webGeolocationPermissionsDeleteAllGeolocationTest from './WebGeolocationPermissionsDeleteAllGeolocationTest.test'
import webGeolocationPermissionsDeleteGeolocationTest from './WebGeolocationPermissionsDeleteGeolocationTest.test'
import webGeolocationPermissionsGetAccessibleGeolocationTest
  from './WebGeolocationPermissionsGetAccessibleGeolocationTest.test'
import webGeolocationPermissionsGetStoredGeolocationTest from './WebGeolocationPermissionsGetStoredGeolocationTest.test'
import webMessagePortOnMessageEventExtTest from './WebMessagePortOnMessageEventExtTest.test'
import webMessagePortCloseTest from './WebMessagePortCloseTest.test'
import webMessagePortOnMessageEventTest from './WebMessagePortOnMessageEventTest.test'
import webMessagePortPostMessageEventExtTest from './WebMessagePortPostMessageEventExtTest.test'
import webMessagePortPostMessageEventTest from './WebMessagePortPostMessageEventTest.test'
import webResourceRequestGetRequestHeaderTest from './WebResourceRequestGetRequestHeaderTest.test'
import webResourceRequestGetRequestMethodTest from './WebResourceRequestGetRequestMethodTest.test'
import webResourceRequestGetRequestUrlTest from './WebResourceRequestGetRequestUrlTest.test'
import webResourceRequestIsMainFrameTest from './WebResourceRequestIsMainFrameTest.test'
import webResourceRequestIsRedirectTest from './WebResourceRequestIsRedirectTest.test'
import webResourceRequestIsRequestGestureTest from './WebResourceRequestIsRequestGestureTest.test'
import webResourceResponseGetReasonMessageTest from './WebResourceResponseGetReasonMessageTest.test'
import webResourceResponseGetResponseCodeTest from './WebResourceResponseGetResponseCodeTest.test'
import webResourceResponseGetResponseDataTest from './WebResourceResponseGetResponseDataTest.test'
import webResourceResponseGetResponseEncodingTest from './WebResourceResponseGetResponseEncodingTest.test'
import webResourceResponseGetResponseHeaderTest from './WebResourceResponseGetResponseHeaderTest.test'
import webResourceResponseGetResponseMimeTypeTest from './WebResourceResponseGetResponseMimeTypeTest.test'
import webResourceResponseSetReasonMessageTest from './WebResourceResponseSetReasonMessageTest.test'
import webResourceResponseSetResponseCodeTest from './WebResourceResponseSetResponseCodeTest.test'
import webResourceResponseSetResponseDataTest from './WebResourceResponseSetResponseDataTest.test'
import webResourceResponseSetResponseEncodingTest from './WebResourceResponseSetResponseEncodingTest.test'
import webResourceResponseSetResponseHeaderTest from './WebResourceResponseSetResponseHeaderTest.test'
import webResourceResponseSetResponseIsReadyTest from './WebResourceResponseSetResponseIsReadyTest.test'
import webResourceResponseSetResponseMimeTypeTest from './WebResourceResponseSetResponseMimeTypeTest.test'
import webFileSelectorParamGetAcceptTypeTest from './WebFileSelectorParamGetAcceptTypeTest.test'
import webFileSelectorParamGetModeTest from './WebFileSelectorParamGetModeTest.test'
import webFileSelectorParamGetTitleTest from './WebFileSelectorParamGetTitleTest.test'
import webFileSelectorParamIsCaptureTest from './WebFileSelectorParamIsCaptureTest.test'
import webFileSelectorResultHandleFileListTest from './WebFileSelectorResultHandleFileListTest.test'
import webViewControllerCreateWebMessagePortsTest from './WebViewControllerCreateWebMessagePortsTest.test'
import webViewControllerPostMessageTest from './WebViewControllerPostMessageTest.test'
import webViewControllerSetNetworkAvailableTest from './WebViewControllerSetNetworkAvailableTest.test'
import webAttributeOnResourceLoadTest from './WebAttributeOnResourceLoadTest.test'
import webAttributeOnShowFileSelectorTest from './WebAttributeOnShowFileSelectorTest.test'
import webAttributeOnWindowExitTest from './WebAttributeOnWindowExitTest.test'
import webAttributeOnWindowNewTest from './WebAttributeOnWindowNewTest.test'
import webControllerHandlerSetWebControllerTest from './WebControllerHandlerSetWebControllerTest.test'
import webAttributeOnOverScrollTest from './WebAttributeOnOverScrollTest.test'
import webCookieManagerFetchCookieSyncTest from './WebCookieManagerFetchCookieSyncTest.test'
import webCookieManagerFetchCookieTest from './WebCookieManagerFetchCookieTest.test'
import webCookieManagerConfigCookieSyncTest from './WebCookieManagerConfigCookieSyncTest.test'
import webCookieManagerClearSessionCookieSyncTest from './WebCookieManagerClearSessionCookieSyncTest.test'
import webCookieManagerClearSessionCookieTest from './WebCookieManagerClearSessionCookieTest.test'
import webCookieManagerClearAllCookiesSyncTest from './WebCookieManagerClearAllCookiesSyncTest.test'
import webCookieManagerClearAllCookiesTest from './WebCookieManagerClearAllCookiesTest.test'
import webCookieManagerConfigCookieTest from './WebCookieManagerConfigCookieTest.test'
import webViewControllerPostUrlTest from './WebViewControllerPostUrlTest.test'
import webViewControllerSetConnectionTimeoutTest from './WebViewControllerSetConnectionTimeoutTest.test'

export default function testsuite() {
  webMessageExtGetArrayTest()
  webMessageExtGetArrayBufferTest()
  webMessageExtGetBooleanTest()
  webMessageExtGetErrorTest()
  webMessageExtGetNumberTest()
  webMessageExtGetStringTest()
  webMessageExtGetTypeTest()
  webMessageExtSetArrayTest()
  webMessageExtSetBooleanTest()
  webMessageExtSetArrayBufferTest()
  webMessageExtSetErrorTest()
  webMessageExtSetNumberTest()
  webMessageExtSetStringTest()
  webMessageExtSetTypeTest()
  webJsMessageExtGetArrayTest()
  webJsMessageExtGetArrayBufferTest()
  webJsMessageExtGetBooleanTest()
  webJsMessageExtGetNumberTest()
  webJsMessageExtGetStringTest()
  webJsMessageExtGetTypeTest()
  webStorageDeleteAllDataTest()
  webStorageDeleteOriginTest()
  webStorageGetOriginQuotaTest()
  webStorageGetOriginsTest()
  webStorageGetOriginUsageTest()
  webDataBaseDeleteHttpAuthCredentialsTest()
  webDataBaseExistHttpAuthCredentialsTest()
  webDataBaseSaveHttpAuthCredentialsTest()
  webDataBaseGetHttpAuthCredentialsTest()
  webGeolocationPermissionsAllowGeolocationTest()
  webGeolocationPermissionsDeleteAllGeolocationTest()
  webGeolocationPermissionsDeleteGeolocationTest()
  webGeolocationPermissionsGetAccessibleGeolocationTest()
  webGeolocationPermissionsGetStoredGeolocationTest()
  webMessagePortCloseTest()
  webMessagePortOnMessageEventExtTest()
  webMessagePortOnMessageEventTest()
  webMessagePortPostMessageEventExtTest()
  webMessagePortPostMessageEventTest()
  webResourceRequestGetRequestHeaderTest()
  webResourceRequestGetRequestMethodTest()
  webResourceRequestGetRequestUrlTest()
  webResourceRequestIsMainFrameTest()
  webResourceRequestIsRedirectTest()
  webResourceRequestIsRequestGestureTest()
  webResourceResponseGetReasonMessageTest()
  webResourceResponseGetResponseCodeTest()
  webResourceResponseGetResponseDataTest()
  webResourceResponseGetResponseEncodingTest()
  webResourceResponseGetResponseHeaderTest()
  webResourceResponseGetResponseMimeTypeTest()
  webResourceResponseSetReasonMessageTest()
  webResourceResponseSetResponseCodeTest()
  webResourceResponseSetResponseDataTest()
  webResourceResponseSetResponseEncodingTest()
  webResourceResponseSetResponseHeaderTest()
  webResourceResponseSetResponseIsReadyTest()
  webResourceResponseSetResponseMimeTypeTest()
  webFileSelectorParamGetAcceptTypeTest()
  webFileSelectorParamGetModeTest()
  webFileSelectorParamGetTitleTest()
  webFileSelectorParamIsCaptureTest()
  webFileSelectorResultHandleFileListTest()
  webViewControllerCreateWebMessagePortsTest()
  webViewControllerPostMessageTest()
  webViewControllerSetNetworkAvailableTest()
  webAttributeOnResourceLoadTest()
  webAttributeOnShowFileSelectorTest()
  webAttributeOnWindowExitTest()
  webAttributeOnWindowNewTest()
  webControllerHandlerSetWebControllerTest()
  webAttributeOnOverScrollTest()
  webCookieManagerFetchCookieSyncTest()
  webCookieManagerFetchCookieTest()
  webCookieManagerConfigCookieSyncTest()
  webCookieManagerConfigCookieTest()
  webCookieManagerClearSessionCookieSyncTest()
  webCookieManagerClearSessionCookieTest()
  webCookieManagerClearAllCookiesSyncTest()
  webCookieManagerClearAllCookiesTest()
  webViewControllerPostUrlTest()
  webViewControllerSetConnectionTimeoutTest()
}