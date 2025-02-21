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
import webOnBeforeUnload from './WebOnBeforeUnload.test'
import webOnPermissionRequest from './WebOnPermissionRequestTest.test'
import webOnFullScreenExit from './WebOnFullScreenExit.test'
import webOnFullScreenEnter from './WebOnFullScreenEnter.test'
import webOnDataResubmitted from './WebOnDataResubmitted.test'
import webOptions from './WebOptions.test'
import webOnInterceptRequestTest from './WebOnInterceptRequest.test'
import webOnAudioStateChanged from './WebOnAudioStateChanged.test'
import webOnFirstContentfulPaint from './WebOnFirstContentfulPaint.test'
import webMediaPlayGestureAccess from './WebMediaPlayGestureAccess.test'
import webMediaOption from './WebMediaOption.test'
import webOnLoadIntercept from './WebOnLoadIntercept.test'
import WebViewEnumAndFontLibrary from './WebViewEnumAndFontLibrary.test'
import WebViewEnumAndFontLibraryTwo from './WebViewEnumAndFontLibraryTwo.test'
import WebViewEnumAndSetWebController from './WebViewEnumAndSetWebController.test'
import WebViewJavaScriptProxyAndOnPageVisible from './WebViewJavaScriptProxyAndOnPageVisible.test'
import WebViewOverviewModeAccessAndContextMenuMediaTypeImage
  from './WebViewOverviewModeAccessAndContextMenuMediaTypeImage.test'
import webViewControllerPart3Test from './WebViewControllerPart3.test'
import webFontTest from './WebFontTest.test'
import webSslErrorTest from './WebSslErrorTest.test'
import webOnHttpErrorReceiveTest from './WebOnHttpErrorReceive.test'
import webOnUrlLoadIntercept from './WebOnUrlLoadIntercept.test'
import webOnInterceptKeyEvent from './WebOnInterceptKeyEvent.test'
import webZoomAccessTest from './WebZoomAccessTest.test'
import webControllerLoadUrlTest from './WebControllerLoadUrlTest.test'
import webViewControllerLoadUrlTest from './WebViewControllerLoadUrlTest.test'
import webControllerRefreshTest from './WebControllerRefreshTest.test'
import webViewControllerRefreshTest from './WebViewControllerRefreshTest.test'
import webViewControllerDownloadTest from './WebViewControllerDownloadTest.test'
import webViewControllerRemoveCacheTest from './WebViewControllerRemoveCacheTest.test'
import webViewControllerDownloadServerTest from './WebViewControllerDownloadServerTest.test'
import webHitTestTypeEnumTest from './WebHitTestTypeEnumTest.test'
import webDownloadEnumTest from './WebDownloadEnumTest.test'
import webSecureDnsModeEnumTest from './WebSecureDnsModeEnumTest.test'
import webViewControllerDownloadNetworkTest from './WebViewControllerDownloadNetworkTest.test'
import webViewControllerDownloadFileTest from './WebViewControllerDownloadFileTest.test'
import WebkeyboardAvoidMode from './WebkeyboardAvoidMode.test'

export default function testsuite() {
  webViewControllerPart3Test()
  WebkeyboardAvoidMode()
  WebViewEnumAndFontLibraryTwo()
  webOnBeforeUnload()
  webOnInterceptRequestTest()
  webOnFullScreenEnter()
  webOnFullScreenExit()
  webOnDataResubmitted()
  webOptions()
  webOnAudioStateChanged()
  webOnFirstContentfulPaint()
  webMediaPlayGestureAccess()
  webMediaOption()
  webOnLoadIntercept()
  webOnPermissionRequest()
  WebViewEnumAndFontLibrary()
  WebViewEnumAndSetWebController()
  WebViewJavaScriptProxyAndOnPageVisible()
  WebViewOverviewModeAccessAndContextMenuMediaTypeImage()
  webFontTest()
  webSslErrorTest()
  webOnHttpErrorReceiveTest()
  webOnUrlLoadIntercept()
  webOnInterceptKeyEvent()
  webZoomAccessTest()
  webControllerLoadUrlTest()
  webViewControllerLoadUrlTest()
  webControllerRefreshTest()
  webViewControllerRefreshTest()
  webViewControllerDownloadTest()
  webViewControllerRemoveCacheTest()
  webViewControllerDownloadServerTest()
  webHitTestTypeEnumTest()
  webDownloadEnumTest()
  webSecureDnsModeEnumTest()
  webViewControllerDownloadNetworkTest()
  webViewControllerDownloadFileTest()
}