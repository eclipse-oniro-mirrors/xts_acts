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

const EVENT_ID_SET_EMIT_KEY = 114630;

async function sendMessageToApp(controller: webView.WebviewController, functionName: string, callBackCode: number) {
  try {
    controller.runJavaScript(
      functionName,
      (error, result) => {
        if (error) {
          console.error(`run JavaScript error: ` + JSON.stringify(error))
          return;
        }
        if (result) {
          console.info(`The ${functionName} return value is: ${result}`)
        }
      });
  } catch (resError) {
    console.error(`sendMessageToApp error code: ${resError.code}, Message: ${resError.message}`);
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
  @State imageAccess: boolean = true;
  @State domStorageAccess: boolean = false;
  @State databaseAccess: boolean = true;
  @State callBackCode: number = -1;
  @State isPageEnd: number = -1;
  @State isReceive: number = -1;
  no_error: string = "no error happened"

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: EVENT_ID_SET_EMIT_KEY,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(EVENT_ID_SET_EMIT_KEY)
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
        Button("webMessageExtErrorCode click").key('webMessageExtErrorCodeButton').onClick(async () => {
          await Utils.waitForExist(()=>this.isPageEnd, 'webMessageExtErrorCodeButtonIsPageEnd', 1, 1000);
          await Utils.waitForExist(()=>this.isReceive, 'webMessageExtErrorCodeButtonIsReceive', 1, 1000);
          console.info("key==>" + this.str);
          this.isReceive = -1;
          switch (this.str) {
            case "testWebMessageExtGetStringError001": {
              this.callBackCode = 114640;
              await sendMessageToApp(this.controller, 'postNumberToApp()', this.callBackCode)
              break;
            }

            case "testWebMessageExtGetStringError002": {
              this.callBackCode = 114650;
              await sendMessageToApp(this.controller, 'postBooleanToApp()', this.callBackCode)
              break;
            }

            case "testWebMessageExtGetStringError003": {
              this.callBackCode = 114660;
              await sendMessageToApp(this.controller, 'postArrayBufferToApp()', this.callBackCode)
              break;
            }

            case "testWebMessageExtGetStringError004": {
              this.callBackCode = 114670;
              await sendMessageToApp(this.controller, 'postArrayToApp()', this.callBackCode)
              break;
            }

            case "testWebMessageExtGetStringError005": {
              this.callBackCode = 114680;
              await sendMessageToApp(this.controller, 'postErrorToApp()', this.callBackCode)
              break;
            }

            case "testWebMessageExtGetNumberError001": {
              this.callBackCode = 114690;
              await sendMessageToApp(this.controller, 'postStringToApp()', this.callBackCode)
              break;
            }

            case "testWebMessageExtGetNumberError002": {
              this.callBackCode = 114700;
              await sendMessageToApp(this.controller, 'postBooleanToApp()', this.callBackCode)
              break;
            }

            case "testWebMessageExtGetNumberError003": {
              this.callBackCode = 114710;
              await sendMessageToApp(this.controller, 'postArrayToApp()', this.callBackCode)
              break;
            }
            case "testWebMessageExtGetNumberError004": {
              this.callBackCode = 114720;
              await sendMessageToApp(this.controller, 'postArrayBufferToApp()', this.callBackCode)
              break;
            }

            case "testWebMessageExtGetNumberError005": {
              this.callBackCode = 114730;
              await sendMessageToApp(this.controller, 'postErrorToApp()', this.callBackCode)
              break;
            }

            case "testWebMessageExtGetBooleanError001": {
              this.callBackCode = 114740;
              await sendMessageToApp(this.controller, 'postStringToApp()', this.callBackCode)
              break;
            }

            case "testWebMessageExtGetBooleanError002": {
              this.callBackCode = 114750;
              await sendMessageToApp(this.controller, 'postNumberToApp()', this.callBackCode)
              break;
            }

            case "testWebMessageExtGetBooleanError003": {
              this.callBackCode = 114760;
              await sendMessageToApp(this.controller, 'postArrayBufferToApp()', this.callBackCode)
              break;
            }

            case "testWebMessageExtGetBooleanError004": {
              this.callBackCode = 114770;
              await sendMessageToApp(this.controller, 'postArrayToApp()', this.callBackCode)
              break;
            }

            case "testWebMessageExtGetBooleanError005": {
              this.callBackCode = 114780;
              await sendMessageToApp(this.controller, 'postErrorToApp()', this.callBackCode)
              break;
            }

            case "testWebMessageExGetArrayBufferError001": {
              this.callBackCode = 114790;
              await sendMessageToApp(this.controller, 'postStringToApp()', this.callBackCode)
              break;
            }

            case "testWebMessageExGetArrayBufferError002": {
              this.callBackCode = 114800;
              await sendMessageToApp(this.controller, 'postNumberToApp()', this.callBackCode)
              break;
            }

            case "testWebMessageExGetArrayBufferError003": {
              this.callBackCode = 114810;
              await sendMessageToApp(this.controller, 'postBooleanToApp()', this.callBackCode)
              break;
            }

            case "testWebMessageExGetArrayBufferError004": {
              this.callBackCode = 114820;
              await sendMessageToApp(this.controller, 'postArrayToApp()', this.callBackCode)
              break;
            }

            case "testWebMessageExGetArrayBufferError005": {
              this.callBackCode = 114830;
              await sendMessageToApp(this.controller, 'postErrorToApp()', this.callBackCode)
              break;
            }

            case "testWebMessageExGetArrayError001": {
              this.callBackCode = 114840;
              await sendMessageToApp(this.controller, 'postStringToApp()', this.callBackCode)
              break;
            }

            case "testWebMessageExGetArrayError002": {
              this.callBackCode = 114850;
              await sendMessageToApp(this.controller, 'postNumberToApp()', this.callBackCode)
              break;
            }

            case "testWebMessageExGetArrayError003": {
              this.callBackCode = 114860;
              await sendMessageToApp(this.controller, 'postBooleanToApp()', this.callBackCode)
              break;
            }

            case "testWebMessageExGetArrayError004": {
              this.callBackCode = 114870;
              await sendMessageToApp(this.controller, 'postArrayBufferToApp()', this.callBackCode)
              break;
            }

            case "testWebMessageExGetArrayError005": {
              this.callBackCode = 114880;
              await sendMessageToApp(this.controller, 'postErrorToApp()', this.callBackCode)
              break;
            }

            case "testWebMessageExGetErrorError001": {
              this.callBackCode = 114890;
              await sendMessageToApp(this.controller, 'postStringToApp()', this.callBackCode)
              break;
            }

            case "testWebMessageExGetErrorError002": {
              this.callBackCode = 114900;
              await sendMessageToApp(this.controller, 'postNumberToApp()', this.callBackCode)
              break;
            }

            case "testWebMessageExGetErrorError003": {
              this.callBackCode = 114910;
              await sendMessageToApp(this.controller, 'postBooleanToApp()', this.callBackCode)
              break;
            }

            case "testWebMessageExGetErrorError004": {
              this.callBackCode = 114920;
              await sendMessageToApp(this.controller, 'postArrayBufferToApp()', this.callBackCode)
              break;
            }

            case "testWebMessageExGetErrorError005": {
              this.callBackCode = 114930;
              await sendMessageToApp(this.controller, 'postArrayToApp()', this.callBackCode)
              break;
            }
          }
        })
      }

      Web({ src: $rawfile('onMessageEventExt.html'), controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
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
              console.log(`onMessageEventExt error code: ${resError.code}, Message: ${resError.message}`);
              Utils.emitEvent(String(resError.code), this.callBackCode)
            }
          });
          this.isPageEnd = 1;
        })
        .imageAccess(this.imageAccess)
        .databaseAccess(this.databaseAccess)
        .domStorageAccess(this.domStorageAccess)
    }
  }
}