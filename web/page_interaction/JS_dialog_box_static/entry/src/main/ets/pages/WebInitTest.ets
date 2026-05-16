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

import webView from '@ohos.web.webview';
import Utils from '../../src/test/Util.test';
import { $rawfile, Entry, Component, Column, Row, Button, ClickEvent, Web, NativeEmbedParamStatus } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import events_emitter from '@ohos.events.emitter';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { BusinessError, Callback, RecordData } from '@ohos.base';
import window from '@ohos.window'
import { UIContext, Router } from '@ohos.arkui.UIContext'

const EVENT_ID_SET_SUITE_KEY = 177301;
export class StringFields {
  str: string = '';
}

@Entry
@Component
struct WebInitTest {
  stringObj: StringFields  = new StringFields ();
  controller: webView.WebviewController = new webView.WebviewController();
  @State str: string = ""
  @State userAgentPC:string = "";
  @State webInit: boolean = false
  @State confirm: string = "";
  @State alert: string = "";
  @State webCreated: boolean = false
  @State interceptUrl: string = ''
  @State consoleMsg: string = ''
  @State screenHeight: number = 0;
  @State avoidAreaChangeStr: string = '';
  @State isPageEnd: number = -1;
  @State isReceive: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: EVENT_ID_SET_SUITE_KEY,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(EVENT_ID_SET_SUITE_KEY)
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

  aboutToAppear() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)

  }

  build() {
    Row() {
      Column() {
        Button('WebInitTestButton')
          .key('WebInitTestButton')
          .onClick((e: ClickEvent) => {
            console.info("key==>" +  this.stringObj.str)
            switch ( this.stringObj.str) {
              case "emitOnPrompt": {
                this.isPageEnd = -1
                this.controller.loadUrl("resource://rawfile/index.html");
                this.controller.runJavaScript('toPrompt()')
                  .then((result) => {
                    console.log('zx OnPrompt1' );
                    console.log('result: ' + result);
                  })
                break;
              }
              case "emitOnAlert": {
                this.controller.runJavaScript('alertTest()')
                  .then((result) => {
                    console.log('result: ' + result);
                    Utils.emitEvent(this.alert, 177320);
                  })
                break;
              }
              case "emitOnConfirm": {
                this.controller.runJavaScript('confirmTest()')
                  .then((result) => {
                    console.log('result: ' + result);
                    Utils.emitEvent(this.confirm, 177330);
                  })
                break;
              }

              case 'SwitchNextPageStatic' : {
                let uiContext: UIContext = this.getUIContext();
                let router: Router = uiContext.getRouter();
                router.pushUrl({ url: 'pages/NativeEmbedParamStatusUpdate' })
                console.log('push URL success')
              }

            }
          })

        Web({ src: $rawfile('index.html'), controller: this.controller })
          .height('50%')
          .width('100%')
          .onAlert((event) => {
            this.alert = event.message;
            return false;
          })
          .onConfirm((event) => {
            this.confirm = event.message;
            return false;
          })
          .onPrompt((event) => {
            event.result.handlePromptConfirm("onPrompt ok");
            Utils.emitEvent(event.message, 177310);
            return true;
          })
          .javaScriptAccess(true)
          .geolocationAccess(true)
          .databaseAccess(true)
          .onErrorReceive((event) => {
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
          .onPageEnd((event) => {
            console.log('onPageEnd url:' + event.url);
            this.isPageEnd = 1;
          })
      }
      .width('100%')
    }

    .height('100%')
  }
}