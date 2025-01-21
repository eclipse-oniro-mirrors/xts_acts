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

@Entry
@Component
struct WebOnInterceptKeyEventTest {
  controller: webView.WebviewController = new webView.WebviewController();
  @State str: string = "";
  @State callBackId: number = 0;
  @State stressTimes: number = 0;
  @State successTimes: number = 0;
  @State buttonKey: string = '';
  @State interceptKeyEvent: boolean = false;
  @State onInterceptKeyEventCalled: boolean = false;

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
              case 'testWebOnInterceptKeyEvent001': {
                try {
                  this.controller.loadUrl('resource://rawfile/keyEvent.html');
                  await Utils.sleep(2000)
                  while (this.successTimes < this.stressTimes) {
                    await Utils.triggerKey(2017)
                  }
                  Utils.emitEvent(true, this.callBackId)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                break;
              }
              case 'testWebOnInterceptKeyEvent002': {
                try {
                  this.successTimes = 0;
                  this.interceptKeyEvent = true
                  this.controller.loadUrl('resource://rawfile/keyEvent.html');
                  await Utils.sleep(2000)
                  while (this.successTimes < this.stressTimes) {
                    await Utils.triggerKey(2017)
                  }
                  Utils.emitEvent(true, this.callBackId)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                break;
              }
            }
          })

        Web({ src: '', controller: this.controller })
          .javaScriptAccess(true)
          .geolocationAccess(true)
          .databaseAccess(true)
          .onInterceptKeyEvent(() => {
            this.successTimes++
            Utils.stressingLog('Web.onInterceptKeyEvent()', this.successTimes, this.stressTimes)
            return this.interceptKeyEvent;
          })
      }
      .width('100%')
    }

    .height('100%')
  }
}