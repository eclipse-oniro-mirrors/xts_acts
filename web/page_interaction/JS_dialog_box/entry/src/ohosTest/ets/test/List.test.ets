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
import WebViewEnumAndFontLibrary from './WebViewEnumAndFontLibrary.test'
import bindSelectionMenu from './bindSelectionMenu.test'
import webAttributeTest from './WebAttributeTest.test'
import WebOnPermissionRequest from './WebOnPermissionRequest.test'
import webInitTest from './WebInitTest.test'
import WebPreviewMenuOptions from './WebPreviewMenuOptions.test'
import WebElementType from  './WebElementType.test'

export default function testsuite() {
  webInitTest()
  webAttributeTest()
  bindSelectionMenu()
  WebOnPermissionRequest()
  WebViewEnumAndFontLibrary()
  WebPreviewMenuOptions()
  WebElementType()
}