/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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

import { Entry, Component, Column, Row, Button, ClickEvent, Web,  WebResourceResponse, Header, OnInterceptRequestEvent, CameraCaptureState, OnTitleReceiveEvent, CameraCaptureStateChangeInfo } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import Utils from '../../src/test/Util.test';
import webView from '@ohos.web.webview';
import emitter from '@ohos.events.emitter';
import events_emitter from '@ohos.events.emitter';
import { BusinessError, Callback, RecordData } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext'
import { canIUse } from '@internal.full.global'
export class StringFields {
  public str: string = '';
}

@Entry
@Component
struct webViewController {
  stringObj: StringFields  = new StringFields();
  controller: webView.WebviewController = new webView.WebviewController(undefined);
  @State str: string = ''
  @State httpErrorReceive: Int = 0
  @State responseCode: Int = 200
  @State newState:number = 3;
  @State CameraCaptureStateArr:CameraCaptureState[] = [CameraCaptureState.NONE,CameraCaptureState.PAUSED,CameraCaptureState.ACTIVE]
  heads: Header[] = new Array<Header>()
  responseWeb: WebResourceResponse = new WebResourceResponse()
  webData: string = '<!DOCTYPE html>\n' +
    '<html>\n' +
    '<head>\n' +
    '<title>intercept test</title>\n' +
    '</head>\n' +
    '<body>\n' +
    '<h1>intercept test</h1>\n' +
    '</body>\n' +
    '</html>'
  @State title: string = 'test';

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
        console.info(this.stringObj.str)
      }
    }
  }

  build() {
    Row() {
      Column() {
        Button('webViewOnCameraCaptureStateChangeButton')
          .key('webViewOnCameraCaptureStateChangeButton')
          .onClick((e: ClickEvent) => {
            console.info('key==>' +  this.stringObj.str)
            switch (this.stringObj.str) {
              case 'testOnCameraCaptureStateChange001': {
                try {
                  if(!canIUse('SystemCapability.UIDesign.HDSPattern.Standard')) {
                    Utils.emitEvent(CameraCaptureState.PAUSED, 60600);
                  } else {
                    this.controller.stopCamera();
                    setTimeout(() => {
                      Utils.emitEvent(3, 60600);
                    },1000)
                  }
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'testOnCameraCaptureStateChange002': {
                try {
                  if(!canIUse('SystemCapability.UIDesign.HDSPattern.Standard')) {
                    Utils.emitEvent(CameraCaptureState.ACTIVE, 60601);
                  } else {
                    this.controller.stopCamera();
                    setTimeout(() => {
                      Utils.emitEvent(3, 60601);
                    },1000)
                  }
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'testOnCameraCaptureStateChange003': {
                try {
                  if(!canIUse('SystemCapability.UIDesign.HDSPattern.Standard')) {
                    Utils.emitEvent(CameraCaptureState.NONE, 60602);
                  } else {
                    this.controller.startCamera();
                    setTimeout(() => {
                      Utils.emitEvent(3, 60602);
                    },1000)
                  }
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'SwitchNextPageStatic' : {
                let uiContext: UIContext = this.getUIContext();
                let router: Router = uiContext.getRouter();
                router.pushUrl({ url: 'pages/WebViewOnMicrophoneCaptureStateChange' })
                console.log('push URL success')
              }
            }
          })

        Web({ src: 'resource://rawfile/index.html', controller: this.controller })
          .javaScriptAccess(true)
          .geolocationAccess(true)
          .databaseAccess(true)

          .onTitleReceive((event:OnTitleReceiveEvent):void => {
            if (event) {
              console.log('title:' + event.title);
              this.title = event.title
            }
          })
          .onPermissionRequest((event) => {
            if (event) {
              event.request.grant(event.request.getAccessibleResource());
            }
          })
          .onPageEnd((event) => {
            console.log('onPageEnd url:' + event.url);
          })
          .onCameraCaptureStateChange((info:CameraCaptureStateChangeInfo):void=>{
            console.info("Camera from ", info.originalState, " to ", info.newState);
            console.info("newState" + info.newState);
            this.newState = info.newState;
          })
      }
    }
  }
}

