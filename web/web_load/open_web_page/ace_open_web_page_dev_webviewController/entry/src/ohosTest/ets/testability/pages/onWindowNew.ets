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
import web_webview from '@ohos.web.webview';

const EVENT_ID_SET_EMIT_KEY = 200520;

@Entry
@Component
struct OnWindowNew {
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  @State str: string = "emitOnPageVisibleLoadUrl";
  @State testMultiWindowAccess: boolean = true;
  @State testAllowWindowOpenMethod: boolean = true;
  @State block: boolean = false;
  @State ref: number = 0;
  @State eventId: number = 0;
  @State userAgent: string = "Mozilla/5.0 (Window NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) CHrome/105.0.0.0 Safari/537.36 Edg/105.0.1343.27";
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = true;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State arr: boolean = true;
  @State isPageEnd: number = -1;
  @State isReceive: number = -1;
  sendEventId: number = 0;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: EVENT_ID_SET_EMIT_KEY,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack);
  }

  onPageHide() {
    events_emitter.off(EVENT_ID_SET_EMIT_KEY)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("OnWindowNew page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data?.ACTION != null) {
        this.str = eventData.data?.ACTION;
        this.isReceive = 1;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("web click").key('onWindowNew').onClick(async () => {
          await Utils.waitForExist(()=>this.isPageEnd, 'onWindowNewIsPageEnd', 1, 1000);
          await Utils.waitForExist(()=>this.isReceive, 'onWindowNewIsReceive', 1, 1000);
          console.info("key==>" + this.str);
          this.isReceive = -1;
          switch (this.str) {
            case "emitOnPageVisibleLoadUrl": {
              try {
                this.sendEventId = 200530;
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile('index.html'));
                await Utils.waitForExist(()=>this.isPageEnd, 'loadUrlIsPageEnd', 1, 1000);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitOnPageVisibleRefresh": {
              try {
                this.sendEventId = 200540;
                this.isPageEnd = -1;
                this.controller.refresh();
                await Utils.waitForExist(()=>this.isPageEnd, 'refreshIsPageEnd', 1, 1000);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
          }
        })
      }

      Web({ src: $rawfile("index.html"), controller: this.controller })
        .multiWindowAccess(this.testMultiWindowAccess)
        .javaScriptAccess(this.javaScriptAccess)
        .allowWindowOpenMethod(this.testAllowWindowOpenMethod)
        .onWindowNew((event) => {
          console.log("onWindowNew start");
          if (event) {
            console.log('this.ref ===:' + this.ref);
            this.ref += 1;
            event.handler.setWebController(null);
          }
        })
        .onPageVisible((event) => {
          if (event) {
            console.log('onWindowNew onPageVisible url:' + event.url);
            if (event.url.includes('index.html')) {
              Utils.emitEvent('success', this.sendEventId);
            } else {
              Utils.emitEvent('fail', this.sendEventId);
            }
          }
        })
        .blockNetwork(this.block)
        .onErrorReceive((event) => {
          console.log(`onWindowNew onErrorReceive start`);
          if (event) {
            const url = event.request.getRequestUrl()
            console.log(`onWindowNew onErrorReceive Url is: ${url}`);
          }
        })
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
        .userAgent(this.userAgent)
        .onPageEnd((event) => {
          console.log('onPageEnd url:' + event.url);
          this.isPageEnd = 1;
        })
    }
  }
}