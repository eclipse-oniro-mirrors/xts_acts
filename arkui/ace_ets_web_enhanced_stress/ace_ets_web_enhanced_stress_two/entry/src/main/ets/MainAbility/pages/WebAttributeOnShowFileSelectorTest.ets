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

import webView from '@ohos.web.webview';
import Utils from '../../test/Utils';
import events_emitter from '@ohos.events.emitter';
import { Driver, ON } from '@ohos.UiTest';

@Entry
@Component
struct WebAttributeOnShowFileSelectorTest {
  controller: webView.WebviewController = new webView.WebviewController();
  @State ports: webView.WebMessagePort[] = [];
  @State str: string = ""
  @State buttonKey: string = '';
  @State stressTimes: number = 0;
  @State successTimes: number = 0;
  @State callBackId: number = 0;
  @State javaScriptAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = false;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State uri: string = "file://docs/storage/Users/currentUser/Documents/1.json";

  onPageShow() {
    Utils.registerEventPage((eventData: events_emitter.EventData) => {
      if (eventData.data) {
        this.str = eventData.data.CASE_NAME;
        this.callBackId = eventData.data.CALL_BACK_ID;
        this.stressTimes = eventData.data.STRESS_TIMES;
        this.buttonKey = eventData.data.BUTTON_KEY
      }
    })
  }

  onPageHide() {
    Utils.unRegisterEventPage()
  }

  build() {
    Row() {
      Column() {
        Button(this.buttonKey)
          .key(this.buttonKey)
          .onClick(async () => {
            console.info("key==>" + this.str)
            switch (this.str) {
              case "testWebAttributeOnShowFileSelector001": {
                try {
                  this.controller.loadUrl($rawfile('showFileSelector.html'));
                  await Utils.sleep(2000);
                  let driver = Driver.create();
                  let component = await driver.findComponent(ON.id('WebAttributeOnShowFileSelectorTestWebView'));
                  while (this.successTimes < this.stressTimes) {
                    await component.click()
                  }
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                break;
              }
            }
          })

        Web({ src: '', controller: this.controller })
          .javaScriptAccess(this.javaScriptAccess)
          .key("WebAttributeOnShowFileSelectorTestWebView")
          .fileAccess(this.fileAccess)
          .imageAccess(this.imageAccess)
          .domStorageAccess(this.domStorageAccess)
          .onlineImageAccess(this.onlineImageAccess)
          .databaseAccess(this.databaseAccess)
          .onShowFileSelector((event) => {
            if (event) {
              try {
                this.successTimes++
                event.result.handleFileList([this.uri]);
                Utils.stressingLog('WebAttribute.onShowFileSelector()', this.successTimes, this.stressTimes)
                if (this.successTimes >= this.stressTimes) {
                  Utils.emitEvent(true, this.callBackId)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(false, this.callBackId)
              }
            }
            return true
          })
      }
      .width('100%')
    }

    .height('100%')
  }
}