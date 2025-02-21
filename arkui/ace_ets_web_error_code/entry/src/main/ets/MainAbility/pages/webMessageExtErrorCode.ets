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

class testObj {
  constructor() {
  }

  test(): string {
    return "ArkUI Web Component";
  }

  toString(): void {
    console.log('Web Component toString');
  }
}

async function sendMessageToApp(controller: webView.WebviewController, functionName: string, callBackCode: number) {
  try {
    controller.runJavaScript(
      functionName,
      (error, result) => {
        if (error) {
          console.info(`run JavaScript error: ` + JSON.stringify(error))
          Utils.emitEvent(String(error.code), callBackCode)
          return;
        }
        if (result) {
          console.info(`The ${functionName} return value is: ${result}`)
        }
      });
    await Utils.sleep(2000);
  } catch (resError) {
    console.log(`log error code: ${resError.code}, Message: ${resError.message}`);
    Utils.emitEvent(String(resError.code), callBackCode)
  }
}

@Entry
@Component
struct Index {
  controller: webView.WebviewController = new webView.WebviewController();
  controllerNull: webView.WebviewController = new webView.WebviewController();
  nativePort: webView.WebMessagePort | null = null;
  responseWeb: WebResourceResponse = new WebResourceResponse()
  message: webView.WebMessageExt = new webView.WebMessageExt();
  @State str: string = ""
  @State webResult: string = ' ';
  @State javaScriptAccess: boolean = true;
  @State ports: webView.WebMessagePort[] = [];
  @State testObj: testObj = new testObj();
  @State imageAccess: boolean = true;
  @State domStorageAccess: boolean = false;
  @State databaseAccess: boolean = true;
  @State callBackCode: number = -1;
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
        Button("webMessageExtErrorCode click").key('webMessageExtErrorCodeButton').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "testWebMessageExtGetStringError001": {
              this.callBackCode = 20200;
              await sendMessageToApp(this.controller, 'postNumberToApp()', this.callBackCode)
              break;
            }

            case "testWebMessageExtGetStringError002": {
              this.callBackCode = 20201;
              await sendMessageToApp(this.controller, 'postBooleanToApp()', this.callBackCode)
              break;
            }

            case "testWebMessageExtGetStringError003": {
              this.callBackCode = 20202;
              await sendMessageToApp(this.controller, 'postArrayBufferToApp()', this.callBackCode)
              break;
            }

            case "testWebMessageExtGetStringError004": {
              this.callBackCode = 20203;
              await sendMessageToApp(this.controller, 'postArrayToApp()', this.callBackCode)
              break;
            }

            case "testWebMessageExtGetStringError005": {
              this.callBackCode = 20204;
              await sendMessageToApp(this.controller, 'postErrorToApp()', this.callBackCode)
              break;
            }

            case "testWebMessageExtGetNumberError001": {
              this.callBackCode = 20210;
              await sendMessageToApp(this.controller, 'postStringToApp()', this.callBackCode)
              break;
            }

            case "testWebMessageExtGetNumberError002": {
              this.callBackCode = 20211;
              await sendMessageToApp(this.controller, 'postBooleanToApp()', this.callBackCode)
              break;
            }

            case "testWebMessageExtGetNumberError003": {
              this.callBackCode = 20212;
              await sendMessageToApp(this.controller, 'postArrayToApp()', this.callBackCode)
              break;
            }
            case "testWebMessageExtGetNumberError004": {
              this.callBackCode = 20213;
              await sendMessageToApp(this.controller, 'postArrayBufferToApp()', this.callBackCode)
              break;
            }

            case "testWebMessageExtGetNumberError005": {
              this.callBackCode = 20214;
              await sendMessageToApp(this.controller, 'postErrorToApp()', this.callBackCode)
              break;
            }

            case "testWebMessageExtGetBooleanError001": {
              this.callBackCode = 20220;
              await sendMessageToApp(this.controller, 'postStringToApp()', this.callBackCode)
              break;
            }

            case "testWebMessageExtGetBooleanError002": {
              this.callBackCode = 20221;
              await sendMessageToApp(this.controller, 'postNumberToApp()', this.callBackCode)
              break;
            }

            case "testWebMessageExtGetBooleanError003": {
              this.callBackCode = 20222;
              await sendMessageToApp(this.controller, 'postArrayBufferToApp()', this.callBackCode)
              break;
            }

            case "testWebMessageExtGetBooleanError004": {
              this.callBackCode = 20223;
              await sendMessageToApp(this.controller, 'postArrayToApp()', this.callBackCode)
              break;
            }

            case "testWebMessageExtGetBooleanError005": {
              this.callBackCode = 20224;
              await sendMessageToApp(this.controller, 'postErrorToApp()', this.callBackCode)
              break;
            }

            case "testWebMessageExGetArrayBufferError001": {
              this.callBackCode = 20230;
              await sendMessageToApp(this.controller, 'postStringToApp()', this.callBackCode)
              break;
            }

            case "testWebMessageExGetArrayBufferError002": {
              this.callBackCode = 20231;
              await sendMessageToApp(this.controller, 'postNumberToApp()', this.callBackCode)
              break;
            }

