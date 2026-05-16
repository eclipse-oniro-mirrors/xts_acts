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

import Utils from '../../test/Utils';
import webView from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';
import business_error from '@ohos.base';
import { waitForExist } from '../../test/WaitTest.test';

@Entry
@Component
struct webviewControllerBackOrForwardErrorCode {
  controller: webView.WebviewController = new webView.WebviewController();
  @State str: string = ''
  @State isReceive: number = -1;
  @State javaScriptAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State isPageEnd: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 172400,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(172400)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 0;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button('WebviewController backOrForward error code test').key('webviewControllerBackOrForwardErrorCodeButton').onClick(async () => {
          await waitForExist(()=>this.isReceive, this.str, 0);
          console.info('key==>' + this.str)
          this.isReceive = -1;
          switch (this.str) {

            case 'emitBackOrForwardErrorCodeNull001': {
              try {
                console.info('test backOrForward with null');
                this.controller.backOrForward(null);
                Utils.emitEvent('success', 172410)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 172410)
              }
              break;
            }

            case 'emitBackOrForwardErrorCodeUndefined001': {
              try {
                console.info('test backOrForward with undefined');
                this.controller.backOrForward(undefined);
                Utils.emitEvent('success', 172420)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 172420)
              }
              break;
            }

            default: {
              console.info('unknown case: ' + this.str);
              break;
            }
          }
        })
      }
    }
    .width('100%')
    .height('100%')
  }
}
