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
import webResourceResponseGet from './WebResourceResponseGet.test'
import webResourceResponseSet from './WebResourceResponseSet.test'
import webResourceError from './WebResourceError.test'
import webViewControllerPart2 from './WebViewControllerPart2.test'
import webViewZoomRatio from './WebViewZoomRatio.test'
import webViewControllerZoom from './WebViewControllerZoom.test'
import webControllerZoom from './WebControllerZoom.test'
import webViewMenuShowResult from './WebViewMenuShowResult.test'
import screenCapture from './ScreenCapture.test'
import webViewMenuInputFieldType from './WebViewMenuInputFieldType.test'
import webViewMinLogicalFontSize from './WebViewMinLogicalFontSize.test'
import webMessagePortIsExtentionTypeTest from './WebMessagePortIsExtentionTypeTest.test'
import webCookieManagerFetchCookieSync from './WebCookieManagerFetchCookieSync.test'
import webCookieManagerFetchCookie from './WebCookieManagerFetchCookie.test'
import webCookieManagerExistCookie from './WebCookieManagerExistCookie.test'
import webNestedScrollOptionsScrollBackwardTest from './WebNestedScrollOptionsScrollBackwardTest.test'
import webNestedScrollOptionsScrollForwardTest from './WebNestedScrollOptionsScrollForwardTest.test'
import webNestedScrollOptionsScrollBackwardHorizontalTest
  from './WebNestedScrollOptionsScrollBackwardHorizontalTest.test'
import webNestedScrollOptionsScrollForwardHorizontalTest from './WebNestedScrollOptionsScrollForwardHorizontalTest.test'
import webViewControllerPostUrlTest from './WebViewControllerPostUrlTest.test'
import webViewControllerSetConnectionTimeoutTest from './WebViewControllerSetConnectionTimeoutTest.test'
import webJavaScriptOnDocumentStartTest from './WebJavaScriptOnDocumentStartTest.test'

export default function testsuite() {
  webResourceResponseGet()
  webResourceResponseSet()
  webResourceError()
  webViewControllerPart2()
  webViewZoomRatio()
  webViewControllerZoom()
  webControllerZoom()
  webViewMenuShowResult()
  screenCapture()
  webViewMenuInputFieldType()
  webViewMinLogicalFontSize()
  webMessagePortIsExtentionTypeTest()
  webCookieManagerFetchCookieSync()
  webCookieManagerFetchCookie()
  webCookieManagerExistCookie()
  webNestedScrollOptionsScrollBackwardTest()
  webNestedScrollOptionsScrollForwardTest()
  webNestedScrollOptionsScrollBackwardHorizontalTest()
  webNestedScrollOptionsScrollForwardHorizontalTest()
  webViewControllerPostUrlTest()
  webViewControllerSetConnectionTimeoutTest()
  webJavaScriptOnDocumentStartTest()
}