/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import webView from '@ohos.web.webview';
import {  Entry, Component, Column, Row, Button, ClickEvent, Web } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement' // should be insert by ui-plugins
import { BusinessError } from '@ohos.base';
import Utils from '../../src/test/Utils.test';
import events_emitter from '@ohos.events.emitter';
import emitter from '@ohos.events.emitter';
import { Callback, RecordData } from '@ohos.base'
import { UIContext, Router } from '@ohos.arkui.UIContext'

class StringFields {
  public str: string = '';
}

@Entry
@Component
struct jsMessageExt {
  stringObj: StringFields  = new StringFields ();
  controller: webView.WebviewController = new webView.WebviewController(undefined);
  message: webView.WebMessageExt = new webView.WebMessageExt();
  @State str: string = ''
  @State javaScriptAccess: boolean = true;
  @State databaseAccess: boolean = true;

  aboutToAppear() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack: Callback<events_emitter.EventData> = (eventData: events_emitter.EventData): void => {
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      const data = eventData.data as Record<string, RecordData>;
      if (data != null && data['ACTION'] != null) {
        let strValue: string = String(data['ACTION']);
        this.stringObj.str = strValue;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button('JsMessageExt click').key('JsMessageExtButton').onClick( (e:ClickEvent) => {
          console.info('key==>' +  this.stringObj.str)
          switch (this.stringObj.str) {

            case 'testJsMessageExtGetType001': {
              try {
                this.controller.loadUrl('resource://rawfile/getJsMessageExt.html');
                setTimeout(() => {
                this.controller.runJavaScriptExt(
                  'getString()',
                  (error, result) => {
                    if (error) {
                      let e: BusinessError = error as BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                      Utils.emitEvent(e.code, 30200)
                    }
                    if (result) {
                      try {
                        let type = result.getType();
                        console.info(`get result :` + type)
                        Utils.emitEvent(type, 30200)
                      }
                      catch (resError) {
                        resError = resError as BusinessError;
                        let e: BusinessError = resError as BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(e.code, 30200)
                      }
                    }
                  });
                }, 2000)
              } catch (error) {
                error = error as BusinessError;
                let e: BusinessError = error as BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 30200)
              }
              break;
            }

            case 'testJsMessageExtGetType002': {
              try {
                this.controller.loadUrl('resource://rawfile/getJsMessageExt.html');
                setTimeout(() => {
                this.controller.runJavaScriptExt(
                  'getNumber()',
                  (error, result) => {
                    if (error) {
                      let e: BusinessError = error as BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                      Utils.emitEvent(e.code, 30201)
                    }
                    if (result) {
                      try {
                        let type = result.getType();
                        console.info(`get result :` + type)
                        Utils.emitEvent(type, 30201)
                      }
                      catch (resError) {
                        resError = resError as BusinessError;
                        let e: BusinessError = resError as BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                      }
                    }
                  });
                }, 2000)
              } catch (error) {
                error = error as BusinessError;
                let e: BusinessError = error as BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 30201)
              }
              break;
            }

            case 'testJsMessageExtGetType003': {
              try {
                this.controller.loadUrl('resource://rawfile/getJsMessageExt.html');
                setTimeout(() => {
                this.controller.runJavaScriptExt(
                  'getBoolean()',
                  (error, result) => {
                    if (error) {
                      let e: BusinessError = error as BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                      Utils.emitEvent(e.code, 30202)
                    }
                    if (result) {
                      try {
                        let type = result.getType();
                        console.info(`get result :` + type)
                        Utils.emitEvent(type, 30202)
                      }
                      catch (resError) {
                        resError = resError as BusinessError;
                        let e: BusinessError = resError as BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(e.code, 30202)
                      }
                    }
                  });
                }, 2000)
              } catch (error) {
                error = error as BusinessError;
                let e: BusinessError = error as BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 30202)
              }
              break;
            }

            case 'testJsMessageExtGetType004': {
              try {
                this.controller.loadUrl('resource://rawfile/getJsMessageExt.html');
                setTimeout(() => {
                this.controller.runJavaScriptExt(
                  'getArrayBuffer()',
                  (error, result) => {
                    if (result) {
                      if (error) {
                        let e: BusinessError = error as BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(e.code, 30203)
                      }
                      try {
                        let type = result.getType();
                        console.info(`get result :` + type)
                        Utils.emitEvent(type, 30203)
                      }
                      catch (resError) {
                        resError = resError as BusinessError;
                        let e: BusinessError = resError as BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(e.code, 30203)
                      }
                    }
                  });
                }, 2000)
              } catch (error) {
                error = error as BusinessError;
                let e: BusinessError = error as BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 30203)
              }
              break;
            }

            case 'testJsMessageExtGetType005': {
              try {
                this.controller.loadUrl('resource://rawfile/getJsMessageExt.html');
                setTimeout(() => {
                this.controller.runJavaScriptExt(
                  'getArray()',
                  (error, result) => {
                    if (error) {
                      let e: BusinessError = error as BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                      Utils.emitEvent(e.code, 30204)
                    }
                    if (result) {
                      try {
                        let type = result.getType();
                        console.info(`get result :` + type)
                        Utils.emitEvent(type, 30204)
                      }
                      catch (resError) {
                        resError = resError as BusinessError;
                        let e: BusinessError = resError as BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                      }
                    }
                  });
                }, 2000)
              } catch (error) {
                error = error as BusinessError;
                let e: BusinessError = error as BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 30204)
              }
              break;
            }

