/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { Entry, Text, TextAttribute, Column, Component, Button, ButtonAttribute, ClickEvent, Web, WebAttribute } from '@ohos.arkui.component'  // TextAttribute should be insert by ui-plugins
import { State } from '@ohos.arkui.stateManagement' // should be insert by ui-plugins
import { BusinessError } from '@ohos.base'
import hilog from '@ohos.hilog'
import webview from '@ohos.web.webview'

@Entry
@Component
struct MyStateSample {
  @State pageHeightResult: string = '';
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = true;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = false;
  @State databaseAccess: boolean = true;
  webviewController: webview.WebviewController = new webview.WebviewController(undefined);
  build() {
    Column(undefined) {
      Button('GetPageHeight')
        .id('get_page_height_button')
        .onClick((e: ClickEvent) => {
          try {
            let pageHeight = this.webviewController.getPageHeight();
            this.pageHeightResult = 'pass';
            hilog.info(0x0000, 'testTag', "Test getPageHeight " + pageHeight);
          } catch (error) {
            this.pageHeightResult = '';
            hilog.info(0x0000, 'testTag', "Test getPageHeight failed. " + (error as BusinessError).code);
            hilog.info(0x0000, 'testTag', "Test getPageHeight failed. " + (error as BusinessError).message);
          }
        })
      Text(this.pageHeightResult).id('result_text');
      Web({src: 'resource://rawfile/index.html', controller: this.webviewController})
        .javaScriptAccess(this.javaScriptAccess)
        .databaseAccess(this.databaseAccess)
    }
  }
}
