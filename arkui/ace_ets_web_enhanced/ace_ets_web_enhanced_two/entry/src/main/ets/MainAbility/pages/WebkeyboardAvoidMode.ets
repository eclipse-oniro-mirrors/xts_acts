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
import { Driver, ON } from '@ohos.UiTest';

@Entry
@Component
struct WebkeyboardAvoidMode {
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  @State avoidMode: WebKeyboardAvoidMode = WebKeyboardAvoidMode.RESIZE_CONTENT;
  @State str: string = ""
  @State userAgentPC:string = "";
  @State sslErrorType: number = -1

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
        Button("keyboardAvoidMode").key('keyboardAvoidMode').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "emitKeyboardAvoidMode0100": {
              this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent('true', 171701)
                  break;
                }
              this.avoidMode = WebKeyboardAvoidMode.RESIZE_CONTENT
              await Utils.sleep(2000);
              this.controller.loadUrl("www.baidu.com");
              await Utils.sleep(2000);
              this.controller.loadUrl("resource://rawfile/index377.html");
              await Utils.sleep(2000);
              let driver = Driver.create();
              let buttonOne = await driver.findComponent(ON.type('textField').isAfter(ON.text('TextA')));
              await buttonOne.click()
              await Utils.sleep(4000);
              this.controller.runJavaScript("checkHeight()", (error, result) => {
                console.log('The checkHeight() return value is: ${result}')
                Utils.emitEvent(result, 171701)
              })
              break;
            }
            case "emitKeyboardAvoidMode0200": {
              this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent('true', 171702)
                  break;
                }
              this.avoidMode = WebKeyboardAvoidMode.RESIZE_CONTENT
              await Utils.sleep(2000);
              this.controller.loadUrl("www.baidu.com");
              await Utils.sleep(2000);
              this.controller.loadUrl("resource://rawfile/index377.html");
              await Utils.sleep(2000);
              let driver = Driver.create();
              let buttonOne = await driver.findComponent(ON.text('TextA'));
              await buttonOne.click()
              await Utils.sleep(4000);
              this.controller.runJavaScript("checkHeight()", (error, result) => {
                console.log('The checkHeight() return value is: ${result}')
                Utils.emitEvent(result, 171702)
              })
              break;
            }
            case "emitKeyboardAvoidMode0300": {
              this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent('true', 171703)
                  break;
                }
              this.avoidMode = WebKeyboardAvoidMode.RESIZE_CONTENT
              await Utils.sleep(2000);
              this.controller.loadUrl("www.baidu.com");
              await Utils.sleep(2000);
              this.controller.loadUrl("resource://rawfile/index377.html");
              await Utils.sleep(2000);
              let driver = Driver.create();
              let buttonOne = await driver.findComponent(ON.text('7788'));
              await buttonOne.click()
              await Utils.sleep(4000);
              this.controller.runJavaScript("checkHeight()", (error, result) => {
                console.log('The checkHeight() return value is: ${result}')
                Utils.emitEvent(result, 171703)
              })
              break;
            }
            case "emitKeyboardAvoidMode0400": {
              this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent('true', 171704)
                  break;
                }
              this.avoidMode = WebKeyboardAvoidMode.RESIZE_CONTENT
              await Utils.sleep(2000);
              this.controller.loadUrl("www.baidu.com");
              await Utils.sleep(2000);
              this.controller.loadUrl("resource://rawfile/index377.html");
              await Utils.sleep(2000);
              let driver = Driver.create();
              let buttonOne = await driver.findComponent(ON.text('EmailA'));
              await buttonOne.click()
              await Utils.sleep(4000);
              this.controller.runJavaScript("checkHeight()", (error, result) => {
                console.log('The checkHeight() return value is: ${result}')
                Utils.emitEvent(result, 171704)
              })
              break;
            }
            case "emitKeyboardAvoidMode0500": {
              this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent('true', 171705)
                  break;
                }
              this.avoidMode = WebKeyboardAvoidMode.RESIZE_CONTENT
              await Utils.sleep(2000);
              this.controller.loadUrl("www.baidu.com");
              await Utils.sleep(2000);
              this.controller.loadUrl("resource://rawfile/index377.html");
              await Utils.sleep(2000);
              let driver = Driver.create();
              let buttonOne = await driver.findComponent(ON.text('URLA'));
              await buttonOne.click()
              await Utils.sleep(4000);
              this.controller.runJavaScript("checkHeight()", (error, result) => {
                console.log('The checkHeight() return value is: ${result}')
                Utils.emitEvent(result, 171705)
              })
              break;
            }
            case "emitKeyboardAvoidMode0600": {
              this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent('true', 171706)
                  break;
                }
              this.avoidMode = WebKeyboardAvoidMode.RESIZE_CONTENT
              await Utils.sleep(2000);
              this.controller.loadUrl("www.baidu.com");
              await Utils.sleep(2000);
              this.controller.loadUrl("resource://rawfile/index377.html");
              await Utils.sleep(2000);
              let driver = Driver.create();
              let buttonOne = await driver.findComponent(ON.text('TelA'));
              await buttonOne.click()
              await Utils.sleep(4000);
              this.controller.runJavaScript("checkHeight()", (error, result) => {
                console.log('The checkHeight() return value is: ${result}')
                Utils.emitEvent(result, 171706)
              })
              break;
            }
            case "emitKeyboardAvoidMode0700": {
              this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent('false', 171707)
                  break;
                }
              this.avoidMode = WebKeyboardAvoidMode.OVERLAYS_CONTENT
              await Utils.sleep(2000);
              this.controller.loadUrl("www.baidu.com");
              await Utils.sleep(2000);
              this.controller.loadUrl("resource://rawfile/index377.html");
              await Utils.sleep(2000);
              let driver = Driver.create();
              let buttonOne = await driver.findComponent(ON.text('TextA'));
              await buttonOne.click()
              await Utils.sleep(4000);
              this.controller.runJavaScript("checkHeight()", (error, result) => {
                console.log('The checkHeight() return value is: ${result}')
                Utils.emitEvent(result, 171707)
              })
              break;
            }
            case "emitKeyboardAvoidMode0800": {
              this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent('false', 171708)
                  break;
                }
              this.avoidMode = WebKeyboardAvoidMode.OVERLAYS_CONTENT
              await Utils.sleep(2000);
              this.controller.loadUrl("www.baidu.com");
              await Utils.sleep(2000);
              this.controller.loadUrl("resource://rawfile/index377.html");
              await Utils.sleep(2000);
              let driver = Driver.create();
              let buttonOne = await driver.findComponent(ON.type('textField').isAfter(ON.text('TextA')));
              await buttonOne.click()
              await Utils.sleep(4000);
              this.controller.runJavaScript("checkHeight()", (error, result) => {
                console.log('The checkHeight() return value is: ${result}')
                Utils.emitEvent(result, 171708)
              })
              break;
            }
            case "emitKeyboardAvoidMode0900": {
              this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent('false', 171709)
                  break;
                }
              this.avoidMode = WebKeyboardAvoidMode.OVERLAYS_CONTENT
              await Utils.sleep(2000);
              this.controller.loadUrl("www.baidu.com");
              await Utils.sleep(2000);
              this.controller.loadUrl("resource://rawfile/index377.html");
              await Utils.sleep(2000);
              let driver = Driver.create();
              let buttonOne = await driver.findComponent(ON.text('7788'));
              await buttonOne.click()
              await Utils.sleep(4000);
              this.controller.runJavaScript("checkHeight()", (error, result) => {
                console.log('The checkHeight() return value is: ${result}')
                Utils.emitEvent(result, 171709)
              })
              break;
            }
            case "emitKeyboardAvoidMode1000": {
              this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent('false', 171710)
                  break;
                }
              this.avoidMode = WebKeyboardAvoidMode.OVERLAYS_CONTENT
              await Utils.sleep(2000);
              this.controller.loadUrl("www.baidu.com");
              await Utils.sleep(2000);
              this.controller.loadUrl("resource://rawfile/index377.html");
              await Utils.sleep(2000);
              let driver = Driver.create();
              let buttonOne = await driver.findComponent(ON.text('EmailA'));
              await buttonOne.click()
              await Utils.sleep(4000);
              this.controller.runJavaScript("checkHeight()", (error, result) => {
                console.log('The checkHeight() return value is: ${result}')
                Utils.emitEvent(result, 171710)
              })
              break;
            }
            case "emitKeyboardAvoidMode1100": {
              this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent('false', 171711)
                  break;
                }
              this.avoidMode = WebKeyboardAvoidMode.OVERLAYS_CONTENT
              await Utils.sleep(2000);
              this.controller.loadUrl("www.baidu.com");
              await Utils.sleep(2000);
              this.controller.loadUrl("resource://rawfile/index377.html");
              await Utils.sleep(2000);
              let driver = Driver.create();
              let buttonOne = await driver.findComponent(ON.text('URLA'));
              await buttonOne.click()
              await Utils.sleep(4000);
              this.controller.runJavaScript("checkHeight()", (error, result) => {
                console.log('The checkHeight() return value is: ${result}')
                Utils.emitEvent(result, 171711)
              })
              break;
            }
            case "emitKeyboardAvoidMode1200": {
              this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent('false', 171712)
                  break;
                }
              this.avoidMode = WebKeyboardAvoidMode.OVERLAYS_CONTENT
              await Utils.sleep(2000);
              this.controller.loadUrl("www.baidu.com");
              await Utils.sleep(2000);
              this.controller.loadUrl("resource://rawfile/index377.html");
              await Utils.sleep(2000);
              let driver = Driver.create();
              let buttonOne = await driver.findComponent(ON.text('TelA'));
              await buttonOne.click()
              await Utils.sleep(4000);
              this.controller.runJavaScript("checkHeight()", (error, result) => {
                console.log('The checkHeight() return value is: ${result}')
                Utils.emitEvent(result, 171712)
              })
              break;
            }
            case "emitKeyboardAvoidMode1300": {
              this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent('true', 171713)
                  break;
                }
              this.avoidMode = WebKeyboardAvoidMode.RESIZE_VISUAL
              await Utils.sleep(2000);
              this.controller.loadUrl("www.baidu.com");
              await Utils.sleep(2000);
              this.controller.loadUrl("resource://rawfile/index377.html");
              await Utils.sleep(2000);
              let driver = Driver.create();
              let buttonOne = await driver.findComponent(ON.text('TelA'));
              await buttonOne.click()
              await Utils.sleep(4000);
              this.controller.runJavaScript("checkHeightOne()", (error, result) => {
                console.log('The checkHeight() return value is: ${result}')
                Utils.emitEvent(result, 171713)
              })
              break;
            }
            case "emitKeyboardAvoidMode1400": {
              this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent('true', 171714)
                  break;
                }
              this.avoidMode = WebKeyboardAvoidMode.RESIZE_VISUAL
              await Utils.sleep(2000);
              this.controller.loadUrl("www.baidu.com");
              await Utils.sleep(2000);
              this.controller.loadUrl("resource://rawfile/index377.html");
              await Utils.sleep(2000);
              let driver = Driver.create();
              let buttonOne = await driver.findComponent(ON.text('TextA'));
              await buttonOne.click()
              await Utils.sleep(4000);
              this.controller.runJavaScript("checkHeightOne()", (error, result) => {
                console.log('The checkHeight() return value is: ${result}')
                Utils.emitEvent(result, 171714)
              })
              break;
            }
            case "emitKeyboardAvoidMode1500": {
              this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent('true', 171715)
                  break;
                }
              this.avoidMode = WebKeyboardAvoidMode.RESIZE_VISUAL
              await Utils.sleep(2000);
              this.controller.loadUrl("www.baidu.com");
              await Utils.sleep(2000);
              this.controller.loadUrl("resource://rawfile/index377.html");
              await Utils.sleep(2000);
              let driver = Driver.create();
              let buttonOne = await driver.findComponent(ON.text('7788'));
              await buttonOne.click()
              await Utils.sleep(4000);
              this.controller.runJavaScript("checkHeightOne()", (error, result) => {
                console.log('The checkHeight() return value is: ${result}')
                Utils.emitEvent(result, 171715)
              })
              break;
            }
            case "emitKeyboardAvoidMode1600": {
              this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent('true', 171716)
                  break;
                }
              this.avoidMode = WebKeyboardAvoidMode.RESIZE_VISUAL
              await Utils.sleep(2000);
              this.controller.loadUrl("www.baidu.com");
              await Utils.sleep(2000);
              this.controller.loadUrl("resource://rawfile/index377.html");
              await Utils.sleep(2000);
              let driver = Driver.create();
              let buttonOne = await driver.findComponent(ON.text('EmailA'));
              await buttonOne.click()
              await Utils.sleep(4000);
              this.controller.runJavaScript("checkHeightOne()", (error, result) => {
                console.log('The checkHeight() return value is: ${result}')
                Utils.emitEvent(result, 171716)
              })
              break;
            }
            case "emitKeyboardAvoidMode1700": {
              this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent('true', 171717)
                  break;
                }
              this.avoidMode = WebKeyboardAvoidMode.RESIZE_VISUAL
              await Utils.sleep(2000);
              this.controller.loadUrl("www.baidu.com");
              await Utils.sleep(2000);
              this.controller.loadUrl("resource://rawfile/index377.html");
              await Utils.sleep(2000);
              let driver = Driver.create();
              let buttonOne = await driver.findComponent(ON.text('URLA'));
              await buttonOne.click()
              await Utils.sleep(4000);
              this.controller.runJavaScript("checkHeightOne()", (error, result) => {
                console.log('The checkHeight() return value is: ${result}')
                Utils.emitEvent(result, 171717)
              })
              break;
            }
            case "emitKeyboardAvoidMode1800": {
              this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent('true', 171718)
                  break;
                }
              this.avoidMode = WebKeyboardAvoidMode.RESIZE_VISUAL
              await Utils.sleep(2000);
              this.controller.loadUrl("www.baidu.com");
              await Utils.sleep(2000);
              this.controller.loadUrl("resource://rawfile/index377.html");
              await Utils.sleep(2000);
              let driver = Driver.create();
              let buttonOne = await driver.findComponent(ON.type('textField').isAfter(ON.text('TextA')));
              await buttonOne.click()
              await Utils.sleep(4000);
              this.controller.runJavaScript("checkHeightOne()", (error, result) => {
                console.log('The checkHeight() return value is: ${result}')
                Utils.emitEvent(result, 171718)
              })
              break;
            }
            case "emitKeyboardAvoidMode1900": {
              this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent('true', 171719)
                  break;
                }
              this.avoidMode = WebKeyboardAvoidMode.RESIZE_CONTENT
              await Utils.sleep(2000);
              this.controller.loadUrl("www.baidu.com");
              await Utils.sleep(2000);
              this.controller.loadUrl("resource://rawfile/index378.html");
              await Utils.sleep(2000);
              let driver = Driver.create();
              let buttonOne = await driver.findComponent(ON.text('paragraph with text'));
              await buttonOne.click()
              await Utils.sleep(4000);
              this.controller.runJavaScript("checkHeight()", (error, result) => {
                console.log('The checkHeight() return value is: ${result}')
                Utils.emitEvent(result, 171719)
              })
              break;
            }
            case "emitKeyboardAvoidMode2000": {
              this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent('true', 171720)
                  break;
                }
              this.avoidMode = WebKeyboardAvoidMode.RESIZE_CONTENT
              await Utils.sleep(2000);
              this.controller.loadUrl("www.baidu.com");
              await Utils.sleep(2000);
              this.controller.loadUrl("resource://rawfile/index378.html");
              await Utils.sleep(2000);
              let driver = Driver.create();
              let buttonOne = await driver.findComponent(ON.text('paragraph with tel'));
              await buttonOne.click()
              await Utils.sleep(4000);
              this.controller.runJavaScript("checkHeight()", (error, result) => {
                console.log('The checkHeight() return value is: ${result}')
                Utils.emitEvent(result, 171720)
              })
              break;
            }
            case "emitKeyboardAvoidMode2100": {
              this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent('true', 171721)
                  break;
                }
              this.avoidMode = WebKeyboardAvoidMode.RESIZE_CONTENT
              await Utils.sleep(2000);
              this.controller.loadUrl("www.baidu.com");
              await Utils.sleep(2000);
              this.controller.loadUrl("resource://rawfile/index378.html");
              await Utils.sleep(2000);
              let driver = Driver.create();
              let buttonOne = await driver.findComponent(ON.text('paragraph with url'));
              await buttonOne.click()
              await Utils.sleep(4000);
              this.controller.runJavaScript("checkHeight()", (error, result) => {
                console.log('The checkHeight() return value is: ${result}')
                Utils.emitEvent(result, 171721)
              })
              break;
            }
            case "emitKeyboardAvoidMode2200": {
              this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent('true', 171722)
                  break;
                }
              this.avoidMode = WebKeyboardAvoidMode.RESIZE_CONTENT
              await Utils.sleep(2000);
              this.controller.loadUrl("www.baidu.com");
              await Utils.sleep(2000);
              this.controller.loadUrl("resource://rawfile/index378.html");
              await Utils.sleep(2000);
              let driver = Driver.create();
              let buttonOne = await driver.findComponent(ON.text('paragraph with email'));
              await buttonOne.click()
              await Utils.sleep(4000);
              this.controller.runJavaScript("checkHeight()", (error, result) => {
                console.log('The checkHeight() return value is: ${result}')
                Utils.emitEvent(result, 171722)
              })
              break;
            }
            case "emitKeyboardAvoidMode2300": {
              this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent('true', 171723)
                  break;
                }
              this.avoidMode = WebKeyboardAvoidMode.RESIZE_CONTENT
              await Utils.sleep(2000);
              this.controller.loadUrl("www.baidu.com");
              await Utils.sleep(2000);
              this.controller.loadUrl("resource://rawfile/index378.html");
              await Utils.sleep(2000);
              let driver = Driver.create();
              let buttonOne = await driver.findComponent(ON.text('paragraph with numeric'));
              await buttonOne.click()
              await Utils.sleep(4000);
              this.controller.runJavaScript("checkHeight()", (error, result) => {
                console.log('The checkHeight() return value is: ${result}')
                Utils.emitEvent(result, 171723)
              })
              break;
            }
            case "emitKeyboardAvoidMode2400": {
              this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent('true', 171724)
                  break;
                }
              this.avoidMode = WebKeyboardAvoidMode.RESIZE_CONTENT
              await Utils.sleep(2000);
              this.controller.loadUrl("www.baidu.com");
              await Utils.sleep(2000);
              this.controller.loadUrl("resource://rawfile/index378.html");
              await Utils.sleep(2000);
              let driver = Driver.create();
              let buttonOne = await driver.findComponent(ON.text('paragraph with decimal'));
              await buttonOne.click()
              await Utils.sleep(4000);
              this.controller.runJavaScript("checkHeight()", (error, result) => {
                console.log('The checkHeight() return value is: ${result}')
                Utils.emitEvent(result, 171724)
              })
              break;
            }
            case "emitKeyboardAvoidMode2500": {
              this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent('false', 171725)
                  break;
                }
              this.avoidMode = WebKeyboardAvoidMode.OVERLAYS_CONTENT
              await Utils.sleep(2000);
              this.controller.loadUrl("www.baidu.com");
              await Utils.sleep(2000);
              this.controller.loadUrl("resource://rawfile/index378.html");
              await Utils.sleep(2000);
              let driver = Driver.create();
              let buttonOne = await driver.findComponent(ON.text('paragraph with text'));
              await buttonOne.click()
              await Utils.sleep(4000);
              this.controller.runJavaScript("checkHeight()", (error, result) => {
                console.log('The checkHeight() return value is: ${result}')
                Utils.emitEvent(result, 171725)
              })
              break;
            }
            case "emitKeyboardAvoidMode2600": {
              this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent('false', 171726)
                  break;
                }
              this.avoidMode = WebKeyboardAvoidMode.OVERLAYS_CONTENT
              await Utils.sleep(2000);
              this.controller.loadUrl("www.baidu.com");
              await Utils.sleep(2000);
              this.controller.loadUrl("resource://rawfile/index378.html");
              await Utils.sleep(2000);
              let driver = Driver.create();
              let buttonOne = await driver.findComponent(ON.text('paragraph with tel'));
              await buttonOne.click()
              await Utils.sleep(4000);
              this.controller.runJavaScript("checkHeight()", (error, result) => {
                console.log('The checkHeight() return value is: ${result}')
                Utils.emitEvent(result, 171726)
              })
              break;
            }
            case "emitKeyboardAvoidMode2700": {
              this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent('false', 171727)
                  break;
                }
              this.avoidMode = WebKeyboardAvoidMode.OVERLAYS_CONTENT
              await Utils.sleep(2000);
              this.controller.loadUrl("www.baidu.com");
              await Utils.sleep(2000);
              this.controller.loadUrl("resource://rawfile/index378.html");
              await Utils.sleep(2000);
              let driver = Driver.create();
              let buttonOne = await driver.findComponent(ON.text('paragraph with url'));
              await buttonOne.click()
              await Utils.sleep(4000);
              this.controller.runJavaScript("checkHeight()", (error, result) => {
                console.log('The checkHeight() return value is: ${result}')
                Utils.emitEvent(result, 171727)
              })
              break;
            }
            case "emitKeyboardAvoidMode2800": {
              this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent('false', 171728)
                  break;
                }
              this.avoidMode = WebKeyboardAvoidMode.OVERLAYS_CONTENT
              await Utils.sleep(2000);
              this.controller.loadUrl("www.baidu.com");
              await Utils.sleep(2000);
              this.controller.loadUrl("resource://rawfile/index378.html");
              await Utils.sleep(2000);
              let driver = Driver.create();
              let buttonOne = await driver.findComponent(ON.text('paragraph with email'));
              await buttonOne.click()
              await Utils.sleep(4000);
              this.controller.runJavaScript("checkHeight()", (error, result) => {
                console.log('The checkHeight() return value is: ${result}')
                Utils.emitEvent(result, 171728)
              })
              break;
            }
            case "emitKeyboardAvoidMode2900": {
              this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent('false', 171729)
                  break;
                }
              this.avoidMode = WebKeyboardAvoidMode.OVERLAYS_CONTENT
              await Utils.sleep(2000);
              this.controller.loadUrl("www.baidu.com");
              await Utils.sleep(2000);
              this.controller.loadUrl("resource://rawfile/index378.html");
              await Utils.sleep(2000);
              let driver = Driver.create();
              let buttonOne = await driver.findComponent(ON.text('paragraph with numeric'));
              await buttonOne.click()
              await Utils.sleep(4000);
              this.controller.runJavaScript("checkHeight()", (error, result) => {
                console.log('The checkHeight() return value is: ${result}')
                Utils.emitEvent(result, 171729)
              })
              break;
            }
            case "emitKeyboardAvoidMode3000": {
              this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent('false', 171730)
                  break;
                }
              this.avoidMode = WebKeyboardAvoidMode.OVERLAYS_CONTENT
              await Utils.sleep(2000);
              this.controller.loadUrl("www.baidu.com");
              await Utils.sleep(2000);
              this.controller.loadUrl("resource://rawfile/index378.html");
              await Utils.sleep(2000);
              let driver = Driver.create();
              let buttonOne = await driver.findComponent(ON.text('paragraph with decimal'));
              await buttonOne.click()
              await Utils.sleep(4000);
              this.controller.runJavaScript("checkHeight()", (error, result) => {
                console.log('The checkHeight() return value is: ${result}')
                Utils.emitEvent(result, 171730)
              })
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
    }
  }
}
