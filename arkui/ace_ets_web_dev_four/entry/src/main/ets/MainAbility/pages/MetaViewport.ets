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

@Entry
@Component
struct MetaViewport {
  @State str: string = ""
  @State isMetaViewport: boolean | null | undefined = false;
  @State userAgentPC:string = "";
  @State initInnerWidth: string ="";
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

  build() {
    Column() {
      Row() {
        Button("MetaViewport").id('MetaViewport').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "metaViewport0100": {
              let value: boolean = false;
              try {
                this.controller.loadUrl($rawfile("viewport.html"))
                await Utils.sleep(5000);
                this.controller.runJavaScript("getWidth()", (err, res) => {
                  console.info("Initial viewport width ==> getWidth():" + res)
                  this.initInnerWidth = res;
                })
                this.isMetaViewport = true;
                this.controller.refresh();
                await Utils.sleep(2000);
                this.controller.runJavaScript("getWidth()", (err, res) => {
                  console.info("Modified viewport width ==> getWidth():" + res)
                  if(res != this.initInnerWidth){
                    value = true;
                  }
                  })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              setTimeout(() => {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(true, 3701)
                }else{
                  Utils.emitEvent(value, 3701)
                }
              }, 3000)
              break;
            }
            case "metaViewport0200": {
              let value: boolean = false;
              try {
                this.controller.loadUrl($rawfile("viewport.html"))
                await Utils.sleep(5000);
                this.isMetaViewport = false;
                this.controller.refresh();
                await Utils.sleep(2000);
                this.controller.runJavaScript("getWidth()", (err, res) => {
                  console.info("Modified viewport width ==> getWidth():" + res)
                  if(res == this.initInnerWidth){
                    value = true;
                  }
                })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              setTimeout(() => {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(true, 3702)
                }else{
                  Utils.emitEvent(value, 3702)
                }
              }, 3000)
              break;
            }
            case "metaViewport0300": {
              let value: boolean = false;
              try {
                this.controller.loadUrl($rawfile("viewport.html"))
                await Utils.sleep(5000);
                this.isMetaViewport = true;
                this.isMetaViewport = false;
                this.controller.refresh();
                await Utils.sleep(2000);
                this.controller.runJavaScript("getWidth()", (err, res) => {
                  console.info("Modified viewport width ==> getWidth():" + res)
                  if(res == this.initInnerWidth){
                    value = true;
                  }
                })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              setTimeout(() => {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(true, 3703)
                }else{
                  Utils.emitEvent(value, 3703)
                }
              }, 3000)
              break;
            }
            case "metaViewport0400": {
              let value: boolean = false;
              try {
                this.controller.loadUrl($rawfile("viewport.html"))
                await Utils.sleep(5000);
                this.isMetaViewport = false;
                this.isMetaViewport = true;
                this.controller.refresh();
                await Utils.sleep(2000);
                this.controller.runJavaScript("getWidth()", (err, res) => {
                  console.info("Modified viewport width ==> getWidth():" + res)
                  if(res != this.initInnerWidth){
                    value = true;
                  }
                })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              setTimeout(() => {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(true, 3704)
                }else{
                  Utils.emitEvent(value, 3704)
                }
              }, 3000)
              break;
            }
            case "metaViewport0500": {
              let value: boolean = false;
              try {
                this.controller.loadUrl($rawfile("viewport.html"))
                await Utils.sleep(5000);
                this.isMetaViewport = undefined;
                this.controller.refresh();
                await Utils.sleep(2000);
                this.controller.runJavaScript("getWidth()", (err, res) => {
                  console.info("Modified viewport width ==> getWidth():" + res)
                  if(res != this.initInnerWidth){
                    value = true;
                  }
                })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              setTimeout(() => {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(true, 3705)
                }else{
                  Utils.emitEvent(value, 3705)
                }
              }, 3000)
              break;
            }
            case "metaViewport0600": {
              let value: boolean = false;
              try {
                this.controller.loadUrl($rawfile("viewport.html"))
                await Utils.sleep(5000);
                this.isMetaViewport = null;
                this.controller.refresh();
                await Utils.sleep(2000);
                this.controller.runJavaScript("getWidth()", (err, res) => {
                  console.info("Modified viewport width ==> getWidth():" + res)
                  if(res != this.initInnerWidth){
                    value = true;
                  }
                })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              setTimeout(() => {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(true, 3706)
                }else{
                  Utils.emitEvent(value, 3706)
                }
              }, 3000)
              break;
            }
            case "metaViewport0700": {
              let value: boolean = false;
              try {
                this.controller.loadUrl($rawfile("viewport.html"))
                await Utils.sleep(3000);
                this.isMetaViewport = undefined;
                await Utils.sleep(500);
                this.isMetaViewport = false;
                this.controller.refresh();
                await Utils.sleep(2000);
                this.controller.runJavaScript("getWidth()", (err, res) => {
                  console.info("Modified viewport width ==> getWidth():" + res)
                  if(res == this.initInnerWidth){
                    value = true;
                  }
                })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              setTimeout(() => {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(true, 3707)
                }else{
                  Utils.emitEvent(value, 3707)
                }
              }, 3000)
              break;
            }
            case "metaViewport0800": {
              let value: boolean = false;
              try {
                this.controller.loadUrl($rawfile("viewport.html"))
                await Utils.sleep(3000);
                this.isMetaViewport = null;
                await Utils.sleep(500);
                this.isMetaViewport = false;
                this.controller.refresh();
                await Utils.sleep(2000);
                this.controller.runJavaScript("getWidth()", (err, res) => {
                  console.info("Modified viewport width ==> getWidth():" + res)
                  if(res == this.initInnerWidth){
                    value = true;
                  }
                })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              setTimeout(() => {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(true, 3708)
                }else{
                  Utils.emitEvent(value, 3708)
                }
              }, 3000)
              break;
            }
            case "metaViewport0900": {
              let value: boolean = false;
              try {
                this.controller.loadUrl($rawfile("viewport.html"))
                await Utils.sleep(3000);
                this.isMetaViewport = false;
                await Utils.sleep(500);
                this.isMetaViewport = undefined;
                this.controller.refresh();
                await Utils.sleep(2000);
                this.controller.runJavaScript("getWidth()", (err, res) => {
                  console.info("Modified viewport width ==> getWidth():" + res)
                  if(res == this.initInnerWidth){
                    value = true;
                  }
                })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              setTimeout(() => {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(true, 3709)
                }else{
                  Utils.emitEvent(value, 3709)
                }
              }, 3000)
              break;
            }
            case "metaViewport1000": {
              let value: boolean = false;
              try {
                this.controller.loadUrl($rawfile("viewport.html"))
                await Utils.sleep(3000);
                this.isMetaViewport = false;
                await Utils.sleep(500);
                this.isMetaViewport = null;
                this.controller.refresh();
                await Utils.sleep(2000);
                this.controller.runJavaScript("getWidth()", (err, res) => {
                  console.info("Modified viewport width ==> getWidth():" + res)
                  if(res == this.initInnerWidth){
                    value = true;
                  }
                })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              setTimeout(() => {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(true, 3710)
                }else{
                  Utils.emitEvent(value, 3710)
                }
              }, 3000)
              break;
            }
          }
        })
      }
      Web({ src: $rawfile('viewport.html'), controller: this.controller })
        .height(500)
        .width(500)
        .metaViewport(this.isMetaViewport)

    }
  }
}
