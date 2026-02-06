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

import Utils from '../../test/Utils.test';
import web_webview from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';
import business_error from '@ohos.base';
import { BusinessError } from '@ohos.base';
import { waitForExist } from '../../test/WaitTest.test';

@Entry
@Component
struct WebViewControllerResumeAllTimers {
  @State str: string = ""
  @State isPause : Boolean = false
  @State isResume : Boolean = false
  @State text: String[] = ['', '']
  @State isPageEnd: number = -1;
  @State isReceive: number = -1;
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  controller1: web_webview.WebviewController = new web_webview.WebviewController();
  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 132680,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(132680)
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
        Button("WebViewControllerResumeAllTimers").id('WebViewControllerResumeAllTimers').onClick(async () => {
          console.info('key==>' + this.str)
          await waitForExist(() => this.isPageEnd, this.str, 0);
          await waitForExist(() => this.isReceive, this.str, 0);
          this.isReceive = -1;
          switch (this.str) {

            case "resumeAllTimers0100": {
              let isPause: boolean = false;
              let isResume: boolean = true;
              try {
                let flag: boolean = false;
                let num1: number = 0;
                let num2: number = 0;
                this.controller.runJavaScript("startTimer()", () => {
                  flag = true;
                })
                await waitForExist(() => flag ? 1 : 0, this.str, 1);
                web_webview.WebviewController.pauseAllTimers()
                this.controller.runJavaScript("getNum()", (err, res) => {
                  console.info('key==>getNum1 res :' + JSON.stringify(res))
                  num1 = Number.parseInt(res);
                })
                await waitForExist(() => (num1 > 0) ? 1 : 0, this.str, 1);
                this.controller.runJavaScript("getNum()", (err, res1) => {
                  console.info('key==>getNum2 res1 :' + JSON.stringify(res1))
                  num2 = Number.parseInt(res1);
                })
                await waitForExist(() => num2, this.str, num1);
                if (num1 == num2) {
                  isPause = true;
                }
                await waitForExist(() => isPause ? 1 : 0, this.str, 1);
                web_webview.WebviewController.resumeAllTimers();
                this.controller.runJavaScript("getNum()", (err, res) => {
                  console.info('key==>getNum3 res :' + JSON.stringify(res))
                  num1 = Number.parseInt(res);
                })
                await waitForExist(() => (num1 > 0) ? 1 : 0, this.str, 1);
                this.controller.runJavaScript("getNum()", (err, res) => {
                  console.info('key==>getNum4 res :' + JSON.stringify(res))
                  num2 = Number.parseInt(res);
                })
                await waitForExist(() => (num2 > 0 && num2 != num1) ? 1 : 0, this.str, 1);
                if (num1 != num2) {
                  isResume = true;
                }
                await waitForExist(() => isResume ? 1 : 0, this.str, 1);
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              console.info('isPause' +isPause )
              console.info('isResume' +isResume )
              await waitForExist(() => isPause && isResume ? 1 : 0, this.str, 1);
              Utils.emitEvent(isPause && isResume, 132690)
              break;
            }

            case "resumeAllTimers0300": {
              let isPause: boolean = false;
              let ErrorCode: boolean = false;
              let flag: boolean = false;
              try {
                let num1: number = 0;
                this.controller.runJavaScript("resetTimer()", () => {
                  flag = true;
                })
                await waitForExist(() => flag ? 1 : 0, this.str, 1);
                this.controller.runJavaScript("changeTime()");
                web_webview.WebviewController.pauseAllTimers();
                this.controller.runJavaScript("getNum()", (err, res) => {
                  console.info('key==>getNum7 res :' + JSON.stringify(res))
                  num1 = Number.parseInt(res);
                })
                await waitForExist(() => num1, this.str, 0);
                web_webview.WebviewController.pauseAllTimers();
                if (num1 == 0) {
                  isPause = true;
                }
                await waitForExist(() => isPause ? 1 : 0, this.str, 1);
                web_webview.WebviewController.resumeAllTimers();
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                this.text[0] = e.code.toString()
              }
              await waitForExist(() => this.text[0], this.str, '');
              if (this.text[0] =='') {
                ErrorCode = true;
              }
              await waitForExist(() => isPause && ErrorCode ? 1 : 0, this.str, 1);
              Utils.emitEvent(isPause && ErrorCode, 132710)
              break;
            }

            case "resumeAllTimers0400": {
              let isPause: boolean = false;
              let isResume: boolean = false;
              let ErrorCode: boolean = false;
              try {
                let num1: number = 0;
                let num2: number = 0;
                let flag: boolean = false;
                this.controller.runJavaScript("resetTimer()");
                this.controller.runJavaScript("startTimer()", () => {
                  flag = true;
                });
                await waitForExist(() => flag ? 1 : 0, this.str, 1);
                web_webview.WebviewController.pauseAllTimers()
                this.controller.runJavaScript("getNum()", (err, res) => {
                  console.info('key==>getNum9 res :' + JSON.stringify(res))
                  num1 = Number.parseInt(res);
                })
                this.controller.runJavaScript("getNum()", (err, res1) => {
                  console.info('key==>getNum10 res1 :' + JSON.stringify(res1))
                  num2 = Number.parseInt(res1);
                })
                await waitForExist(() => (num1 == num2) ? 1 : 0, this.str, 1);
                if (num1 == num2) {
                  isPause = true;
                }
                web_webview.WebviewController.resumeAllTimers();
                this.controller.runJavaScript("getNum()", (err, res) => {
                  console.info('key==>getNum11 res :' + JSON.stringify(res))
                  num1 = Number.parseInt(res);
                })
                await waitForExist(() => (num1 > 0) ? 1 : 0, this.str, 1);
                this.controller.runJavaScript("getNum()", (err, res) => {
                  console.info('key==>getNum12 res :' + JSON.stringify(res))
                  num2 = Number.parseInt(res);
                })
                await waitForExist(() => (num2 > 0 && num2 != num1) ? 1 : 0, this.str, 1);
                if (num1 != num2) {
                  isResume = true;
                }
                web_webview.WebviewController.resumeAllTimers();
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode2: ${e.code},  Message2: ${e.message}`);
                this.text[1] = e.code.toString()
              }
              await waitForExist(() => this.text[1], this.str, '');
              if (this.text[1] =='') {
                ErrorCode = true;
              }
              await waitForExist(() => (isPause && isResume) && ErrorCode ? 1 : 0, this.str, 1);
              Utils.emitEvent((isPause && isResume)&& ErrorCode, 132720)
              break;
            }

            case "resumeAllTimers0500": {
              let isPause: boolean = false;
              try {
                let num1: number = -1;
                let flag: boolean = false;
                this.controller.runJavaScript("resetTimer()");
                web_webview.WebviewController.pauseAllTimers();
                flag = false;
                this.controller.runJavaScript("startTimer()", () => {
                  flag = true;
                })
                await waitForExist(() => flag ? 1 : 0, this.str, 1);
                this.controller.runJavaScript("getNum()", (err, res) => {
                  console.info('key==>getNum13 res :' + JSON.stringify(res))
                  num1 = Number.parseInt(res);
                })
                await waitForExist(() => num1, this.str, 0);
                if (num1 == 0) {
                  isPause = true;
                }
                web_webview.WebviewController.resumeAllTimers();
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              await waitForExist(() => isPause ? 1 : 0, this.str, 1);
              Utils.emitEvent(isPause, 132730)
              break;
            }

            case "resumeAllTimers0600": {
              let isPause: boolean = false;
              try {
                let num1: number = -1;
                let flag: boolean = false;
                this.controller.runJavaScript("resetTimer()");
                web_webview.WebviewController.pauseAllTimers();
                flag = false;
                this.controller.runJavaScript("changeTime()", () => {
                  flag = true;
                })
                await waitForExist(() => flag ? 1 : 0, this.str, 1);
                this.controller.runJavaScript("getNum()", (err, res) => {
                  console.info('key==>getNum14 res :' + JSON.stringify(res))
                  num1 = Number.parseInt(res);
                })
                await waitForExist(() => num1, this.str, 0);
                if (num1 == 0) {
                  isPause = true;
                }
                web_webview.WebviewController.resumeAllTimers();
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              await waitForExist(() => isPause, this.str, 1);
              Utils.emitEvent(isPause, 132740)
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
                let flag: boolean = false;
                this.controller.runJavaScript("resetTimer()");
                this.controller1.runJavaScript("resetTimer()");
                this.controller.runJavaScript("startTimer()");
                this.controller1.runJavaScript("startTimer()", () => {
                  flag = true;
                })
                await waitForExist(() => flag ? 1 : 0, this.str, 1);
                web_webview.WebviewController.pauseAllTimers();
                this.controller.runJavaScript("getNum()", (err, res) => {
                  console.info('key==>getNum15 res :' + JSON.stringify(res))
                  num1 = Number.parseInt(res);
                })
                this.controller1.runJavaScript("getNum()", (err, res) => {
                  console.info('key==>getNum16 res :' + JSON.stringify(res))
                  num2 = Number.parseInt(res);
                })
                this.controller.runJavaScript("startTimer()");
                flag = false;
                this.controller1.runJavaScript("startTimer()", () => {
                  flag = true;
                })
                await waitForExist(() => flag ? 1 : 0, this.str, 1);
                this.controller.runJavaScript("getNum()", (err, res) => {
                  console.info('key==>getNum17 res :' + JSON.stringify(res))
                  num3 = Number.parseInt(res);
                })
                await waitForExist(() => (num3 == num1) ? 1 : 0, this.str, 1);
                this.controller1.runJavaScript("getNum()", (err, res) => {
                  console.info('key==>getNum18 res :' + JSON.stringify(res))
                  num4 = Number.parseInt(res);
                })
                await waitForExist(() => (num4 == num2) ? 1 : 0, this.str, 1);
                if ((num1 == num3)&&(num2 == num4)) {
                  isPause = true;
                }
                await waitForExist(() => isPause ? 1 : 0, this.str, 1);
                web_webview.WebviewController.resumeAllTimers();
                this.controller.runJavaScript("resetTimer()");
                this.controller1.runJavaScript("resetTimer()");
                this.controller.runJavaScript("startTimer()");
                flag = false;
                this.controller1.runJavaScript("startTimer()", () => {
                  flag = true;
                })
                await waitForExist(() => flag ? 1 : 0, this.str, 1);
                this.controller.runJavaScript("getNum()", (err, res) => {
                  console.info('key==>getNum19 res :' + JSON.stringify(res))
                  num1 = Number.parseInt(res);
                })
                this.controller1.runJavaScript("getNum()", (err, res) => {
                  console.info('key==>getNum20 res :' + JSON.stringify(res))
                  num2 = Number.parseInt(res);
                })
                await waitForExist(() => (num3 != num1) ? 1 : 0, this.str, 1);
                this.controller.runJavaScript("getNum()", (err, res) => {
                  console.info('key==>getNum21 res :' + JSON.stringify(res))
                  num3 = Number.parseInt(res);
                })
                this.controller1.runJavaScript("getNum()", (err, res) => {
                  console.info('key==>getNum22 res :' + JSON.stringify(res))
                  num4 = Number.parseInt(res);
                })
                await waitForExist(() => (num4 != num2) ? 1 : 0, this.str, 1);
                if ((num1 != num3)&&(num2 != num4)) {
                  isResume = true;
                }
                await waitForExist(() => isResume ? 1 : 0, this.str, 1);
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              await waitForExist(() => isPause && isResume, this.str, 1);
              Utils.emitEvent(isPause && isResume, 132750)
              break;
            }
          }
        })
      }

      Web({ src: $rawfile("index_resumeAllTimers.html"), controller: this.controller })
        .onPageEnd((event) => {
          console.log('web pageEnd==>' + event.url);
          this.isPageEnd = 0;
        })
      Web({ src: $rawfile("index_resumeAllTimers1.html"), controller: this.controller1 })
        .onPageEnd((event) => {
          console.log('web pageEnd==>' + event.url);
          this.isPageEnd = 0;
        })
    }
  }
}
