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
struct webViewOnScroll {
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  @State str: string = "emitOnscroll";
  @State textX: number = 100;
  @State textY: number = 100;
  @State firstId: number = 312;
  @State secondId: number = 314;
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = false;
  @State imageAccess: boolean = true;
  @State userAgentPC:string = "";
  @State pageResult: boolean = false;
  @State pageResult2: boolean = false;
  @State onlineImageAccess: boolean = true;
  @State checkEleResultAgain: string = "";
  @State checkEleResult1: string = "";
  @State checkEleResult2: string = "";
  @State checkEleResult3: string = "";
  @State checkEleResult: number[] = [];
  @State databaseAccess: boolean = true;
  @State flag: boolean = false;
  @State userAgent: string = "Mozilla/5.0 (Window NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko)" +
    " CHrome/105.0.0.0 Safari/537.36 Edg/105.0.1343.27";

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("webViewOnScroll page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data?.ACTION != null) {
        this.str = eventData.data?.ACTION;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("web click").key('webViewOnScroll').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "emitOnscroll": {
              try {
                this.flag = true
                this.controller.scrollBy(this.textX, this.textY);
                await Utils.sleep(1000)
                console.log("action of emitOnscroll is scrollBy" + this.textX + this.textY);
                this.flag = false
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitOnscrollAgain": {
              try {
                this.flag = true
                this.firstId = 316;
                this.secondId = 318;
                this.textX = -50;
                this.textY = -50;
                this.controller.scrollBy(this.textX, this.textY);
                await Utils.sleep(1000)
                console.log("action of emitOnscroll is scrollBy" + this.textX + this.textY);
                this.flag = false
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitpageDown": {
              try {
                this.controller.loadUrl($rawfile('indexCopyTwo.html'))
                await Utils.sleep(3000)
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("Tablet")) {
                  this.controller.loadUrl($rawfile('indexCopyTwoTablet.html'))
                  await Utils.sleep(3000)
                }
                this.controller.runJavaScript("checkVIsible()", (error, result) => {
                  this.checkEleResult = JSON.parse(result)
                  console.log(`The checkVIsible() return value is: ${result}`);
                })
                this.controller.pageDown(false);
                await Utils.sleep(3000)
                this.controller.runJavaScript("checkVIsible()", (error, result) => {
                  this.checkEleResultAgain = JSON.parse(result)
                  console.log(`The checkVIsible() again return value is: ${result}`);
                  if (this.checkEleResult[3] < JSON.parse(result)[3] && JSON.parse(result)[3] <
                    (JSON.parse(result)[1] / 2)) {
                    this.pageResult = true;
                    console.log('emitpageDown result is :' + this.pageResult);
                  } else {
                    this.pageResult = false;
                    console.log('emitpageDown result is :' + this.pageResult);
                  }
                })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                this.pageResult = false;
              }
              this.controller.runJavaScript("test()", (res) => {
                Utils.emitEvent(this.pageResult, 106)
              })
              break;
            }
            case "emitpageUp": {
              try {
                this.controller.runJavaScript("checkVIsible()", (error, result) => {
                  this.checkEleResult = JSON.parse(result)
                  console.log(`The checkVIsible() return value is: ${result}`);
                })
                this.controller.pageUp(false);
                await Utils.sleep(3000)
                this.controller.runJavaScript("checkVIsible()", (error, result) => {
                  this.checkEleResultAgain = JSON.parse(result)
                  console.log(`The checkVIsible() again return value is: ${result}`);
                  if (JSON.parse(result)[3] == 0) {
                    this.pageResult = true;
                    console.log('emitpageUp result is :' + this.pageResult);
                  } else {
                    this.pageResult = false;
                    console.log('emitpageUp result is :' + this.pageResult);
                  }
                })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                this.pageResult = false;
              }
              this.controller.runJavaScript("test()", (res) => {
                Utils.emitEvent(this.pageResult, 108)
              })
              break;
            }
            case "emitpageDownAgain": {
              try {
                this.controller.runJavaScript("checkVIsible()", (error, result) => {
                  this.checkEleResult = JSON.parse(result)
                  console.log(`The checkVIsible() return value is: ${result}`);
                })
                this.controller.pageDown(true);
                await Utils.sleep(3000)
                this.controller.runJavaScript("checkVIsible()", (error, result) => {
                  this.checkEleResultAgain = JSON.parse(result)
                  console.log(`The checkVIsible() again return value is: ${result}`);
                  if ((JSON.parse(result)[1] / 2) < JSON.parse(result)[3] && JSON.parse(result)[3] <
                  JSON.parse(result)[1]) {
                    this.pageResult = true;
                    console.log('emitpageDownAgain result is :' + this.pageResult);
                  } else {
                    this.pageResult = false;
                    console.log('emitpageDownAgain result is :' + this.pageResult);
                  }
                })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                this.pageResult = false;
              }
              this.controller.runJavaScript("test()", (res) => {
                Utils.emitEvent(this.pageResult, 110)
              })
              break;
            }
            case "emitpageUpAgain": {
              try {
                this.controller.runJavaScript("checkVIsible()", (error, result) => {
                  this.checkEleResult = JSON.parse(result)
                  console.log(`The checkVIsible() return value is: ${result}`);
                })
                this.controller.pageUp(true);
                await Utils.sleep(3000)
                this.controller.runJavaScript("checkVIsible()", (error, result) => {
                  this.checkEleResultAgain = JSON.parse(result)
                  console.log(`The checkVIsible() again return value is: ${result}`);
                  if (JSON.parse(result)[3] == 0 && this.checkEleResult[3] > (JSON.parse(result)[1] / 2)) {
                    this.pageResult = true;
                    console.log('emitpageUpAgain result is :' + this.pageResult);
                  } else {
                    this.pageResult = false;
                    console.log('emitpageUpAgain result is :' + this.pageResult);
                  }
                })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                this.pageResult = false;
              }
              this.controller.runJavaScript("test()", (res) => {
                Utils.emitEvent(this.pageResult, 112)
              })
              break;
            }
          }
        })
      }

      Web({ src: $rawfile('indexFive.html'), controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
        .userAgent(this.userAgent)
        .onScroll((event) => {
          if(this.flag){
            console.info("x = " + event.xOffset + this.firstId)
            Utils.emitEvent(event.xOffset, this.firstId)
            console.info("y = " + event.yOffset + this.secondId)
            Utils.emitEvent(event.yOffset, this.secondId)
          }
        })
    }
  }
}