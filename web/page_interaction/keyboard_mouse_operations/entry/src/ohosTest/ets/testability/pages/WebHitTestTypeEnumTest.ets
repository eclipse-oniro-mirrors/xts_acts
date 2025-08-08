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

@Entry
@Component
struct WebHitTestTypeEnumTest {
  controller: webView.WebviewController = new webView.WebviewController();
  @State str: string = ""

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(10)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
      }
    }
  }

  build() {
    Row() {
      Column() {
        Button('WebHitTestTypeEnumTestButton').key('WebHitTestTypeEnumTestButton')
          .onClick(async () => {
            console.info("key==>" + this.str)
            switch (this.str) {
              case "testWebHitTestTypeEnum001": {
                try {
                  Utils.emitEvent(webView.WebHitTestType.EditText, 70143)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "testWebHitTestTypeEnum002": {
                try {
                  Utils.emitEvent(webView.WebHitTestType.Email, 70144)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "testWebHitTestTypeEnum003": {
                try {
                  Utils.emitEvent(webView.WebHitTestType.HttpAnchor, 70145)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "testWebHitTestTypeEnum004": {
                try {
                  Utils.emitEvent(webView.WebHitTestType.HttpAnchorImg, 70146)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "testWebHitTestTypeEnum005": {
                try {
                  Utils.emitEvent(webView.WebHitTestType.Img, 70147)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "testWebHitTestTypeEnum006": {
                try {
                  Utils.emitEvent(webView.WebHitTestType.Map, 70148)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "testWebHitTestTypeEnum007": {
                try {
                  Utils.emitEvent(webView.WebHitTestType.Phone, 70149)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "testWebHitTestTypeEnum008": {
                try {
                  Utils.emitEvent(webView.WebHitTestType.Unknown, 70150)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
            }
          })

        Web({ src: $rawfile('hitType.html'), controller: this.controller })
          .javaScriptAccess(true)
          .javaScriptAccess(true)
          .horizontalScrollBarAccess(true)
          .verticalScrollBarAccess(true)
          .geolocationAccess(true)
          .databaseAccess(true)
      }
      .width('100%')
    }
    .height('100%')
  }
}