/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import {
  Header,
  Entry,
  Component,
  Column,
  Row,
  Button,
  ClickEvent,
  Web
} from "@ohos.arkui.component"
import { State } from "@ohos.arkui.stateManagement" // should be insert by ui-plugins
import web_webview from '@ohos.web.webview'
import { BusinessError } from '@ohos.base';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Utils from '../../src/test/Utils.test';
import emitter from '@ohos.events.emitter';
import events_emitter from '@ohos.events.emitter';
import { Callback, RecordData } from '@ohos.base'
import buffer from '@ohos.buffer'
import common from '@ohos.app.ability.common'
import { AppStorage } from 'arkui.stateManagement.storage.appStorage'
import { UIContext, Router } from '@ohos.arkui.UIContext'
import { WebNetErrorList } from '@ohos.web.netErrorList'

export class StringFields {
  public str: string = '';
}

@Entry
@Component
struct webSchemeHandlerRequest {
  stringObj: StringFields  = new StringFields ();
  controller: web_webview.WebviewController = new web_webview.WebviewController(undefined);
  webviewcontroller: web_webview.WebviewController = new web_webview.WebviewController(undefined);
  webSchemeHander: web_webview.WebSchemeHandler = new web_webview.WebSchemeHandler();
  htmlData: string = "<html><body bgcolor=\"white\">Source:<pre>source</pre></body></html>";
  postDataStream: web_webview.WebHttpBodyStream = new web_webview.WebHttpBodyStream()
  resourceHandler: web_webview.WebResourceHandler = new web_webview.WebResourceHandler()
  requests:web_webview.WebSchemeHandlerRequest[] = []
  @State getRequestUrlResult: string = "lock";
  @State getRequestMethodResult: string = "lock";
  @State getReferrerResult: string = "lock";
  @State isMainFrameResult: boolean = false;
  @State hasGestureResult: boolean = true;

  aboutToAppear() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack: Callback<events_emitter.EventData> = (eventData: events_emitter.EventData): void => {
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      const data = eventData.data as Record<string, RecordData>;
      if (data != null && data['ACTION'] != null) {
        let strValue: string = String(data['ACTION']);
        this.stringObj.str = strValue;
      }
    }
  }
  build() {
    Column() {
      Row() {
        Button("webSchemeHandlerRequest").key('webSchemeHandlerRequest').onClick( (e:ClickEvent) => {
          console.info("key==>" + this.stringObj.str)
          switch (this.stringObj.str) {
            case "webSchemeHandlerRequest0100": {
              try {
                  this.webviewcontroller.setWebSchemeHandler('https', this.webSchemeHander);
                  web_webview.WebviewController.setServiceWorkerWebSchemeHandler('https', this.webSchemeHander);
                  this.webviewcontroller.loadUrl('https://www.example.com/service_worker.html')
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }

            case 'emitonSwitchNextPage': {
              let uiContext: UIContext = this.getUIContext();
              let router: Router = uiContext.getRouter();
              router.pushUrl({ url: 'pages/webResourceType' })
              console.log('push URL success')
            }
          }
        })
      }

      Web({ src: 'https://www.example.com', controller: this.webviewcontroller })
        .onControllerAttached(() => {
          try {
            this.webSchemeHander.onRequestStart((request: web_webview.WebSchemeHandlerRequest, 
              resourceHandler: web_webview.WebResourceHandler) => {
              console.log("[schemeHandler] onRequestStart")
              this.requests.push(request)
              let schemeMap = new Map<string,string>(
                [["https://www.example.com/service_worker.html", "service_worker.html"]]
              )
              try {
                console.log("[schemeHandler] onRequestStart url:" + request.getRequestUrl())
                this.getRequestUrlResult = request.getRequestUrl()
                if(this.requests.length>0 && this.requests[0].getRequestUrl()){
                  Utils.emitEvent(true,142120)
                }
                if(this.requests.length>0 && this.requests[0].getRequestMethod()){
                  Utils.emitEvent(true,142130)
                }
                console.log("[schemeHandler] onRequestStart method:" + request.getRequestMethod())
                this.getRequestMethodResult = request.getRequestMethod()
                console.log("[schemeHandler] onRequestStart referrer:" + request.getReferrer())
                this.getReferrerResult = request.getReferrer()
                if(this.requests.length>0 && this.requests[0].getReferrer() !== undefined){
                  Utils.emitEvent(true,142140)

                }
                if(this.requests.length>0 && this.requests[0].isMainFrame() !== undefined){
                  Utils.emitEvent(true,142150)
                }
                console.log("[schemeHandler] onRequestStart isMainFrame:" + request.isMainFrame())
                this.isMainFrameResult = request.isMainFrame()
                console.log("[schemeHandler] onRequestStart hasGesture:" + request.hasGesture())
                if(this.requests.length>0 && this.requests[0].hasGesture() !== undefined){
                  Utils.emitEvent(true,142160)
                }
                this.hasGestureResult = request.hasGesture()
                if(this.requests.length>0 && this.requests[0].getRequestResourceType() !== undefined){
                  Utils.emitEvent(true,142161)
                }
                console.log("[schemeHandler] onRequestStart resource type:" + request.getRequestResourceType())
                console.log("[schemeHandler] onRequestStart header size:" + request.getHeader().length)
                let header = request.getHeader();
                if(this.requests.length>0 && this.requests[0].getHeader()){
                  Utils.emitEvent(true,142110)
                }
                let requestHeaderMap = new Map<string, string>();
                for (let i = 0; i < header.length; i++) {
                  console.log("[schemeHandler] onRequestStart header:" + header[i].headerKey + " " + header[i].headerValue);
                  requestHeaderMap.set(header[i].headerKey, header[i].headerValue)
                }
              } catch (error) {
                error = error as BusinessError;
                let e: BusinessError = error as BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }

              this.postDataStream = request.getHttpBodyStream() as web_webview.WebHttpBodyStream ;
              this.resourceHandler = resourceHandler;

              if(schemeMap.has(request.getRequestUrl())){
                let arrayBuffer = new ArrayBuffer(200);
                let size:number = 200;
                let fileName = schemeMap.get(request.getRequestUrl()) as string;
                let context: common.UIAbilityContext | undefined =
                  AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext | undefined;
                let response = new web_webview.WebSchemeHandlerResponse();
                response.setStatus(200)
                response.setStatusText("OK")
                response.setMimeType("text/html")
                response.setEncoding("utf-8")
                this.resourceHandler.didReceiveResponse(response);
                console.log("[schemeHandler] didReceiveResponse" )
                this.resourceHandler.didReceiveResponseBody(arrayBuffer);
                console.log("[schemeHandler] didReceiveResponseBody" )
                resourceHandler.didFail(WebNetErrorList.ERR_FAILED, true);
                Utils.emitEvent(true,142190)

                return true;
              }
              return false;

            })
            this.webSchemeHander.onRequestStop((request: web_webview.WebSchemeHandlerRequest) => {
              console.log("[schemeHandler] onRequestStop")
            });
          } catch (error) {
            error = error as BusinessError;
            let e: BusinessError = error as BusinessError;
            console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
          }
        })
        .javaScriptAccess(true)
        .domStorageAccess(true)
    }
  }
}