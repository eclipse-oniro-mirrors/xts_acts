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
import geolocationPermissionsErrorCode from './GeolocationPermissionsErrorCode.test'
import jsMessageExtErrorCode from './JsMessageExtErrorCode.test'
import webCookieManagerErrorCode from './WebCookieManagerErrorCode.test'
import webMessageExtErrorCode from './WebMessageExtErrorCode.test'
import webMessagePortErrorCode from './WebMessagePortErrorCode.test'
import webStorageErrorCode from './WebStorageErrorCode.test'
import webViewControllerErrorCode from './WebViewControllerErrorCode.test'
import webErrorCode from './WebErrorCode.test'
import webViewControllerPostUrlErrorCode from './WebViewControllerPostUrlErrorCode.test'
import webDownloadErrorCode from './WebDownloadErrorCode.test'
import webViewControllerErrorCodeSecond from './WebViewControllerErrorCodeSecond.test'
import webResourceHandlerTest from './webResourceHandlerTest.test'
import webHttpBodyStreamTest from './webHttpBodyStreamTest.test'

export default function testsuite() {
  webErrorCode()
  geolocationPermissionsErrorCode()
  jsMessageExtErrorCode()
  webMessagePortErrorCode()
  webCookieManagerErrorCode()
  webStorageErrorCode()
  webMessageExtErrorCode()
  webViewControllerErrorCode()
  webViewControllerPostUrlErrorCode()
  webDownloadErrorCode()
  webViewControllerErrorCodeSecond()
  webResourceHandlerTest()
  webHttpBodyStreamTest()
}