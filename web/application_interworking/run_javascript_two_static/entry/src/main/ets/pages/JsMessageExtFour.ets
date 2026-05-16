/*
 * Copyright (c) 2024-2026 Huawei Device Co., Ltd.
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

import { Entry, Component, Column, Row, Button, ClickEvent, Web, JavaScriptProxy } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import { BusinessError, Callback, RecordData } from '@ohos.base';

import webView from '@ohos.web.webview';
import emitter from '@ohos.events.emitter';
import events_emitter from '@ohos.events.emitter';

import Utils from '../../src/test/Util.test';


export class TestObj {
  private testReturnStr:string = '';
  constructor() {}
  testReturnObj() {
    this.testReturnStr = '';
    return this;
  }
  testReturnObj2(size: int) {
    this.testReturnStr = 'a'.repeat(size - 88) + 'b';
    return this;
  }
}

@Entry
@Component
struct jsMessageExtFour {
  controller: webView.WebviewController = new webView.WebviewController(undefined);
  message: webView.WebMessageExt = new webView.WebMessageExt();
  @State str: string = '';
  @State isReceive: int = -1;
  @State isPageEnd: int = -1;
  @State testObj: TestObj = new TestObj();
  jsObj:JavaScriptProxy = {
    jsObject: this.testObj,
    name: 'testObj',
    methodList: ['testReturnObj', 'testReturnObj2'],
    controller: this.controller
  }

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 144,
      priority: events_emitter.EventPriority.LOW
    };
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack);
  }

  onPageHide() {
    events_emitter.off(144);
  }

  private valueChangeCallBack: Callback<events_emitter.EventData> = (eventData: events_emitter.EventData):void => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      const data = eventData.data as Record<string, RecordData>;
      if (data != null && data['ACTION'] != null) {
        this.str = String(data['ACTION']);
        this.isReceive = 0;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button('JsMessageExtFour').key('JsMessageExtFourButton').onClick(() => {
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
                      if (errorDescription.includes('support type')) {
                        Utils.emitEvent(true, 25112127);
                      } else {
                        Utils.emitEvent(false, 25112127);
                      }
                    }
                  }
                })
              } catch (error) {
                let e: BusinessError = error as BusinessError;
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
                      let e: BusinessError = error as BusinessError;
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
                        if (errorDescription.includes('support type')) {
                          Utils.emitEvent(true, 25112130);
                        } else {
                          Utils.emitEvent(false, 25112130);
                        }
                      }
                    }
                  });
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
          }
        })
      }

      Web({ src: 'resource://rawfile/runJavascript.html', controller: this.controller })
        .javaScriptProxy(this.jsObj)
        .onPageEnd((event) => {
          if (event) {
            this.isPageEnd = 0;
            console.log(' onPageEnd url:' + event.url);
          }
        })
    }
  }
}
