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
import { waitForExist } from '../../test/WaitTest.test';
@Entry
@Component
struct WebOnFirstMeaningfulPaint {
  @State str: string = ""
  @State text: number[] | undefined[] =[0, 0]
  @State isReceive: number = -1;
  @State isComplete: number = -1;
  controller: webView.WebviewController = new webView.WebviewController();

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 151990,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(151990)
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
        Button("WebOnFirstMeaningfulPaint").id('WebOnFirstMeaningfulPaint').onClick(async () => {
          await waitForExist(() => this.isComplete, this.str, 0);
          await waitForExist(() => this.isReceive, this.str, 0);
          this.isReceive = -1;
          console.info("key==>" + this.str)
          switch (this.str) {
            case "OnFirstMeaningfulPaint0100": {
              let value: boolean = false;
              this.text = [0, 0]
              try {
                this.isComplete = -1;
                this.controller.loadUrl('www.example.com');
                await waitForExist(() => this.isComplete, this.str, 0);
                if (this.text[0] != 0 && this.text[1] != 0) {
                  value = true;
                }
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              Utils.emitEvent(value, 152000)
              break;
            }

            case "OnFirstMeaningfulPaint0200": {
              let value: boolean = false;
              this.text = [0, 0]
              try {
                this.isComplete = -1;
                this.controller.loadUrl('https://www.iana.org/help/example-domains');
                await waitForExist(() => this.isComplete, this.str, 0);
                if (this.text[0] != 0 && this.text[1] != 0) {
                  value = true;
                }
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              Utils.emitEvent(value, 152010)
                console.log("value: " + value);
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
        .onPageEnd((event) => {
          console.log('web pageEnd==>' + event.url);
          this.isComplete = 0;
        })
    }
  }
}
