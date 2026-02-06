/*
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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
import { waitForExist } from '../../test/WaitTest.test';
import Utils from '../../test/Utils';
import web_webview from '@ohos.web.webview';
import image from "@ohos.multimedia.image"

@Entry
@Component
struct OnWindowNew {
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  @State str: string = 'emitOnWindowNew01';
  @State testMultiWindowAccess: boolean = true;
  @State testAllowWindowOpenMethod: boolean = true;
  @State block: boolean = false;
  @State ref: number = 0;
  @State eventId: number = 0;
  @State userAgent: string = 'Mozilla/5.0 (Window NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) CHrome/105.0.0.0 Safari/537.36 Edg/105.0.1343.27';
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = true;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State arr: boolean = true;
  @State isComplete: number = -1;
  @State isReceive: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 134050,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack);
  }

  onPageHide() {
    events_emitter.off(134050)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info('OnWindowNew page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data?.ACTION != null) {
        this.str = eventData.data?.ACTION;
        this.isReceive = 0;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button('web click').key('onWindowNew').onClick(async () => {
          await waitForExist(() => this.isComplete, this.str, 0);
          await waitForExist(() => this.isReceive, this.str, 0);
          this.isReceive = -1;
          console.info('key==>' + this.str)
          switch (this.str) {
            case 'emitOnWindowNew01': {
              try {
                this.ref = 0;
                this.javaScriptAccess = true;
                this.testAllowWindowOpenMethod = true;
                this.testMultiWindowAccess = true;

                this.isComplete = -1;
                this.controller.refresh();
                await waitForExist(() => this.isComplete, this.str, 0);

                this.controller.runJavaScript('OpenNewWindow()');
                await waitForExist(() => this.ref, this.str, 1);
                Utils.emitEvent(this.ref, 134060);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'emitOnWindowNew02': {
              try {
                this.ref = 0;
                this.javaScriptAccess = true;
                this.testAllowWindowOpenMethod = false;
                this.testMultiWindowAccess = true;

                this.isComplete = -1;
                this.controller.refresh();
                await waitForExist(() => this.isComplete, this.str, 0);

                this.controller.runJavaScript('OpenNewWindow()');
                await waitForExist(() => this.ref, this.str, 1, 100);
                Utils.emitEvent(this.ref, 134070)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'emitOnWindowNew03': {
              try {
                this.ref = 0;
                this.javaScriptAccess = false;
                this.testAllowWindowOpenMethod = false;
                this.testMultiWindowAccess = true;

                this.isComplete = -1;
                this.controller.refresh();
                await waitForExist(() => this.isComplete, this.str, 0);

                this.controller.runJavaScript('OpenNewWindow()');
                await waitForExist(() => this.ref, this.str, 1, 100);
                Utils.emitEvent(this.ref, 134080)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'emitOnWindowNew04': {
              try {
                this.ref = 0;
                this.javaScriptAccess = true;
                this.testAllowWindowOpenMethod = false;
                this.testMultiWindowAccess = false;

                this.isComplete = -1;
                this.controller.refresh();
                await waitForExist(() => this.isComplete, this.str, 0);

                this.controller.runJavaScript('OpenNewWindow()');
                await waitForExist(() => this.ref, this.str, 1, 100);
                Utils.emitEvent(this.ref, 134090)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
          }
        })
      }

      Web({ src: $rawfile('onWindowNew.html'), controller: this.controller })
        .multiWindowAccess(this.testMultiWindowAccess)
        .javaScriptAccess(this.javaScriptAccess)
        .allowWindowOpenMethod(this.testAllowWindowOpenMethod)
        .onWindowNew((event) => {
          console.log('onWindowNew start');
          if (event) {
            console.log('this.ref ===:' + this.ref);
            this.ref += 1;
            event.handler.setWebController(null);
          }
        })
        .onPageVisible((event) => {
          if (this.arr) {
            if (event) {
              console.log('onWindowNew onPageVisible url:' + event.url);
              Utils.emitEvent(event.url, this.eventId);
            }
          }
        })
        .blockNetwork(this.block)
        .onErrorReceive((event) => {
          console.log(`onWindowNew onErrorReceive start`);
          if (event) {
            let Url = event.request.getRequestUrl()
            console.log(`onWindowNew onErrorReceive Url is: ${Url}`);
          }
        })
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
        .userAgent(this.userAgent)
        .onPageBegin((event) => {
          console.log('onPageBegin ==>' + event.url);
        })
        .onPageEnd((event) => {
          console.log('onPageEnd ==>' + event.url);
          this.isComplete = 0
        })
    }
  }
}