            case "testWebMessageExGetArrayBufferError003": {
              this.callBackCode = 20232;
              await sendMessageToApp(this.controller, 'postBooleanToApp()', this.callBackCode)
              break;
            }

            case "testWebMessageExGetArrayBufferError004": {
              this.callBackCode = 20233;
              await sendMessageToApp(this.controller, 'postArrayToApp()', this.callBackCode)
              break;
            }

            case "testWebMessageExGetArrayBufferError005": {
              this.callBackCode = 20234;
              await sendMessageToApp(this.controller, 'postErrorToApp()', this.callBackCode)
              break;
            }

            case "testWebMessageExGetArrayError001": {
              this.callBackCode = 20240;
              await sendMessageToApp(this.controller, 'postStringToApp()', this.callBackCode)
              break;
            }

            case "testWebMessageExGetArrayError002": {
              this.callBackCode = 20241;
              await sendMessageToApp(this.controller, 'postNumberToApp()', this.callBackCode)
              break;
            }

            case "testWebMessageExGetArrayError003": {
              this.callBackCode = 20242;
              await sendMessageToApp(this.controller, 'postBooleanToApp()', this.callBackCode)
              break;
            }

            case "testWebMessageExGetArrayError004": {
              this.callBackCode = 20243;
              await sendMessageToApp(this.controller, 'postArrayBufferToApp()', this.callBackCode)
              break;
            }

            case "testWebMessageExGetArrayError005": {
              this.callBackCode = 20244;
              await sendMessageToApp(this.controller, 'postErrorToApp()', this.callBackCode)
              break;
            }

            case "testWebMessageExGetErrorError001": {
              this.callBackCode = 20250;
              await sendMessageToApp(this.controller, 'postStringToApp()', this.callBackCode)
              break;
            }

            case "testWebMessageExGetErrorError002": {
              this.callBackCode = 20251;
              await sendMessageToApp(this.controller, 'postNumberToApp()', this.callBackCode)
              break;
            }

            case "testWebMessageExGetErrorError003": {
              this.callBackCode = 20252;
              await sendMessageToApp(this.controller, 'postBooleanToApp()', this.callBackCode)
              break;
            }

            case "testWebMessageExGetErrorError004": {
              this.callBackCode = 20253;
              await sendMessageToApp(this.controller, 'postArrayBufferToApp()', this.callBackCode)
              break;
            }

            case "testWebMessageExGetErrorError005": {
              this.callBackCode = 20254;
              await sendMessageToApp(this.controller, 'postArrayToApp()', this.callBackCode)
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
        .onPageEnd(() => {
          console.log("onPageEnd==>")
          this.ports = this.controller.createWebMessagePorts(true);
          this.controller.postMessage("init_web_messageport", [this.ports[1]], "*");
          this.nativePort = this.ports[0];
          this.nativePort.onMessageEventExt((result) => {
            try {
              switch (this.str) {
                case "testWebMessageExtGetStringError001":
                case "testWebMessageExtGetStringError002":
                case "testWebMessageExtGetStringError003":
                case "testWebMessageExtGetStringError004":
                case "testWebMessageExtGetStringError005": {
                  result.getString()
                  break;
                }
                case "testWebMessageExtGetNumberError001":
                case "testWebMessageExtGetNumberError002":
                case "testWebMessageExtGetNumberError003":
                case "testWebMessageExtGetNumberError004":
                case "testWebMessageExtGetNumberError005": {
                  result.getNumber()
                  break;
                }
                case "testWebMessageExtGetBooleanError001":
                case "testWebMessageExtGetBooleanError002":
                case "testWebMessageExtGetBooleanError003":
                case "testWebMessageExtGetBooleanError004":
                case "testWebMessageExtGetBooleanError005": {
                  result.getBoolean()
                  break;
                }
                case "testWebMessageExGetArrayBufferError001":
                case "testWebMessageExGetArrayBufferError002":
                case "testWebMessageExGetArrayBufferError003":
                case "testWebMessageExGetArrayBufferError004":
                case "testWebMessageExGetArrayBufferError005": {
                  result.getArrayBuffer()
                  break;
                }
                case "testWebMessageExGetArrayError001":
                case "testWebMessageExGetArrayError002":
                case "testWebMessageExGetArrayError003":
                case "testWebMessageExGetArrayError004":
                case "testWebMessageExGetArrayError005": {
                  result.getArray()
                  break;
                }
                case "testWebMessageExGetErrorError001":
                case "testWebMessageExGetErrorError002":
                case "testWebMessageExGetErrorError003":
                case "testWebMessageExGetErrorError004":
                case "testWebMessageExGetErrorError005": {
                  result.getError()
                  break;
                }
              }
              Utils.emitEvent(this.no_error, this.callBackCode)
            } catch (resError) {
              console.log(`log error code: ${resError.code}, Message: ${resError.message}`);
              Utils.emitEvent(String(resError.code), this.callBackCode)
            }
          });
        })
        .imageAccess(this.imageAccess)
        .databaseAccess(this.databaseAccess)
        .domStorageAccess(this.domStorageAccess)
    }
  }
}
