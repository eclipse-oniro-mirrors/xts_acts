/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import events_emitter from '@ohos.events.emitter';
import { webview } from '@kit.ArkWeb';
import { BusinessError } from '@ohos.base';
import Utils from '../../test/Utils';
import { Driver, ON } from '@ohos.UiTest';


const EVENT_ID_SET_SUITE_KEY = 202700;

@Entry
@Component
struct OnceStringError {
  controller: webview.WebviewController = new webview.WebviewController();
  @State str: string = "";
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: EVENT_ID_SET_SUITE_KEY,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(EVENT_ID_SET_SUITE_KEY)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 0;
      }
    }
  }


  build() {
    Column() {
      Row() {
        Button('web click').key('onceStringErrorButton').onClick(async () => {
          console.info("key==>" + this.str);
          await Utils.waitForExist(()=>this.isReceive, 'webcomponentIsReceive', 0, 1000);
          await Utils.waitForExist(()=>this.isPageEnd, 'webcomponentIsPageEnd', 0, 1000);
          this.isReceive = -1;
          switch (this.str) {
            case "testOnceStringTypeEmpty": {
              try {
                webview.once("", () => {
                  console.info("once empty string success");
                  Utils.emitEvent("success", 202701);
                });
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 202701);
              }
              break;
            }

            case "testOnceStringTypeNull": {
              try {
                webview.once(null, () => {
                  console.info("once null success");
                  Utils.emitEvent("success", 202702);
                });
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 202702);
              }
              break;
            }

            case "testOnceStringTypeUndefined": {
              try {
                webview.once(undefined, () => {
                  console.info("once undefined success");
                  Utils.emitEvent("success", 202703);
                });
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 202703);
              }
              break;
            }
          }
        })
      }

      Web({ src: "www.example.com", controller: this.controller })
        .onPageEnd(() => {
          this.isPageEnd = 0;
        })
        .width("100%")
        .height("50%")
    }
  }
}
