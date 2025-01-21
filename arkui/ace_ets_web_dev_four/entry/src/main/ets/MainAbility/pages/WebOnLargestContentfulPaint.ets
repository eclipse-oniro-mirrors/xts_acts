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

@Entry
@Component
struct WebOnLargestContentfulPaint {
  @State str: string = ""
  @State text: number[] | undefined[] = [0, 0, 0, 0, 0, 0]
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
        Button("WebOnLargestContentfulPaint").id('WebOnLargestContentfulPaint').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {

            case "OnLargestContentfulPaint0100": {
              let value: boolean = false;
              this.text = [0, 0, 0, 0, 0, 0]
              try {
                this.controller.loadUrl('www.example.com');
                await Utils.sleep(2000);
                this.controller.removeCache(true);
                await Utils.sleep(2000);
                this.controller.loadUrl('www.example.com');
                await Utils.sleep(5000);
                if (
                  this.text[0] != 0
                    && this.text[1] == 0
                    && this.text[2] != 0
                    && this.text[3] == 0
                    && this.text[4] == 0
                    && this.text[5] == 0
                ) {
                  value = true;
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }

              setTimeout(() => {
                console.log("value: " + value);
                Utils.emitEvent(value, 801)
              }, 3000)
              break;
            }

            case "OnLargestContentfulPaint0200": {
              let value: boolean = false;
              this.text = [0, 0, 0, 0, 0, 0]
              try {
                this.controller.loadUrl('https://www.iana.org/help/example-domains');
                await Utils.sleep(2000);
                this.controller.removeCache(true);
                await Utils.sleep(2000);
                this.controller.loadUrl('https://www.iana.org/help/example-domains');
                await Utils.sleep(5000);
                if (
                  this.text[0] != 0
                    && this.text[1] != 0
                    && this.text[2] != 0
                    && this.text[3] != 0
                    && this.text[4] != 0
                    && this.text[5] != 0
                ) {
                  value = true;
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }

              setTimeout(() => {
                console.log("value: " + value);
                Utils.emitEvent(value, 802)
              }, 3000)
              break;
            }
          }
        })
      }

      Web({ src: 'www.example.com', controller: this.controller })
        .onLargestContentfulPaint(event => {
          if (event) {
            console.log("onLargestContentfulPaint:" + "[NavigationStart]:" +
            event.navigationStartTime)
            console.log("onLargestContentfulPaint:" + "[LargestImagePaint]:" +
            event.largestImagePaintTime)
            console.log("onLargestContentfulPaint:" + "[largestTextPaint]:" +
            event.largestTextPaintTime)
            console.log("onLargestContentfulPaint:" + "[imageBPP]:" +
            event.imageBPP)
            console.log("onLargestContentfulPaint:" + "[LargestImageLoadStart]:" +
            event.largestImageLoadStartTime)
            console.log("onLargestContentfulPaint:" + "[LargestImageLoadEnd]:" +
            event.largestImageLoadEndTime)
            this.text[0] = event.navigationStartTime
            this.text[1] = event.largestImagePaintTime
            this.text[2] = event.largestTextPaintTime
            this.text[3] = event.imageBPP
            this.text[4] = event.largestImageLoadStartTime
            this.text[5] = event.largestImageLoadEndTime
          }
        })
    }
  }
}
