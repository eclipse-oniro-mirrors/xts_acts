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
import business_error from '@ohos.base';
import {waitForAssert, waitForExist} from '../../test/WaitTest.test';

class TestObj {
  private testReturnStr = '';
  private testNoReturnStr = '';
  private testReturnNumber = -1;
  private testNoReturnNumber = -1;
  constructor() {}
  testReturnObj() {
    this.testReturnStr = '';
    return this;
  }
  testReturnObj2(size: number) {
    this.testReturnStr = 'a'.repeat(size - 88) + 'b';
    return this;
  }
}

@Entry
@Component
struct jsMessageExtFour {
  controller: webView.WebviewController = new webView.WebviewController();
  message: webView.WebMessageExt = new webView.WebMessageExt();
  @State str: string = '';
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;
  @State testObj: TestObj = new TestObj();

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 144,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(144)
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

  build() {
    Column() {
      Row() {
        Button('JsMessageExtFour').key('JsMessageExtFourButton').onClick(async () => {
          await waitForExist(() => this.isPageEnd, this.str, 0, 1000);
          await waitForExist(() => this.isReceive, this.str, 0, 1000);
          this.isReceive = -1;
          console.info('key==>' + this.str)
          switch (this.str) {
            case 'emitPromiseJavascriptProxyGetErrorDescription001': {
              try {
                this.controller.runJavaScriptExt('registerRetSize(100)').then((result) => {
                  if (result) {
                    console.log(this.str + ' getErrorDescription before==>' + result.getErrorDescription());
                    if (result.getErrorDescription() && result.getErrorDescription() !== null ) {
                      let errorDescription = result.getErrorDescription() + '';
                      let startIndex = errorDescription.indexOf('<');
                      let endIndex = errorDescription.indexOf('>');
                      let resultDesc = errorDescription.slice(startIndex + 1, endIndex);
                      console.log(this.str + ' getErrorDescription after==>' + resultDesc);
                      console.log(this.str + ' getErrorDescription length==>' + resultDesc.length);
                      if (resultDesc.length == 100 && resultDesc.includes('aaab')) {
                        Utils.emitEvent(true, 25112127);
                      } else {
                        Utils.emitEvent(false, 25112127);
                      }
                    }
                  }
                }).catch((error:business_error.BusinessError) => {
                  console.log('error:' + JSON.stringify(error));
                  Utils.emitEvent(error.code, 25112127);
                })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case 'emitPromiseJavascriptProxyGetErrorDescription002': {
              try {
                this.controller.runJavaScriptExt('registerRetSize(2048)').then((result) => {
                  if (result) {
                    console.log(this.str + ' getErrorDescription before==>' + result.getErrorDescription());
                    if (result.getErrorDescription() && result.getErrorDescription() !== null ) {
                      let errorDescription = result.getErrorDescription() + '';
                      let startIndex = errorDescription.indexOf('<');
                      let endIndex = errorDescription.indexOf('>');
                      let resultDesc = errorDescription.slice(startIndex + 1, endIndex);
                      console.log(this.str + ' getErrorDescription after==>' + resultDesc);
                      console.log(this.str + ' getErrorDescription length==>' + resultDesc.length);
                      if (resultDesc.length == 2048 && resultDesc.includes('aaab')) {
                        Utils.emitEvent(true, 25112128);
                      } else {
                        Utils.emitEvent(false, 25112128);
                      }
                    }
                  }
                }).catch((error:business_error.BusinessError) => {
                  console.log('error:' + JSON.stringify(error));
                  Utils.emitEvent(error.code, 25112128);
                })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case 'emitPromiseJavascriptProxyGetErrorDescription003': {
              try {
                this.controller.runJavaScriptExt('registerRetSize(2048*1024)').then((result) => {
                  if (result) {
                    console.log(this.str + ' getErrorDescription before==>' + result.getErrorDescription());
                    if (result.getErrorDescription() && result.getErrorDescription() !== null ) {
                      let errorDescription = result.getErrorDescription() + '';
                      let startIndex = errorDescription.indexOf('<');
                      let endIndex = errorDescription.indexOf('>');
                      let resultDesc = errorDescription.slice(startIndex + 1, endIndex);
                      console.log(this.str + ' getErrorDescription after==>' + resultDesc);
                      console.log(this.str + ' getErrorDescription length==>' + resultDesc.length);
                      if (resultDesc.length == 2048 && !resultDesc.includes('aaab')) {
                        Utils.emitEvent(true, 25112129);
                      } else {
                        Utils.emitEvent(false, 25112129);
                      }
                    }
                  }
                }).catch((error:business_error.BusinessError) => {
                  console.log('error:' + JSON.stringify(error));
                  Utils.emitEvent(error.code, 25112129);
                })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case 'emitCallbackJavascriptProxyGetErrorDescription001': {
              try {
                this.controller.runJavaScriptExt(
                  'registerRetSize(101)',
                  (error, result) => {
                    if (error) {
                      let e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                      Utils.emitEvent(e.code, 25112130)
                    }
                    if (result) {
                      console.log(this.str + ' getErrorDescription before==>' + result.getErrorDescription());
                      if (result.getErrorDescription() && result.getErrorDescription() !== null ) {
                        let errorDescription = result.getErrorDescription() + '';
                        let startIndex = errorDescription.indexOf('<');
                        let endIndex = errorDescription.indexOf('>');
                        let resultDesc = errorDescription.slice(startIndex + 1, endIndex);
                        console.log(this.str + ' getErrorDescription after==>' + resultDesc);
                        console.log(this.str + ' getErrorDescription length==>' + resultDesc.length);
                        if (resultDesc.length == 101 && resultDesc.includes('aaab')) {
                          Utils.emitEvent(true, 25112130);
                        } else {
                          Utils.emitEvent(false, 25112130);
                        }
                      }
                    }
                  });
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case 'emitCallbackJavascriptProxyGetErrorDescription002': {
              try {
                this.controller.runJavaScriptExt(
                  'registerRetSize(2048)',
                  (error, result) => {
                    if (error) {
                      let e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                      Utils.emitEvent(e.code, 25112131)
                    }
                    if (result) {
                      console.log(this.str + ' getErrorDescription before==>' + result.getErrorDescription());
                      if (result.getErrorDescription() && result.getErrorDescription() !== null ) {
                        let errorDescription = result.getErrorDescription() + '';
                        let startIndex = errorDescription.indexOf('<');
                        let endIndex = errorDescription.indexOf('>');
                        let resultDesc = errorDescription.slice(startIndex + 1, endIndex);
                        console.log(this.str + ' getErrorDescription after==>' + resultDesc);
                        console.log(this.str + ' getErrorDescription length==>' + resultDesc.length);
                        if (resultDesc.length == 2048 && resultDesc.includes('aaab')) {
                          Utils.emitEvent(true, 25112131);
                        } else {
                          Utils.emitEvent(false, 25112131);
                        }
                      }
                    }
                  });
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case 'emitCallbackJavascriptProxyGetErrorDescription003': {
              try {
                this.controller.runJavaScriptExt(
                  'registerRetSize(2048*1024)',
                  (error, result) => {
                    if (error) {
                      let e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                      Utils.emitEvent(e.code, 25112132)
                    }
                    if (result) {
                      console.log(this.str + ' getErrorDescription before==>' + result.getErrorDescription());
                      if (result.getErrorDescription() && result.getErrorDescription() !== null ) {
                        let errorDescription = result.getErrorDescription() + '';
                        let startIndex = errorDescription.indexOf('<');
                        let endIndex = errorDescription.indexOf('>');
                        let resultDesc = errorDescription.slice(startIndex + 1, endIndex);
                        console.log(this.str + ' getErrorDescription after==>' + resultDesc);
                        console.log(this.str + ' getErrorDescription length==>' + resultDesc.length);
                        if (resultDesc.length == 2048 && !resultDesc.includes('aaab')) {
                          Utils.emitEvent(true, 25112132);
                        } else {
                          Utils.emitEvent(false, 25112132);
                        }
                      }
                    }
                  });
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }

          }
        })
      }

      Web({ src: $rawfile('runJavascript.html'), controller: this.controller })
        .javaScriptProxy({
          object: this.testObj,
          name: 'testObj',
          methodList: ['testReturnObj', 'testReturnObj2'],
          controller: this.controller
        })
        .onPageEnd((event) => {
          if (event) {
            this.isPageEnd = 0;
            console.log(' onPageEnd url:' + event.url);
          }
        })
    }
  }
}
