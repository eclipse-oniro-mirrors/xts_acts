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
import { Driver } from '@kit.TestKit';
import { window } from '@kit.ArkUI';
import { BusinessError } from '@ohos.base';

const EVENT_ID_SET_SUITE_KEY = 179901;
let driver = Driver.create();

@Entry
@Component
struct webViewOnScroll {
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  @State webHeight: number = 0
  @State str: string = "emitOnscroll";
  @State textX: number = 100;
  @State textY: number = 100;
  @State firstId: number = 179910;
  @State secondId: number = 179920;
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
  @State isWebBottom:Boolean = false;
  @State isWebTop:Boolean = false;

  @State userAgent: string = "Mozilla/5.0 (Window NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko)" +
    " CHrome/105.0.0.0 Safari/537.36 Edg/105.0.1343.27";
  @State isPageEnd: number = -1;
  @State isReceive: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: EVENT_ID_SET_SUITE_KEY,
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
        this.isReceive = 1;
      }
    }
  }

  getWebHeight() {
    try {
      this.controller?.runJavaScriptExt('window.innerHeight',
        (error, result) => {
          if (error || !result) {
            return;
          }
          if (result.getType() === web_webview.JsMessageType.NUMBER) {
            this.webHeight = result.getNumber()
          }
        })
    } catch (error) {
    }
  }

  checkScrollPosition() {
    console.log("y:" + this.controller.getScrollOffset().y + ",webHeight :" + this.webHeight + ",getPageHeight:" +
    this.controller.getPageHeight());
    if (this.controller.getScrollOffset().y + this.webHeight >= this.controller.getPageHeight()- 2) {
      this.isWebBottom = true;
      console.log("页面已经滑动到底部");
    }
    else if(this.controller.getScrollOffset().y == 0) {
      this.isWebTop = true;
      console.log("页面已经滑动到顶部");
    }
  }

  onPageHide() {
    events_emitter.off(EVENT_ID_SET_SUITE_KEY)
  }

  build() {
    Column() {
      Row() {
        Button("web click").key('webViewOnScroll').onClick(async () => {
          console.info("key==>" + this.str)
          await Utils.waitForExist(()=>this.isReceive, this.str+' isReceive', 1, 1000);
          await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
          switch (this.str) {
            case "emitOnscroll": {
              try {
                this.flag = true
                this.controller.scrollBy(this.textX, this.textY);
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
                console.log("action of emitOnscroll is scrollBy" + this.textX + this.textY);
                this.flag = false
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitOnscrollAgain": {
              try {
                this.flag = false
                this.firstId = 179930;
                this.secondId = 179940;
                this.textX = -50;
                this.textY = -50;
                this.controller.scrollTo(0,0)
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().x, this.str+' webXOffset');
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
                this.controller.scrollBy(100, 100);
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().x, this.str+' webXOffset');
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
                this.flag = true
                this.controller.scrollBy(this.textX, this.textY);
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().x, this.str+' webXOffset');
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
                console.log("action of emitOnscroll is scrollBy" + this.textX + this.textY);
                this.flag = false
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitpageDown": {
              try {
                this.isPageEnd = -1
                this.controller.loadUrl($rawfile('indexCopyTwo.html'))
                await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("Tablet")) {
                  this.isPageEnd = -1
                  this.controller.loadUrl($rawfile('indexCopyTwoTablet.html'))
                  await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                }
                this.controller.runJavaScript("checkVIsible()", (error, result) => {
                  this.checkEleResult = JSON.parse(result)
                  console.log(`The checkVIsible() return value is: ${result}`);
                })
                this.controller.pageDown(false);
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
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
                Utils.emitEvent(this.pageResult, 179950)
              })
              break;
            }
            case "emitpageUp": {
              try {
                this.isPageEnd = -1
                this.controller.loadUrl($rawfile('indexCopyTwo.html'))
                await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("Tablet")) {
                  this.isPageEnd = -1
                  this.controller.loadUrl($rawfile('indexCopyTwoTablet.html'))
                  await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                }
                this.controller.runJavaScript("checkVIsible()", (error, result) => {
                  this.checkEleResult = JSON.parse(result)
                  console.log(`The checkVIsible() return value is: ${result}`);
                })
                this.controller.pageUp(true);
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
                this.controller.pageDown(false);
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
                this.controller.pageUp(false);
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
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
                Utils.emitEvent(this.pageResult, 179960)
              })
              break;
            }
            case "emitpageDownAgain": {
              try {
                this.isPageEnd = -1
                this.controller.loadUrl($rawfile('indexFive.html'))
                await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                this.controller.pageDown(true);
                setTimeout(() => {
                  if (this.isWebBottom) {
                    console.log("页面已经滑动到底部");
                    Utils.emitEvent(true, 179970)
                  } else {
                    Utils.emitEvent(false, 179970)
                  }
                },3000)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitpageUpAgain": {
              try {
                this.isPageEnd = -1
                this.controller.loadUrl($rawfile('indexCopyTwo.html'))
                await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("Tablet")) {
                  this.isPageEnd = -1
                  this.controller.loadUrl($rawfile('indexCopyTwoTablet.html'))
                  await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                }
                this.controller.pageUp(true);
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
                this.controller.pageDown(false);
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
                this.controller.pageUp(false);
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
                this.controller.pageDown(true);
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
                this.controller.pageUp(true);
                await Utils.waitForScrollStop(()=>this.controller.getPageOffset().y, this.str+' webYOffset');
                if (this.isWebTop) {
                  console.log("页面已经滑动到顶部");
                  Utils.emitEvent(true, 179980);
                } else {
                  Utils.emitEvent(false, 179980);
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
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
        .onPageEnd((event) => {
          this.getWebHeight();
          console.log('onPageEnd url:' + event.url);
          this.isPageEnd = 1;
        })
        .onScroll((event) => {
          console.log('onScroll:', this.firstId,this.secondId)
          console.log('onScroll xOffset:' + event.xOffset + ' yOffset:' + event.yOffset);
          this.checkScrollPosition();
          if(this.flag){
            console.info("x = " + event.xOffset + this.firstId)
            Utils.emitEvent(event.xOffset, this.firstId)
            console.info("y = " + event.yOffset + this.secondId)
            Utils.emitEvent(event.yOffset, this.secondId)
          }
        }).height('95%')
    }
  }
}