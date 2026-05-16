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
import { JsProxyObject } from '../../test/Interfaces';
import business_error, { BusinessError } from '@ohos.base';
import {waitForAssert, waitForExist} from '../../test/WaitTest.test';

@Entry
@Component
struct webController {
  controller: WebController = new WebController()
  @State str: string = "emitUserAgent"
  @State console: string = ""
  @State javaScriptAccess: boolean = true
  @State registerJavaScriptProxyFlag: boolean = false
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;


  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 172180,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(172180)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 0;
      }
    }
  }
  private jsObj: JsProxyObject = {
    test: (res: object) => {
      console.info("ets toString:" + String(res));
    },
    toString: (str: string) => {
      console.info("ets toString:" + String(str));
    },
    register: (res: object) => {
      if (this.registerJavaScriptProxyFlag == true) {
        Utils.emitEvent(String(res), 172190);
      }
      return "web222"
    }
  }

  build() {
    Column() {
      Row() {
        Button("WebController click").key('WebControllerButton').onClick(async () => {
          await waitForExist(() => this.isPageEnd, this.str, 0);
          await waitForExist(() => this.isReceive, this.str, 0);
          this.isReceive = -1;
          console.info('key==>' + this.str)
          switch (this.str) {
            case "testRegisterJavaScriptProxy001": {
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl({ url: $rawfile('webPart1index.html') })
                await waitForExist(() => this.isPageEnd, this.str, 0);
                this.registerJavaScriptProxyFlag = true
                this.controller.registerJavaScriptProxy({
                  object: this.jsObj,
                  name: "objName",
                  methodList: ["test", "toString", "register"]
                })
                this.isPageEnd = -1;
                this.controller.refresh()
                await waitForExist(() => this.isPageEnd, this.str, 0);
                this.controller.runJavaScript({ script: "proxy()" })
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 172190)
              }
              break;
            }
            case "testDeleteJavaScriptRegister001": {
              try {
                this.controller.registerJavaScriptProxy({
                  object: this.jsObj,
                  name: "objName",
                  methodList: ["test", "toString", "register"]
                })
                this.controller.refresh()
                this.controller.deleteJavaScriptRegister("objName")
                this.controller.runJavaScript({ script: "registerTest()" })
                if (this.console !== "web222") {
                  let deleteEntireCookieCalled = true
                  Utils.emitEvent(deleteEntireCookieCalled, 172200)
                  return
                }
                Utils.emitEvent(false, 172200)
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 172200)
              }
              break;
            }
          }
        })
      }

      Web({ src: $rawfile('webPart1index.html'), controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .onPageEnd((event) => {
          if (event) {
            this.isPageEnd = 0;
            console.log('WebController onPageEnd url:' + event.url);
          }
        })
    }
  }
}
