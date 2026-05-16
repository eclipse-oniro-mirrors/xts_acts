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

@Entry
@Component
struct runJavaScriptExt {
  controller: webView.WebviewController = new webView.WebviewController();
  message: webView.WebMessageExt = new webView.WebMessageExt();
  @State str: string = '';
  @State ports: webView.WebMessagePort[] = [];
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 261010,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(261010)
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
        Button('runJavaScriptExt click').key('runJavaScriptExtButton').onClick(async () => {
          await waitForExist(() => this.isPageEnd, this.str, 0, 1000);
          await waitForExist(() => this.isReceive, this.str, 0, 1000);
          this.isReceive = -1;
          console.info('key==>' + this.str)
          switch (this.str) {
            case 'emitRunJavaScriptExtPromiseGetType001': {
              try {
                this.controller.runJavaScriptExt('getString()')
                  .then((result) => {
                    let type = result.getType();
                    console.log(this.str + 'type==>' + type);
                    Utils.emitEvent(type, 26031005)
                    let value = result.getString();
                    console.log(this.str + 'value==>' + value);
                    Utils.emitEvent(value, 26031006)
                  })
                  .catch((error: business_error.BusinessError) => {
                    console.error('error: ' + JSON.stringify(error));
                  })

              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }

            case 'emitRunJavaScriptExtPromiseGetType002': {
              try {
                this.controller.runJavaScriptExt('getNumber()')
                  .then((result) => {
                    let type = result.getType();
                    console.log(this.str + 'type==>' + type);
                    Utils.emitEvent(type, 26031007)
                    let value = result.getNumber();
                    console.log(this.str + 'value==>' + value);
                    Utils.emitEvent(value, 26031008)
                  })
                  .catch((error: business_error.BusinessError) => {
                    console.error('error: ' + JSON.stringify(error));
                  })

              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }

            case 'emitRunJavaScriptExtPromiseGetType003': {
              try {
                this.controller.runJavaScriptExt('getBoolean()')
                  .then((result) => {
                    let type = result.getType();
                    console.log(this.str + 'type==>' + type);
                    Utils.emitEvent(type, 26031009)
                    let value = result.getBoolean();
                    console.log(this.str + 'value==>' + value);
                    Utils.emitEvent(value, 26031010)
                  })
                  .catch((error: business_error.BusinessError) => {
                    console.error('error: ' + JSON.stringify(error));
                  })

              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }

            case 'emitRunJavaScriptExtPromiseGetType004': {
              try {
                this.controller.runJavaScriptExt('getArrayBuffer()')
                  .then((result) => {
                    let type = result.getType();
                    console.log(this.str + 'type==>' + type);
                    Utils.emitEvent(type, 26031011)
                    let value = result.getArrayBuffer();
                    console.log(this.str + 'value==>' + value);
                    if (result.getArrayBuffer()) {
                      Utils.emitEvent(true, 26031012)
                    } else {
                      Utils.emitEvent(false, 26031012)
                    }
                  })
                  .catch((error: business_error.BusinessError) => {
                    console.error('error: ' + JSON.stringify(error));
                  })

              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }

            case 'emitRunJavaScriptExtPromiseGetType005': {
              try {
                this.controller.runJavaScriptExt('getArray()')
                  .then((result) => {
                    let type = result.getType();
                    console.log(this.str + 'type==>' + type);
                    Utils.emitEvent(type, 26031013)
                    let value = result.getArray();
                    console.log(this.str + 'value==>' + value);
                    if (value[0] == 'banana' && value[1] == 'apple' && value[2] == 'peach') {
                      Utils.emitEvent(true, 26031014)
                    } else {
                      Utils.emitEvent(false, 26031014)
                    }
                  })
                  .catch((error: business_error.BusinessError) => {
                    console.error('error: ' + JSON.stringify(error));
                  })

              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
          }
        })
      }

      Web({ src: $rawfile('getJsMessageExt.html'), controller: this.controller })
        .onPageEnd((event) => {
          if (event) {
            this.isPageEnd = 0;
            console.log(' onPageEnd url:' + event.url);
           }
        })
    }
  }
}
