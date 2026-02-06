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
import image from "@ohos.multimedia.image"
import { waitForExist } from '../../test/WaitTest.test';

@Entry
@Component
struct OnWindowNew {
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  @State str: string = "emitBlockNetWorkTrue";
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
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 130590,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack);
  }

  onPageHide() {
    events_emitter.off(130590)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("OnWindowNew page valueChangeCallBack");
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
        Button("web click").key('onWindowNew').onClick(async () => {
          console.info('key==>' + this.str)
          await waitForExist(()=>this.isPageEnd, 'isPageEnd ' + this.str, 0);
          await waitForExist(()=>this.isReceive, 'isReceive ' + this.str, 0);
          this.isReceive = -1;
          switch (this.str) {
            case "emitBlockNetWorkTrue": {
              try {
                this.block = true;
                this.isPageEnd = -1;
                this.controller.refresh();
                await waitForExist(()=>this.isPageEnd, 'refresh isPageEnd ' + this.str, 0);
                this.controller.loadUrl('www.example.com');
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitBlockNetWorkFalse": {
              try {
                this.block = false;
                this.isPageEnd = -1;
                this.controller.refresh();
                await waitForExist(()=>this.isPageEnd, 'refresh isPageEnd ' + this.str, 0);
                this.isPageEnd = -1;
                this.controller.loadUrl('www.example.com');
                await waitForExist(()=>this.isPageEnd, 'loadUrl isPageEnd ' + this.str, 0);
                let testTitle = this.controller.getTitle();
                console.log(`testTitle is: ${testTitle}`);
                Utils.emitEvent(testTitle, 130610)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

          }
        })
      }

      Web({ src: $rawfile("onWindowNew.html"), controller: this.controller })
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
            Utils.emitEvent(Url, 130600);
          }
        })
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
        .userAgent(this.userAgent)
        .onPageEnd((event) => {
          console.log('web pageEnd==>' + event.url);
          this.isPageEnd = 0;
          console.log('this.isPageEnd==>' + this.isPageEnd);
        })
    }
  }
}