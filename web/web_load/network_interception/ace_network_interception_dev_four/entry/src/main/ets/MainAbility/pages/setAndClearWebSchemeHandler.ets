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

import events_emitter from '@ohos.events.emitter';
import Utils from '../../test/Utils';
import web_webview from '@ohos.web.webview';
import business_error from '@ohos.base';
import buffer from '@ohos.buffer'
import { WebNetErrorList } from '@ohos.web.netErrorList'
import { BusinessError } from '@ohos.base';

@Entry
@Component
struct setAndClearWebSchemeHandler {
  @State str: string = ""
  @State encoding: string | null | undefined= ""
  webviewcontroller: web_webview.WebviewController = new web_webview.WebviewController();
  webSchemeHander: web_webview.WebSchemeHandler = new web_webview.WebSchemeHandler();
  htmlData: string = "<html><body bgcolor=\"white\">Source:<pre>source</pre></body></html>";
  postDataStream: web_webview.WebHttpBodyStream | null = null;
  resourceHandler: web_webview.WebResourceHandler | null = null;
  @State getRequestUrlResult: string = "lock";
  @State getRequestMethodResult: string = "lock";
  @State getReferrerResult: string = "lock";
  @State isMainFrameResult: boolean = false;
  @State hasGestureResult: boolean = true;

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
        Button("setAndClearWebSchemeHandler").id('setAndClearWebSchemeHandler').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "setAndClearWebSchemeHandler0100": {
              try {
                this.webviewcontroller.setWebSchemeHandler('https', this.webSchemeHander);
                this.webviewcontroller.loadUrl('https://www.baidu.com/')
                await Utils.sleep(2000);
                Utils.emitEvent(this.getRequestUrlResult, 8822)
                Utils.emitEvent(this.getRequestMethodResult, 8824)
                Utils.emitEvent(this.getReferrerResult, 8826)
                Utils.emitEvent(this.hasGestureResult, 8830)
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "setAndClearWebSchemeHandler0200": {
              try {
                this.getRequestUrlResult = "lock";
                this.getRequestMethodResult = "lock";
                this.getReferrerResult = "lock";
                this.isMainFrameResult = false;
                this.hasGestureResult = true;
                this.webviewcontroller.setWebSchemeHandler('https', this.webSchemeHander);
                this.webviewcontroller.clearWebSchemeHandler();
                this.webviewcontroller.loadUrl('https://www.baidu.com/')
                await Utils.sleep(2000);
                Utils.emitEvent(this.getRequestUrlResult, 8832)
                Utils.emitEvent(this.getRequestMethodResult, 8834)
                Utils.emitEvent(this.getReferrerResult, 8836)
                Utils.emitEvent(this.isMainFrameResult, 8838)
                Utils.emitEvent(this.hasGestureResult, 8840)
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "setAndClearWebSchemeHandler0300": {
              try {
                this.getRequestUrlResult = "lock";
                this.getRequestMethodResult = "lock";
                this.getReferrerResult = "lock";
                this.isMainFrameResult = false;
                this.hasGestureResult = true;
                this.webviewcontroller.setWebSchemeHandler('https', this.webSchemeHander);
                web_webview.WebviewController.clearServiceWorkerWebSchemeHandler();
                await Utils.sleep(2000);
                this.webviewcontroller.loadUrl('https://www.baidu.com/')
                await Utils.sleep(2000);
                Utils.emitEvent(this.getRequestUrlResult, 8842)
                Utils.emitEvent(this.getRequestMethodResult, 8844)
                Utils.emitEvent(this.getReferrerResult, 8846)
                Utils.emitEvent(this.hasGestureResult, 8850)
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
          }
        })
      }

      Web({ src: 'https://www.example.com', controller: this.webviewcontroller })
        .onControllerAttached(() => {
          try {
            this.webSchemeHander.onRequestStart((request: web_webview.WebSchemeHandlerRequest, resourceHandler: web_webview.WebResourceHandler) => {
              console.log("[schemeHandler] onRequestStart")
              try {
                console.log("[schemeHandler] onRequestStart url:" + request.getRequestUrl())
                this.getRequestUrlResult = request.getRequestUrl()
                console.log("[schemeHandler] onRequestStart method:" + request.getRequestMethod())
                this.getRequestMethodResult = request.getRequestMethod()
                console.log("[schemeHandler] onRequestStart referrer:" + request.getReferrer())
                this.getReferrerResult = request.getReferrer()
                console.log("[schemeHandler] onRequestStart isMainFrame:" + request.isMainFrame())
                this.isMainFrameResult = request.isMainFrame()
                console.log("[schemeHandler] onRequestStart hasGesture:" + request.hasGesture())
                this.hasGestureResult = request.hasGesture()
                console.log("[schemeHandler] onRequestStart header size:" + request.getHeader().length)
                
                let header = request.getHeader();
                for (let i = 0; i < header.length; i++) {
                  console.log("[schemeHandler] onRequestStart header:" + header[i].headerKey + " " + header[i].headerValue);
                }
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              if (request.getRequestUrl() != 'https://www.example.com/'){
                return true;
              }else {
                return false; 
              }
            })
            this.webSchemeHander.onRequestStop((request: web_webview.WebSchemeHandlerRequest) => {
              console.log("[schemeHandler] onRequestStop")
            });
          } catch (error) {
            let e: business_error.BusinessError = error as business_error.BusinessError;
            console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
          }
        })
        .javaScriptAccess(true)
        .domStorageAccess(true)
    }
  }
}