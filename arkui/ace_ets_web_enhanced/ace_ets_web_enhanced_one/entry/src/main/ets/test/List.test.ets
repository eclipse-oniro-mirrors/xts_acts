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
import webViewController from './WebViewController.test'
import geolocationPermissions from './GeolocationPermissions.test'
import webCookieManager from './WebCookieManager.test'
import jsMessageExt from './JsMessageExt.test'
import webMessageExt from './WebMessageExt.test'
import webDataBase from './WebDataBase.test'
import webController from './WebController.test'
import webAttribute from './WebAttribute.test'
import webAttributeTwo from './WebAttributeTwo.test'
import sslErrorHandler from './SslErrorHandler.test'
import webStorage from './WebStorage.test'
import httpAuthHandler from './HttpAuthHandler.test'
import webViewControllerHitTest from './WebViewControllerHitTest.test'
import webAttributeTest from './WebAttributeTest.test'
import webControllerHitTest from './WebControllerHitTest.test'
import webJsGeolocationInvoke from './WebJsGeolocationInvoke.test'
import webInitTest from './WebInitTest.test'

export default function testsuite() {
  webInitTest()
  webAttributeTest()
  webStorage()
  webJsGeolocationInvoke()
  webMessageExt()
  webCookieManager()
  jsMessageExt()
  geolocationPermissions()
  webViewController()
  webDataBase()
  webController()
  webAttribute()
  sslErrorHandler()
  httpAuthHandler()
  webViewControllerHitTest()
  webControllerHitTest()
  webAttributeTwo()
}