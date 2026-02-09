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

import webView from '@ohos.web.webview';
import Utils from '../../test/Utils';
import events_emitter from '@ohos.events.emitter';

const EVENT_ID_SET_EMIT_KEY = 201290;

@Entry
@Component
struct WebSecureDnsModeEnumTest {
  controller: webView.WebviewController = new webView.WebviewController();
  @State str: string = ""
  @State isPageEnd: number = -1;
  @State isReceive: number = -1;


  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: EVENT_ID_SET_EMIT_KEY,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(EVENT_ID_SET_EMIT_KEY)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 1;
      }
    }
  }

  build() {
    Row() {
      Column() {
        Button('WebSecureDnsModeEnumTestButton').key('WebSecureDnsModeEnumTestButton')
          .onClick(async () => {
            await Utils.waitForExist(()=>this.isPageEnd, 'WebSecureDnsModeEnumTestButtonIsPageEnd', 1, 1000);
            await Utils.waitForExist(()=>this.isReceive, 'WebSecureDnsModeEnumTestButtonIsReceive', 1, 1000);
            console.info("key==>" + this.str);
            this.isReceive = -1;
            switch (this.str) {
              case "testWebSecureDnsModeEnum001": {
                try {
                  Utils.emitEvent(webView.SecureDnsMode.OFF, 201300)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "testWebSecureDnsModeEnum002": {
                try {
                  Utils.emitEvent(webView.SecureDnsMode.AUTO, 201310)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "testWebSecureDnsModeEnum003": {
                try {
                  Utils.emitEvent(webView.SecureDnsMode.SECURE_ONLY, 201320)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
            }
          })

        Web({ src: $rawfile('second.html'), controller: this.controller })
          .javaScriptAccess(true)
          .javaScriptAccess(true)
          .horizontalScrollBarAccess(true)
          .verticalScrollBarAccess(true)
          .geolocationAccess(true)
          .databaseAccess(true)
          .onPageEnd((event) => {
            console.log('onPageEnd url:' + event.url);
            this.isPageEnd = 1;
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}