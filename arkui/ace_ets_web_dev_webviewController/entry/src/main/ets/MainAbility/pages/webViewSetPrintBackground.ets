/**
 * Copyright (c) 2023 iSoftStone Information Technology (Group) Co.,Ltd.
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
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import testsuite from '../../test/List.test';
import Utils from '../../test/Utils';
import web_webview from '@ohos.web.webview';

let loadedUrl;

@Entry
@Component
struct webViewSetPrintBackground {
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  @State str: string = "emitSetPrintBackgroundOne";
  @State res: boolean = false;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("web click").key('webcomponentSetPrintBackground').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "emitSetPrintBackgroundOne": {
              this.controller.runJavaScript("tryPrint()", (error, result) => {
                if (error) {
                  console.info(`emitSetPrintBackgroundOne runJavaScript error: ` + JSON.stringify(error))
                  return;
                } else {
                  console.log("emitSetPrintBackgroundOne runJavaScript.result: " + result);
                }
              })
              await Utils.sleep(2000);
              try {
                this.controller.setPrintBackground(false);
                await Utils.sleep(2000);
                let enable = this.controller.getPrintBackground();
                console.info("getPrintBackground: " + enable);
                Utils.emitEvent(enable, 214)
                console.info("emitSetPrintBackgroundOne  res: " + enable);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
          }
        })
      }

      Web({ src: $rawfile('theScroll.html'), controller: this.controller })
    }
  }
}
