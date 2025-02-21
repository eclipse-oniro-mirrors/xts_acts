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

@Entry
@Component
struct webViewContWebMessageExtReturnError {
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  ports: web_webview.WebMessagePort[] = null;
  nativePort: web_webview.WebMessagePort = null;
  @State str: string = "emitWebMessageExtGetStringError";
  @State userAgent: string = "Mozilla/5.0 (Window NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko)" +
    " CHrome/105.0.0.0 Safari/537.36 Edg/105.0.1343.27";
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = false;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State zoomAccess: boolean = false;
  @State errorCode: string = '0';
  @State errorTestCode: number = 0;
  @State errorMsg: string = 'failed';
  @State webResult: string = ''
  message: web_webview.WebMessageExt = new web_webview.WebMessageExt();

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("webViewContWebMessageExtReturnError page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("WebMessageExtErrorTest").key('webViewContWebMessageExtReturnError').onClick(() => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "emitWebMessageExtGetStringError": {
              this.ports = this.controller.createWebMessagePorts(true);
              this.controller.postMessage("init_web_messageport", [this.ports[1]], "*");
              this.nativePort = this.ports[0];
              this.controller.runJavaScript(
                'postErrorToApp()',
                (error, result) => {
                  if (error) {
                    console.info(`run JavaScript error: ` + JSON.stringify(error))
                    return;
                  }
                  if (result) {
                    this.webResult = result
                    console.info(`The postErrorToApp() return value is: ${result}`)
                  }
                });
              this.nativePort.onMessageEventExt((result) => {
                console.log("In eTS side got message");
                try {
                  let type = result.getType();
                  console.log("In eTS side getType:" + type);
                  result.getString()
                } catch (resError) {
                  console.log(`log error code: ${resError.code}, Message: ${resError.message}`);
                  this.errorTestCode = resError.code;
                  this.errorMsg = resError.message;
                  console.error("emitWebMessageExtGetStringError onMessageEventExt getString result is :" + this.errorTestCode + this.errorMsg);
                  Utils.emitEvent(this.errorTestCode, 826)
                  Utils.emitEvent(this.errorMsg, 827)
                }
              });
              break;
            }
            case "emitWebMessageExtGetNumberError": {
              this.errorTestCode = 0;
              this.errorMsg = 'failed';
              this.ports = this.controller.createWebMessagePorts(true);
              this.controller.postMessage("init_web_messageport", [this.ports[1]], "*");
              this.nativePort = this.ports[0];
              this.controller.runJavaScript(
                'postArrayToApp()',
                (error, result) => {
                  if (error) {
                    console.info(`run JavaScript error: ` + JSON.stringify(error))
                    return;
                  }
                  if (result) {
                    this.webResult = result
                    console.info(`The postArrayToApp() return value is: ${result}`)
                  }
                });
              this.nativePort.onMessageEventExt((result) => {
                console.log("In eTS side got message");
                try {
                  let type = result.getType();
                  console.log("In eTS side getType:" + type);
                  result.getNumber()
                } catch (resError) {
                  console.log(`log error code: ${resError.code}, Message: ${resError.message}`);
                  this.errorTestCode = resError.code;
                  this.errorMsg = resError.message;
                  console.error("emitWebMessageExtGetNumberError onMessageEventExt getNumber result is :" + this.errorTestCode + this.errorMsg);
                  Utils.emitEvent(this.errorTestCode, 828)
                  Utils.emitEvent(this.errorMsg, 829)
                }
              });
              break;
            }
            case "emitWebMessageExtGetBooleanError": {
              this.errorTestCode = 0;
              this.errorMsg = 'failed';
              this.ports = this.controller.createWebMessagePorts(true);
              this.controller.postMessage("init_web_messageport", [this.ports[1]], "*");
              this.nativePort = this.ports[0];
              this.controller.runJavaScript(
                'postArrayBufferToApp()',
                (error, result) => {
                  if (error) {
                    console.info(`run JavaScript error: ` + JSON.stringify(error))
                    return;
                  }
                  if (result) {
                    this.webResult = result
                    console.info(`The postArrayBufferToApp() return value is: ${result}`)
                  }
                });
              this.nativePort.onMessageEventExt((result) => {
                console.log("In eTS side got message");
                try {
                  let type = result.getType();
                  console.log("In eTS side getType:" + type);
                  result.getBoolean()
                } catch (resError) {
                  console.log(`log error code: ${resError.code}, Message: ${resError.message}`);
                  this.errorTestCode = resError.code;
                  this.errorMsg = resError.message;
                  console.error("emitWebMessageExtGetBooleanError onMessageEventExt getBoolean result is :" + this.errorTestCode + this.errorMsg);
                  Utils.emitEvent(this.errorTestCode, 830)
                  Utils.emitEvent(this.errorMsg, 831)
                }
              });
              break;
            }
            case "emitWebMessageExtGetArrayBufferError": {
              this.errorTestCode = 0;
              this.errorMsg = 'failed';
              this.ports = this.controller.createWebMessagePorts(true);
              this.controller.postMessage("init_web_messageport", [this.ports[1]], "*");
              this.nativePort = this.ports[0];
              this.controller.runJavaScript(
                'postBooleanToApp()',
                (error, result) => {
                  if (error) {
                    console.info(`run JavaScript error: ` + JSON.stringify(error))
                    return;
                  }
                  if (result) {
                    this.webResult = result
                    console.info(`The postBooleanToApp() return value is: ${result}`)
                  }
                });
              this.nativePort.onMessageEventExt((result) => {
                console.log("In eTS side got message");
                try {
                  let type = result.getType();
                  console.log("In eTS side getType:" + type);
                  result.getArrayBuffer()
                } catch (resError) {
                  console.log(`log error code: ${resError.code}, Message: ${resError.message}`);
                  this.errorTestCode = resError.code;
                  this.errorMsg = resError.message;
                  console.error("emitWebMessageExtGetArrayBufferError onMessageEventExt getArrayBuffer result is :" + this.errorTestCode + this.errorMsg);
                  Utils.emitEvent(this.errorTestCode, 832)
                  Utils.emitEvent(this.errorMsg, 833)
                }
              });
              break;
            }
            case "emitWebMessageExtGetArrayError": {
              this.errorTestCode = 0;
              this.errorMsg = 'failed';
              this.ports = this.controller.createWebMessagePorts(true);
              this.controller.postMessage("init_web_messageport", [this.ports[1]], "*");
              this.nativePort = this.ports[0];
              this.controller.runJavaScript(
                'postNumberToApp()',
                (error, result) => {
                  if (error) {
                    console.info(`run JavaScript error: ` + JSON.stringify(error))
                    return;
                  }
                  if (result) {
                    this.webResult = result
                    console.info(`The postNumberToApp() return value is: ${result}`)
                  }
                });
              this.nativePort.onMessageEventExt((result) => {
                console.log("In eTS side got message");
                try {
                  let type = result.getType();
                  console.log("In eTS side getType:" + type);
                  result.getArray()
                } catch (resError) {
                  console.log(`log error code: ${resError.code}, Message: ${resError.message}`);
                  this.errorTestCode = resError.code;
                  this.errorMsg = resError.message;
                  console.error("emitWebMessageExtGetArrayError onMessageEventExt getArray result is :" + this.errorTestCode + this.errorMsg);
                  Utils.emitEvent(this.errorTestCode, 834)
                  Utils.emitEvent(this.errorMsg, 835)
                }
              });
              break;
            }
            case "emitWebMessageExtGetErrorError": {
              this.errorTestCode = 0;
              this.errorMsg = 'failed';
              this.ports = this.controller.createWebMessagePorts(true);
              this.controller.postMessage("init_web_messageport", [this.ports[1]], "*");
              this.nativePort = this.ports[0];
              this.controller.runJavaScript(
                'postStringToApp()',
                (error, result) => {
                  if (error) {
                    console.info(`run JavaScript error: ` + JSON.stringify(error))
                    return;
                  }
                  if (result) {
                    this.webResult = result
                    console.info(`The postStringToApp() return value is: ${result}`)
                  }
                });
              this.nativePort.onMessageEventExt((result) => {
                console.log("In eTS side got message");
                try {
                  let type = result.getType();
                  console.log("In eTS side getType:" + type);
                  result.getError()
                } catch (resError) {
                  console.log(`log error code: ${resError.code}, Message: ${resError.message}`);
                  this.errorTestCode = resError.code;
                  this.errorMsg = resError.message;
                  console.error("emitWebMessageExtGetErrorError onMessageEventExt getError result is :" + this.errorTestCode + this.errorMsg);
                  Utils.emitEvent(this.errorTestCode, 836)
                  Utils.emitEvent(this.errorMsg, 837)
                }
              });
              break;
            }
          }
        })
      }

      Web({ src: $rawfile('indexEdit.html'), controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
        .userAgent(this.userAgent)
        .zoomAccess(this.zoomAccess)
        .onPageEnd(err => {
          console.log("In eTS side message onPageEnd init mesaage channel");
          console.log("1.create message port")
          this.ports = this.controller.createWebMessagePorts(true);
          console.log("2.send port1 to HTML5")
          this.controller.postMessage("init_web_messageport", [this.ports[1]], "*");
          console.log("3.save port0 to current path")
          this.nativePort = this.ports[0];
          console.log("4.set callback function")
          this.nativePort.onMessageEventExt((result) => {
            console.log("In eTS side got message");
            try {
              let type = result.getType();
              console.log("In eTS side getType:" + type);
            } catch (resError) {
              console.log(`log error code: ${resError.code}, Message: ${resError.message}`);
            }
          });
          console.info('url: ', err.url);
        })
    }
  }
}