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
struct jsMessageExtThree {
  controller: webView.WebviewController = new webView.WebviewController();
  message: webView.WebMessageExt = new webView.WebMessageExt();
  @State str: string = '';
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;
  @State testObj: TestObj = new TestObj();

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 143,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(143)
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
        Button('JsMessageExtThree').key('JsMessageExtThreeButton').onClick(async () => {
          await waitForExist(() => this.isPageEnd, this.str, 0, 1000);
          await waitForExist(() => this.isReceive, this.str, 0, 1000);
          this.isReceive = -1;
          console.info('key==>' + this.str)
          switch (this.str) {
            case 'emitPromiseGetErrorDescriptionNull001': {
              try {
                let js = 'function retTest(){return "abc";}retTest();';
                this.controller.runJavaScriptExt(js).then((result) => {
                  if (result) {
                    console.log(this.str + ' getErrorDescription==>' + result.getErrorDescription());
                    console.log(this.str + ' getType==>' + result.getType());
                    let getType = result.getType();
                    let errorDescription = result.getErrorDescription();
                    if (errorDescription === null && getType == webView.JsMessageType.STRING) {
                      Utils.emitEvent(true, 25112117);
                    } else {
                      Utils.emitEvent(false, 25112117);
                    }
                  }
                }).catch((error:business_error.BusinessError) => {
                  console.log('error:' + JSON.stringify(error));
                  Utils.emitEvent(error.code, 25112117);
                })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case 'emitPromiseGetErrorDescriptionNull002': {
              try {
                let js = 'function retTest(){return 123;}retTest();';
                this.controller.runJavaScriptExt(js).then((result) => {
                  if (result) {
                    console.log(this.str + ' getErrorDescription==>' + result.getErrorDescription());
                    console.log(this.str + ' getType==>' + result.getType());
                    let getType = result.getType();
                    let errorDescription = result.getErrorDescription();
                    if (errorDescription === null && getType == webView.JsMessageType.NUMBER) {
                      Utils.emitEvent(true, 25112118);
                    } else {
                      Utils.emitEvent(false, 25112118);
                    }
                  }
                }).catch((error:business_error.BusinessError) => {
                  console.log('error:' + JSON.stringify(error));
                  Utils.emitEvent(error.code, 25112118);
                })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case 'emitPromiseGetErrorDescriptionNull003': {
              try {
                let js = 'function retTest(){return true;}retTest();';
                this.controller.runJavaScriptExt(js).then((result) => {
                  if (result) {
                    console.log(this.str + ' getErrorDescription==>' + result.getErrorDescription());
                    console.log(this.str + ' getType==>' + result.getType());
                    let getType = result.getType();
                    let errorDescription = result.getErrorDescription();
                    if (errorDescription === null && getType == webView.JsMessageType.BOOLEAN) {
                      Utils.emitEvent(true, 25112119);
                    } else {
                      Utils.emitEvent(false, 25112119);
                    }
                  }
                }).catch((error:business_error.BusinessError) => {
                  console.log('error:' + JSON.stringify(error));
                  Utils.emitEvent(error.code, 25112119);
                })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case 'emitPromiseGetErrorDescriptionNull004': {
              try {
                let js = 'function retTest(){' +
                  'let buffer = new ArrayBuffer(10);' +
                  'let view = new Uint8Array(buffer);' +
                  'view[0] = 97;' +
                  'return view;' +
                  '}retTest();';
                this.controller.runJavaScriptExt(js).then((result) => {
                  if (result) {
                    console.log(this.str + ' getErrorDescription==>' + result.getErrorDescription());
                    console.log(this.str + ' getType==>' + result.getType());
                    let getType = result.getType();
                    let errorDescription = result.getErrorDescription();
                    if (errorDescription === null && getType == webView.JsMessageType.ARRAY_BUFFER) {
                      Utils.emitEvent(true, 25112120);
                    } else {
                      Utils.emitEvent(false, 25112120);
                    }
                  }
                }).catch((error:business_error.BusinessError) => {
                  console.log('error:' + JSON.stringify(error));
                  Utils.emitEvent(error.code, 25112120);
                })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case 'emitPromiseGetErrorDescriptionNull005': {
              try {
                let js = 'function retTest(){return [1,2,3];}retTest();';
                this.controller.runJavaScriptExt(js).then((result) => {
                  if (result) {
                    console.log(this.str + ' getErrorDescription==>' + result.getErrorDescription());
                    console.log(this.str + ' getType==>' + result.getType());
                    let getType = result.getType();
                    let errorDescription = result.getErrorDescription();
                    if (errorDescription === null && getType == webView.JsMessageType.ARRAY) {
                      Utils.emitEvent(true, 25112121);
                    } else {
                      Utils.emitEvent(false, 25112121);
                    }
                  }
                }).catch((error:business_error.BusinessError) => {
                  console.log('error:' + JSON.stringify(error));
                  Utils.emitEvent(error.code, 25112121);
                })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case 'emitCallbackGetErrorDescriptionNull001': {
              try {
                let js = 'function retTest(){return "def";}retTest();';
                this.controller.runJavaScriptExt(
                  js,
                  (error, result) => {
                    if (error) {
                      let e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                      Utils.emitEvent(e.code, 25112122)
                    }
                    if (result) {
                      console.log(this.str + ' getErrorDescription==>' + result.getErrorDescription());
                      console.log(this.str + ' getType==>' + result.getType());
                      let getType = result.getType();
                      let errorDescription = result.getErrorDescription();
                      if (errorDescription === null && getType == webView.JsMessageType.STRING) {
                        Utils.emitEvent(true, 25112122);
                      } else {
                        Utils.emitEvent(false, 25112122);
                      }
                    }
                  });
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case 'emitCallbackGetErrorDescriptionNull002': {
              try {
                let js = 'function retTest(){return 123;}retTest();';
                this.controller.runJavaScriptExt(
                  js,
                  (error, result) => {
                    if (error) {
                      let e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                      Utils.emitEvent(e.code, 25112123)
                    }
                    if (result) {
                      console.log(this.str + ' getErrorDescription==>' + result.getErrorDescription());
                      console.log(this.str + ' getType==>' + result.getType());
                      let getType = result.getType();
                      let errorDescription = result.getErrorDescription();
                      if (errorDescription === null && getType == webView.JsMessageType.NUMBER) {
                        Utils.emitEvent(true, 25112123);
                      } else {
                        Utils.emitEvent(false, 25112123);
                      }
                    }
                  });
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case 'emitCallbackGetErrorDescriptionNull003': {
              try {
                let js = 'function retTest(){return false;}retTest();';
                this.controller.runJavaScriptExt(
                  js,
                  (error, result) => {
                    if (error) {
                      let e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                      Utils.emitEvent(e.code, 25112124)
                    }
                    if (result) {
                      console.log(this.str + ' getErrorDescription==>' + result.getErrorDescription());
                      console.log(this.str + ' getType==>' + result.getType());
                      let getType = result.getType();
                      let errorDescription = result.getErrorDescription();
                      if (errorDescription === null && getType == webView.JsMessageType.BOOLEAN) {
                        Utils.emitEvent(true, 25112124);
                      } else {
                        Utils.emitEvent(false, 25112124);
                      }
                    }
                  });
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case 'emitCallbackGetErrorDescriptionNull004': {
              try {
                let js = 'function retTest(){' +
                  'let buffer = new ArrayBuffer(10);' +
                  'let view = new Uint8Array(buffer);' +
                  'view[0] = 97;' +
                  'return view;' +
                  '}retTest();';
                this.controller.runJavaScriptExt(
                  js,
                  (error, result) => {
                    if (error) {
                      let e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                      Utils.emitEvent(e.code, 25112125)
                    }
                    if (result) {
                      console.log(this.str + ' getErrorDescription==>' + result.getErrorDescription());
                      console.log(this.str + ' getType==>' + result.getType());
                      let getType = result.getType();
                      let errorDescription = result.getErrorDescription();
                      if (errorDescription === null && getType == webView.JsMessageType.ARRAY_BUFFER) {
                        Utils.emitEvent(true, 25112125);
                      } else {
                        Utils.emitEvent(false, 25112125);
                      }
                    }
                  });
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case 'emitCallbackGetErrorDescriptionNull005': {
              try {
                let js = 'function retTest(){return [4,5,6];}retTest();';
                this.controller.runJavaScriptExt(
                  js,
                  (error, result) => {
                    if (error) {
                      let e: business_error.BusinessError = error as business_error.BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                      Utils.emitEvent(e.code, 25112126)
                    }
                    if (result) {
                      console.log(this.str + ' getErrorDescription==>' + result.getErrorDescription());
                      console.log(this.str + ' getType==>' + result.getType());
                      let getType = result.getType();
                      let errorDescription = result.getErrorDescription();
                      if (errorDescription === null && getType == webView.JsMessageType.ARRAY) {
                        Utils.emitEvent(true, 25112126);
                      } else {
                        Utils.emitEvent(false, 25112126);
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
