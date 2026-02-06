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
import webView from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';
import { JsProxyObject } from '../../test/Interfaces.d';
import {waitForAssert, waitForExist} from '../../test/WaitTest';

@Entry
@Component
struct webMessageExt {
  controller: webView.WebviewController = new webView.WebviewController();
  nativePort: webView.WebMessagePort | null = null;
  message: webView.WebMessageExt = new webView.WebMessageExt();
  @State str: string = ''
  @State javaScriptAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State ports: webView.WebMessagePort[] = [];
  @State listeningPort: number = 0
  @State listeningFlag: number = 0
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 170290,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(170290)
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
      Utils.emitEvent(String(res), 102);
    },
    toString: (str: string) => {
      console.info('ets toString:' + String(str));
    },
    register: (res: object) => {
      Utils.emitEvent(String(res), 86);
      return 'web222'
    }
  }

  build() {
    Column() {
      Row() {
        Button('WebMessageExtErrorCode click').key('WebMessageExtErrorCodeButton').onClick(async () => {
          await waitForExist(()=>this.isPageEnd, 'WebMessageExtButtonIsPageEnd', 0);
          await waitForExist(()=>this.isReceive, 'WebMessageExtButtonIsReceive', 0);
          console.info("key==>" + this.str);
          this.isReceive = -1;
          switch (this.str) {
            case 'testWebMessageExtSetStringErrorCode001': {
              let resultValue: string = '0'
              try {
                if (this.nativePort) {
                  this.message.setType(webView.WebMessageType.NUMBER);
                  this.message.setString(String(1));
                  this.nativePort.postMessageEventExt(this.message);
                }
                await Utils.sleep(3000);
                this.controller.runJavaScript('postStringToHtml()', (error, result) => {
                  if (error) {
                    console.error(`testWebMessageExtSetStringErrorCode001 The postStringToHtml() return value is: ${error}`);
                  }
                  console.log(`testWebMessageExtSetStringErrorCode001 The postStringToHtml() return value is: ${result}`);
                  resultValue = result

                })

              } catch (error) {
                console.log('testWebMessageExtSetStringErrorCode001 In eTS side send message catch error:' + error.code + ', msg:' + error.message);
                resultValue = error.code
              }

              let check = (v1: string, v2: string): boolean => {
                return v1 === v2 ? true:false;
              }
              await waitForAssert(() =>resultValue, check, '17100014', 170300, this.str);

              break;
            }
            case 'testWebMessageExtSetNumberErrorCode001': {
              let resultValue: string = '0'
              try {
                if (this.nativePort) {
                  this.message.setType(webView.WebMessageType.STRING);
                  this.message.setNumber(1);
                  this.nativePort.postMessageEventExt(this.message);
                }
                await Utils.sleep(3000);
                this.controller.runJavaScript('postNumberToHtml()', (error, result) => {
                  if (error) {
                    console.log(`testWebMessageExtSetNumberErrorCode001 The postNumberToHtml() return value is: ${error}`);
                  }
                  console.log(`testWebMessageExtSetNumberErrorCode001 The postNumberToHtml() return value is: ${result}`);
                  resultValue = result
                })
              } catch (error) {
                console.log('testWebMessageExtSetNumberErrorCode001 In eTS side send message catch error:' + error.code + ', msg:' + error.message);
                resultValue = error.code
              }
              let check = (v1: string, v2: string): boolean => {
                return v1 === v2 ? true:false;
              }
              await waitForAssert(() =>resultValue, check, '17100014', 170310, this.str);

              break;
            }

            case 'testWebMessageExtSetBooleanErrorCode001': {
              let resultValue: string = '0'
              try {
                if (this.nativePort) {
                  this.message.setType(webView.WebMessageType.NOT_SUPPORT);
                  this.message.setBoolean(true);
                  this.nativePort.postMessageEventExt(this.message);
                }
                await Utils.sleep(3000);
                this.controller.runJavaScript('postBooleanToHtml()', (error, result) => {
                  if (error) {
                    console.log(`testWebMessageExtSetBooleanErrorCode001 The postBooleanToHtml() return value is: ${error}`);
                  }
                  console.log(`testWebMessageExtSetBooleanErrorCode001 The postBooleanToHtml() return value is: ${result}`);
                  resultValue = result
                })
              } catch (error) {
                console.log('testWebMessageExtSetBooleanErrorCode001 In eTS side send message catch error:' + error.code + ', msg:' + error.message);
                resultValue = error.code
              }
              let check = (v1: string, v2: string): boolean => {
                return v1 === v2 ? true:false;
              }
              await waitForAssert(() =>resultValue, check, '17100014', 170320, this.str);

              break;
            }
            case 'testWebMessageExtSetArrayBufferErrorCode001': {
              let resultValue: string = '0'
              try {
                if (this.nativePort) {
                  let buffer = new ArrayBuffer(8);
                  this.message.setType(webView.WebMessageType.ARRAY);
                  this.message.setArrayBuffer(buffer);
                  this.nativePort.postMessageEventExt(this.message);
                }
                await Utils.sleep(3000);
                this.controller.runJavaScript('postArrayBufferToHtml()', (error, result) => {
                  if (error) {
                    console.log(`testWebMessageExtSetArrayBufferErrorCode001 The postArrayBufferToHtml() return value is: ${error}`);
                  }
                  console.log(`testWebMessageExtSetArrayBufferErrorCode001 The postArrayBufferToHtml() return value is: ${result}`);
                  resultValue = result
                })
              } catch (error) {
                console.log('testWebMessageExtSetArrayBufferErrorCode001 In eTS side send message catch error:' + error.code + ', msg:' + error.message);
                resultValue = error.code
              }
              let check = (v1: string, v2: string): boolean => {
                return v1 === v2 ? true:false;
              }
              await waitForAssert(() =>resultValue, check, '17100014', 170330, this.str);

              break;
            }

            case 'testWebMessageExtSetArrayErrorCode001': {
              let resultValue: string = '0'
              try {
                if (this.nativePort) {
                  let fruits = ['apple'];
                  this.message.setType(webView.WebMessageType.ARRAY_BUFFER);
                  this.message.setArray(fruits);
                  this.nativePort.postMessageEventExt(this.message);
                }
                await Utils.sleep(3000);
                this.controller.runJavaScript('postArrayBufferToHtml()', (error, result) => {
                  if (error) {
                    console.log(`testWebMessageExtSetArrayErrorCode001 The postArrayBufferToHtml() return value is: ${error}`);
                  }
                  console.log(`testWebMessageExtSetArrayErrorCode001 The postArrayBufferToHtml() return value is: ${result}`);
                  resultValue = result
                })
              } catch (error) {
                console.log('testWebMessageExtSetArrayErrorCode001 In eTS side send message catch error:' + error.code + ', msg:' + error.message);
                resultValue = error.code
              }
              let check = (v1: string, v2: string): boolean => {
                return v1 === v2 ? true:false;
              }
              await waitForAssert(() =>resultValue, check, '17100014', 170340, this.str);

              break;
            }

            case 'testWebMessageExtSetErrorErrorCode001': {
              let resultValue: string = '0'
              try {
                try {
                  console.log('URL Error');
                  throw new URIError('URI seq')
                } catch (e) {
                  console.log('hwd URIError:' + (e instanceof SyntaxError));
                  console.log('hwd URIError:' + e.message);
                  console.log('hwd URIError:' + e.name);
                  if (this.nativePort) {
                    this.message.setType(webView.WebMessageType.STRING);
                    this.message.setError(e);
                    this.nativePort.postMessageEventExt(this.message);
                  }
                  await Utils.sleep(3000);
                  this.controller.runJavaScript('postErrorToHtml()', (error, result) => {
                    if (error) {
                      console.log(`The postErrorToHtml() return value is: ${error}`);
                    }
                    console.log(`The postErrorToHtml() return value is: ${result}`);
                    resultValue = result
                  })
                }
              } catch (error) {
                console.log('testWebMessageExtSetErrorErrorCode001 In eTS side send message catch error:' + error.code + ', msg:' + error.message);
                resultValue = error.code
              }
              let check = (v1: string, v2: string): boolean => {
                return v1 === v2 ? true:false;
              }
              await waitForAssert(() =>resultValue, check, '17100014', 170350, this.str);

              break;
            }

          }
        })
      }

      Web({ src: $rawfile('onMessageEventExt.html'), controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .javaScriptProxy({
          object: this.jsObj,
          name: 'backToEts',
          methodList: ['test', 'toString'],
          controller: this.controller
        })
        .onPageEnd((event) => {
          console.log('onPageEnd url:' + event.url);
          this.isPageEnd = 0;
          if (event) {
            this.ports = this.controller.createWebMessagePorts(true);
            this.controller.postMessage('init_web_messageport', [this.ports[1]], '*');
            this.nativePort = this.ports[0];
            this.nativePort.onMessageEventExt((result) => {
              try {
                if (this.listeningFlag == 0) {
                  return;
                } else if (this.listeningFlag == 1) {
                  let value = result.getType()
                  console.info(`The postTypeToApp() return value is: ${value}`)
                  Utils.emitEvent(value, this.listeningPort)
                } else if (this.listeningFlag == 2) {
                  let value = result.getType()
                  console.info(`The postTypeToApp() return value is: ${value}`)
                  Utils.emitEvent(value, this.listeningPort)
                } else if (this.listeningFlag == 3) {
                  let value = result.getType()
                  console.info(`The postTypeToApp() return value is: ${value}`)
                  Utils.emitEvent(value, this.listeningPort)
                } else if (this.listeningFlag == 4) {
                  let value = result.getType()
                  console.info(`The postTypeToApp() return value is: ${value}`)
                  Utils.emitEvent(value, this.listeningPort)
                } else if (this.listeningFlag == 5) {
                  let value = result.getType()
                  console.info(`The postTypeToApp() return value is: ${value}`)
                  Utils.emitEvent(value, this.listeningPort)
                } else if (this.listeningFlag == 6) {
                  let value = result.getType()
                  console.info(`The postTypeToApp() return value is: ${value}`)
                  Utils.emitEvent(value, this.listeningPort)
                } else if (this.listeningFlag == 10) {
                  let value = result.getString()
                  console.info(`The postStringToApp() return value is: ${value}`)
                  Utils.emitEvent(value, this.listeningPort)
                } else if (this.listeningFlag == 11) {
                  let value = result.getNumber()
                  console.info(`The postNumberToApp() return value is: ${value}`)
                  Utils.emitEvent(value, this.listeningPort)
                } else if (this.listeningFlag == 12) {
                  let value = result.getBoolean()
                  console.info(`The postBooleanToApp() return value is: ${value}`)
                  Utils.emitEvent(value, this.listeningPort)
                } else if (this.listeningFlag == 13) {
                  let value = result.getBoolean()
                  console.info(`The postBooleanFalseToApp() return value is: ${value}`)
                  Utils.emitEvent(value, this.listeningPort)
                } else if (this.listeningFlag == 14) {
                  let value = 'result getArrayBuffer byteLength:' + result.getArrayBuffer().byteLength
                  console.info(`The postArrayBufferToApp() return value is: ${value}`)
                  Utils.emitEvent(value, this.listeningPort)
                } else if (this.listeningFlag == 15) {
                  let value = result.getArray()
                  console.info(`The postArrayToApp() return value is: ${value[0]}`)
                  Utils.emitEvent(value[0], this.listeningPort)
                } else if (this.listeningFlag == 16) {
                  let value = result.getError().message
                  console.info(`The postErrorToApp() return value is: ${value}`)
                  Utils.emitEvent(value, this.listeningPort)
                }
              } catch (resError) {
                console.log(`log error code: ${resError.code}, Message: ${resError.message}`);
              }
            });
            console.log('url:' + event.url)
          }
        })
    }
  }
}