            case 'testJsMessageExtJsMessageType001': {
              try {
                console.info(`webView.JsMessageType.NOT_SUPPORT :` + webView.JsMessageType.NOT_SUPPORT)
                Utils.emitEvent(webView.JsMessageType.NOT_SUPPORT, 30205)
              } catch (error) {
                error = error as BusinessError;
                let e: BusinessError = error as BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 30205)
              }
              break;
            }

            case 'testJsMessageExtJsMessageType002': {
              try {
                console.info(`webView.JsMessageType.STRING :` + webView.JsMessageType.STRING)
                Utils.emitEvent(webView.JsMessageType.STRING, 30206)
              } catch (error) {
                error = error as BusinessError;
                let e: BusinessError = error as BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 30206)
              }
              break;
            }

            case 'testJsMessageExtJsMessageType003': {
              try {
                console.info(`webView.JsMessageType.NUMBER :` + webView.JsMessageType.NUMBER)
                Utils.emitEvent(webView.JsMessageType.NUMBER, 30207)
              } catch (error) {
                error = error as BusinessError;
                let e: BusinessError = error as BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 30207)
              }
              break;
            }

            case 'testJsMessageExtJsMessageType004': {
              try {
                console.info(`webView.JsMessageType.BOOLEAN :` + webView.JsMessageType.BOOLEAN)
                Utils.emitEvent(webView.JsMessageType.BOOLEAN, 30208)
              } catch (error) {
                error = error as BusinessError;
                let e: BusinessError = error as BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 30208)
              }
              break;
            }

            case 'testJsMessageExtJsMessageType005': {
              try {
                console.info(`webView.JsMessageType.ARRAY_BUFFER :` + webView.JsMessageType.ARRAY_BUFFER)
                Utils.emitEvent(webView.JsMessageType.ARRAY_BUFFER, 30209)
              } catch (error) {
                error = error as BusinessError;
                let e: BusinessError = error as BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 30209)
              }
              break;
            }

            case 'testJsMessageExtJsMessageType006': {
              try {
                console.info(`webView.JsMessageType.ARRAY :` + webView.JsMessageType.ARRAY)
                Utils.emitEvent(webView.JsMessageType.ARRAY, 30210)
              } catch (error) {
                error = error as BusinessError;
                let e: BusinessError = error as BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 30210)
              }
              break;
            }

            case 'testJsMessageExtGetString001': {
              try {
                this.controller.loadUrl('resource://rawfile/getJsMessageExt.html');
                setTimeout(() => {
                this.controller.runJavaScriptExt(
                  'getString()',
                  (error, result) => {
                    if (error) {
                      let e: BusinessError = error as BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                      Utils.emitEvent(e.code, 100013)
                    }
                    if (result) {
                      try {
                        let value = result.getString();
                        console.info(`get result :` + value)
                        Utils.emitEvent(value, 100013)
                      }
                      catch (resError) {
                        resError = resError as BusinessError;
                        let e: BusinessError = resError as BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(e.code, 100013)
                      }
                    }
                  });
                }, 2000)
              } catch (error) {
                error = error as BusinessError;
                let e: BusinessError = error as BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 100013)
              }
              break;
            }

            case 'testJsMessageExtGetNumber001': {
              try {
                this.controller.loadUrl('resource://rawfile/getJsMessageExt.html');
                setTimeout(() => {
                this.controller.runJavaScriptExt(
                  'getNumber()',
                  (error, result) => {
                    if (error) {
                      let e: BusinessError = error as BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                      Utils.emitEvent(e.code, 100014)
                    }
                    if (result) {
                      try {
                        let value = result.getNumber();
                        console.info(`get result :` + value)
                        Utils.emitEvent(value, 100014)
                      }
                      catch (resError) {
                        resError = resError as BusinessError;
                        let e: BusinessError = resError as BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(e.code, 100014)
                      }
                    }
                  });
                }, 2000)
              } catch (error) {
                error = error as BusinessError;
                let e: BusinessError = error as BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 100014)
              }
              break;
            }

            case 'testJsMessageExtGetBoolean002': {
              try {
                this.controller.loadUrl('resource://rawfile/getJsMessageExt.html');
                setTimeout(() => {
                this.controller.runJavaScriptExt(
                  'getBooleanFalse()',
                  (error, result) => {
                    if (error) {
                      let e: BusinessError = error as BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                      Utils.emitEvent(e.code, 100016)
                    }
                    if (result) {
                      try {
                        let value = result.getBoolean();
                        console.info(`get result :` + value)
                        Utils.emitEvent(value, 100016)
                      }
                      catch (resError) {
                        resError = resError as BusinessError;
                        let e: BusinessError = resError as BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(e.code, 100016)
                      }
                    }
                  });
                }, 2000)
              } catch (error) {
                error = error as BusinessError;
                let e: BusinessError = error as BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 100016)
              }
              break;
            }

            case 'testJsMessageExtGetArrayBuffer001': {
              try {
                this.controller.loadUrl('resource://rawfile/getJsMessageExt.html');
                setTimeout(() => {
                this.controller.runJavaScriptExt(
                  'getArrayBuffer()',
                  (error, result) => {
                    if (error) {
                      let e: BusinessError = error as BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                      Utils.emitEvent(e.code, 100017)
                    }
                    if (result) {
                      try {
                        let value = 'result type:' + typeof (result.getArrayBuffer());
                        console.info(`get result :` + value)
                        Utils.emitEvent(value, 100017)
                      }
                      catch (resError) {
                        resError = resError as BusinessError;
                        let e: BusinessError = resError as BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(e.code, 100017)
                      }
                    }
                  });
                }, 2000)
              } catch (error) {
                error = error as BusinessError;
                let e: BusinessError = error as BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 100017)
              }
              break;
            }

            case 'testJsMessageExtGetArray001': {
              try {
                this.controller.loadUrl('resource://rawfile/getJsMessageExt.html');
                setTimeout(() => {
                this.controller.runJavaScriptExt(
                  'getArray()',
                  (error, result) => {
                    if (error) {
                      let e: BusinessError = error as BusinessError;
                      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                      Utils.emitEvent(e.code, 100018)
                    }
                    if (result) {
                      try {
                        let value = result.getArray();
                        console.info(`get result :` + value)
                        if (value[0] == 'banana' && value[1] == 'apple' && value[2] == 'peach') {
                          Utils.emitEvent(true, 100018)
                        } else {
                          Utils.emitEvent(false, 100018)
                        }
                      }
                      catch (resError) {
                        resError = resError as BusinessError;
                        let e: BusinessError = resError as BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                        Utils.emitEvent(e.code, 100018)
                      }
                    }
                  });
                }, 2000)
              } catch (error) {
                error = error as BusinessError;
                let e: BusinessError = error as BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 100018)
              }
              break;
            }

            case 'SwitchNextPageStatic' : {
              let uiContext: UIContext = this.getUIContext();
              let router: Router = uiContext.getRouter();
              router.pushUrl({ url: 'pages/web' })
              console.log('push URL success')
            }

          }
        })
      }

      Web({ src: 'resource://rawfile/index.html', controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)

    }
  }
}
