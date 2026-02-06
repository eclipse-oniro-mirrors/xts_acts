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
import Utils from '../../test/Utils';
import web_webview from '@ohos.web.webview';

const EVENT_ID_SET_EMIT_KEY = 111670;

@Entry
@Component
struct webViewContJsMessageExtReturnError {
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  @State str: string = "";
  @State userAgent: string = "Mozilla/5.0 (Window NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko)" +
    " CHrome/105.0.0.0 Safari/537.36 Edg/105.0.1343.27";
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = false;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State errorTestCode: number = 0;
  @State errorMsg: string = 'failed';
  @State isFirstPageEnd: number = -1;
  @State isPageEnd: number = -1;
  @State isReceive: number = -1;

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
    console.info("webViewContJsMessageExtReturnError page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data?.ACTION != null) {
        this.str = eventData.data?.ACTION;
        this.isReceive = 1;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("JsMessageExtErrorTest").key('webViewContJsMessageExtReturnError').onClick(async () => {
          await Utils.waitForExist(()=>this.isReceive, 'webViewContJsMessageExtReturnErrorIsReceive', 1, 1000);
          console.info("key==>" + this.str)
          this.isReceive = -1;
          switch (this.str) {
            case "emitJsMessageExtGetStringError": {
              this.controller.loadUrl($rawfile('testMessageExt.html'));
              await Utils.waitForExist(()=>this.isPageEnd, 'webViewContJsMessageExtReturnErrorIsPageEnd', 1, 1000);
              this.isPageEnd = -1;
              try {
                this.controller.runJavaScriptExt(
                  'testArray()',
                  (error, result) => {
                    if (error) {
                      console.info(`run JavaScript error: ` + JSON.stringify(error))
                      return;
                    }
                    if (result) {
                      try {
                        let type = result.getType();
                        console.info('run JavaScript result.getType(): ' + type)
                        result.getString();
                      }
                      catch (resError) {
                        this.errorTestCode = resError.code;
                        this.errorMsg = resError.message;
                        console.info("emitJsMessageExtGetStringError runJavaScriptExt getString result is :" + this.errorTestCode + this.errorMsg);
                        Utils.emitEvent(this.errorTestCode, 111680)
                        Utils.emitEvent(this.errorMsg, 111690)
                        return;
                      }
                    }
                  });
              } catch (error) {
                console.error(`runJavaScriptExt fail, ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitJsMessageExtGetNumberError": {
              this.errorTestCode = 0;
              this.errorMsg = 'failed';
              this.controller.loadUrl($rawfile('testMessageExt.html'));
              await Utils.waitForExist(()=>this.isPageEnd, 'webViewContJsMessageExtReturnErrorIsPageEnd', 1, 1000);
              this.isPageEnd = -1;
              try {
                this.controller.runJavaScriptExt(
                  'testArrayBuffer()',
                  (error, result) => {
                    if (error) {
                      console.info(`run JavaScript error: ` + JSON.stringify(error))
                      return;
                    }
                    if (result) {
                      try {
                        let type = result.getType();
                        console.info('run JavaScript result.getType(): ' + type)
                        result.getNumber();
                      }
                      catch (resError) {
                        this.errorTestCode = resError.code;
                        this.errorMsg = resError.message;
                        console.info("emitJsMessageExtGetNumberError runJavaScriptExt getNumber result is :" + this.errorTestCode + this.errorMsg);
                        Utils.emitEvent(this.errorTestCode, 111700)
                        Utils.emitEvent(this.errorMsg, 111710)
                        return;
                      }
                    }
                  });
              } catch (error) {
                console.error(`runJavaScriptExt fail, ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitJsMessageExtGetBooleanError": {
              this.errorTestCode = 0;
              this.errorMsg = 'failed';
              this.controller.loadUrl($rawfile('testMessageExt.html'));
              await Utils.waitForExist(()=>this.isPageEnd, 'webViewContJsMessageExtReturnErrorIsPageEnd', 1, 1000);
              this.isPageEnd = -1;
              try {
                this.controller.runJavaScriptExt(
                  'testNumber()',
                  (error, result) => {
                    if (error) {
                      console.info(`run JavaScript error: ` + JSON.stringify(error))
                      return;
                    }
                    if (result) {
                      try {
                        let type = result.getType();
                        console.info('run JavaScript result.getType(): ' + type)
                        result.getBoolean();
                      }
                      catch (resError) {
                        console.log(`log error code: ${resError.code}, Message: ${resError.message}`);
                        this.errorTestCode = resError.code;
                        this.errorMsg = resError.message;
                        console.error("emitJsMessageExtGetBooleanError runJavaScriptExt getBoolean result is :" + this.errorTestCode + this.errorMsg);
                        Utils.emitEvent(this.errorTestCode, 111720)
                        Utils.emitEvent(this.errorMsg, 111730)
                        return;
                      }
                    }
                  });
              } catch (error) {
                console.error(`runJavaScriptExt fail, ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitJsMessageExtGetArrayBufferError": {
              this.errorTestCode = 0;
              this.errorMsg = 'failed';
              this.controller.loadUrl($rawfile('testMessageExt.html'));
              await Utils.waitForExist(()=>this.isPageEnd, 'webViewContJsMessageExtReturnErrorIsPageEnd', 1, 1000);
              this.isPageEnd = -1;
              try {
                this.controller.runJavaScriptExt(
                  'testBoolean()',
                  (error, result) => {
                    if (error) {
                      console.info(`run JavaScript error: ` + JSON.stringify(error))
                      return;
                    }
                    if (result) {
                      try {
                        let type = result.getType();
                        console.info('run JavaScript result.getType(): ' + type)
                        result.getArrayBuffer();
                      }
                      catch (resError) {
                        this.errorTestCode = resError.code;
                        this.errorMsg = resError.message;
                        console.error("emitJsMessageExtGetArrayBufferError runJavaScriptExt getArrayBuffer result is :" + this.errorTestCode + this.errorMsg);
                        Utils.emitEvent(this.errorTestCode, 111740)
                        Utils.emitEvent(this.errorMsg, 111750)
                        return;
                      }
                    }
                  });
              } catch (error) {
                console.error(`runJavaScriptExt fail, ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitJsMessageExtGetArrayError": {
              this.errorTestCode = 0;
              this.errorMsg = 'failed';
              this.controller.loadUrl($rawfile('testMessageExt.html'));
              await Utils.waitForExist(()=>this.isPageEnd, 'webViewContJsMessageExtReturnErrorIsPageEnd', 1, 1000);
              this.isPageEnd = -1;
              try {
                this.controller.runJavaScriptExt(
                  'testString()',
                  (error, result) => {
                    if (error) {
                      console.info(`run JavaScript error: ` + JSON.stringify(error))
                      return;
                    }
                    if (result) {
                      try {
                        let type = result.getType();
                        console.info('run JavaScript result.getType(): ' + type)
                        result.getArray();
                      }
                      catch (resError) {
                        this.errorTestCode = resError.code;
                        this.errorMsg = resError.message;
                        console.info("emitJsMessageExtGetArrayError runJavaScriptExt getArray result is :" + this.errorTestCode + this.errorMsg);
                        Utils.emitEvent(this.errorTestCode, 111760)
                        Utils.emitEvent(this.errorMsg, 111770)
                        return;
                      }
                    }
                  });
              } catch (error) {
                console.error(`runJavaScriptExt fail, ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
          }
        })
      }

      Web({ src: 'www.example.com', controller: this.controller })
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
        .userAgent(this.userAgent)
        .onPageEnd((event) => {
          console.log('onPageEnd url:' + event.url);
          if (this.isFirstPageEnd === -1) {
            this.isFirstPageEnd = 1;
          } else {
            this.isPageEnd = 1;
          }
        })
    }
  }
}