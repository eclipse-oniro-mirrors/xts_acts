/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
  OnRenderExitedEvent,
  OnPageBeginEvent,
  RenderProcessNotRespondingReason,
  RenderProcessNotRespondingData,
  Entry,
  Component,
  Column,
  Row,
  Button,
  ClickEvent,
  Web
} from "@ohos.arkui.component"
import { State } from "@ohos.arkui.stateManagement"
import webview from '@ohos.web.webview'
import { BusinessError } from '@ohos.base';
import buffer from '@ohos.buffer'
import Utils from '../../src/test/Util.test';
import events_emitter from '@ohos.events.emitter';
import { Callback } from '@ohos.base'
import { WebNetErrorList } from '@ohos.web.netErrorList'
import emitter from '@ohos.events.emitter';
import { Callback, RecordData } from '@ohos.base'
import { UIContext, Router } from '@ohos.arkui.UIContext'

class StringFields {
  public str: string = '';
}

@Entry
@Component
struct webViewSdkSchemeHandler {
  stringObj: StringFields  = new StringFields ();
  controller: webview.WebviewController = new webview.WebviewController(undefined);
  schemeHandler: webview.WebSchemeHandler = new webview.WebSchemeHandler()
  httpBodyStream: webview.WebHttpBodyStream | null = null
  existHttpBodyStream: webview.WebHttpBodyStream | null = null
  @State emitKey: string = '';
  @State str: string = '';
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = true;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;
  requests?: webview.WebSchemeHandlerRequest
  scheme1: webview.WebCustomScheme = {
    schemeName: 'custom', isSupportCORS: true, isSupportFetch: true
  } as webview.WebCustomScheme
  htmlData: string = '{"test":1}';

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
        console.info('this.stringObj.str has been updated to: ' + this.stringObj.str);
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("web click").key('webViewSdkSchemeHandler').onClick((e: ClickEvent) => {
          this.controller.refresh()
          console.info("key==>" + this.stringObj.str)
          switch (this.stringObj.str) {
            case 'emitWebViewSdkSchemeHandler_getHeader': {
              console.info(`requests=${JSON.stringify(this.requests)}, getHeader=${this.requests?.getHeader()}`);
              if (this.requests && this.requests?.getHeader()) {
                Utils.emitEvent(true, 1501)
              }
              break;
            }
            case 'emitWebViewSdkSchemeHandler_getRequestUrl': {
              if (this.requests && this.requests?.getRequestUrl()) {
                Utils.emitEvent(true, 1502)
              }
              break;
            }
            case 'emitWebViewSdkSchemeHandler_getRequestMethod': {
              if (this.requests && this.requests?.getRequestMethod()) {
                Utils.emitEvent(true, 1503)
              }
              break;
            }
            case 'emitWebViewSdkSchemeHandler_getReferrer': {
              if (this.requests && this.requests?.getReferrer() !== undefined) {
                Utils.emitEvent(true, 1504)
              }
              break;
            }
            case 'emitWebViewSdkSchemeHandler_isMainFrame': {
              if (this.requests && this.requests?.isMainFrame() !== undefined) {
                Utils.emitEvent(true, 1505)
              }
              break;
            }
            case 'emitWebViewSdkSchemeHandler_hasGesture': {
              if (this.requests && this.requests?.hasGesture() !== undefined) {
                Utils.emitEvent(true, 1506)
              }
              break;
            }
            case 'SwitchNextPageStatic' : {
              let uiContext: UIContext = this.getUIContext();
              let router: Router = uiContext.getRouter();
              router.pushUrl({ url: 'pages/webHttpBodyStream' })
              console.log('push URL success')
            }
          }
        })
      }

      Web({ src: "resource://rawfile/index.html", controller: this.controller })
        .javaScriptAccess(true)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
        .onControllerAttached(() => {
          try {
            this.schemeHandler.onRequestStart(
              (request: webview.WebSchemeHandlerRequest, resourceHandler: webview.WebResourceHandler) => {
                console.log('[schemeHandler] onRequestStart')
                this.requests = request
                if (request.getRequestUrl().toLowerCase().indexOf('custom') > -1 ||
                  request.getRequestUrl().indexOf('www.example.com') > -1) {
                  if (this.httpBodyStream == null || this.httpBodyStream == undefined) {
                    this.httpBodyStream = request.getHttpBodyStream()
                  }
                  let response = new webview.WebSchemeHandlerResponse();
                  response.setStatus(200)
                  response.setStatusText('text')
                  response.setHeaderByName('Access-Control-Allow-Origin', '*', true)
                  resourceHandler.didReceiveResponse(response);
                  let buf = buffer.from(this.htmlData)
                  resourceHandler.didReceiveResponseBody(buf.buffer);
                  resourceHandler.didFinish();
                  return true
                }
                let response = new webview.WebSchemeHandlerResponse();
                response.setUrl('https://www.weibo.com')
                if (response.getUrl().indexOf('weibo') > -1) {
                }
                response.setNetErrorCode(WebNetErrorList.ERR_FAILED)
                if (response.getNetErrorCode() == -2) {
                }
                response.setStatus(200)
                if (response.getStatus() == 200) {
                }
                response.setStatusText('ok')
                if (response.getStatusText() == 'ok') {
                }
                response.setMimeType('text/html')
                if (response.getMimeType() == 'text/html') {
                }
                response.setEncoding('utf-8')
                response.setHeaderByName('Access-Control-Allow-Origin', '*', true)
                response.setHeaderByName('Access-Control-Allow-Origin', 'none', false)
                let newResponse = new webview.WebSchemeHandlerResponse();
                resourceHandler.didReceiveResponse(newResponse);
                let buf = buffer.from(this.htmlData)
                resourceHandler.didReceiveResponseBody(buf.buffer);
                resourceHandler.didFail(WebNetErrorList.ERR_FAILED)
                try {
                  resourceHandler.didFinish();
                } catch (e) {
                  console.log('finish error')
                }
                return false;
              })
            this.schemeHandler.onRequestStop((request: webview.WebSchemeHandlerRequest) => {
              console.log('[schemeHandler] onRequestStop')
            });
            this.controller.setWebSchemeHandler('https', this.schemeHandler);
            this.controller.setWebSchemeHandler('http', this.schemeHandler);
            this.controller.setWebSchemeHandler('resource', this.schemeHandler);
            this.controller.setWebSchemeHandler('custom', this.schemeHandler);
          } catch (error) {
            console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
          }
        })
    }
  }
}
