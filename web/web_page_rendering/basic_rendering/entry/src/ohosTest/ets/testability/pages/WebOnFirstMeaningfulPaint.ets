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
import { BusinessError } from '@ohos.base';

@Entry
@Component
struct WebOnFirstMeaningfulPaint {
  @State str: string = ""
  @State text: number[] | undefined[] =[0, 0]
  controller: webView.WebviewController = new webView.WebviewController();

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
        Button("WebOnFirstMeaningfulPaint").id('WebOnFirstMeaningfulPaint').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {

            case "OnFirstMeaningfulPaint0100": {
              let value: boolean = false;
              this.text = [0, 0]
              try {
                this.controller.loadUrl('www.example.com');
                await Utils.sleep(5000);
                if (this.text[0] != 0 && this.text[1] != 0) {
                  value = true;

                }
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }

              setTimeout(() => {
                Utils.emitEvent(value, 701)
              }, 3000)
              break;
            }

            case "OnFirstMeaningfulPaint0200": {
              let value: boolean = false;
              this.text = [0, 0]
              try {
                this.controller.loadUrl('https://www.iana.org/help/example-domains');
                await Utils.sleep(5000);
                if (this.text[0] != 0 && this.text[1] != 0) {
                  value = true;
                }
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }

              setTimeout(() => {
                console.log("value: " + value);
                Utils.emitEvent(value, 702)
              }, 3000)
              break;
            }
          }
        })
      }

      Web({ src: 'www.example.com', controller: this.controller })
        .onFirstMeaningfulPaint(event => {
          if (event) {
            console.log("onFirstMeaningfulPaint:" + "[NavigationStart]:" +
              event.navigationStartTime)
            console.log("onFirstMeaningfulPaint:" + "[FirstMeaningfulPaint]:" +
              event.firstMeaningfulPaintTime)
            this.text[0] = event.navigationStartTime
            this.text[1] = event.firstMeaningfulPaintTime
          }
        })
    }
  }
}
