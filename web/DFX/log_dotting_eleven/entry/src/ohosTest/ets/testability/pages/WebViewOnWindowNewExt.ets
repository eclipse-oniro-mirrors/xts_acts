/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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

import { hilog } from '@kit.PerformanceAnalysisKit';
import business_error from '@ohos.base'
import events_emitter from '@ohos.events.emitter';
import Utils from '../../test/Utils.test';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import testsuite from '../../test/List.test';
import { Driver, ON, On, MouseButton  } from '@ohos.UiTest';
import testNapi from 'libentry.so';
import web_webview from '@ohos.web.webview'
let driver = Driver.create()

@CustomDialog
struct NewWebViewComp {
  controller?: CustomDialogController;
  webviewController1: web_webview.WebviewController = new web_webview.WebviewController();

  build() {
    Column() {
      Web({ src: "www.example.com", controller: this.webviewController1 })
        .javaScriptAccess(true)
        .multiWindowAccess(true)
        .allowWindowOpenMethod(true)
        .onWindowExit(() => {
          console.info("NewWebViewComp onWindowExit");
          if (this.controller) {
            this.controller?.close();
          }
        })
    }
  }
}

@Entry
@Component
struct OnWindowNewExt {
  @State message: string = 'Hello World';
  @State isReceive: number = -1;
  @State scrollResult: boolean = false;
  @State isPageEnd: number = -1;
  @State str: string = "";
  @State navigationPolicy:number = 5;
  @State isAlert:boolean = false;
  @State isUserTrigger:boolean = false;
  @State handlerNum:number = 1
  @State targetUrl:string = ''
  webTag: string = 'ArkWeb1';
  dialogController: CustomDialogController | null = null;
  controller: web_webview.WebviewController = new web_webview.WebviewController(this.webTag);
  scrollCallback: (result: string) => void = (result: string) => {
    console.info("test result: " + result);
    this.scrollResult = true;
  }


  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 101009,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(101009)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 1;
      }
    }
  }


  build() {
    Column({ space: 20 }) {
      Button('web click')
        .key('WebViewOnWindowNewExtButton')
        .onClick(async () => {
          await Utils.waitForExist(()=>this.isReceive, this.str+' isReceive', 1, 1000);
          await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
          console.info("key==>" + this.str)
          switch (this.str) {
            case 'emitWebViewOnWindowNewExt001': {
              try {
                if(!canIUse('SystemCapability.UIDesign.HDSPattern.Standard')) {
                  console.log('pbbbnetment');
                  Utils.emitEvent(true, 20260118)
                } else {
                  this.isPageEnd = -1;
                  this.controller.loadUrl($rawfile("window.open.html"))
                  await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                  let buttonOne = await driver.findComponent(ON.text('打开新窗口'));
                  let point = await buttonOne.getBoundsCenter();
                  await driver.mouseClick(point, MouseButton.MOUSE_BUTTON_LEFT, 2047);
                  let webRect = Utils.getComponentRect('WebViewOnWindowNewExtWeb');
                  let downX = Math.round(globalThis.winLeft + webRect.left + 15);
                  let downY = Math.round(globalThis.winTop + webRect.top + 15);
                  await driver.click(downX, downY);
                  Utils.sleep(1000);
                  await driver.click(downX, downY);
                  setTimeout(() => {
                    Utils.emitEvent(this.isAlert, 20260118)
                  }, 4000)
                }
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }

            case 'emitWebViewOnWindowNewExt002': {
              try {
                if(!canIUse('SystemCapability.UIDesign.HDSPattern.Standard')) {
                  console.log('pbbbnetment2');
                  Utils.emitEvent(false, 20260119)
                } else {
                  this.isPageEnd = -1;
                  this.controller.loadUrl($rawfile("window.open.html"))
                  await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                  let buttonOne = await driver.findComponent(ON.text('打开新标签'));
                  await buttonOne.click();
                  let webRect = Utils.getComponentRect('WebViewOnWindowNewExtWeb');
                  let downX = Math.round(globalThis.winLeft + webRect.left + 15);
                  let downY = Math.round(globalThis.winTop + webRect.top + 15);
                  await driver.click(downX, downY);
                  Utils.sleep(1000);
                  await driver.click(downX, downY);
                  setTimeout(() => {
                    Utils.emitEvent(this.isAlert, 20260119)
                  }, 4000)
                }
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }

            case 'emitWebViewOnWindowNewExt003': {
              try {
                if(!canIUse('SystemCapability.UIDesign.HDSPattern.Standard')) {
                  console.log('pbbbnetment3');
                  Utils.emitEvent(true, 20260120)
                } else {
                  this.isPageEnd = -1;
                  this.controller.loadUrl($rawfile("window.open.html"))
                  await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                  let buttonOne = await driver.findComponent(ON.text('打开新窗口'));
                  await buttonOne.click();
                  let webRect = Utils.getComponentRect('WebViewOnWindowNewExtWeb');
                  let downX = Math.round(globalThis.winLeft + webRect.left + 15);
                  let downY = Math.round(globalThis.winTop + webRect.top + 15);
                  await driver.click(downX, downY);
                  Utils.sleep(1000);
                  await driver.click(downX, downY);
                  setTimeout(() => {
                    Utils.emitEvent(this.isUserTrigger, 20260120)
                  }, 4000)
                }
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }

            case 'emitWebViewOnWindowNewExt004': {
              try {
                if(!canIUse('SystemCapability.UIDesign.HDSPattern.Standard')) {
                  console.log('pbbbnetment3');
                  Utils.emitEvent('https://www.baidu.com/', 20260121)
                } else {
                  this.isPageEnd = -1;
                  this.controller.loadUrl($rawfile("window.open.html"))
                  await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                  let buttonOne = await driver.findComponent(ON.text('打开新窗口'));
                  await buttonOne.click();
                  let webRect = Utils.getComponentRect('WebViewOnWindowNewExtWeb');
                  let downX = Math.round(globalThis.winLeft + webRect.left + 15);
                  let downY = Math.round(globalThis.winTop + webRect.top + 15);
                  await driver.click(downX, downY);
                  Utils.sleep(1000);
                  await driver.click(downX, downY);
                  setTimeout(() => {
                    Utils.emitEvent(this.targetUrl, 20260121)
                  }, 4000)
                }
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }


            case 'emitWebViewOnWindowNewExt005': {
              try {
                if(!canIUse('SystemCapability.UIDesign.HDSPattern.Standard')) {
                  console.log('pbbbnetment3');
                  Utils.emitEvent(2, 20260122)
                } else {
                  this.isPageEnd = -1;
                  this.controller.loadUrl($rawfile("window.open.html"))
                  await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                  let buttonOne = await driver.findComponent(ON.text('打开新窗口'));
                  await buttonOne.click();
                  let webRect = Utils.getComponentRect('WebViewOnWindowNewExtWeb');
                  let downX = Math.round(globalThis.winLeft + webRect.left + 15);
                  let downY = Math.round(globalThis.winTop + webRect.top + 15);
                  await driver.click(downX, downY);
                  Utils.sleep(1000);
                  await driver.click(downX, downY);
                  setTimeout(() => {
                    Utils.emitEvent(this.handlerNum, 20260122)
                  }, 4000)
                }
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }

          }
        })


      Row() {
        Web({ src: $rawfile("window.open.html"), controller: this.controller })
          .key('WebViewOnWindowNewExtWeb')
          .javaScriptAccess(true)
          .multiWindowAccess(true)
          .allowWindowOpenMethod(true)
          .onPageEnd(() => {
            this.isPageEnd = 1
          })
          .onWindowNew((event) => {
            console.log("===== ArkTS onWindowNew 开始 =====");
            if (this.dialogController) {
              this.dialogController?.close();
            }

            let popController: web_webview.WebviewController = new web_webview.WebviewController();
            this.dialogController = new CustomDialogController({
              builder: NewWebViewComp({ webviewController1: popController })
            })
            this.dialogController?.open();

            // 关键：必须设置 WebController
            event.handler.setWebController(popController);
            if (event) {
              console.log("onWindowNew isAlert", event.isAlert)
              console.log("onWindowNew isUserTrigger", event.isUserTrigger)
              console.log("onWindowNew targetUrl", event.targetUrl)
              console.log("onWindowNew handler", event.handler)

            }
            if (event) {
              console.log("event.url", event.targetUrl)
            }
            console.log("===== ArkTS onWindowNew 结束 =====");
          })
          .onWindowNewExt((event) => {
            console.log(" ===== ArkTS onWindowNewExt 开始 =====");

            if (this.dialogController) {
              this.dialogController?.close();
            }

            let popController: web_webview.WebviewController = new web_webview.WebviewController();
            this.dialogController = new CustomDialogController({
              builder: NewWebViewComp({ webviewController1: popController })
            })
            this.dialogController?.open();

            // 关键：必须设置 WebController
            event.handler.setWebController(popController);
            if (event) {
              this.navigationPolicy = event.navigationPolicy;
              this.isAlert = event.isAlert;
              this.isUserTrigger = event.isUserTrigger;
              this.targetUrl = event.targetUrl;
              this.handlerNum = JSON.stringify(event.handler).length
              console.log("onWindowNewExt isAlert", event.isAlert)
              console.log("onWindowNewExt isUserTrigger", event.isUserTrigger)
              console.log("onWindowNewExt targetUrl", event.targetUrl)
              console.log("onWindowNewExt handler length", JSON.stringify(event.handler).length)

              console.log("onWindowNewExt navigationAction", event.navigationPolicy)
              console.log("onWindowNewExt height", event.windowFeatures.height)
              console.log("onWindowNewExt width", event.windowFeatures.width)
              console.log("onWindowNewExt x", event.windowFeatures.x)
              console.log("onWindowNewExt y", event.windowFeatures.y)
            }
            console.log("===== ArkTS onWindowNewExt 结束 =====");
          })
      }.height('20%')
    }
    .height('100%')
    .width('100%')
    .alignItems(HorizontalAlign.Center)

  }
}



