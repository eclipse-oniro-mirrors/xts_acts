/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { waitForExist } from '../../test/WaitTest.test';


@Entry
@Component
struct WebViewOnFirstScreenPaint {
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  @State str: string = "";
  @State isComplete: number = -1;
  @State isReceive: number = -1;
  @State positionInfo: CaretOffset = { index: 0, x: 0, y: 0 }
  @State ScreenPaintNavigationStartTime:number = 0;
  @State ScreenPaintFirstScreenPaintTime:number = 0;
  @State ScreenPaintUrl:string = ""


  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 152069,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("webViewOnFullScreenEnter page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data?.ACTION != null) {
        this.str = eventData.data?.ACTION;
        this.isReceive = 0;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("web click").key('WebViewOnFirstScreenPaintButton').onClick(async () => {
          console.info("key==>" + this.str)
          await waitForExist(() => this.isComplete, this.str, 0);
          await waitForExist(() => this.isReceive, this.str, 0);
          switch (this.str) {
            case "emitOnFirstScreenPaint001": {
              try {
                this.isComplete = -1;
                this.controller.loadUrl($rawfile('4stiaozhuangbaidu.html'));
                await waitForExist(() => this.isComplete, this.str, 0);
                Utils.emitEvent(this.ScreenPaintUrl, 20260131)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "emitOnFirstScreenPaint002": {
              try {
                this.isComplete = -1;
                this.controller.loadUrl($rawfile('4stiaozhuangbaidu.html'));
                await waitForExist(() => this.isComplete, this.str, 0);
                Utils.emitEvent(this.ScreenPaintNavigationStartTime > 0, 20260132)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }


            case "emitOnFirstScreenPaint003": {
              try {
                this.isComplete = -1;
                this.controller.loadUrl($rawfile('4stiaozhuangbaidu.html'));
                await waitForExist(() => this.isComplete, this.str, 0);
                Utils.emitEvent(this.ScreenPaintFirstScreenPaintTime > 0, 20260133)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

          }
        })
      }

      Web({ src: $rawfile('4stiaozhuangbaidu.html'), controller: this.controller })
        .width('100%')
        .height('50%%')
        .onPageEnd((event) => {
          console.log('web pageEnd==>' + event.url);
          this.isComplete = 0;
        })
        .onFirstScreenPaint((event:FirstScreenPaint)=> {
          this.ScreenPaintUrl = event.url;
          this.ScreenPaintNavigationStartTime = event.navigationStartTime;
          this.ScreenPaintFirstScreenPaintTime = event.firstScreenPaintTime;
          console.log(`zhu onFirstScreenPaint on ${event.url}.`);
          console.log(`zhu The navigation start time is ${event.navigationStartTime}.`);
          console.log(`zhu The first screen paint time is ${event.firstScreenPaintTime}.`);
        })
    }.width('100%').height('100%').backgroundColor('#F1F3F5')
  }
}