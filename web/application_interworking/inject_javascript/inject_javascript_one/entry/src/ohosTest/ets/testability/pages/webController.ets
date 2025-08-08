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

@Entry
@Component
struct webController {
  controller: WebController = new WebController()
  @State str: string = "emitUserAgent"
  @State console: string = ""
  @State javaScriptAccess: boolean = true

  @State registerJavaScriptProxyFlag: boolean = false


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
  private jsObj: JsProxyObject = {
    test: (res: object) => {
      console.info("ets toString:" + String(res));
    },
    toString: (str: string) => {
      console.info("ets toString:" + String(str));
    },
    register: (res: object) => {
      if (this.registerJavaScriptProxyFlag == true) {
        Utils.emitEvent(String(res), 31008);
      }
      return "web222"
    }
  }

  build() {
    Column() {
      Row() {
        Button("WebController click").key('WebControllerButton').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "testRegisterJavaScriptProxy001": {
              try {
                this.controller.loadUrl({ url: $rawfile('webPart1index.html') })
                await Utils.sleep(2000);
                this.registerJavaScriptProxyFlag = true
                this.controller.registerJavaScriptProxy({
                  object: this.jsObj,
                  name: "objName",
                  methodList: ["test", "toString", "register"]
                })
                this.controller.refresh()
                await Utils.sleep(2000);
                this.controller.runJavaScript({ script: "proxy()" })
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 31008)
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
                  Utils.emitEvent(deleteEntireCookieCalled, 31009)
                  return
                }
                Utils.emitEvent(false, 31009)
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 31009)
              }
              break;
            }
          }
        })
      }

      Web({ src: $rawfile('webPart1index.html'), controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
    }
  }
}
