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
import {waitForAssert, waitForExist} from '../../test/WaitTest.test';
import { URL } from '../../test/Config.test';

@Entry
@Component
struct webPrivateNetworkAccessTest {
  controller: webView.WebviewController = new webView.WebviewController();
  controllerTwo: webView.WebviewController = new webView.WebviewController();
  @State emitKey: string = '';
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 21,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(21)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.emitKey = eventData.data.ACTION;
        this.isReceive = 0;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button('privateNetworkAccess click')
          .key('WebPrivateNetworkAccessButton')
          .onClick(async () => {
            await waitForExist(()=>this.isReceive, this.emitKey, 0);
            await waitForExist(()=>this.isPageEnd, this.emitKey, 0);
            console.info('key==>' + this.emitKey);
            this.isReceive = -1;
            switch (this.emitKey) {
              case 'emitPrivateNetworkAccess01': {
                try {
                  webView.WebviewController.enablePrivateNetworkAccess(true);
                  let result = webView.WebviewController.isPrivateNetworkAccessEnabled();
                  console.log(this.emitKey + ' isPrivateNetworkAccessEnabled：' + result);
                  Utils.emitEvent(result, 2025081409);
                } catch (error) {
                  console.error(this.emitKey + ' ErrorCode：' + error.code + ' Message：' + error.message);
                  Utils.emitEvent(error.message, 2025081409);
                }
                break;
              }
              case 'emitPrivateNetworkAccess02': {
                try {
                  webView.WebviewController.enablePrivateNetworkAccess(false);
                  let result = webView.WebviewController.isPrivateNetworkAccessEnabled();
                  console.log(this.emitKey + ' isPrivateNetworkAccessEnabled：' + result);
                  Utils.emitEvent(result, 2025081410);
                } catch (error) {
                  console.error(this.emitKey + ' ErrorCode：' + error.code + ' Message：' + error.message);
                  Utils.emitEvent(error.message, 2025081410);
                }
                break;
              }
              case 'emitPrivateNetworkAccessErrorCode01': {
                try {
                  webView.WebviewController.enablePrivateNetworkAccess(null);
                } catch (error) {
                  console.error(this.emitKey + ' ErrorCode：' + error.code + ' Message：' + error.message);
                  Utils.emitEvent(Number(error.code), 2025081411);
                }
                break;
              }
              case 'emitPrivateNetworkAccessErrorCode02': {
                try {
                  webView.WebviewController.enablePrivateNetworkAccess(undefined);
                } catch (error) {
                  console.error(this.emitKey + ' ErrorCode：' + error.code + ' Message：' + error.message);
                  Utils.emitEvent(Number(error.code), 2025081412);
                }
                break;
              }
            }
         })
      }
      Web({ src: URL, controller: this.controller })
        .onPageEnd((event) => {
          if (event) {
            this.isPageEnd = 0;
            console.log('onPageEnd url:' + event.url);
           }
        })
        .width('100%')
        .height('100%')
    }
  }
}
