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
import { BusinessError } from '@ohos.base';

@Entry
@Component
struct customizeSchemes {
  @State titleReceive: string = ""
  @State str: string = ""
  @State encoding: string | null | undefined= ""
  @State valueResult: string = ""
  @State fileValue: string = ""
  webviewcontroller: web_webview.WebviewController = new web_webview.WebviewController();
  webSchemeHander: web_webview.WebSchemeHandler = new web_webview.WebSchemeHandler();
  htmlData: string = "<html><body bgcolor=\"white\">Source:<pre>source</pre></body></html>";
  postDataStream: web_webview.WebHttpBodyStream | null = null;
  resourceHandler: web_webview.WebResourceHandler | null = null;
  context = getContext(this) as common.UIAbilityContext;

  aboutToAppear():void {
    try {
      web_webview.WebviewController.customizeSchemes([{
        schemeName: "custom-local",
        isSupportCORS: false,
        isSupportFetch: false,
        isStandard: false,
        isLocal: true,
        isDisplayIsolated: false,
        isSecure: false,
        isCspBypassing: false
      },{
        schemeName: "test",
        isSupportCORS: true,
        isSupportFetch: true,
        isStandard: true,
        isLocal: true,
        isDisplayIsolated: true,
        isSecure: true,
        isCspBypassing: true
      }])
    } catch(error) {
      let e:business_error.BusinessError = error as business_error.BusinessError;
      console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
    }
  }

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
        Button("customizeSchemes").id('customizeSchemes').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "customizeSchemes0100": {
              try {
                this.webviewcontroller.loadUrl('custom-local://www.example.com/local.html')
                await Utils.sleep(2000);
                Utils.emitEvent(this.titleReceive, 8872)
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "customizeSchemes0200": {
              try {
                this.webviewcontroller.loadUrl('test://www.example.com/local.html')
                await Utils.sleep(2000);
                Utils.emitEvent(this.titleReceive, 8874)
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
          }
        })
      }

      Web({ src: 'https://www.example.com', controller: this.webviewcontroller })
        .onTitleReceive((event) => {
          if (event) {
            console.log('onTitleReceive title:' + event.title)
            this.titleReceive = event.title
          }
        })
        .onControllerAttached(() => {
          try {
            this.webSchemeHander.onRequestStart((request: web_webview.WebSchemeHandlerRequest, resourceHandler: web_webview.WebResourceHandler) => {
              console.log("[schemeHandler] onRequestStart")
              let schemeMap = new Map([
                ["custom-local://www.example.com/local.html", "local.html"],
                ["test://www.example.com/local.html", "local.html"]
              ]);

              this.postDataStream = request.getHttpBodyStream();
              this.resourceHandler = resourceHandler

              if(schemeMap.has(request.getRequestUrl())){
                let arrayBuffer = new ArrayBuffer(200);
                let size = 200;
              
                try {
                  console.log("[schemeHandler] read begin:");
                  let fileName = schemeMap.get(request.getRequestUrl());
                  let fileContent = this.context.resourceManager.getRawFileContentSync(fileName);
                  let buf: ArrayBuffer = fileContent.buffer.slice(0)
                  arrayBuffer = buf;
                  size = arrayBuffer.byteLength;
                  console.log("[schemeHandler] read" + fileName + " size:" +size);
                  this.fileValue = fileName as string;
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                }

                let response = new web_webview.WebSchemeHandlerResponse();
                try {
                  response.setStatus(200)
                  response.setStatusText("OK")
                  if(request.getRequestUrl().endsWith(".html")){
                    response.setMimeType("text/html")
                  } else if (request.getRequestUrl().endsWith(".js")){
                    response.setMimeType("text/javascript")
                  }
                  response.setEncoding("utf-8")
                  response.setHeaderByName("content-length", '${size}', false)
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`[schemeHandler] ErrorCode: ${e.code},  Message: ${e.message}`);
                }

                let buf = buffer.from(this.htmlData)
                try {
                  console.log("[schemeHandler] length 1")
                  resourceHandler.didReceiveResponse(response);
                  resourceHandler.didReceiveResponseBody(arrayBuffer);
                  resourceHandler.didFinish();
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`[schemeHandler] ErrorCode: ${e.code},  Message: ${e.message}`);
                }
                return true;
              }
              return false;
            })
            this.webSchemeHander.onRequestStop((request: web_webview.WebSchemeHandlerRequest) => {
              console.log("[schemeHandler] onRequestStop")
            });
            this.webviewcontroller.setWebSchemeHandler("https", this.webSchemeHander);
            this.webviewcontroller.setWebSchemeHandler("custom-local", this.webSchemeHander);
            this.webviewcontroller.setWebSchemeHandler("test", this.webSchemeHander);
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