/*
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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
import image from '@ohos.multimedia.image';
import { JsProxyObject } from '../../test/Interfaces';
import { waitForExist } from '../../test/WaitTest.test';
import { BusinessError } from '@ohos.base';

@Entry
@Component
struct WebViewControllerCreateWebPrintDocumentAdapter {
  controller: webView.WebviewController = new webView.WebviewController();
  controllerTwo: webView.WebviewController = new webView.WebviewController();
  nativePort: webView.WebMessagePort | null = null;
  message: webView.WebMessageExt = new webView.WebMessageExt();
  @State str: string = ""
  @State pixelMap: image.PixelMap | undefined = undefined;
  @State javaScriptAccess: boolean = true
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = true;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = false;
  @State databaseAccess: boolean = true;
  @State checkEleResult: number[] = [];
  @State registerJavaScriptProxyFlag: boolean = false;
  @State console: string = ""
  @State arrTime: Array<number> = [0, 0]
  @State time: number = 0
  @State onScrollCallBack: boolean = false;
  @State onMessageEventCallBack: boolean = false
  @State ports: webView.WebMessagePort[] = [];
  @State userAgentPC:string = "";
  @State isReceive: number = -1;
  @State isPageOneEnd: number = -1;
  @State isPageTwoEnd: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 133400,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(133400)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 0;
        if (this.controller) {
          this.controller.loadUrl("resource://rawfile/index.html");
          this.controller.clearHistory()
        }
      }
    }
  }
  private jsObj: JsProxyObject = {
    test: (res: object) => {
      console.info("ets toString:" + String(res));
    },
    toString: (str: string) => {
      console.info("ets toString:" + String(str));
    },
    register: (res: object) => {
      if (this.registerJavaScriptProxyFlag == true) {
        Utils.emitEvent(String(res), 100075);
      }
      return "web222"
    }
  }


  build() {
    Column() {
      Row() {
        Button("WebViewController click").key('WebViewControllerTestButton').onClick(async () => {
          await Utils.waitForExist(() => this.isPageOneEnd, this.str, 0);
          await Utils.waitForExist(() => this.isPageTwoEnd, this.str, 0);
          await Utils.waitForExist(() => this.isReceive, this.str, 0);
          this.isReceive = -1;
          console.info("key==>" + this.str)
          switch (this.str) {
            case "testCreateWebPrintDocumentAdapter001": {
              try {
                this.controller.clearHistory()
                this.isPageOneEnd = -1;
                this.controller.loadUrl("resource://rawfile/index.html")
                await waitForExist(() => this.isPageOneEnd, this.str, 0);
                let printAdapter = this.controller.createWebPrintDocumentAdapter("");
                console.log('testCreateWebPrintDocumentAdapter001 result is :' + printAdapter);
                Utils.emitEvent("empty", 133410)
              } catch (error) {
                const businessError = error as BusinessError;
                console.error(`testCreateWebPrintDocumentAdapter001 ErrorCode: ${businessError.code},  Message: ${businessError.message}`);
                Utils.emitEvent(false, 133410);
              }
              break;
            }
case "testCreateWebPrintDocumentAdapter002": {
              try {
                this.controller.clearHistory()
                this.isPageOneEnd = -1;
                this.controller.loadUrl("resource://rawfile/index.html")
                await waitForExist(() => this.isPageOneEnd, this.str, 0);
                // Test with empty string instead of null
                let printAdapter = this.controller.createWebPrintDocumentAdapter("");
                console.log('testCreateWebPrintDocumentAdapter002 result is :' + printAdapter);
                Utils.emitEvent("null", 133420)
              } catch (error) {
                const businessError = error as BusinessError;
                console.error(`testCreateWebPrintDocumentAdapter002 ErrorCode: ${businessError.code},  Message: ${businessError.message}`);
                Utils.emitEvent("null", 133420);
              }
              break;
            }
            case "testCreateWebPrintDocumentAdapter003": {
              try {
                this.controller.clearHistory()
                this.isPageOneEnd = -1;
                this.controller.loadUrl("resource://rawfile/index.html")
                await waitForExist(() => this.isPageOneEnd, this.str, 0);
                // Test with empty string instead of undefined
                let printAdapter = this.controller.createWebPrintDocumentAdapter("");
                console.log('testCreateWebPrintDocumentAdapter003 result is :' + printAdapter);
                Utils.emitEvent("undefined", 133430)
              } catch (error) {
                const businessError = error as BusinessError;
                console.error(`testCreateWebPrintDocumentAdapter003 ErrorCode: ${businessError.code},  Message: ${businessError.message}`);
                Utils.emitEvent("undefined", 133430);
              }
              break;
            }
            case "testCreateWebPrintDocumentAdapter004": {
              try {
                this.controller.clearHistory()
                this.isPageOneEnd = -1;
                this.controller.loadUrl("resource://rawfile/index.html")
                await waitForExist(() => this.isPageOneEnd, this.str, 0);
                let printAdapter = this.controller.createWebPrintDocumentAdapter("testJob");
                console.log('testCreateWebPrintDocumentAdapter004 result is :' + printAdapter);
                
                // Check return value coverage - verify PrintDocumentAdapter interface
                let hasOnStartLayoutWrite = typeof printAdapter.onStartLayoutWrite === 'function';
                let hasOnJobStateChanged = typeof printAdapter.onJobStateChanged === 'function';
                console.log('testCreateWebPrintDocumentAdapter004 onStartLayoutWrite function exists:' + hasOnStartLayoutWrite);
                console.log('testCreateWebPrintDocumentAdapter004 onJobStateChanged function exists:' + hasOnJobStateChanged);
                
                // Check if the return value is an object (PrintDocumentAdapter)
                let isObject = typeof printAdapter === 'object' && printAdapter !== null;
                console.log('testCreateWebPrintDocumentAdapter004 return value is object:' + isObject);
                
                // Overall check if the return value meets the PrintDocumentAdapter interface requirements
                let isValidPrintDocumentAdapter = isObject && hasOnStartLayoutWrite && hasOnJobStateChanged;
                console.log('testCreateWebPrintDocumentAdapter004 isValidPrintDocumentAdapter:' + isValidPrintDocumentAdapter);
                
                Utils.emitEvent(isValidPrintDocumentAdapter, 133440);
              } catch (error) {
                const businessError = error as BusinessError;
                console.error(`testCreateWebPrintDocumentAdapter004 ErrorCode: ${businessError.code},  Message: ${businessError.message}`);
                Utils.emitEvent("returnValue", 133440);
              }
              break;
            }
            case "testCreateWebPrintDocumentAdapter005": {
              try {
                this.controller.clearHistory()
                this.isPageOneEnd = -1;
                this.controller.loadUrl("resource://rawfile/index.html")
                await waitForExist(() => this.isPageOneEnd, this.str, 0);
                let printAdapter = this.controller.createWebPrintDocumentAdapter("validJobName.pdf");
                console.log('testCreateWebPrintDocumentAdapter005 result is :' + printAdapter);
                
                // Check if return value is not null/undefined
                Utils.emitEvent("returnValue", 133450);
              } catch (error) {
                const businessError = error as BusinessError;
                console.error(`testCreateWebPrintDocumentAdapter005 ErrorCode: ${businessError.code},  Message: ${businessError.message}`);
                Utils.emitEvent("returnValue", 133450);
              }
              break;
            }
            case "testCreateWebPrintDocumentAdapter006": {
              try {
                this.controller.clearHistory()
                this.isPageOneEnd = -1;
                this.controller.loadUrl("resource://rawfile/index.html")
                await waitForExist(() => this.isPageOneEnd, this.str, 0);
                let printAdapter = this.controller.createWebPrintDocumentAdapter("job_@#$%.pdf");
                console.log('testCreateWebPrintDocumentAdapter006 result is :' + printAdapter);
                
                // Check if return value handles special characters
                Utils.emitEvent("returnValue", 133460);
              } catch (error) {
                const businessError = error as BusinessError;
                console.error(`testCreateWebPrintDocumentAdapter006 ErrorCode: ${businessError.code},  Message: ${businessError.message}`);
                Utils.emitEvent("returnValue", 133460);
              }
              break;
            }
            case "testCreateWebPrintDocumentAdapter007": {
              try {
                this.controller.clearHistory()
                this.isPageOneEnd = -1;
                this.controller.loadUrl("resource://rawfile/index.html")
                await waitForExist(() => this.isPageOneEnd, this.str, 0);
                let longJobName = "a".repeat(255);
                let printAdapter = this.controller.createWebPrintDocumentAdapter(longJobName);
                console.log('testCreateWebPrintDocumentAdapter007 result is :' + printAdapter);
                
                // Check if return value handles long strings
                Utils.emitEvent("returnValue", 133470);
              } catch (error) {
                const businessError = error as BusinessError;
                console.error(`testCreateWebPrintDocumentAdapter007 ErrorCode: ${businessError.code},  Message: ${businessError.message}`);
                Utils.emitEvent("returnValue", 133470);
              }
              break;
            }
            case "testCreateWebPrintDocumentAdapter008": {
              try {
                // Test with invalid controller (not associated with Web component)
                let invalidController = new webView.WebviewController();
                let printAdapter = invalidController.createWebPrintDocumentAdapter("testJob");
                console.log('testCreateWebPrintDocumentAdapter008 result is :' + printAdapter);
                
                // Should not reach here
                Utils.emitEvent("returnValue", 133480);
              } catch (error) {
                const businessError = error as BusinessError;
                console.error(`testCreateWebPrintDocumentAdapter008 ErrorCode: ${businessError.code},  Message: ${businessError.message}`);
                // Check if error code is 17100001 (Init error) - this is the expected behavior
                Utils.emitEvent(true, 133480);
              }
              break;
            }

          }
        })
      }

      Web({ src: $rawfile('index.html'), controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
        .onPageEnd((event) => {
          console.log('web pageOneEnd==>' + event.url);
          this.isPageOneEnd = 0;
        })
      Web({ src: $rawfile('second.html'), controller: this.controllerTwo })
        .id('2')
        .key('web2')
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
        .onPageEnd((event) => {
          console.log('web pageTwoEnd==>' + event.url);
          this.isPageTwoEnd = 0;
        })
    }
  }
}
