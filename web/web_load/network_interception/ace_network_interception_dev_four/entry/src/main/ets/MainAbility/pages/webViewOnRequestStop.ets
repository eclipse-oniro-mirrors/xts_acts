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
struct webViewOnRequestStop {
  @State str: string = ""
  @State encoding: string | null | undefined= ""
  webviewcontroller: web_webview.WebviewController = new web_webview.WebviewController();
  webSchemeHander: web_webview.WebSchemeHandler = new web_webview.WebSchemeHandler();
  htmlData: string = "<html><body bgcolor=\"white\">Source:<pre>source</pre></body></html>";
  postDataStream: web_webview.WebHttpBodyStream | null = null;
  resourceHandler: web_webview.WebResourceHandler | null = null;
  defaultOnRequestStop0100: boolean = false;
  defaultOnRequestStop0200: boolean = false;
  defaultOnRequestStop0300: boolean = false;

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
        Button("OnRequestStop").id('OnRequestStop').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "defaultOnRequestStop0100": {
              this.defaultOnRequestStop0100 = true;
              try {
                this.webviewcontroller.loadUrl('https://www.baidu.com/')
                await Utils.sleep(2000);
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "defaultOnRequestStop0200": {
              this.defaultOnRequestStop0200 = true;
              try {
                this.webviewcontroller.loadUrl('https://www.baidu.com/')
                await Utils.sleep(2000);
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "defaultOnRequestStop0300": {
              try {
                this.webviewcontroller.loadUrl('https://www.baidu.com/')
                await Utils.sleep(1000);
                this.defaultOnRequestStop0300 = true;
                this.webviewcontroller.loadUrl('https://www.baidu.com/')
                await Utils.sleep(2000);
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
                console.log("[schemeHandler] onRequestStart method:" + request.getRequestMethod())
                console.log("[schemeHandler] onRequestStart referrer:" + request.getReferrer())
                console.log("[schemeHandler] onRequestStart isMainFrame:" + request.isMainFrame())
                console.log("[schemeHandler] onRequestStart hasGesture:" + request.hasGesture())
                console.log("[schemeHandler] onRequestStart header size:" + request.getHeader().length)
                let header = request.getHeader();
                for (let i = 0; i < header.length; i++) {
                  console.log("[schemeHandler] onRequestStart header:" + header[i].headerKey + " " + header[i].headerValue);
                }
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              if (request.getRequestUrl() == 'https://www.example.com/'){
                return false;
              }
              let response = new web_webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.NET_OK)
                response.setStatus(200)
                response.setStatusText("OK")
                response.setMimeType("text/html")
                response.setEncoding("utf-8")
                response.setHeaderByName("header1", "value1", false)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`[schemeHandler] ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              let buf = buffer.from(this.htmlData)
              try {
                console.log("[schemeHandler] length 1")
                resourceHandler.didReceiveResponse(response);
                resourceHandler.didReceiveResponseBody(buf.buffer);
                if(this.defaultOnRequestStop0200 == true){
                  resourceHandler.didFail(WebNetErrorList.ERR_FAILED)
                } else if(this.defaultOnRequestStop0100 == true){
                  resourceHandler.didFinish();
                }
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`[schemeHandler] ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              this.webviewcontroller.setWebSchemeHandler("https", this.webSchemeHander);
              return true;
            })
            this.webSchemeHander.onRequestStop((request: web_webview.WebSchemeHandlerRequest) => {
              console.log("[schemeHandler] onRequestStop")
              if (this.defaultOnRequestStop0100){
                this.defaultOnRequestStop0100 = false;
                Utils.emitEvent(true, 8800)
              }
              if (this.defaultOnRequestStop0200){
                this.defaultOnRequestStop0200 = false;
                Utils.emitEvent(true, 8802)
              }
              if (this.defaultOnRequestStop0300){
                this.defaultOnRequestStop0300 = false;
                Utils.emitEvent(true, 8804)
              }
            });
            this.webviewcontroller.setWebSchemeHandler("https", this.webSchemeHander);
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