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
import web_webview from '@ohos.web.webview'
import events_emitter from '@ohos.events.emitter';
import { BusinessError } from '@ohos.base';
import { Driver } from '@kit.TestKit';
import { ON } from '@kit.TestKit';

const EVENT_ID_SET_SUITE_KEY = 180101;
let driver = Driver.create();

@Entry
@Component
struct WebkeyboardAvoidMode {
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  @State avoidMode: WebKeyboardAvoidMode = WebKeyboardAvoidMode.RESIZE_CONTENT;
  @State str: string = ""
  @State userAgentPC:string = "";
  @State sslErrorType: number = -1
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;
  @State isRunJsEnd: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: EVENT_ID_SET_SUITE_KEY,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(EVENT_ID_SET_SUITE_KEY)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 1;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("keyboardAvoidMode").key('keyboardAvoidMode').onClick(async () => {
          console.info("key==>" + this.str)
          await Utils.waitForExist(()=>this.isReceive, this.str+' isReceive', 1, 1000);
          await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
          switch (this.str) {
            case "emitKeyboardAvoidMode0100": {
              this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC") || (this.userAgentPC).includes("Wearable")) {
                  Utils.emitEvent('true', 180110)
                  break;
                }
              this.avoidMode = WebKeyboardAvoidMode.RESIZE_CONTENT
              this.isPageEnd = -1
              this.controller.loadUrl("www.example.com");
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              this.isPageEnd = -1
              this.controller.loadUrl("resource://rawfile/index377.html");
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              let buttonOne = await driver.findComponent(ON.type('textField').isAfter(ON.text('TextA')));
              await buttonOne.click()
              await Utils.waitForReleaseDriver(this.str, driver)
              await Utils.sleep(1000);
              this.isRunJsEnd = -1;
              this.controller.runJavaScript("checkHeight()", (error, result) => {
                console.log('The checkHeight() return value is: result')
                Utils.emitEvent(result, 180110)
              this.isRunJsEnd = 1;
              })
              await Utils.waitForExist(()=>this.isRunJsEnd, this.str+' isRunJsEnd', 1, 1000);
              break;
            }
            case "emitKeyboardAvoidMode0200": {
              this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC") || (this.userAgentPC).includes("Wearable")) {
                  Utils.emitEvent('true', 180120)
                  break;
                }
              this.avoidMode = WebKeyboardAvoidMode.RESIZE_CONTENT
              this.isPageEnd = -1
              this.controller.loadUrl("www.example.com");
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              this.isPageEnd = -1;
              this.controller.loadUrl("resource://rawfile/index377.html");
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              let buttonOne = await driver.findComponent(ON.text('TextA'));
              await buttonOne.click()
              await Utils.sleep(1000);
              this.isRunJsEnd = -1;
              await Utils.waitForReleaseDriver(this.str, driver)
              this.controller.runJavaScript("checkHeight()", (error, result) => {
                console.log('The checkHeight() return value is: result')
                Utils.emitEvent(result, 180120)
                this.isRunJsEnd = 1;
              })
              await Utils.waitForExist(()=>this.isRunJsEnd, this.str+' isRunJsEnd', 1, 1000);
              break;
            }
            case "emitKeyboardAvoidMode0300": {
              this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC") || (this.userAgentPC).includes("Wearable")) {
                  Utils.emitEvent('true', 180130)
                  break;
                }
              this.avoidMode = WebKeyboardAvoidMode.RESIZE_CONTENT
              this.isPageEnd = -1
              this.controller.loadUrl("www.example.com");
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              this.isPageEnd = -1;
              this.controller.loadUrl("resource://rawfile/index377.html");
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              let buttonOne = await driver.findComponent(ON.text('7788'));
              await buttonOne.click()
              await Utils.sleep(1000);
              this.isRunJsEnd = -1;
              this.controller.runJavaScript("checkHeight()", (error, result) => {
                console.log('The checkHeight() return value is: result')
                Utils.emitEvent(result, 180130)
                this.isRunJsEnd = 1;
              })
              await Utils.waitForExist(()=>this.isRunJsEnd, this.str+' isRunJsEnd', 1, 1000);
              break;
            }
            case "emitKeyboardAvoidMode0400": {
              this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC") || (this.userAgentPC).includes("Wearable")) {
                  Utils.emitEvent('true', 180140)
                  break;
                }
              this.avoidMode = WebKeyboardAvoidMode.RESIZE_CONTENT
              this.isPageEnd = -1;
              this.controller.loadUrl("www.example.com");
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              this.isPageEnd = -1;
              this.controller.loadUrl("resource://rawfile/index377.html");
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              let buttonOne = await driver.findComponent(ON.text('EmailA'));
              await buttonOne.click()
              await Utils.sleep(1000);
              this.isRunJsEnd = -1;
              this.controller.runJavaScript("checkHeight()", (error, result) => {
                console.log('The checkHeight() return value is: result')
                Utils.emitEvent(result, 180140)
                this.isRunJsEnd = 1;
              })
              await Utils.waitForExist(()=>this.isRunJsEnd, this.str+' isRunJsEnd', 1, 1000);
              break;
            }
            case "emitKeyboardAvoidMode0500": {
              this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC") || (this.userAgentPC).includes("Wearable")) {
                  Utils.emitEvent('true', 180150)
                  break;
                }
              this.avoidMode = WebKeyboardAvoidMode.RESIZE_CONTENT
              this.isPageEnd = -1;
              this.controller.loadUrl("www.example.com");
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              this.isPageEnd = -1;
              this.controller.loadUrl("resource://rawfile/index377.html");
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', )
              let buttonOne = await driver.findComponent(ON.text('URLA'));
              await buttonOne.click()
              await Utils.sleep(1000);
              this.isRunJsEnd = -1;
              this.controller.runJavaScript("checkHeight()", (error, result) => {
                console.log('The checkHeight() return value is: result')
                Utils.emitEvent(result, 180150)
                this.isRunJsEnd = 1;
              })
              await Utils.waitForExist(()=>this.isRunJsEnd, this.str+' isRunJsEnd', 1, 1000);
              break;
            }
            case "emitKeyboardAvoidMode0600": {
              this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC") || (this.userAgentPC).includes("Wearable")) {
                  Utils.emitEvent('true', 180160)
                  break;
                }
              this.avoidMode = WebKeyboardAvoidMode.RESIZE_CONTENT
              this.isPageEnd = -1;
              this.controller.loadUrl("www.example.com");
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 100)
              this.isPageEnd = -1;
              this.controller.loadUrl("resource://rawfile/index377.html");
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              let buttonOne = await driver.findComponent(ON.text('TelA'));
              await buttonOne.click()
              await Utils.sleep(1000);
              this.isRunJsEnd = -1;
              this.controller.runJavaScript("checkHeight()", (error, result) => {
                console.log('The checkHeight() return value is: result')
                Utils.emitEvent(result, 180160)
                this.isRunJsEnd = 1;
              })
              await Utils.waitForExist(()=>this.isRunJsEnd, this.str+' isRunJsEnd', 1, 1000);
              break;
            }
            case "emitKeyboardAvoidMode0700": {
              this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC") || (this.userAgentPC).includes("Wearable")) {
                  Utils.emitEvent('false', 180170)
                  break;
                }
              this.avoidMode = WebKeyboardAvoidMode.OVERLAYS_CONTENT
              this.isPageEnd = -1;
              this.controller.loadUrl("www.example.com");
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              this.isPageEnd = -1;
              this.controller.loadUrl("resource://rawfile/index377.html");
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              let buttonOne = await driver.findComponent(ON.text('TextA'));
              await buttonOne.click()
              await Utils.sleep(1000);
              this.isRunJsEnd = -1;
              this.controller.runJavaScript("checkHeight()", (error, result) => {
                console.log('The checkHeight() return value is: result')
                Utils.emitEvent(result, 180170)
                this.isRunJsEnd = 1;
              })
              await Utils.waitForExist(()=>this.isRunJsEnd, this.str+' isRunJsEnd', 1, 1000);
              break;
            }
            case "emitKeyboardAvoidMode0800": {
              this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC") || (this.userAgentPC).includes("Wearable")) {
                  Utils.emitEvent('false', 180180)
                  break;
                }
              this.avoidMode = WebKeyboardAvoidMode.OVERLAYS_CONTENT
              this.isPageEnd = -1;
              this.controller.loadUrl("www.example.com");
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              this.isPageEnd = -1;
              this.controller.loadUrl("resource://rawfile/index377.html");
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              let buttonOne = await driver.findComponent(ON.type('textField').isAfter(ON.text('TextA')));
              await buttonOne.click()
              await Utils.sleep(1000);
              this.isRunJsEnd = -1;
              this.controller.runJavaScript("checkHeight()", (error, result) => {
                console.log('The checkHeight() return value is:' + JSON.stringify(result))
                Utils.emitEvent(result, 180180)
                this.isRunJsEnd = 1;
              })
              await Utils.waitForExist(()=>this.isRunJsEnd, this.str+' isRunJsEnd', 1, 1000);
              break;
            }
            case "emitKeyboardAvoidMode0900": {
              this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC") || (this.userAgentPC).includes("Wearable")) {
                  Utils.emitEvent('false', 180190)
                  break;
                }
              this.avoidMode = WebKeyboardAvoidMode.OVERLAYS_CONTENT
              this.isPageEnd = -1;
              this.controller.loadUrl("www.example.com");
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              this.isPageEnd = -1;
              this.controller.loadUrl("resource://rawfile/index377.html");
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              let buttonOne = await driver.findComponent(ON.text('7788'));
              await buttonOne.click()
              await Utils.sleep(1000);
              this.isRunJsEnd = -1;
              this.controller.runJavaScript("checkHeight()", (error, result) => {
                console.log('The checkHeight() return value is: result')
                Utils.emitEvent(result, 180190)
                this.isRunJsEnd = 1;
              })
              await Utils.waitForExist(()=>this.isRunJsEnd, this.str+' isRunJsEnd', 1, 1000);
              break;
            }
            case "emitKeyboardAvoidMode1000": {
              this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC") || (this.userAgentPC).includes("Wearable")) {
                  Utils.emitEvent('false', 180200)
                  break;
                }
              this.avoidMode = WebKeyboardAvoidMode.OVERLAYS_CONTENT
              this.isPageEnd = -1;
              this.controller.loadUrl("www.example.com");
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              this.isPageEnd = -1;
              this.controller.loadUrl("resource://rawfile/index377.html");
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              let buttonOne = await driver.findComponent(ON.text('EmailA'));
              await buttonOne.click()
              await Utils.sleep(1000);
              this.isRunJsEnd = -1;
              this.controller.runJavaScript("checkHeight()", (error, result) => {
                console.log('The checkHeight() return value is: result')
                Utils.emitEvent(result, 180200)
                this.isRunJsEnd = 1;
              })
              await Utils.waitForExist(()=>this.isRunJsEnd, this.str+' isRunJsEnd', 1, 1000);
              break;
            }
            case "emitKeyboardAvoidMode1100": {
              this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC") || (this.userAgentPC).includes("Wearable")) {
                  Utils.emitEvent('false', 180210)
                  break;
                }
              this.avoidMode = WebKeyboardAvoidMode.OVERLAYS_CONTENT
              this.isPageEnd = -1;
              this.controller.loadUrl("www.example.com");
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              this.isPageEnd = -1;
              this.controller.loadUrl("resource://rawfile/index377.html");
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd',)
              let buttonOne = await driver.findComponent(ON.text('URLA'));
              await buttonOne.click()
              await Utils.sleep(1000);
              this.isRunJsEnd = -1;
              this.controller.runJavaScript("checkHeight()", (error, result) => {
                console.log('The checkHeight() return value is: result')
                Utils.emitEvent(result, 180210)
                this.isRunJsEnd = 1;
              })
              await Utils.waitForExist(()=>this.isRunJsEnd, this.str+' isRunJsEnd', 1, 1000);
              break;
            }
            case "emitKeyboardAvoidMode1200": {



              this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC") || (this.userAgentPC).includes("Wearable")) {
                  Utils.emitEvent('false', 180220)
                  break;
                }
              this.avoidMode = WebKeyboardAvoidMode.OVERLAYS_CONTENT
              this.isPageEnd = -1;
              this.controller.loadUrl("www.example.com");
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              this.isPageEnd = -1;
              this.controller.loadUrl("resource://rawfile/index377.html");
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              let buttonOne = await driver.findComponent(ON.text('TelA'));
              await buttonOne.click()
              await Utils.sleep(1000);
              this.isRunJsEnd = -1;
              this.controller.runJavaScript("checkHeight()", (error, result) => {
                console.log('The checkHeight() return value is: result')
                Utils.emitEvent(result, 180220)
                this.isRunJsEnd = 1;
              })
              await Utils.waitForExist(()=>this.isRunJsEnd, this.str+' isRunJsEnd', 1, 1000);
              break;
            }
            case "emitKeyboardAvoidMode1300": {
              this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC") || (this.userAgentPC).includes("Wearable")) {
                  Utils.emitEvent('true', 180230)
                  break;
                }
              this.avoidMode = WebKeyboardAvoidMode.RESIZE_VISUAL
              this.isPageEnd = -1;
              this.controller.loadUrl("www.example.com");
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              this.isPageEnd = -1;
              this.controller.loadUrl("resource://rawfile/index377.html");
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              let buttonOne = await driver.findComponent(ON.text('TelA'));
              await buttonOne.click()
              await Utils.sleep(1000);
              this.isRunJsEnd = -1;
              this.controller.runJavaScript("checkHeightOne()", (error, result) => {
                console.log('The checkHeight() return value is: result')
                Utils.emitEvent(result, 180230)
                this.isRunJsEnd = 1;
              })
              await Utils.waitForExist(()=>this.isRunJsEnd, this.str+' isRunJsEnd', 1, 1000);
              break;
            }
            case "emitKeyboardAvoidMode1400": {
              this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC") || (this.userAgentPC).includes("Wearable")) {
                  Utils.emitEvent('true', 180240)
                  break;
                }
              this.avoidMode = WebKeyboardAvoidMode.RESIZE_VISUAL
              this.isPageEnd = -1;
              this.controller.loadUrl("www.example.com");
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              this.isPageEnd = -1;
              this.controller.loadUrl("resource://rawfile/index377.html");
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              let buttonOne = await driver.findComponent(ON.text('TextA'));
              await buttonOne.click()
              await Utils.sleep(1000);
              this.isRunJsEnd = -1;
              this.controller.runJavaScript("checkHeightOne()", (error, result) => {
                console.log('The checkHeight() return value is: ', result)
                Utils.emitEvent(result, 180240)
                this.isRunJsEnd = 1;
              })
              await Utils.waitForExist(()=>this.isRunJsEnd, this.str+' isRunJsEnd', 1, 1000);
              break;
            }
            case "emitKeyboardAvoidMode1500": {
              this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC") || (this.userAgentPC).includes("Wearable")) {
                  Utils.emitEvent('true', 180250)
                  break;
                }
              this.avoidMode = WebKeyboardAvoidMode.RESIZE_VISUAL
              this.isPageEnd = -1;
              this.controller.loadUrl("www.example.com");
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              this.isPageEnd = -1;
              this.controller.loadUrl("resource://rawfile/index377.html");
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              let buttonOne = await driver.findComponent(ON.text('7788'));
              await buttonOne.click()
              await Utils.sleep(1000);
              this.isRunJsEnd = -1;
              this.controller.runJavaScript("checkHeightOne()", (error, result) => {
                console.log('The checkHeight() return value is: result')
                Utils.emitEvent(result, 180250)
                this.isRunJsEnd = 1;
              })
              await Utils.waitForExist(()=>this.isRunJsEnd, this.str+' isRunJsEnd', 1, 1000);
              break;
            }
            case "emitKeyboardAvoidMode1600": {
              this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC") || (this.userAgentPC).includes("Wearable")) {
                  Utils.emitEvent('true', 180260)
                  break;
                }
              this.avoidMode = WebKeyboardAvoidMode.RESIZE_VISUAL
              this.isPageEnd = -1;
              this.controller.loadUrl("www.example.com");
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              this.isPageEnd = -1;
              this.controller.loadUrl("resource://rawfile/index377.html");
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              let buttonOne = await driver.findComponent(ON.text('EmailA'));
              await buttonOne.click()
              await Utils.sleep(1000);
              this.isRunJsEnd = -1;
              this.controller.runJavaScript("checkHeightOne()", (error, result) => {
                console.log('The checkHeight() return value is: result')
                Utils.emitEvent(result, 180260)
                this.isRunJsEnd = 1;
              })
              await Utils.waitForExist(()=>this.isRunJsEnd, this.str+' isRunJsEnd', 1, 1000);
              break;
            }
            case "emitKeyboardAvoidMode1700": {
              this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC") || (this.userAgentPC).includes("Wearable")) {
                  Utils.emitEvent('true', 180270)
                  break;
                }
              this.avoidMode = WebKeyboardAvoidMode.RESIZE_VISUAL
              this.isPageEnd = -1;
              this.controller.loadUrl("www.example.com");
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              this.isPageEnd = -1;
              this.controller.loadUrl("resource://rawfile/index377.html");
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              let buttonOne = await driver.findComponent(ON.text('URLA'));
              await buttonOne.click()
              await Utils.sleep(1000);
              this.isRunJsEnd = -1;
              this.controller.runJavaScript("checkHeightOne()", (error, result) => {
                console.log('The checkHeight() return value is: result')
                Utils.emitEvent(result, 180270)
                this.isRunJsEnd = 1;
              })
              await Utils.waitForExist(()=>this.isRunJsEnd, this.str+' isRunJsEnd', 1, 1000);
              break;
            }
            case "emitKeyboardAvoidMode1800": {
              this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC") || (this.userAgentPC).includes("Wearable")) {
                  Utils.emitEvent('true', 180280)
                  break;
                }
              this.avoidMode = WebKeyboardAvoidMode.RESIZE_VISUAL
              this.isPageEnd = -1;
              this.controller.loadUrl("www.example.com");
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              this.isPageEnd = -1;
              this.controller.loadUrl("resource://rawfile/index377.html");
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              let buttonOne = await driver.findComponent(ON.type('textField').isAfter(ON.text('TextA')));
              await buttonOne.click()
              await Utils.sleep(1000);
              this.isRunJsEnd = -1;
              this.controller.runJavaScript("checkHeightOne()", (error, result) => {
                console.log('The checkHeight() return value is: result')
                Utils.emitEvent(result, 180280)
                this.isRunJsEnd = 1;
              })
              await Utils.waitForExist(()=>this.isRunJsEnd, this.str+' isRunJsEnd', 1, 1000);
              break;
            }
            case "emitKeyboardAvoidMode1900": {
              this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC") || (this.userAgentPC).includes("Wearable")) {
                  Utils.emitEvent('true', 180290)
                  break;
                }
              this.avoidMode = WebKeyboardAvoidMode.RESIZE_CONTENT
              this.isPageEnd = -1;
              this.controller.loadUrl("www.example.com");
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              this.isPageEnd = -1;
              this.controller.loadUrl("resource://rawfile/index378.html");
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              let buttonOne = await driver.findComponent(ON.text('paragraph with text'));
              await buttonOne.click()
              await Utils.sleep(1000);
              this.isRunJsEnd = -1;
              this.controller.runJavaScript("checkHeight()", (error, result) => {
                console.log('The checkHeight() return value is: result')
                Utils.emitEvent(result, 180290)
                this.isRunJsEnd = 1;
              })
              await Utils.waitForExist(()=>this.isRunJsEnd, this.str+' isRunJsEnd', 1, 1000);
              break;
            }
            case "emitKeyboardAvoidMode2000": {
              this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC") || (this.userAgentPC).includes("Wearable")) {
                  Utils.emitEvent('true', 180300)
                  break;
                }
              this.avoidMode = WebKeyboardAvoidMode.RESIZE_CONTENT
              this.isPageEnd = -1;
              this.controller.loadUrl("www.example.com");
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              this.isPageEnd = -1;
              this.controller.loadUrl("resource://rawfile/index378.html");
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              let buttonOne = await driver.findComponent(ON.text('paragraph with tel'));
              await buttonOne.click()
              await Utils.sleep(1000);
              this.isRunJsEnd = -1;
              this.controller.runJavaScript("checkHeight()", (error, result) => {
                console.log('The checkHeight() return value is: result')
                Utils.emitEvent(result, 180300)
                this.isRunJsEnd = 1;
              })
              await Utils.waitForExist(()=>this.isRunJsEnd, this.str+' isRunJsEnd', 1, 1000);
              break;
            }
            case "emitKeyboardAvoidMode2100": {
              this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC") || (this.userAgentPC).includes("Wearable")) {
                  Utils.emitEvent('true', 180310)
                  break;
                }
              this.avoidMode = WebKeyboardAvoidMode.RESIZE_CONTENT
              this.isPageEnd = -1;
              this.controller.loadUrl("www.example.com");
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              this.isPageEnd = -1;
              this.controller.loadUrl("resource://rawfile/index378.html");
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              let buttonOne = await driver.findComponent(ON.text('paragraph with url'));
              await buttonOne.click()
              await Utils.sleep(1000);
              this.isRunJsEnd = -1;
              this.controller.runJavaScript("checkHeight()", (error, result) => {
                console.log('The checkHeight() return value is: result')
                Utils.emitEvent(result, 180310)
                this.isRunJsEnd = 1;
              })
              await Utils.waitForExist(()=>this.isRunJsEnd, this.str+' isRunJsEnd', 1, 1000);
              break;
            }
            case "emitKeyboardAvoidMode2200": {
              this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC") || (this.userAgentPC).includes("Wearable")) {
                  Utils.emitEvent('true', 180320)
                  break;
                }
              this.avoidMode = WebKeyboardAvoidMode.RESIZE_CONTENT
              this.isPageEnd = -1;
              this.controller.loadUrl("www.example.com");
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              this.isPageEnd = -1;
              this.controller.loadUrl("resource://rawfile/index378.html");
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              let buttonOne = await driver.findComponent(ON.text('paragraph with email'));
              await buttonOne.click()
              await Utils.sleep(1000);
              this.isRunJsEnd = -1;
              this.controller.runJavaScript("checkHeight()", (error, result) => {
                console.log('The checkHeight() return value is: result')
                Utils.emitEvent(result, 180320)
                this.isRunJsEnd = 1;
              })
              await Utils.waitForExist(()=>this.isRunJsEnd, this.str+' isRunJsEnd', 1, 1000);
              break;
            }
            case "emitKeyboardAvoidMode2300": {
              this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC") || (this.userAgentPC).includes("Wearable")) {
                  Utils.emitEvent('true', 180330)
                  break;
                }
              this.avoidMode = WebKeyboardAvoidMode.RESIZE_CONTENT
              this.isPageEnd = -1;
              this.controller.loadUrl("www.example.com");
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              this.isPageEnd = -1;
              this.controller.loadUrl("resource://rawfile/index378.html");
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              let buttonOne = await driver.findComponent(ON.text('paragraph with numeric'));
              await buttonOne.click()
              await Utils.sleep(1000);
              this.isRunJsEnd = -1;
              this.controller.runJavaScript("checkHeight()", (error, result) => {
                console.log('The checkHeight() return value is: result')
                Utils.emitEvent(result, 180330)
                this.isRunJsEnd = 1;
              })
              await Utils.waitForExist(()=>this.isRunJsEnd, this.str+' isRunJsEnd', 1, 1000);
              break;
            }
            case "emitKeyboardAvoidMode2400": {
              this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC") || (this.userAgentPC).includes("Wearable")) {
                  Utils.emitEvent('true', 180340)
                  break;
                }
              this.avoidMode = WebKeyboardAvoidMode.RESIZE_CONTENT
              this.isPageEnd = -1;
              this.controller.loadUrl("www.example.com");
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              this.isPageEnd = -1;
              this.controller.loadUrl("resource://rawfile/index378.html");
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              let buttonOne = await driver.findComponent(ON.text('paragraph with decimal'));
              await buttonOne.click()
              await Utils.sleep(1000);
              this.isRunJsEnd = -1;
              this.controller.runJavaScript("checkHeight()", (error, result) => {
                console.log('The checkHeight() return value is: result')
                Utils.emitEvent(result, 180340)
                this.isRunJsEnd = 1;
              })
              await Utils.waitForExist(()=>this.isRunJsEnd, this.str+' isRunJsEnd', 1, 1000);
              break;
            }
            case "emitKeyboardAvoidMode2500": {
              this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC") || (this.userAgentPC).includes("Wearable")) {
                  Utils.emitEvent('false', 180350)
                  break;
                }
              this.avoidMode = WebKeyboardAvoidMode.OVERLAYS_CONTENT
              this.isPageEnd = -1;
              this.controller.loadUrl("www.example.com");
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              this.isPageEnd = -1;
              this.controller.loadUrl("resource://rawfile/index378.html");
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              let buttonOne = await driver.findComponent(ON.text('paragraph with text'));
              await buttonOne.click()
              await Utils.sleep(1000);
              this.isRunJsEnd = -1;
              this.controller.runJavaScript("checkHeight()", (error, result) => {
                console.log('The checkHeight() return value is: result')
                Utils.emitEvent(result, 180350)
                this.isRunJsEnd = 1;
              })
              await Utils.waitForExist(()=>this.isRunJsEnd, this.str+' isRunJsEnd', 1, 1000);
              break;
            }
            case "emitKeyboardAvoidMode2600": {
              this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC") || (this.userAgentPC).includes("Wearable")) {
                  Utils.emitEvent('false', 180360)
                  break;
                }
              this.avoidMode = WebKeyboardAvoidMode.OVERLAYS_CONTENT
              this.isPageEnd = -1;
              this.controller.loadUrl("www.example.com");
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              this.isPageEnd = -1;
              this.controller.loadUrl("resource://rawfile/index378.html");
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              let buttonOne = await driver.findComponent(ON.text('paragraph with tel'));
              await buttonOne.click()
              await Utils.sleep(1000);
              this.isRunJsEnd = -1;
              this.controller.runJavaScript("checkHeight()", (error, result) => {
                console.log('The checkHeight() return value is: result')
                Utils.emitEvent(result, 180360)
                this.isRunJsEnd = 1;
              })
              await Utils.waitForExist(()=>this.isRunJsEnd, this.str+' isRunJsEnd', 1, 1000);
              break;
            }
            case "emitKeyboardAvoidMode2700": {
              this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC") || (this.userAgentPC).includes("Wearable")) {
                  Utils.emitEvent('false', 180370)
                  break;
                }
              this.avoidMode = WebKeyboardAvoidMode.OVERLAYS_CONTENT
              this.isPageEnd = -1;
              this.controller.loadUrl("www.example.com");
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              this.isPageEnd = -1;
              this.controller.loadUrl("resource://rawfile/index378.html");
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              let buttonOne = await driver.findComponent(ON.text('paragraph with url'));
              await buttonOne.click()
              await Utils.sleep(1000);
              this.isRunJsEnd = -1;
              this.controller.runJavaScript("checkHeight()", (error, result) => {
                console.log('The checkHeight() return value is: result')
                Utils.emitEvent(result, 180370)
                this.isRunJsEnd = 1;
              })
              await Utils.waitForExist(()=>this.isRunJsEnd, this.str+' isRunJsEnd', 1, 1000);
              break;
            }
            case "emitKeyboardAvoidMode2800": {
              this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")  || (this.userAgentPC).includes("Wearable")) {
                  Utils.emitEvent('false', 180380)
                  break;
                }
              this.avoidMode = WebKeyboardAvoidMode.OVERLAYS_CONTENT
              this.isPageEnd = -1;
              this.controller.loadUrl("www.example.com");
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              this.isPageEnd = -1;
              this.controller.loadUrl("resource://rawfile/index378.html");
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              let buttonOne = await driver.findComponent(ON.text('paragraph with email'));
              await buttonOne.click()
              await Utils.sleep(1000);
              this.isRunJsEnd = -1;
              this.controller.runJavaScript("checkHeight()", (error, result) => {
                console.log('The checkHeight() return value is: result')
                Utils.emitEvent(result, 180380)
                this.isRunJsEnd = 1;
              })
              await Utils.waitForExist(()=>this.isRunJsEnd, this.str+' isRunJsEnd', 1, 1000);
              break;
            }
            case "emitKeyboardAvoidMode2900": {
              this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC") || (this.userAgentPC).includes("Wearable")) {
                  Utils.emitEvent('false', 180390)
                  break;
                }
              this.avoidMode = WebKeyboardAvoidMode.OVERLAYS_CONTENT
              this.isPageEnd = -1;
              this.controller.loadUrl("www.example.com");
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              this.isPageEnd = -1;
              this.controller.loadUrl("resource://rawfile/index378.html");
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              let buttonOne = await driver.findComponent(ON.text('paragraph with numeric'));
              await buttonOne.click()
              await Utils.sleep(1000);
              this.isRunJsEnd = -1;
              this.controller.runJavaScript("checkHeight()", (error, result) => {
                console.log('The checkHeight() return value is: result')
                Utils.emitEvent(result, 180390)
                this.isRunJsEnd = 1
              })
              await Utils.waitForExist(()=>this.isRunJsEnd, this.str+' isRunJsEnd', 1, 1000);
              break;
            }
            case "emitKeyboardAvoidMode3000": {
              this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC") || (this.userAgentPC).includes("Wearable")) {
                  Utils.emitEvent('false', 180400)
                  break;
                }
              this.avoidMode = WebKeyboardAvoidMode.OVERLAYS_CONTENT
              this.isPageEnd = -1;
              this.controller.loadUrl("www.example.com");
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              this.isPageEnd = -1;
              this.controller.loadUrl("resource://rawfile/index378.html");
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              let buttonOne = await driver.findComponent(ON.text('paragraph with decimal'));
              await buttonOne.click()
              await Utils.sleep(1000);
              this.isRunJsEnd = -1;
              this.controller.runJavaScript("checkHeight()", (error, result) => {
                console.log('The checkHeight() return value is: result')
                Utils.emitEvent(result, 180400)
                this.isRunJsEnd = 1
              })
              await Utils.waitForExist(()=>this.isRunJsEnd, this.str+' isRunJsEnd', 1, 1000);
              break;
            }

          }
        })
      }

      Web({ src: $rawfile('index377.html'), controller: this.controller })
        .keyboardAvoidMode(this.avoidMode)
        .javaScriptAccess(true)
        .geolocationAccess(true)
        .databaseAccess(true)
        .height(2000)
        .width('100%')
        .onPageEnd((event) => {
          console.log('onPageEnd url:' + event.url);
          this.isPageEnd = 1;
        })
    }
  }
}
