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
import web_webview from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';
import { Driver } from '@kit.TestKit';

const EVENT_ID_SET_SUITE_KEY = 181101;
const driver = Driver.create();

@Entry
@Component
struct DNSHostIP {
  @State userAgentPC:string = "";
  @State hostName: string | null | undefined= 'www.baidu.com';
  @State str: string = "";
  @State zoomAccessValue: boolean = true;
  @State value: boolean = false;
  @State isMetaViewport: boolean | null | undefined = false;
  @State textRatio: number = 100;
  controller: WebController = new WebController()
  controllerone: web_webview.WebviewController = new web_webview.WebviewController();
  @State isPageEnd: number = -1;
  @State isReceive: number = -1;
  @State isPageOneEnd: number = -1;

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
        this.isReceive = 1;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("DNSHostIP").id('DNSHostIP').onClick(async () => {
          console.info("key==>" + this.str)
          await Utils.waitForExist(()=>this.isReceive, this.str+' isReceive', 1, 1000);
          switch (this.str) {
            case "emitZoomAccess": {
                await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                this.zoomAccessValue = false;
                this.isPageEnd = -1
                this.controller.refresh();
                await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                this.controller.runJavaScript({
                  script: "getPageHeight()", callback: (res1) => {
                    let zoomInCalled = false;
                    this.controller.runJavaScript({
                      script: "getPageHeight()", callback: (res) => {
                        console.info("getPageHeight==>" + res);
                        if (Number(res) > Number(res1)) {
                          zoomInCalled = true;
                        }
                        Utils.emitEvent(zoomInCalled, 181110);
                      }
                    })
                  }
                })
                break;
            }
            case "emitGetHitTestValue": {
                await Utils.waitForExist(()=>this.isPageOneEnd, this.str+' isPageOneEnd', 1, 1000);
                try {
                  let hitValue = this.controllerone.getHitTestValue();
                  console.log("hitType: " + hitValue.type);
                  console.log("extra: " + hitValue.extra);
                  Utils.emitEvent("hitValue", 181120);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
            }


          }
        })

      }
      
      Web({ src: $rawfile('ZoomAccess.html'), controller: this.controller })
        .databaseAccess(true)
        .zoomAccess(this.zoomAccessValue)
        .textZoomRatio(this.textRatio)
        .onPageEnd((event) => {
          console.log('onPageEnd url:' + event.url);
          this.isPageEnd = 1;
        })
      Web({ src: $rawfile('ZoomAccess.html'), controller: this.controllerone })
        .databaseAccess(true)
        .zoomAccess(this.zoomAccessValue)
        .textZoomRatio(this.textRatio)
        .onPageEnd((event) => {
          console.log('onPageOneEnd url:' + event.url);
          this.isPageOneEnd = 1;
        })
    }
  }
}
