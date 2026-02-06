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
import webView from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';
import { BusinessError } from '@ohos.base';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import testsuite from '../../test/List.test';
import { waitForExist } from '../../test/WaitTest.test';
@Entry
@Component
struct WebDefaultTextEncodingFormat {
  @State str: string = ""
  @State encoding: string | null | undefined= ""
  @State userAgentPC:string = "";
  @State isPageEnd:number = -1 ;
  @State isReceive: number = -1;
  controller: webView.WebviewController = new webView.WebviewController();
  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 153320,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(153320)
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
        Button("WebDefaultTextEncodingFormat").id('WebDefaultTextEncodingFormat').onClick(async () => {
          console.info("key==>" + this.str)
          await waitForExist(() => this.isPageEnd, this.str, 0);
          await waitForExist(() => this.isReceive, this.str, 0);
          this.isReceive = -1;
          switch (this.str) {
            case "defaultTextEncodingFormat0100": {
              let value: string;
              try {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent("UTF-8", 153330)
                }else{
                  this.encoding = "UTF-8";
                  await Utils.sleep(2000);
                  this.isPageEnd = -1;
                  this.controller.refresh();
                  await waitForExist(()=>this.isPageEnd, this.str, 0);
                  this.controller.runJavaScript("getEncoding()", (err, res) => {
                    console.info("key==>getEncoding res 1:" + res)
                    value = res.substring(1, res.length - 1);
                    Utils.emitEvent(value, 153330)
                  })
                }
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "defaultTextEncodingFormat0200": {
              let value: string;
              try {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent("gb18030", 153340)
                }else{
                  this.encoding = "gb18030";
                  await Utils.sleep(2000);
                  this.isPageEnd = -1;
                  this.controller.refresh();
                  await waitForExist(()=>this.isPageEnd, this.str, 0);
                  this.controller.runJavaScript("getEncoding()", (err, res) => {
                    console.info("key==>getEncoding res 2:" + res)
                    value = res.substring(1, res.length - 1);
                    Utils.emitEvent(value, 153340)
                  })
                }
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "defaultTextEncodingFormat0300": {
              let value: string;
              try {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent("GBK", 153350)
                }else{
                  this.encoding = "GBK";
                  await Utils.sleep(2000);
                  this.isPageEnd = -1;
                  this.controller.refresh();
                  await waitForExist(()=>this.isPageEnd, this.str, 0);
                  this.controller.runJavaScript("getEncoding()", (err, res) => {
                    console.info("key==>getEncoding res 3:" + res)
                    value = res.substring(1, res.length - 1);
                    Utils.emitEvent(value, 153350)
                  })
                }
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "defaultTextEncodingFormat0400": {
              let value: string;
              try {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent("Big5", 153360)
                }else{
                  this.encoding = "Big5";
                  await Utils.sleep(2000);
                  this.isPageEnd = -1;
                  this.controller.refresh();
                  await waitForExist(()=>this.isPageEnd, this.str, 0);
                  this.controller.runJavaScript("getEncoding()", (err, res) => {
                    console.info("key==>getEncoding res 4:" + res)
                    value = res.substring(1, res.length - 1);
                    Utils.emitEvent(value, 153360)
                  })
                }
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "defaultTextEncodingFormat0500": {
              let value: string;
              try {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent("windows-1252", 153370)
                }else{
                  this.encoding = "windows-1252";
                  await Utils.sleep(2000);
                  this.isPageEnd = -1;
                  this.controller.refresh();
                  await waitForExist(()=>this.isPageEnd, this.str, 0);
                  this.controller.runJavaScript("getEncoding()", (err, res) => {
                    console.info("key==>getEncoding res 5:" + res)
                    value = res.substring(1, res.length - 1);
                    Utils.emitEvent(value, 153370)
                  })
                }
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "defaultTextEncodingFormat0600": {
              let value: string;
              try {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent("macintosh", 153380)
                }else{
                  this.encoding = "macintosh";
                  await Utils.sleep(2000);
                  this.isPageEnd = -1;
                  this.controller.refresh();
                  await waitForExist(()=>this.isPageEnd, this.str, 0);
                  this.controller.runJavaScript("getEncoding()", (err, res) => {
                    console.info("key==>getEncoding res 6:" + res)
                    value = res.substring(1, res.length - 1);
                    Utils.emitEvent(value, 153380)
                  })
                }
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "defaultTextEncodingFormat0700": {
              let value: string;
              try {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent("EUC-KR", 153390)
                }else{
                  this.encoding = "EUC-KR";
                  await Utils.sleep(2000);
                  this.isPageEnd = -1;
                  this.controller.refresh();
                  await waitForExist(()=>this.isPageEnd, this.str, 0);
                  this.controller.runJavaScript("getEncoding()", (err, res) => {
                    console.info("key==>getEncoding res 7:" + res)
                    value = res.substring(1, res.length - 1);
                    Utils.emitEvent(value, 153390)
                  })
                }
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "defaultTextEncodingFormat0800": {
              let value: string;
              try {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent("ISO-2022-JP", 153400)
                }else{
                  this.encoding = "ISO-2022-JP";
                  await Utils.sleep(2000);
                  this.isPageEnd = -1;
                  this.controller.refresh();
                  await waitForExist(()=>this.isPageEnd, this.str, 0);
                  this.controller.runJavaScript("getEncoding()", (err, res) => {
                    console.info("key==>getEncoding res 8:" + res)
                    value = res.substring(1, res.length - 1);
                    Utils.emitEvent(value, 153400)
                  })
                }
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "defaultTextEncodingFormat0900": {
              let value: string;
              try {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent("EUC-JP", 153410)
                }else{
                  this.encoding = "EUC-JP";
                  await Utils.sleep(2000);
                  this.isPageEnd = -1;
                  this.controller.refresh();
                  await waitForExist(()=>this.isPageEnd, this.str, 0);
                  this.controller.runJavaScript("getEncoding()", (err, res) => {
                    console.info("key==>getEncoding res 9:" + res)
                    value = res.substring(1, res.length - 1);
                    Utils.emitEvent(value, 153410)
                  })
                }
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "defaultTextEncodingFormat1000": {
              let value: string;
              try {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent("Shift_JIS", 153420)
                }else{
                  this.encoding = "Shift_JIS";
                  await Utils.sleep(2000);
                  this.isPageEnd = -1;
                  this.controller.refresh();
                  await waitForExist(()=>this.isPageEnd, this.str, 0);
                  this.controller.runJavaScript("getEncoding()", (err, res) => {
                    console.info("key==>getEncoding res 10:" + res)
                    value = res.substring(1, res.length - 1);
                    Utils.emitEvent(value, 153420)
                  })
                }
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "defaultTextEncodingFormat1100": {
              let value: string;
              try {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent("UTF-8", 153430)
                }else{
                  this.encoding = "";
                  await Utils.sleep(2000);
                  this.isPageEnd = -1;
                  this.controller.refresh();
                  await waitForExist(()=>this.isPageEnd, this.str, 0);
                  this.controller.runJavaScript("getEncoding()", (err, res) => {
                    console.info("key==>getEncoding res 11:" + res)
                    value = res.substring(1, res.length - 1);
                    Utils.emitEvent(value, 153430)
                  })
                }
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "defaultTextEncodingFormat1200": {
              let value: string;
              try {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent("UTF-8", 153440)
                }else{
                  this.encoding = " ";
                  await Utils.sleep(2000);
                  this.isPageEnd = -1;
                  this.controller.refresh();
                  await waitForExist(()=>this.isPageEnd, this.str, 0);
                  console.info("zbr1" + this.encoding);
                  this.controller.runJavaScript("getEncoding()", (err, res) => {
                    console.info("zbr-key==>getEncoding res 12:" + res)
                    value = res.substring(1, res.length - 1);
                    Utils.emitEvent(value, 153440)
                  })
                }
              } catch (error) {
                console.error(`zbr-ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "defaultTextEncodingFormat1300": {
              let value: string;
              try {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent("UTF-8", 153450)
                }else{
                  this.encoding = "qwer123.";
                  await Utils.sleep(2000);
                  this.isPageEnd = -1;
                  this.controller.refresh();
                  await waitForExist(()=>this.isPageEnd, this.str, 0);
                  this.controller.runJavaScript("getEncoding()", (err, res) => {
                    console.info("key==>getEncoding res 13:" + res)
                    value = res.substring(1, res.length - 1);
                    Utils.emitEvent(value, 153450)
                  })
                }
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "defaultTextEncodingFormat1400": {
              let value: string;
              try {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent("UTF-8", 153460)
                }else{
                  this.encoding = null;
                  await Utils.sleep(2000);
                  this.isPageEnd = -1;
                  this.controller.refresh();
                  await waitForExist(()=>this.isPageEnd, this.str, 0);
                  this.controller.runJavaScript("getEncoding()", (err, res) => {
                    console.info("key==>getEncoding res 14:" + res)
                    value = res.substring(1, res.length - 1);
                    Utils.emitEvent(value, 153460)
                  })
                }
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "defaultTextEncodingFormat1500": {
              let value: string;
              try {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent("UTF-8", 153470)
                }else{
                  this.encoding = undefined;
                  await Utils.sleep(2000);
                  this.isPageEnd = -1;
                  this.controller.refresh();
                  await waitForExist(()=>this.isPageEnd, this.str, 0);
                  this.controller.runJavaScript("getEncoding()", (err, res) => {
                    console.info("key==>getEncoding res 15:" + res)
                    value = res.substring(1, res.length - 1);
                    Utils.emitEvent(value, 153470)
                  })
                }
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "defaultTextEncodingFormat1600": {
              let value: string;
              try {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent("UTF-8", 153480)
                }else{
                  this.encoding = "ASCII";
                  await Utils.sleep(2000);
                  this.isPageEnd = -1;
                  this.controller.refresh();
                  await waitForExist(()=>this.isPageEnd, this.str, 0);
                  this.controller.runJavaScript("getEncoding()", (err, res) => {
                    console.info("key==>getEncoding res 16:" + res)
                    value = res.substring(1, res.length - 1);
                    Utils.emitEvent(value, 153480)
                  })
                }
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "defaultTextEncodingFormat1700": {
              let value: string;
              try {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent("UTF-8", 153490)
                }else{
                  this.encoding = "ANSI";
                  await Utils.sleep(2000);
                  this.isPageEnd = -1;
                  this.controller.refresh();
                  await waitForExist(()=>this.isPageEnd, this.str, 0);
                  this.controller.runJavaScript("getEncoding()", (err, res) => {
                    console.info("key==>getEncoding res 17:" + res)
                    value = res.substring(1, res.length - 1);
                    Utils.emitEvent(value, 153490)
                  })
                }
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "defaultTextEncodingFormat1800": {
              let value: string;
              try {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent("UTF-8", 153500)
                }else{
                  this.encoding = "utf-8";
                  await Utils.sleep(2000);
                  this.isPageEnd = -1;
                  this.controller.refresh();
                  await waitForExist(()=>this.isPageEnd, this.str, 0);
                  this.controller.runJavaScript("getEncoding()", (err, res) => {
                    console.info("key==>getEncoding res 18:" + res)
                    value = res.substring(1, res.length - 1);
                    Utils.emitEvent(value, 153500)
                  })
                }
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
          }
        })
      }

      Web({ src: $rawfile("index_defaultTextEncodingFormat.html"), controller: this.controller })
        .defaultTextEncodingFormat(this.encoding)
        .onPageEnd((event) => {
          console.log('web pageEnd==>' + event.url);
          this.isPageEnd = 0;
        })
    }
  }
}
