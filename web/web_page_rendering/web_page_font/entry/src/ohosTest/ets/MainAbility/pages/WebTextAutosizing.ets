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
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import testsuite from '../../test/List.test';
import {waitForExist} from '../../test/WaitTest.test';

@Entry
@Component
struct WebTextAutosizing {
  webviewController: web_webview.WebviewController = new web_webview.WebviewController();
  @State str: string = ""
  @State text: number = 0
  @State text1: number = 0
  @State ClientWidth:number = 0
  @State de: number = 1
  @State qa: number = 9
  @State det: number = 13
  @State userAgentPC:string = "";
  @State isTextAutosizing: boolean | undefined | null= false;
  @State flag:boolean = false
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;


  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 150200,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(150200)
  }

    private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 0;
      }
    }
  }

  aboutToAppear() {
    let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
    let abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments();
    console.info('start run testcase!!!');
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite);
  }

  build() {
    Column() {
      Row() {
        Button("WebTextAutosizing").id('WebTextAutosizing').onClick(async () => {
          await waitForExist(() => this.isPageEnd, this.str, 0);
          await waitForExist(() => this.isReceive, this.str, 0);
          this.isReceive = -1;
          console.info("key==>" + this.str)
          switch (this.str) {

            case "TextAutosizing0100": {
              this.userAgentPC = this.webviewController.getUserAgent();
              if ((this.userAgentPC).includes("PC")) {
                Utils.emitEvent(true, 150210)
                break;
              }else if((this.userAgentPC).includes("Tablet")){
                Utils.emitEvent(true, 150210)
                break;
              }
              this.webviewController.runJavaScript("getClientWidth()", (err, res) => {
                  this.ClientWidth = Number(res);
                  Utils.sleep(3000);
                  //判断是否是智慧屏
                  if(this.ClientWidth > 980) {
                   this.flag = true;
                  }
                })
              
              let value: boolean = false;
              this.isTextAutosizing = false;
              this.de = 1
              this.text = 0
              this.text1 = 0
              try {
                 this.isPageEnd = -1;
                 this.webviewController.loadUrl($rawfile("text.html"));
                 await waitForExist(() => this.isPageEnd, this.str, 0);
     
                this.de = 100;
                this.isPageEnd = -1;
                this.webviewController.refresh();
                await waitForExist(() => this.isPageEnd, this.str, 0);
                this.webviewController.runJavaScript("getSize()", (err, res) => {
                  console.info("key==>getNum1 res :" + JSON.stringify(res))
                  this.text = Number(res)
                })
                this.isTextAutosizing = true;
                await Utils.sleep(2000);
                this.webviewController.runJavaScript("getSize()", (err, res) => {
                  console.info("key==>getNum1 res :" + JSON.stringify(res))
                  this.text1 = Number(res)
                })
                await Utils.sleep(2000);
                if (this.text1 < this.text) {
                  value = true;
                }
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
  

              setTimeout(() => {
                console.log("value01: " + value);
                // 判断是否是智慧屏
                if(this.flag == true) {
                    Utils.emitEvent(true, 150210)
                } else {
                   Utils.emitEvent(value, 150210)
                }
                
              }, 3000)

              break;
            }

            case "TextAutosizing0200": {
              this.userAgentPC = this.webviewController.getUserAgent();
              if ((this.userAgentPC).includes("PC")) {
                Utils.emitEvent(true, 150220)
                break;
              }else if((this.userAgentPC).includes("Tablet")){
                Utils.emitEvent(true, 150220)
                break;
              }
              let value: boolean = false;
              this.isTextAutosizing = false;
              this.de = 1
              this.text = 0
              this.text1 = 0
              try {
                this.isPageEnd = -1;
                 this.webviewController.loadUrl($rawfile("text.html"));
                 await waitForExist(() => this.isPageEnd, this.str, 0);
                this.de = 100;
                this.isPageEnd = -1;
                this.webviewController.refresh();
                await waitForExist(() => this.isPageEnd, this.str, 0);
                this.webviewController.runJavaScript("getSize()", (err, res) => {
                  console.info("key==>getNum2 res :" + JSON.stringify(res))
                  this.text = Number(res)
                })
                this.isTextAutosizing = false;
                await Utils.sleep(2000);
                this.webviewController.runJavaScript("getSize()", (err, res) => {
                  console.info("key==>getNum2 res :" + JSON.stringify(res))
                  this.text1 = Number(res)
                })
                await Utils.sleep(2000);
                if (this.text1 == this.text) {
                  value = true;
                }
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }

              setTimeout(() => {
                console.log("value02: " + value);
                Utils.emitEvent(value, 150220)
              }, 3000)
              break;
            }

            case "TextAutosizing0300": {
              this.userAgentPC = this.webviewController.getUserAgent();
              if ((this.userAgentPC).includes("PC")) {
                Utils.emitEvent(true, 150230)
                break;
              }else if((this.userAgentPC).includes("Tablet")){
                Utils.emitEvent(true, 150230)
                break;
              }
              let value: boolean = false;
              this.isTextAutosizing = false;
              this.de = 1
              this.text = 0
              this.text1 = 0
              try {
                this.isPageEnd = -1;
                 this.webviewController.loadUrl($rawfile("text.html"));
                 await waitForExist(() => this.isPageEnd, this.str, 0);
                this.de = 100;
                this.isPageEnd = -1;
                this.webviewController.refresh();
                await waitForExist(() => this.isPageEnd, this.str, 0);
                this.webviewController.runJavaScript("getSize()", (err, res) => {
                  console.info("key==>getNum3 res :" + JSON.stringify(res))
                  this.text = Number(res)
                })
                this.isTextAutosizing = undefined;
                await Utils.sleep(2000);
                this.webviewController.runJavaScript("getSize()", (err, res) => {
                  console.info("key==>getNum3 res :" + JSON.stringify(res))
                  this.text1 = Number(res)
                })
                await Utils.sleep(2000);
                if (this.text1 == this.text) {
                  value = true;
                }
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }

              setTimeout(() => {
                console.log("value03: " + value);
                Utils.emitEvent(value, 150230)
              }, 3000)
              break;
            }
            case "TextAutosizing0400": {
              this.userAgentPC = this.webviewController.getUserAgent();
              if ((this.userAgentPC).includes("PC")) {
                Utils.emitEvent(true, 150240)
                break;
              }else if((this.userAgentPC).includes("Tablet")){
                Utils.emitEvent(true, 150240)
                break;
              }
              let value: boolean = false;
              this.isTextAutosizing = false;
              this.de = 1
              this.text = 0
              this.text1 = 0
              try {
                this.isPageEnd = -1;
                 this.webviewController.loadUrl($rawfile("text.html"));
                 await waitForExist(() => this.isPageEnd, this.str, 0);
                this.de = 100;
                this.isPageEnd = -1;
                this.webviewController.refresh();
                await waitForExist(() => this.isPageEnd, this.str, 0);
                this.webviewController.runJavaScript("getSize()", (err, res) => {
                  console.info("key==>getNum4 res :" + JSON.stringify(res))
                  this.text = Number(res)
                })
                this.isTextAutosizing = null;
                await Utils.sleep(2000);
                this.webviewController.runJavaScript("getSize()", (err, res) => {
                  console.info("key==>getNum4 res :" + JSON.stringify(res))
                  this.text1 = Number(res)
                })
                await Utils.sleep(2000);
                if (this.text1 == this.text) {
                  value = true;
                }
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }

              setTimeout(() => {
                console.log("value04: " + value);
                Utils.emitEvent(value, 150240)
              }, 3000)
              break;
            }
          }
        })
      }

      Web({ src: $rawfile("text.html"), controller: this.webviewController })
        .height(500)
        .padding(20)
        .javaScriptAccess(true)
        .zoomAccess(true)
        .multiWindowAccess(true)
        .webFixedFont("HarmonyOS-Sans-Condensed")
        .minFontSize(this.de)
        .minLogicalFontSize(this.qa)
        .defaultFixedFontSize(this.det)
        .textAutosizing(this.isTextAutosizing)
        .onPageEnd((event) => {
            if (event) {
              this.isPageEnd = 0;
              console.log('onPageEnd url:' + event.url);
            }
          })
    }
  }


}
