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
import { Driver } from '@ohos.UiTest';

@Entry
@Component
struct WebAttributeOnOverScrollTest {
  controller: WebController = new WebController()
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
  @State testMultiWindowAccess: boolean = true;
  @State testAllowWindowOpenMethod: boolean = true;

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

              case "testWebAttributeOnOverScroll001": {
                try {
                  this.successTimes = 0
                  let driver = Driver.create();
                  while (this.successTimes < this.stressTimes) {
                    await driver.swipe(100, 300, 100, 400, 40000);
                  }
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testWebAttributeOnOverScroll002": {
                try {
                  this.successTimes = 0
                  let driver = Driver.create();
                  while (this.successTimes < this.stressTimes) {
                    await driver.swipe(100, 400, 100, 300, 40000);
                  }
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testWebAttributeOnOverScroll003": {
                try {
                  this.successTimes = 0
                  let driver = Driver.create();
                  while (this.successTimes < this.stressTimes) {
                    await driver.swipe(200, 300, 100, 300, 40000);
                  }
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testWebAttributeOnOverScroll004": {
                try {
                  this.successTimes = 0
                  let driver = Driver.create();
                  while (this.successTimes < this.stressTimes) {
                    await driver.swipe(100, 300, 200, 300, 40000);
                  }
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

            }
          })

        Web({ src: $rawfile('onOverScroll.html'), controller: this.controller })
          .javaScriptAccess(this.javaScriptAccess)
          .fileAccess(this.fileAccess)
          .imageAccess(this.imageAccess)
          .domStorageAccess(this.domStorageAccess)
          .onlineImageAccess(this.onlineImageAccess)
          .databaseAccess(this.databaseAccess)
          .onOverScroll((event) => {
            if (event) {
              this.successTimes++
              Utils.stressingLog('WebAttribute.onOverScroll()', this.successTimes, this.stressTimes)
              if (this.successTimes >= this.stressTimes) {
                Utils.emitEvent(true, this.callBackId)
              }
              console.info("x = " + event.xOffset)
              console.info("y = " + event.yOffset)
            }
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}