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
struct webViewOnRequestStart {
  @State str: string = ""
  @State encoding: string | null | undefined= ""
  webviewcontroller: web_webview.WebviewController = new web_webview.WebviewController();
  webSchemeHander: web_webview.WebSchemeHandler = new web_webview.WebSchemeHandler();
  firstTrigger:string = "a";
  htmlData: string = "<html><body bgcolor=\"white\">Source:<pre>source</pre></body></html>";
  postDataStream: web_webview.WebHttpBodyStream | null = null;
  resourceHandler: web_webview.WebResourceHandler | null = null;
  defaultTextEncodingFormat0100: boolean = false;
  defaultTextEncodingFormat0200: boolean = false;

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
        Button("OnRequestStart").id('OnRequestStart').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "defaultOnRequestStart0100": {
              this.defaultTextEncodingFormat0100= true;
              try {
                this.webviewcontroller.loadUrl('https://www.baidu.com/')
                await Utils.sleep(2000);
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "defaultOnRequestStart0200": {
              try {
                this.firstTrigger='defaultOnRequestStart0200';
                this.webviewcontroller.loadUrl('https://gitee.com/openharmony/')
                await Utils.sleep(3000);
                console.log("firstTrigger=>"+this.firstTrigger);
                this.webviewcontroller.refresh();
                Utils.emitEvent(this.firstTrigger, 4414)
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
          }
        })
      }

      Web({ src: 'https://www.example.com', controller: this.webviewcontroller })
        .onLoadIntercept((event) => {
          console.log("onLoadIntercept"+event.data.getRequestUrl());
          if (event.data.getRequestUrl() == "https://gitee.com/openharmony/"){
            return true;
          }
          return false;
        })
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
                if (request.getRequestUrl() == 'https://www.baidu.com/'){
                  Utils.emitEvent(request.getRequestUrl(), 4400)
                  Utils.emitEvent(request.getRequestMethod(), 4402)
                  Utils.emitEvent(request.getReferrer(), 4404)
                  Utils.emitEvent(request.isMainFrame(), 4406)
                  Utils.emitEvent(request.hasGesture(), 4408)
                  if(request.getHeader().length > 0){
                    Utils.emitEvent(true, 4410)
                  }else {
                    Utils.emitEvent(request.getHeader().length, 4410)
                  }
                  
                }
                let header = request.getHeader();
                for (let i = 0; i < header.length; i++) {
                  console.log("[schemeHandler] onRequestStart header:" + header[i].headerKey + " " + header[i].headerValue);
                }
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              if (request.getRequestUrl() != 'https://www.example.com/'){
                if (this.defaultTextEncodingFormat0100){
                  this.defaultTextEncodingFormat0100=false;
                  Utils.emitEvent(true, 4412)
                }
                this.firstTrigger="onRequestStart"
                return true;
              }else {
                return false; 
              }
            })
            this.webSchemeHander.onRequestStop((request: web_webview.WebSchemeHandlerRequest) => {
              console.log("[schemeHandler] onRequestStop")
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