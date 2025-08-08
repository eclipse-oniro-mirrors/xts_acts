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
import events_emitter from '@ohos.events.emitter';
import Utils from '../../test/Utils';
import webView from '@ohos.web.webview';

@Entry
@Component
struct webAttribute {
  controller: WebController = new WebController()
  @State str: string = "emitUserAgent"
  @State console: string = ""
  @State javaScriptAccess: boolean = true

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
    Column() {
      Row() {
        Button("WebAttribute click").key('WebAttributeButton').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "testJavaScriptAccess001": {
              try {
                this.javaScriptAccess = false
                await Utils.sleep(2000);
                this.controller.runJavaScript({ script: "jsAccess()" })
                await Utils.sleep(2000);
                if (this.console !== "web111") {
                  let javaScriptAccessCalled = true
                  Utils.emitEvent(javaScriptAccessCalled, 32019)
                }
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 32019)
              }
              break;
            }
          }
        })
      }

      Web({ src: $rawfile('index.html'), controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
    }
  }
}
