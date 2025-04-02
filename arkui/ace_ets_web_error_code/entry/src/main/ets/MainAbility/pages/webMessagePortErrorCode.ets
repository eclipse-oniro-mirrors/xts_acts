/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import { JsProxyObject } from '../../test/Interfaces';
import business_error from '@ohos.base';

@Entry
@Component
struct Index {
  controller: webView.WebviewController = new webView.WebviewController();
  controllerNull: webView.WebviewController = new webView.WebviewController();
  nativePort: webView.WebMessagePort | null = null;
  responseWeb: WebResourceResponse = new WebResourceResponse()
  @State str: string = ""
  @State javaScriptAccess: boolean = true;
  @State ports: webView.WebMessagePort[] = [];
  @State webResult: string = ' ';
  no_error: string = "no error happened"

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
      Utils.emitEvent(String(res), 102);
    },
    toString: (str: string) => {
      console.info("ets toString:" + String(str));
    },
    register: (res: object) => {
      Utils.emitEvent(String(res), 86);
      return "web222"
    }
  }

  build() {
    Column() {
      Row() {
        Button("WebMessagePortErrorCode click").key('WebMessagePortErrorCodeButton').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {

            case "testCloseError001": {
              try {
                this.ports = this.controller.createWebMessagePorts(true);
                this.controller.postMessage('__init_port__', [this.ports[0]], '*');
                this.ports[1].close();
                this.ports[1].postMessageEvent("post message from ets to html5");
                Utils.emitEvent(this.no_error, 20360)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 20360)
              }
              break;
            }

            case "testOnMessageEventExtError001": {
              try {
                this.ports = this.controller.createWebMessagePorts(true);
                this.controller.postMessage("init_web_messageport", [this.ports[1]], "*");
                this.nativePort = this.ports[0];
                this.nativePort.close()
                this.nativePort.onMessageEventExt((result) => {
                  try {
                    console.info(`The onMessageEventExt return value is: ${result}`)
                    Utils.emitEvent(this.no_error, 20361)
                  } catch (resError) {
                    console.log(`log error code: ${resError.code}, Message: ${resError.message}`);
                    Utils.emitEvent(String(resError.code), 20361)
                  }
                });
              } catch (error) {
                Utils.emitEvent(String(error.code), 20361)
              }
              break;
            }

            case "testPostMessageEventExtError001": {
              try {
                this.ports = this.controller.createWebMessagePorts();
                this.controller.postMessage('__init_port__', [this.ports[0]], '*');
                this.ports[1].close()
                this.ports[1].postMessageEvent("post message from ets to html5");
                Utils.emitEvent(this.no_error, 20362)
              } catch (resError) {
                console.log(`log error code: ${resError.code}, Message: ${resError.message}`);
                Utils.emitEvent(String(resError.code), 20362)
              }
              break;
            }

            case "testOnMessageEventError001": {
              try {
                this.ports = this.controller.createWebMessagePorts(true);
                this.controller.postMessage("init_web_messageport", [this.ports[1]], "*");
                this.nativePort = this.ports[0];
                this.nativePort.close()
                this.nativePort.onMessageEvent((result) => {
                  try {
                    console.info(`The onMessageEvent return value is: ${result}`)
                    Utils.emitEvent(this.no_error, 20363)
                  } catch (resError) {
                    console.log(`log error code: ${resError.code}, Message: ${resError.message}`);
                    Utils.emitEvent(String(resError.code), 20363)
                  }
                });
              } catch (error) {
                Utils.emitEvent(String(error.code), 20363)
              }
              break;
            }

          }
        })
      }

      Web({ src: $rawfile('onMessageEventExt.html'), controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .javaScriptProxy({
          object: this.jsObj,
          name: "backToEts",
          methodList: ["test", "toString"],
          controller: this.controller
        })

    }
  }
}
