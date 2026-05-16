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
  Entry,
  Component,
  Column,
  Row,
  Button,
  ClickEvent,
  Web,
  OnConsoleEvent,
  OnErrorReceiveEvent
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import webView from '@ohos.web.webview'
import { BusinessError, RecordData } from '@ohos.base';
import Utils from '../../src/test/Util.test';
import events_emitter from '@ohos.events.emitter';
import emitter from '@ohos.events.emitter';
import { Callback } from '@ohos.base'
import { UIContext, Router } from '@ohos.arkui.UIContext'

@Entry
@Component
struct WebInitTest {
  controller: webView.WebviewController = new webView.WebviewController(undefined);
  @State str: string = ''
  @State webInit: boolean = false
  @State webCreated: boolean = false
  @State interceptUrl: string = ''
  @State consoleMsg: string = ''
  @State consoleCorsError: boolean = false


  aboutToAppear() {
    console.info('Entry aboutToAppear');
    let valueChangeEvent: emitter.InnerEvent = {
      eventId: 10,
      priority: emitter.EventPriority.LOW
    }
    emitter.on(valueChangeEvent, this.valueChangeCallBack)
    console.info('Finish aboutToAppear ' + this.valueChangeCallBack);

    try {
      webView.once('webInited', () => {
        console.error('webInited =====>')
        this.webInit = true
      })
      webView.once('webCreated', () => {
        console.error('webCreated =====>')
        this.webCreated = true
      })
    } catch (error: BusinessError) {
      console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
    }
  }

  private valueChangeCallBack: Callback<emitter.EventData> = (eventData: emitter.EventData): void => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      const data = eventData.data as Record<string, RecordData>;
      if (data && data['ACTION'] != null) {
        console.info('Received ACTION value: ' + data['ACTION']);
        let strValue: string = String(data['ACTION']);
        console.info('strValue has been updated to: ' + strValue);
        this.str = strValue;
        console.info('this.str has been updated to: ' + this.str);
      }
    }
  }

  build() {
    Row() {
      Column() {
        Button('WebInitTestButton')
          .key('WebInitTestButton')
          .onClick( (e: ClickEvent) => {
            console.log('key==>' + this.str)
            switch (this.str) {
              case 'emitOnce001': {
                try {
                  webView.once('webInited', () => {
                    console.error('webInited =====>')
                    this.webInit = true
                  })
                  Utils.emitEvent(this.webInit, 409);
                } catch (error: BusinessError) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'emitOnce002': {
                try {
                  Utils.emitEvent(this.webCreated, 410);
                } catch (error: BusinessError) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'emitonSwitchNextPage': {
                let uiContext: UIContext = this.getUIContext();
                let router: Router = uiContext.getRouter();
                router.pushUrl({ url: 'pages/componentLifeCycleTestOne' })
                console.log('push URL success')
              }
            }
          })

        Web({ src: 'resource://rawfile/index.html', controller: this.controller })
          .height('50%')
          .width('100%')
          .javaScriptAccess(true)
          .geolocationAccess(true)
          .databaseAccess(true)
          .pinchSmooth(true)
         .onConsole((event:OnConsoleEvent):boolean => {
           if (event) {
             this.consoleMsg = event.message?.getMessage() as String;
             if (!this.consoleCorsError &&
               event.message?.getMessage() !== undefined &&
               event.message.getMessage().indexOf('blocked by CORS policy') >= 0) {
               this.consoleCorsError = true
             }
             console.log('onConsole getMessage:' + event.message?.getMessage())
             console.log('onConsole getSourceId:' + event.message?.getSourceId())
             console.log('onConsole getLineNumber:' + event.message?.getLineNumber())
             console.log('onConsole getMessageLevel:' + event.message?.getMessageLevel())
           }
           return false
         })
         .onErrorReceive((event:OnErrorReceiveEvent):void=> {
           if (event) {
             console.log('onErrorReceive ==============> ')
             console.log('getErrorInfo:' + event.error.getErrorInfo())
             console.log('getErrorCode:' + event.error.getErrorCode())
             console.log('url:' + event.request.getRequestUrl())
             console.log('isMainFrame:' + event.request.isMainFrame())
             console.log('isRedirect:' + event.request.isRedirect())
             console.log('isRequestGesture:' + event.request.isRequestGesture())
             console.log('getRequestHeader_headerKey:' + event.request.getRequestHeader().toString())
             let result = event.request.getRequestHeader()
             console.log('The request header result size is ' + result.length)
             for (let i of result) {
               console.log('The request header key is : ' + i.headerKey + ', value is : ' + i.headerValue)
             }
           }
         })
      }
      .width('100%')
    }
    .height('100%')
  }
}
