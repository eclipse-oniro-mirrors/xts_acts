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

@Entry
@Component
struct WebDefaultTextEncodingFormat {
  @State str: string = ""
  @State encoding: string | null | undefined= ""
  @State userAgentPC:string = "";
  controller: webView.WebviewController = new webView.WebviewController();
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
          switch (this.str) {
            case "defaultTextEncodingFormat0100": {
              let value: string;
              try {
                this.encoding = "UTF-8";
                await Utils.sleep(2000);
                this.controller.refresh();
                await Utils.sleep(2000);
                this.controller.runJavaScript("getEncoding()", (err, res) => {
                  console.info("key==>getEncoding res 1:" + res)
                  value = res.substring(1, res.length - 1);
                })
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              setTimeout(() => {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent("UTF-8", 7701)
                }else{
                  Utils.emitEvent(value, 7701)
                }
              }, 3000)
              break;
            }
            case "defaultTextEncodingFormat0200": {
              let value: string;
              try {
                this.encoding = "gb18030";
                await Utils.sleep(2000);
                this.controller.refresh();
                await Utils.sleep(2000);
                this.controller.runJavaScript("getEncoding()", (err, res) => {
                  console.info("key==>getEncoding res 2:" + res)
                  value = res.substring(1, res.length - 1);
                })
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              setTimeout(() => {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent("gb18030", 7702)
                }else{
                  Utils.emitEvent(value, 7702)
                }
              }, 3000)
              break;
            }
            case "defaultTextEncodingFormat0300": {
              let value: string;
              try {
                this.encoding = "GBK";
                await Utils.sleep(2000);
                this.controller.refresh();
                await Utils.sleep(2000);
                this.controller.runJavaScript("getEncoding()", (err, res) => {
                  console.info("key==>getEncoding res 3:" + res)
                  value = res.substring(1, res.length - 1);
                })
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              setTimeout(() => {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent("GBK", 7703)
                }else{
                  Utils.emitEvent(value, 7703)
                }
              }, 3000)
              break;
            }
            case "defaultTextEncodingFormat0400": {
              let value: string;
              try {
                this.encoding = "Big5";
                await Utils.sleep(2000);
                this.controller.refresh();
                await Utils.sleep(2000);
                this.controller.runJavaScript("getEncoding()", (err, res) => {
                  console.info("key==>getEncoding res 4:" + res)
                  value = res.substring(1, res.length - 1);
                })
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              setTimeout(() => {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent("Big5", 7704)
                }else{
                  Utils.emitEvent(value, 7704)
                }
              }, 3000)
              break;
            }
            case "defaultTextEncodingFormat0500": {
              let value: string;
              try {
                this.encoding = "windows-1252";
                await Utils.sleep(2000);
                this.controller.refresh();
                await Utils.sleep(2000);
                this.controller.runJavaScript("getEncoding()", (err, res) => {
                  console.info("key==>getEncoding res 5:" + res)
                  value = res.substring(1, res.length - 1);
                })
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              setTimeout(() => {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent("windows-1252", 7705)
                }else{
                  Utils.emitEvent(value, 7705)
                }
              }, 3000)
              break;
            }
            case "defaultTextEncodingFormat0600": {
              let value: string;
              try {
                this.encoding = "macintosh";
                await Utils.sleep(2000);
                this.controller.refresh();
                await Utils.sleep(2000);
                this.controller.runJavaScript("getEncoding()", (err, res) => {
                  console.info("key==>getEncoding res 6:" + res)
                  value = res.substring(1, res.length - 1);
                })
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              setTimeout(() => {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent("macintosh", 7706)
                }else{
                  Utils.emitEvent(value, 7706)
                }
              }, 3000)
              break;
            }
            case "defaultTextEncodingFormat0700": {
              let value: string;
              try {
                this.encoding = "EUC-KR";
                await Utils.sleep(2000);
                this.controller.refresh();
                await Utils.sleep(2000);
                this.controller.runJavaScript("getEncoding()", (err, res) => {
                  console.info("key==>getEncoding res 7:" + res)
                  value = res.substring(1, res.length - 1);
                })
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              setTimeout(() => {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent("EUC-KR", 7707)
                }else{
                  Utils.emitEvent(value, 7707)
                }
              }, 3000)
              break;
            }
            case "defaultTextEncodingFormat0800": {
              let value: string;
              try {
                this.encoding = "ISO-2022-JP";
                await Utils.sleep(2000);
                this.controller.refresh();
                await Utils.sleep(2000);
                this.controller.runJavaScript("getEncoding()", (err, res) => {
                  console.info("key==>getEncoding res 8:" + res)
                  value = res.substring(1, res.length - 1);
                })
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              setTimeout(() => {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent("ISO-2022-JP", 7708)
                }else{
                  Utils.emitEvent(value, 7708)
                }
              }, 3000)
              break;
            }
            case "defaultTextEncodingFormat0900": {
              let value: string;
              try {
                this.encoding = "EUC-JP";
                await Utils.sleep(2000);
                this.controller.refresh();
                await Utils.sleep(2000);
                this.controller.runJavaScript("getEncoding()", (err, res) => {
                  console.info("key==>getEncoding res 9:" + res)
                  value = res.substring(1, res.length - 1);
                })
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              setTimeout(() => {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent("EUC-JP", 7709)
                }else{
                  Utils.emitEvent(value, 7709)
                }
              }, 3000)
              break;
            }
            case "defaultTextEncodingFormat1000": {
              let value: string;
              try {
                this.encoding = "Shift_JIS";
                await Utils.sleep(2000);
                this.controller.refresh();
                await Utils.sleep(2000);
                this.controller.runJavaScript("getEncoding()", (err, res) => {
                  console.info("key==>getEncoding res 10:" + res)
                  value = res.substring(1, res.length - 1);
                })
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              setTimeout(() => {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent("Shift_JIS", 7710)
                }else{
                  Utils.emitEvent(value, 7710)
                }
              }, 3000)
              break;
            }
            case "defaultTextEncodingFormat1100": {
              let value: string;
              try {
                this.encoding = "";
                await Utils.sleep(2000);
                this.controller.refresh();
                await Utils.sleep(2000);
                this.controller.runJavaScript("getEncoding()", (err, res) => {
                  console.info("key==>getEncoding res 11:" + res)
                  value = res.substring(1, res.length - 1);
                })
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              setTimeout(() => {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent("UTF-8", 7711)
                }else{
                  Utils.emitEvent(value, 7711)
                }
              }, 3000)
              break;
            }
            case "defaultTextEncodingFormat1200": {
              let value: string;
              try {
                this.encoding = " ";
                await Utils.sleep(2000);
                this.controller.refresh();
                await Utils.sleep(2000);
                this.controller.runJavaScript("getEncoding()", (err, res) => {
                  console.info("key==>getEncoding res 12:" + res)
                  value = res.substring(1, res.length - 1);
                })
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              setTimeout(() => {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent("UTF-8", 7712)
                }else{
                  Utils.emitEvent(value, 7712)
                }
              }, 3000)
              break;
            }
            case "defaultTextEncodingFormat1300": {
              let value: string;
              try {
                this.encoding = "qwer123.";
                await Utils.sleep(2000);
                this.controller.refresh();
                await Utils.sleep(2000);
                this.controller.runJavaScript("getEncoding()", (err, res) => {
                  console.info("key==>getEncoding res 13:" + res)
                  value = res.substring(1, res.length - 1);
                })
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }

              setTimeout(() => {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent("UTF-8", 7713)
                }else{
                  Utils.emitEvent(value, 7713)
                }
              }, 3000)
              break;
            }
            case "defaultTextEncodingFormat1400": {
              let value: string;
              try {
                this.encoding = null;
                await Utils.sleep(2000);
                this.controller.refresh();
                await Utils.sleep(2000);
                this.controller.runJavaScript("getEncoding()", (err, res) => {
                  console.info("key==>getEncoding res 14:" + res)
                  value = res.substring(1, res.length - 1);
                })
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }

              setTimeout(() => {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent("UTF-8", 7714)
                }else{
                  Utils.emitEvent(value, 7714)
                }
              }, 3000)
              break;
            }
            case "defaultTextEncodingFormat1500": {
              let value: string;
              try {
                this.encoding = undefined;
                await Utils.sleep(2000);
                this.controller.refresh();
                await Utils.sleep(2000);
                this.controller.runJavaScript("getEncoding()", (err, res) => {
                  console.info("key==>getEncoding res 15:" + res)
                  value = res.substring(1, res.length - 1);
                })
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              setTimeout(() => {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent("UTF-8", 7715)
                }else{
                  Utils.emitEvent(value, 7715)
                }
              }, 3000)
              break;
            }
            case "defaultTextEncodingFormat1600": {
              let value: string;
              try {
                this.encoding = "ASCII";
                await Utils.sleep(2000);
                this.controller.refresh();
                await Utils.sleep(2000);
                this.controller.runJavaScript("getEncoding()", (err, res) => {
                  console.info("key==>getEncoding res 16:" + res)
                  value = res.substring(1, res.length - 1);
                })
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              setTimeout(() => {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent("UTF-8", 7716)
                }else{
                  Utils.emitEvent(value, 7716)
                }
              }, 3000)
              break;
            }
            case "defaultTextEncodingFormat1700": {
              let value: string;
              try {
                this.encoding = "ANSI";
                await Utils.sleep(2000);
                this.controller.refresh();
                await Utils.sleep(2000);
                this.controller.runJavaScript("getEncoding()", (err, res) => {
                  console.info("key==>getEncoding res 17:" + res)
                  value = res.substring(1, res.length - 1);
                })
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              setTimeout(() => {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent("UTF-8", 7717)
                }else{
                  Utils.emitEvent(value, 7717)
                }
              }, 3000)
              break;
            }
            case "defaultTextEncodingFormat1800": {
              let value: string;
              try {
                this.encoding = "utf-8";
                await Utils.sleep(2000);
                this.controller.refresh();
                await Utils.sleep(2000);
                this.controller.runJavaScript("getEncoding()", (err, res) => {
                  console.info("key==>getEncoding res 18:" + res)
                  value = res.substring(1, res.length - 1);
                })
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              setTimeout(() => {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent("UTF-8", 7718)
                }else{
                  Utils.emitEvent(value, 7718)
                }
              }, 3000)
              break;
            }
          }
        })
      }

      Web({ src: $rawfile("index_defaultTextEncodingFormat.html"), controller: this.controller })
        .defaultTextEncodingFormat(this.encoding)
    }
  }
}
