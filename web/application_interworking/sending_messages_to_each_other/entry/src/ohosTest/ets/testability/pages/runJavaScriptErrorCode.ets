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
import {waitForAssert, waitForExist} from '../../test/WaitTest';

@Entry
@Component
struct runJavaScriptErrorCode {
  controller: webView.WebviewController = new webView.WebviewController();
  @State str: string = '';
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 180210,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(180210)
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
        Button('runJsError click').key('runJavaScriptErrorCodeButton').onClick(async () => {
          await waitForExist(()=>this.isReceive, this.str, 0, 1000);
          await waitForExist(()=>this.isPageEnd, this.str, 0, 1000);
          console.info('key==>' + this.str);
          this.isReceive = -1;
          switch (this.str) {
            case 'emitRunJavaScriptPromiseErrorCode001': {
              try {
                this.controller.runJavaScript('testArrayBuffer()')
                  .then((result) => {
                    console.info('runJavaScript promise result: ' + result);
                  })
                  .catch((error: BusinessError) => {
                    console.error('runJavaScript promise ErrorCode:' + error.code + ' Message:' + error.message);
                    console.error('ErrorCode type:' + typeof(error.code));
                    Utils.emitEvent(error.code, 26031901);
                  })
              } catch (error) {
                console.log('catch errorCode:' + error.code + 'message:' + error.message);
                Utils.emitEvent(error.code, 26031901);
              }
              break;
            }
            case 'emitRunJavaScriptCallbackErrorCode001': {
              try {
                this.controller.runJavaScript(
                  'testArrayBuffer()',
                  (error, result) => {
                    if (error) {
                      console.error('runJavaScript callback ErrorCode:' + error.code + ' Message:' + error.message);
                      console.error('ErrorCode type:' + typeof(error.code));
                      Utils.emitEvent(error.code, 26031902);
                      return;
                    }
                    if (result) {
                      console.info('runJavaScript callback result: ' + result);
                    }
                  })
              } catch (error) {
                console.log('catch errorCode:' + error.code + 'message:' + error.message);
                Utils.emitEvent(error.code, 26031902);
              }
              break;
            }
            case 'emitRunJavaScriptCallbackSetEmpty001': {
              try {
                this.controller.runJavaScript(
                  '',
                  (error, result) => {
                    if (error) {
                      console.error('runJavaScript callback ErrorCode:' + error.code + ' Message:' + error.message);
                      console.error('ErrorCode type:' + typeof(error.code));
                      Utils.emitEvent(error.code, 26032501);
                      return;
                    }
                    if (result) {
                      console.info('runJavaScript callback result: ' + result);
                      Utils.emitEvent(result, 26032501);
                    }
                  })
              } catch (error) {
                console.log('catch errorCode:' + error.code + 'message:' + error.message);
                Utils.emitEvent(error.code, 26032501);
              }
              break;
            }
            case 'emitRunJavaScriptCallbackSetNull001': {
              try {
                this.controller.runJavaScript(
                  null,
                  (error, result) => {
                    if (error) {
                      console.error('runJavaScript callback ErrorCode:' + error.code + ' Message:' + error.message);
                      console.error('ErrorCode type:' + typeof(error.code));
                      Utils.emitEvent(error.code, 26032502);
                      return;
                    }
                    if (result) {
                      console.info('runJavaScript callback result: ' + result);
                    }
                  })
              } catch (error) {
                console.log('catch errorCode:' + error.code + 'message:' + error.message);
                Utils.emitEvent(error.code, 26032502);
              }
              break;
            }
            case 'emitRunJavaScriptCallbackSetUndefined001': {
              try {
                this.controller.runJavaScript(
                  undefined,
                  (error, result) => {
                    if (error) {
                      console.error('runJavaScript callback ErrorCode:' + error.code + ' Message:' + error.message);
                      console.error('ErrorCode type:' + typeof(error.code));
                      Utils.emitEvent(error.code, 26032503);
                      return;
                    }
                    if (result) {
                      console.info('runJavaScript callback result: ' + result);
                    }
                  })
              } catch (error) {
                console.log('catch errorCode:' + error.code + 'message:' + error.message);
                Utils.emitEvent(error.code, 26032503);
              }
              break;
            }

          }
        })
      }

      Web({ src: $rawfile('runJavaScript.html'), controller: this.controller })
        .onPageEnd((event) => {
          console.log('onPageEnd url:' + event.url);
          this.isPageEnd = 0;
        })
    }
  }
}
