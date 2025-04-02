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
struct webViewContJsMessageExtReturnError {
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  @State str: string = "emitJsMessageExtGetStringError";
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

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("webViewContJsMessageExtReturnError page valueChangeCallBack");
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
        Button("JsMessageExtErrorTest").key('webViewContJsMessageExtReturnError').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "emitJsMessageExtGetStringError": {
              this.controller.loadUrl($rawfile('testMessageExt.html'));
              await Utils.sleep(3000);
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
                        console.log(`log error code: ${resError.code}, Message: ${resError.message}`);
                        this.errorTestCode = resError.code;
                        this.errorMsg = resError.message;
                        console.error("emitJsMessageExtGetStringError runJavaScriptExt getString result is :" + this.errorTestCode + this.errorMsg);
                        Utils.emitEvent(this.errorTestCode, 816)
                        Utils.emitEvent(this.errorMsg, 817)
                        return;
                      }
                    }
                  });
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitJsMessageExtGetNumberError": {
              this.errorTestCode = 0;
              this.errorMsg = 'failed';
              this.controller.loadUrl($rawfile('testMessageExt.html'));
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
                        console.log(`log error code: ${resError.code}, Message: ${resError.message}`);
                        this.errorTestCode = resError.code;
                        this.errorMsg = resError.message;
                        console.error("emitJsMessageExtGetNumberError runJavaScriptExt getNumber result is :" + this.errorTestCode + this.errorMsg);
                        Utils.emitEvent(this.errorTestCode, 818)
                        Utils.emitEvent(this.errorMsg, 819)
                        return;
                      }
                    }
                  });
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitJsMessageExtGetBooleanError": {
              this.errorTestCode = 0;
              this.errorMsg = 'failed';
              this.controller.loadUrl($rawfile('testMessageExt.html'));
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
                        Utils.emitEvent(this.errorTestCode, 820)
                        Utils.emitEvent(this.errorMsg, 821)
                        return;
                      }
                    }
                  });
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitJsMessageExtGetArrayBufferError": {
              this.errorTestCode = 0;
              this.errorMsg = 'failed';
              this.controller.loadUrl($rawfile('testMessageExt.html'));
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
                        console.log(`log error code: ${resError.code}, Message: ${resError.message}`);
                        this.errorTestCode = resError.code;
                        this.errorMsg = resError.message;
                        console.error("emitJsMessageExtGetArrayBufferError runJavaScriptExt getArrayBuffer result is :" + this.errorTestCode + this.errorMsg);
                        Utils.emitEvent(this.errorTestCode, 822)
                        Utils.emitEvent(this.errorMsg, 823)
                        return;
                      }
                    }
                  });
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitJsMessageExtGetArrayError": {
              this.errorTestCode = 0;
              this.errorMsg = 'failed';
              this.controller.loadUrl($rawfile('testMessageExt.html'));
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
                        console.log(`log error code: ${resError.code}, Message: ${resError.message}`);
                        this.errorTestCode = resError.code;
                        this.errorMsg = resError.message;
                        console.error("emitJsMessageExtGetArrayError runJavaScriptExt getArray result is :" + this.errorTestCode + this.errorMsg);
                        Utils.emitEvent(this.errorTestCode, 824)
                        Utils.emitEvent(this.errorMsg, 825)
                        return;
                      }
                    }
                  });
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
          }
        })
      }

      Web({ src: 'www.example.com', controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
        .userAgent(this.userAgent)
        .zoomAccess(this.zoomAccess)
        .onPageEnd(err => {
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
                    console.log(`log error code: ${resError.code}, Message: ${resError.message}`);
                    return;
                  }
                }
              });
            console.info('url: ', err.url);
          } catch (error) {
            console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
          }
        })
    }
  }
}