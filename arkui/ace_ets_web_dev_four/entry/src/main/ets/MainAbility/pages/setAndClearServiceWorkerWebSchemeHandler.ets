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
import common from '@ohos.app.ability.common'

@Entry
@Component
struct setAndClearServiceWorkerWebSchemeHandler {
  @State str: string = ""
  @State encoding: string | null | undefined= ""
  webviewcontroller: web_webview.WebviewController = new web_webview.WebviewController();
  webSchemeHander: web_webview.WebSchemeHandler = new web_webview.WebSchemeHandler();
  htmlData: string = "<html><body bgcolor=\"white\">Source:<pre>source</pre></body></html>";
  postDataStream: web_webview.WebHttpBodyStream | null = null;
  resourceHandler: web_webview.WebResourceHandler | null = null;
  context = getContext(this) as common.UIAbilityContext;
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
        Button("setAndClearServiceWorkerWebSchemeHandler").id('setAndClearServiceWorkerWebSchemeHandler').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "setAndClearServiceWorkerWebSchemeHandler0100": {
              try {
                this.webviewcontroller.setWebSchemeHandler('https', this.webSchemeHander);
                web_webview.WebviewController.setServiceWorkerWebSchemeHandler('https', this.webSchemeHander);
                this.webviewcontroller.loadUrl('https://www.example.com/service_worker.html')
                await Utils.sleep(2000);
                Utils.emitEvent(this.getRequestMethodResult, 8854)
                Utils.emitEvent(this.hasGestureResult, 8860)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "setAndClearServiceWorkerWebSchemeHandler0200": {
              try {
                this.webviewcontroller.clearWebSchemeHandler();
                web_webview.WebviewController.clearServiceWorkerWebSchemeHandler();
                this.getRequestUrlResult = "lock";
                this.getRequestMethodResult = "lock";
                this.getReferrerResult = "lock";
                this.isMainFrameResult = false;
                this.hasGestureResult = true;
                web_webview.WebviewController.setServiceWorkerWebSchemeHandler('https', this.webSchemeHander);
                web_webview.WebviewController.clearServiceWorkerWebSchemeHandler();
                this.webviewcontroller.loadUrl('https://www.example.com/service_worker.html')
                await Utils.sleep(2000);
                Utils.emitEvent(this.getRequestUrlResult, 8862)
                Utils.emitEvent(this.getRequestMethodResult, 8864)
                Utils.emitEvent(this.getReferrerResult, 8866)
                Utils.emitEvent(this.isMainFrameResult, 8868)
                Utils.emitEvent(this.hasGestureResult, 8870)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
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
              let schemeMap = new Map([
                ["https://www.example.com/service_worker.html", "service_worker.html"]
              ])
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
                let requestHeaderMap = new Map<string, string>();
                for (let i = 0; i < header.length; i++) {
                  console.log("[schemeHandler] onRequestStart header:" + header[i].headerKey + " " + header[i].headerValue);
                  requestHeaderMap.set(header[i].headerKey, header[i].headerValue)
                }
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }

              this.postDataStream = request.getHttpBodyStream();
              this.resourceHandler = resourceHandler;

              if(schemeMap.has(request.getRequestUrl())){
                let arrayBuffer = new ArrayBuffer(200);
                let size = 200;
                let fileName = schemeMap.get(request.getRequestUrl());
                let fileContent = this.context.resourceManager.getRawFileContentSync(fileName);
                let buf:ArrayBuffer = fileContent.buffer.slice(0);
                arrayBuffer = buf;
                size = arrayBuffer.byteLength;

                let response = new web_webview.WebSchemeHandlerResponse();
                response.setStatus(200)
                response.setStatusText("OK")
                response.setMimeType("text/html")
                response.setEncoding("utf-8")
                response.setHeaderByName("content-length", '${size}', false)

                this.resourceHandler.didReceiveResponse(response);
                this.resourceHandler.didReceiveResponseBody(arrayBuffer);
                this.resourceHandler.didFinish();

                return true;
              }
              return false;
              
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