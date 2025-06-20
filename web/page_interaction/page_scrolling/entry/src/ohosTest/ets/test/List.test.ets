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

import webViewController from './webViewController.test'
import ScrollPage from './ScrollPage.test'
import webViewOnScroll from './webViewOnScroll.test'
import webResourceResponseGet from './WebResourceResponseGet.test'
import webNestedScrollOptionsScrollForwardTest from './WebNestedScrollOptionsScrollForwardTest.test'
import NestedScrollMode from './NestedScrollMode.test'
import scrollEvent from './scrollEvent.test'
import scrollByTo from './scrollByTo.test'
export default function testsuite() {
  webResourceResponseGet()
  webViewOnScroll()
  ScrollPage()
  webViewController()
  webNestedScrollOptionsScrollForwardTest()
  NestedScrollMode()
  scrollEvent()
  scrollByTo()
}