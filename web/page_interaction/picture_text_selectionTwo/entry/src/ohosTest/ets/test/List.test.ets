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
import WebViewEnumAndFontLibrary from './WebViewEnumAndFontLibrary.test'
import WebViewEnumAndSetWebController from './WebViewEnumAndSetWebController.test'
import webViewMenuShowResult from './webViewMenuShowResult.test'
import webViewHasImageJsunit from './webViewHasImageJsunit.test'
import WebViewBypassVsyncCondition from './WebViewBypassVsyncCondition.test'


export default function testsuite() {
  webViewController()
  WebViewEnumAndFontLibrary()
  WebViewEnumAndSetWebController()
  webViewMenuShowResult()
  webViewHasImageJsunit()
  WebViewBypassVsyncCondition()

}