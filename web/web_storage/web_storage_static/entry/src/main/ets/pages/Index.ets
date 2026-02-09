/**
 * Copyright (c) 2025 iSoftStone Information Technology (Group) Co.,Ltd.
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

import { OnPermissionRequestEvent, OnPageVisibleEvent, Entry, Text, TextAttribute, Column, Component, Button, ButtonAttribute, ClickEvent, Web } from '@ohos.arkui.component'  // TextAttribute should be insert by ui-plugins
import { State } from '@ohos.arkui.stateManagement' // should be insert by ui-plugins
import webView from '@ohos.web.webview'
import hilog from '@ohos.hilog'

@Entry
@Component
struct webStorage {
  controller: webView.WebviewController = new webView.WebviewController(undefined);
  @State javaScriptAccess: boolean = true;
  @State databaseAccess: boolean = true
  @State stateRst: string = "Xts test result"
  updateFlag: boolean = false

  build() {
    Column(undefined) {
      Text('WebStorageTest').fontSize(20)
      Web({ src: 'resource://rawfile/addOrigin.html', controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .databaseAccess(this.databaseAccess)
        .onPageVisible((parameter: OnPageVisibleEvent): void => {
          hilog.info(0x000, 'testTag', '[Boruto]: Page OnPageVisibleEvent url:' + parameter.url);
          if (this.updateFlag) {
            this.stateRst = parameter.url;
          }
        })
        .onPermissionRequest((event: OnPermissionRequestEvent): void => {
          if (this.updateFlag && event) {
            hilog.info(0x000, 'testTag', '[Boruto]: Show request==>Origin:' + event.request.getOrigin());
            this.stateRst = event.request.getOrigin();
          }
        })
    }
  }
}
