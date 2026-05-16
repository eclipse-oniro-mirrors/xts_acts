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
 * See the License for specific language governing permissions and
 * limitations under the License.
 */

import Utils from '../../test/Utils';
import webView from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';
import { JsProxyObject } from '../../test/Interfaces.d';
import {waitForAssert, waitForExist} from '../../test/WaitTest';

@Entry
@Component
struct WebMessageExtSetArray {
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
      eventId: 170298,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(170298)
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
        Button('WebMessageExtSetArray click').key('WebMessageExtSetArrayButton').onClick(async () => {
          await waitForExist(()=>this.isPageEnd, 'WebMessageExtSetArrayButtonIsPageEnd', 0);
          await waitForExist(()=>this.isReceive, 'WebMessageExtSetArrayButtonIsReceive', 0);
          console.info("key==>" + this.str);
          this.isReceive = -1;
          switch (this.str) {
            case 'testWebMessageExtSetArrayWithEmpty001': {
              let resultValue: string = '0'
              try {
                if (this.nativePort) {
                  this.message.setType(webView.WebMessageType.ARRAY);
                  let emptyArray: Array<string | number | boolean> = [];
                  this.message.setArray(emptyArray);
                  this.nativePort.postMessageEventExt(this.message);
                  await Utils.sleep(1000);
                  this.controller.runJavaScript('postArrayToHtml()', (error, result) => {
                    if (error) {
                      console.log(`testWebMessageExtSetArrayWithEmpty001 The postArrayToHtml() return value is: ${error}`);
                    }
                    console.log(`testWebMessageExtSetArrayWithEmpty001 The postArrayToHtml() return value is: ${result}`);
                    resultValue = result
                  })
                }
              } catch (error) {
                console.log('testWebMessageExtSetArrayWithEmpty001 In eTS side send message catch error:' + error.code + ', msg:' + error.message);
                resultValue = String(error.code)
              }
              let check = (v1: string, v2: string): boolean => {
                return v1 === v2 ? true:false;
              }
              await waitForAssert(() =>resultValue, check, '401', 170271, this.str);
              break;
            }
            case 'testWebMessageExtSetArrayWithNull002': {
              let resultValue: string = '0'
              try {
                if (this.nativePort) {
                  this.message.setType(webView.WebMessageType.ARRAY);
                  let nullValue: Array<string | number | boolean> | null = null;
                  if (nullValue !== null) {
                    this.message.setArray(nullValue);
                    this.nativePort.postMessageEventExt(this.message);
                  }
                  await Utils.sleep(1000);
                  this.controller.runJavaScript('postArrayToHtml()', (error, result) => {
                    if (error) {
                      console.log(`testWebMessageExtSetArrayWithNull002 The postArrayToHtml() return value is: ${error}`);
                    }
                    console.log(`testWebMessageExtSetArrayWithNull002 The postArrayToHtml() return value is: ${result}`);
                    resultValue = result
                  })
                }
              } catch (error) {
                console.log('testWebMessageExtSetArrayWithNull002 In eTS side send message catch error:' + error.code + ', msg:' + error.message);
                resultValue = String(error.code)
              }
              let check = (v1: string, v2: string): boolean => {
                return v1 === v2 ? true:false;
              }
              await waitForAssert(() =>resultValue, check, "\"Receive arraybuffer:\"", 170272, this.str);
              break;
            }
            case 'testWebMessageExtSetArrayWithUndefined003': {
              let resultValue: string = '0'
              try {
                if (this.nativePort) {
                  this.message.setType(webView.WebMessageType.ARRAY);
                  let undefinedValue: Array<string | number | boolean> | undefined = undefined;
                  if (undefinedValue !== undefined) {
                    this.message.setArray(undefinedValue);
                    this.nativePort.postMessageEventExt(this.message);
                  }
                  await Utils.sleep(1000);
                  this.controller.runJavaScript('postArrayToHtml()', (error, result) => {
                    if (error) {
                      console.log(`testWebMessageExtSetArrayWithUndefined003 The postArrayToHtml() return value is: ${error}`);
                    }
                    console.log(`testWebMessageExtSetArrayWithUndefined003 The postArrayToHtml() return value is: ${result}`);
                    resultValue = result
                  })
                }
              } catch (error) {
                console.log('testWebMessageExtSetArrayWithUndefined003 In eTS side send message catch error:' + error.code + ', msg:' + error.message);
                resultValue = String(error.code)
              }
              let check = (v1: string, v2: string): boolean => {
                return v1 === v2 ? true:false;
              }
              await waitForAssert(() =>resultValue, check, "\"Receive arraybuffer:\"", 170273, this.str);
              break;
            }
            case 'testWebMessageExtSetArrayWithMixedTypes004': {
              let resultValue: string = '0'
              try {
                if (this.nativePort) {
                  this.message.setType(webView.WebMessageType.ARRAY);
                  let mixedArray: Array<string | number | boolean> = ['hello', 123, true];
                  this.message.setArray(mixedArray);
                  this.nativePort.postMessageEventExt(this.message);
                  await Utils.sleep(1000);
                  this.controller.runJavaScript('postArrayToHtml()', (error, result) => {
                    if (error) {
                      console.log(`testWebMessageExtSetArrayWithMixedTypes004 The postArrayToHtml() return value is: ${error}`);
                    }
                    console.log(`testWebMessageExtSetArrayWithMixedTypes004 The postArrayToHtml() return value is: ${result}`);
                    resultValue = result
                  })
                }
              } catch (error) {
                console.log('testWebMessageExtSetArrayWithMixedTypes004 In eTS side send message catch error:' + error.code + ', msg:' + error.message);
                resultValue = String(error.code)
              }
              let check = (v1: string, v2: string): boolean => {
                return v1 === v2 ? true:false;
              }
              await waitForAssert(() =>resultValue, check, '401', 170274, this.str);
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
                } else if (this.listeningFlag ==1) {
                  let value = result.getType()
                  console.info(`The postTypeToApp() return value is: ${value}`)
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
