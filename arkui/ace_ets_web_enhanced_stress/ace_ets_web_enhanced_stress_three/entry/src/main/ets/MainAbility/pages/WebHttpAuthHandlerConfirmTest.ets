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
struct webHttpAuthHandlerConfirmTest {
  controller: webView.WebviewController = new webView.WebviewController();
  @State str: string = "";
  @State callBackId: number = 0;
  @State stressTimes: number = 0;
  @State buttonKey: string = '';
  @State account: number = 11;

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
              case 'testWebHttpAuthHandlerConfirm001': {
                try {
                  this.controller.loadUrl("http://httpbin.org/basic-auth/11/3333")
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
          .onHttpAuthRequest((event) => {
            if (event) {
              try {
                for (let i = 0; i < this.stressTimes; i++) {
                  event.handler.confirm(this.account + '', '3333')
                  Utils.stressingLog('HttpAuthHandler.confirm()', i + 1, this.stressTimes)
                }
                this.controller.clearSslCache()
                this.controller.clearClientAuthenticationCache()
                Utils.emitEvent(true, this.callBackId)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                this.controller.clearSslCache()
                this.controller.clearClientAuthenticationCache()
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