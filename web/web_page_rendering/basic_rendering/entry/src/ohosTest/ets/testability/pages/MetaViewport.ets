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
import { waitForExist } from '../../test/WaitTest.test';
@Entry
@Component
struct MetaViewport {
  @State str: string = ""
  @State isMetaViewport: boolean | null | undefined = false;
  @State userAgentPC: string = "";
  @State initInnerWidth: string = "";
  @State isComplete: number = -1;
  @State isReceive: number = -1;

  controller: webView.WebviewController = new webView.WebviewController();

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 150290,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(150290)
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

  build() {
    Column() {
      Row() {
        Button("MetaViewport").id('MetaViewport').onClick(async () => {
          console.info("key==>" + this.str)
          await waitForExist(() => this.isComplete, this.str, 0);
          await waitForExist(() => this.isReceive, this.str, 0);
          this.isReceive = -1;
          switch (this.str) {
            case "metaViewport0100": {
              let value: boolean = false;
              try {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(true, 150300)
                } else {
                  this.isComplete = -1;
                  this.controller.loadUrl($rawfile("viewport.html"))
                  await waitForExist(() => this.isComplete, this.str, 0);
                  this.controller.runJavaScript("getWidth()", (err, res) => {
                    console.info("Initial viewport width ==> getWidth():" + res)
                    this.initInnerWidth = res;
                  })
                  this.isMetaViewport = true;
                  this.isComplete = -1;
                  this.controller.refresh();
                  await waitForExist(() => this.isComplete, this.str, 0);
                  this.controller.runJavaScript("getWidth()", (err, res) => {
                    console.info("Modified viewport width ==> getWidth():" + res)
                    if (res != this.initInnerWidth) {
                      value = true;
                    }
                  })
                  await waitForExist(() => '' + value, this.str, 'true');
                  Utils.emitEvent(value, 150300)
                }
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "metaViewport0200": {
              let value: boolean = false;
              try {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(true, 150310)
                } else {
                  this.isComplete = -1;
                  this.controller.loadUrl($rawfile("viewport.html"))
                  await waitForExist(() => this.isComplete, this.str, 0);
                  this.isMetaViewport = false;
                  this.isComplete = -1;
                  this.controller.refresh();
                  await waitForExist(() => this.isComplete, this.str, 0);
                  this.controller.runJavaScript("getWidth()", (err, res) => {
                    console.info("Initial viewport width ==> getWidth():" + res)
                    this.initInnerWidth = res;
                  })
                  this.isMetaViewport = false;
                  this.isComplete = -1;
                  this.controller.refresh();
                  await waitForExist(() => this.isComplete, this.str, 0);
                  this.controller.runJavaScript("getWidth()", (err, res) => {
                    console.info("Modified viewport width ==> getWidth():" + res)
                    if (res == this.initInnerWidth) {
                      value = true;
                    }
                  })
                  await waitForExist(() => '' + value, this.str, 'true');
                  Utils.emitEvent(value, 150310)
                }
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "metaViewport0300": {
              let value: boolean = false;
              try {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(true, 150320)
                } else {
                  this.isComplete = -1;
                  this.controller.loadUrl($rawfile("viewport.html"))
                  await waitForExist(() => this.isComplete, this.str, 0);
                  this.isMetaViewport = false;
                  this.isComplete = -1;
                  this.controller.refresh();
                  await waitForExist(() => this.isComplete, this.str, 0);
                  this.controller.runJavaScript("getWidth()", (err, res) => {
                    console.info("Initial viewport width ==> getWidth():" + res)
                    this.initInnerWidth = res;
                  })
                  this.isMetaViewport = false;
                  this.isComplete = -1;
                  this.controller.refresh();
                  await waitForExist(() => this.isComplete, this.str, 0);
                  this.controller.runJavaScript("getWidth()", (err, res) => {
                    console.info("Modified viewport width ==> getWidth():" + res)
                    if (res == this.initInnerWidth) {
                      value = true;
                    }
                  })
                  await waitForExist(() => '' + value, this.str, 'true');
                  Utils.emitEvent(value, 150320)
                }
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "metaViewport0400": {
              let value: boolean = false;
              try {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(true, 150330)
                } else {
                  this.isComplete = -1;
                  this.controller.loadUrl($rawfile("viewport.html"))
                  await waitForExist(() => this.isComplete, this.str, 0);
                  this.isMetaViewport = false;
                  this.isComplete = -1;
                  this.controller.refresh();
                  await waitForExist(() => this.isComplete, this.str, 0);
                  this.controller.runJavaScript("getWidth()", (err, res) => {
                    console.info("Initial viewport width ==> getWidth():" + res)
                    this.initInnerWidth = res;
                  })
                  this.isMetaViewport = true;
                  this.isComplete = -1;
                  this.controller.refresh();
                  await waitForExist(() => this.isComplete, this.str, 0);
                  this.controller.runJavaScript("getWidth()", (err, res) => {
                    console.info("Modified viewport width ==> getWidth():" + res)
                    if (res != this.initInnerWidth) {
                      value = true;
                    }
                  })
                  await waitForExist(() => '' + value, this.str, 'true');
                  Utils.emitEvent(value, 150330)
                }
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "metaViewport0500": {
              let value: boolean = false;
              try {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(true, 150340)
                } else {
                  this.isComplete = -1;
                  this.controller.loadUrl($rawfile("viewport.html"))
                  await waitForExist(() => this.isComplete, this.str, 0);
                  this.isMetaViewport = false;
                  this.isComplete = -1;
                  this.controller.refresh();
                  await waitForExist(() => this.isComplete, this.str, 0);
                  this.controller.runJavaScript("getWidth()", (err, res) => {
                    console.info("Initial viewport width ==> getWidth():" + res)
                    this.initInnerWidth = res;
                  })
                  this.isMetaViewport = true;
                  this.isComplete = -1;
                  this.controller.refresh();
                  await waitForExist(() => this.isComplete, this.str, 0);
                  this.controller.runJavaScript("getWidth()", (err, res) => {
                    console.info("Modified viewport width ==> getWidth():" + res)
                    if (res != this.initInnerWidth) {
                      value = true;
                    }
                  })
                  await waitForExist(() => '' + value, this.str, 'true');
                  Utils.emitEvent(value, 150340)
                }
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }
              break;
            }
            case "metaViewport0600": {
              let value: boolean = false;
              try {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(true, 150350)
                } else {
                  this.isComplete = -1;
                  this.controller.loadUrl($rawfile("viewport.html"))
                  await waitForExist(() => this.isComplete, this.str, 0);
                  this.isMetaViewport = false;
                  this.isComplete = -1;
                  this.controller.refresh();
                  await waitForExist(() => this.isComplete, this.str, 0);
                  this.controller.runJavaScript("getWidth()", (err, res) => {
                    console.info("Initial viewport width ==> getWidth():" + res)
                    this.initInnerWidth = res;
                  })
                  this.isMetaViewport = true;
                  this.isComplete = -1;
                  this.controller.refresh();
                  await waitForExist(() => this.isComplete, this.str, 0);
                  this.controller.runJavaScript("getWidth()", (err, res) => {
                    console.info("Modified viewport width ==> getWidth():" + res)
                    if (res != this.initInnerWidth) {
                      value = true;
                    }
                  })
                  await waitForExist(() => '' + value, this.str, 'true');
                  Utils.emitEvent(value, 150350)
                }
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "metaViewport0700": {
              let value: boolean = false;
              try {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(true, 150360)
                } else {
                  this.isComplete = -1;
                  this.controller.loadUrl($rawfile("viewport.html"))
                  await waitForExist(() => this.isComplete, this.str, 0);
                  this.isMetaViewport = false;
                  this.isComplete = -1;
                  this.controller.refresh();
                  await waitForExist(() => this.isComplete, this.str, 0);
                  this.controller.runJavaScript("getWidth()", (err, res) => {
                    console.info("Initial viewport width ==> getWidth():" + res)
                    this.initInnerWidth = res;
                  })
                  this.isMetaViewport = false;
                  this.isComplete = -1;
                  this.controller.refresh();
                  await waitForExist(() => this.isComplete, this.str, 0);
                  this.controller.runJavaScript("getWidth()", (err, res) => {
                    console.info("Modified viewport width ==> getWidth():" + res)
                    if (res == this.initInnerWidth) {
                      value = true;
                    }
                  })
                  await waitForExist(() => '' + value, this.str, 'true');
                  Utils.emitEvent(value, 150360)
                }
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "metaViewport0800": {
              let value: boolean = false;
              try {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(true, 150370)
                } else {
                  this.isComplete = -1;
                  this.controller.loadUrl($rawfile("viewport.html"))
                  await waitForExist(() => this.isComplete, this.str, 0);
                  this.isMetaViewport = false;
                  this.isComplete = -1;
                  this.controller.refresh();
                  await waitForExist(() => this.isComplete, this.str, 0);
                  this.controller.runJavaScript("getWidth()", (err, res) => {
                    console.info("Initial viewport width ==> getWidth():" + res)
                    this.initInnerWidth = res;
                  })
                  this.isMetaViewport = false;
                  this.isComplete = -1;
                  this.controller.refresh();
                  await waitForExist(() => this.isComplete, this.str, 0);
                  this.controller.runJavaScript("getWidth()", (err, res) => {
                    console.info("Modified viewport width ==> getWidth():" + res)
                    if (res == this.initInnerWidth) {
                      value = true;
                    }
                  })
                  await waitForExist(() => '' + value, this.str, 'true');
                  Utils.emitEvent(value, 150370)
                }
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "metaViewport0900": {
              let value: boolean = false;
              try {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(true, 150380)
                } else {
                  this.isComplete = -1;
                  this.controller.loadUrl($rawfile("viewport.html"))
                  await waitForExist(() => this.isComplete, this.str, 0);
                  this.isMetaViewport = false;
                  this.isComplete = -1;
                  this.controller.refresh();
                  await waitForExist(() => this.isComplete, this.str, 0);
                  this.controller.runJavaScript("getWidth()", (err, res) => {
                    console.info("Initial viewport width ==> getWidth():" + res)
                    this.initInnerWidth = res;
                  })
                  this.isMetaViewport = false;
                  this.isComplete = -1;
                  this.controller.refresh();
                  await waitForExist(() => this.isComplete, this.str, 0);
                  this.controller.runJavaScript("getWidth()", (err, res) => {
                    console.info("Modified viewport width ==> getWidth():" + res)
                    if (res == this.initInnerWidth) {
                      value = true;
                    }
                  })
                  await waitForExist(() => '' + value, this.str, 'true');
                  Utils.emitEvent(value, 150380)
                }
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "metaViewport1000": {
              let value: boolean = false;
              try {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(true, 150390)
                } else {
                  this.isComplete = -1;
                  this.controller.loadUrl($rawfile("viewport.html"))
                  await waitForExist(() => this.isComplete, this.str, 0);
                  this.isMetaViewport = false;
                  this.isComplete = -1;
                  this.controller.refresh();
                  await waitForExist(() => this.isComplete, this.str, 0);
                  this.controller.runJavaScript("getWidth()", (err, res) => {
                    console.info("Initial viewport width ==> getWidth():" + res)
                    this.initInnerWidth = res;
                  })
                  this.isMetaViewport = false;
                  this.isComplete = -1;
                  this.controller.refresh();
                  await waitForExist(() => this.isComplete, this.str, 0);
                  this.controller.runJavaScript("getWidth()", (err, res) => {
                    console.info("Modified viewport width ==> getWidth():" + res)
                    if (res == this.initInnerWidth) {
                      value = true;
                    }
                  })
                  await waitForExist(() => '' + value, this.str, 'true');
                  Utils.emitEvent(value, 150390)
                }
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
          }
        })
      }

      Web({ src: $rawfile('viewport.html'), controller: this.controller })
        .onPageEnd((event) => {
          console.log('web pageEnd==>' + event.url);
          this.isComplete = 0;
        })
        .height(500)
        .width(500)
        .metaViewport(this.isMetaViewport)
    }
  }
}

