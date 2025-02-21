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
import web_webview from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';
import business_error from '@ohos.base';

@Entry
@Component
struct WebViewControllerResumeAllTimers {
  @State str: string = ""
  @State isPause : Boolean = false
  @State isResume : Boolean = false
  @State text: String[] = ['', '']
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  controller1: web_webview.WebviewController = new web_webview.WebviewController();
  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(10)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("WebViewControllerResumeAllTimers").id('WebViewControllerResumeAllTimers').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {

            case "resumeAllTimers0100": {
              let isPause: boolean = false;
              let isResume: boolean = true;
              try {
                let num1: number = 0;
                let num2: number = 0;
                this.controller.runJavaScript("startTimer()");
                await Utils.sleep(2000);
                web_webview.WebviewController.pauseAllTimers()
                await Utils.sleep(2000);
                this.controller.runJavaScript("getNum()", (err, res) => {
                  console.info("key==>getNum1 res :" + JSON.stringify(res))
                  num1 = Number.parseInt(res);
                })
                await Utils.sleep(2000);
                this.controller.runJavaScript("getNum()", (err, res1) => {
                  console.info("key==>getNum2 res1 :" + JSON.stringify(res1))
                  num2 = Number.parseInt(res1);
                })
                await Utils.sleep(2000);
                if (num1 == num2) {
                  isPause = true;
                }
                await Utils.sleep(2000);
                web_webview.WebviewController.resumeAllTimers();
                await Utils.sleep(2000);
                this.controller.runJavaScript("getNum()", (err, res) => {
                  console.info("key==>getNum3 res :" + JSON.stringify(res))
                  num1 = Number.parseInt(res);
                })
                await Utils.sleep(2000);
                this.controller.runJavaScript("getNum()", (err, res) => {
                  console.info("key==>getNum4 res :" + JSON.stringify(res))
                  num2 = Number.parseInt(res);
                })
                if (num1 != num2) {
                  isResume = true;
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              console.info("isPause" +isPause )
              console.info("isResume" +isResume )
              setTimeout(() => {
                Utils.emitEvent(isPause && isResume, 501)
              }, 3000)
              break;
            }

            case "resumeAllTimers0200": {
              let isPause: boolean = false;
              let isResume: boolean = false;
              try {
                let num1: number = 0;
                let num2: number = 0;
                this.controller.runJavaScript("resetTimer()");
                web_webview.WebviewController.pauseAllTimers();
                this.controller.runJavaScript("changeTime()");
                await Utils.sleep(2000);
                this.controller.runJavaScript("getNum()", (err, res) => {
                  console.info("key==>getNum5 res :" + JSON.stringify(res))
                  num1 = Number.parseInt(res);
                })
                web_webview.WebviewController.resumeAllTimers();
                await Utils.sleep(2000);
                this.controller.runJavaScript("getNum()", (err, res) => {
                  console.info("key==>getNum6 res :" + JSON.stringify(res))
                  num2 = Number.parseInt(res);
                })
                await Utils.sleep(1000);
                if (num1 == 0) {
                  isPause = true;
                }
                await Utils.sleep(1000);
                if (num2 == 1) {
                  isResume = true;
                }
                await Utils.sleep(1000);
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              setTimeout(() => {
                Utils.emitEvent(isPause && isResume, 502)
              }, 3000)
              break;
            }

            case "resumeAllTimers0300": {
              let isPause: boolean = false;
              let ErrorCode: boolean = false;
              try {
                let num1: number = 0;
                this.controller.runJavaScript("resetTimer()");
                await Utils.sleep(1000);
                this.controller.runJavaScript("changeTime()");
                web_webview.WebviewController.pauseAllTimers();
                await Utils.sleep(1000);
                this.controller.runJavaScript("getNum()", (err, res) => {
                  console.info("key==>getNum7 res :" + JSON.stringify(res))
                  num1 = Number.parseInt(res);
                })
                web_webview.WebviewController.pauseAllTimers();
                await Utils.sleep(1000);
                await Utils.sleep(1000);
                if (num1 == 0) {
                  isPause = true;
                }
                await Utils.sleep(1000);
                web_webview.WebviewController.resumeAllTimers();
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                this.text[0] = e.code.toString()
              }
              await Utils.sleep(1000);
              if (this.text[0] =='') {
                ErrorCode = true;
              }
              setTimeout(() => {
                Utils.emitEvent(isPause && ErrorCode, 503)
              }, 3000)
              break;
            }

            case "resumeAllTimers0400": {
              let isPause: boolean = false;
              let isResume: boolean = false;
              let ErrorCode: boolean = false;
              try {
                let num1: number = 0;
                let num2: number = 0;
                this.controller.runJavaScript("resetTimer()");
                this.controller.runJavaScript("startTimer()");
                await Utils.sleep(2000);
                web_webview.WebviewController.pauseAllTimers()
                await Utils.sleep(2000);
                this.controller.runJavaScript("getNum()", (err, res) => {
                  console.info("key==>getNum9 res :" + JSON.stringify(res))
                  num1 = Number.parseInt(res);
                })
                await Utils.sleep(2000);
                this.controller.runJavaScript("getNum()", (err, res1) => {
                  console.info("key==>getNum10 res1 :" + JSON.stringify(res1))
                  num2 = Number.parseInt(res1);
                })
                await Utils.sleep(2000);
                if (num1 == num2) {
                  isPause = true;
                }
                await Utils.sleep(2000);
                web_webview.WebviewController.resumeAllTimers();
                await Utils.sleep(2000);
                this.controller.runJavaScript("getNum()", (err, res) => {
                  console.info("key==>getNum11 res :" + JSON.stringify(res))
                  num1 = Number.parseInt(res);
                })
                await Utils.sleep(2000);
                this.controller.runJavaScript("getNum()", (err, res) => {
                  console.info("key==>getNum12 res :" + JSON.stringify(res))
                  num2 = Number.parseInt(res);
                })
                if (num1 != num2) {
                  isResume = true;
                }
                await Utils.sleep(1000);
                web_webview.WebviewController.resumeAllTimers();
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode2: ${e.code},  Message2: ${e.message}`);
                this.text[1] = e.code.toString()
              }
              await Utils.sleep(1000);
              if (this.text[1] =='') {
                ErrorCode = true;
              }
              setTimeout(() => {
                Utils.emitEvent((isPause && isResume)&& ErrorCode, 504)
              }, 3000)
              break;
            }

            case "resumeAllTimers0500": {
              let isPause: boolean = false;
              try {
                let num1: number = 0;
                this.controller.runJavaScript("resetTimer()");
                web_webview.WebviewController.pauseAllTimers();
                this.controller.runJavaScript("startTimer()");
                await Utils.sleep(2000);
                this.controller.runJavaScript("getNum()", (err, res) => {
                  console.info("key==>getNum13 res :" + JSON.stringify(res))
                  num1 = Number.parseInt(res);
                })
                await Utils.sleep(2000);
                if (num1 == 0) {
                  isPause = true;
                }
                web_webview.WebviewController.resumeAllTimers();
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              setTimeout(() => {
                Utils.emitEvent(isPause, 505)
              }, 3000)
              break;
            }

            case "resumeAllTimers0600": {
              let isPause: boolean = false;
              try {
                let num1: number = 0;
                this.controller.runJavaScript("resetTimer()");
                web_webview.WebviewController.pauseAllTimers();
                this.controller.runJavaScript("changeTime()");
                await Utils.sleep(2000);
                this.controller.runJavaScript("getNum()", (err, res) => {
                  console.info("key==>getNum14 res :" + JSON.stringify(res))
                  num1 = Number.parseInt(res);
                })
                await Utils.sleep(1000);
                if (num1 == 0) {
                  isPause = true;
                }
                await Utils.sleep(1000);
                web_webview.WebviewController.resumeAllTimers();
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              setTimeout(() => {
                Utils.emitEvent(isPause, 506)
              }, 3000)
              break;
            }

            case "resumeAllTimers0700": {
              let isPause: boolean = false;
              let isResume: boolean = false;
              try {
                let num1: number = 0;
                let num2: number = 0;
                let num3: number = 0;
                let num4: number = 0;
                this.controller.runJavaScript("resetTimer()");
                this.controller1.runJavaScript("resetTimer()");
                this.controller.runJavaScript("startTimer()");
                this.controller1.runJavaScript("startTimer()");
                await Utils.sleep(2000);
                web_webview.WebviewController.pauseAllTimers();
                await Utils.sleep(2000);
                this.controller.runJavaScript("getNum()", (err, res) => {
                  console.info("key==>getNum15 res :" + JSON.stringify(res))
                  num1 = Number.parseInt(res);
                })
                this.controller1.runJavaScript("getNum()", (err, res) => {
                  console.info("key==>getNum16 res :" + JSON.stringify(res))
                  num2 = Number.parseInt(res);
                })
                await Utils.sleep(1000);
                this.controller.runJavaScript("startTimer()");
                this.controller1.runJavaScript("startTimer()");
                await Utils.sleep(2000);
                this.controller.runJavaScript("getNum()", (err, res) => {
                  console.info("key==>getNum17 res :" + JSON.stringify(res))
                  num3 = Number.parseInt(res);
                })
                await Utils.sleep(1000);
                this.controller1.runJavaScript("getNum()", (err, res) => {
                  console.info("key==>getNum18 res :" + JSON.stringify(res))
                  num4 = Number.parseInt(res);
                })
                await Utils.sleep(1000);
                if ((num1 == num3)&&(num2 == num4)) {
                  isPause = true;
                }
                await Utils.sleep(1000);
                web_webview.WebviewController.resumeAllTimers();
                this.controller.runJavaScript("resetTimer()");
                this.controller1.runJavaScript("resetTimer()");
                this.controller.runJavaScript("startTimer()");
                this.controller1.runJavaScript("startTimer()");
                await Utils.sleep(2000);
                this.controller.runJavaScript("getNum()", (err, res) => {
                  console.info("key==>getNum19 res :" + JSON.stringify(res))
                  num1 = Number.parseInt(res);
                })
                this.controller1.runJavaScript("getNum()", (err, res) => {
                  console.info("key==>getNum20 res :" + JSON.stringify(res))
                  num2 = Number.parseInt(res);
                })
                await Utils.sleep(2000);
                this.controller.runJavaScript("getNum()", (err, res) => {
                  console.info("key==>getNum21 res :" + JSON.stringify(res))
                  num3 = Number.parseInt(res);
                })
                this.controller1.runJavaScript("getNum()", (err, res) => {
                  console.info("key==>getNum22 res :" + JSON.stringify(res))
                  num4 = Number.parseInt(res);
                })
                await Utils.sleep(1000);
                if ((num1 != num3)&&(num2 != num4)) {
                  isResume = true;
                }
                await Utils.sleep(1000);
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              setTimeout(() => {
                Utils.emitEvent(isPause&&isResume, 507)
              }, 3000)
              break;
            }
          }
        })
      }

      Web({ src: $rawfile("index_resumeAllTimers.html"), controller: this.controller })
      Web({ src: $rawfile("index_resumeAllTimers1.html"), controller: this.controller1 })
    }
  }
}
