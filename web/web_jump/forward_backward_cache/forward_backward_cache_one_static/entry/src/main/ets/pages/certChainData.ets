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

import { Entry, Text,Column, Component, Button, ClickEvent, Web, Row, Stack,ThreatType ,WebRotateEffect} from '@ohos.arkui.component'  // TextAttribute should be insert by ui-plugins
import { State} from '@ohos.arkui.stateManagement' // should be insert by ui-plugins
import Utils from '../../src/test/Util.test';
import events_emitter from '@ohos.events.emitter';
import emitter from '@ohos.events.emitter';
import { Callback, RecordData, BusinessError } from '@ohos.base'
import web_webview from '@ohos.web.webview';
import webview from '@ohos.web.webview';
import { UIContext, Router } from '@ohos.arkui.UIContext'

export class StringFields {
  public str: string = '';
}
@Entry
@Component
struct Second {
  stringObj: StringFields  = new StringFields ();
  webviewCtl: web_webview.WebviewController = new web_webview.WebviewController(undefined);
  @State onSslErrorEventReceiveResult: boolean = false;
  @State onHttpErrorReceiveResult: boolean = false;
  @State onErrorReceive: boolean = false;
  @State onSslErrorEvent: boolean = false;
  @State onRequestSelected: boolean = false;
  @State certChainDataResult: boolean = false;
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
        Button("web Test").key('certChainDataWeb').onClick((e: ClickEvent) => {
          console.info("key==>" + this.stringObj.str)
          switch (this.stringObj.str) {
            case "certChainData01": {
              this.webviewCtl.refresh();
              this.webviewCtl.loadUrl('https://expired.badssl.com/');
              setTimeout(() => {
                Utils.emitEvent(this.certChainDataResult, 202412099)
              }, 6000)

              break;
            }
            case "onHttpErrorReceive": {
              this.webviewCtl.refresh();
              this.webviewCtl.loadUrl("https://example.com/404-test",);
              setTimeout(() => {
                Utils.emitEvent(this.onHttpErrorReceiveResult, 2024120991)
              }, 3000)
              break;
            }

            case "onErrorReceive": {
              this.webviewCtl.refresh();
              this.webviewCtl.loadUrl("https://example.",);
              setTimeout(() => {
                Utils.emitEvent(this.onErrorReceive, 2024120992)
              }, 6000)
              break;
            }

            case "onSslErrorEvent": {
              this.webviewCtl.refresh();
              this.webviewCtl.loadUrl("https://example.com/404-test",);
              setTimeout(() => {
                Utils.emitEvent(this.onSslErrorEvent, 2024120993)
              }, 3000)
              break;
            }

            case "onRequestSelected": {
              this.webviewCtl.refresh();
              this.webviewCtl.loadUrl("https://example.com/404-test",);
              setTimeout(() => {
                Utils.emitEvent(this.onRequestSelected, 2024120994)
              }, 3000)
              break;
            }
            case 'emitonSwitchNextPage': {
              let uiContext: UIContext = this.getUIContext();
              let router: Router = uiContext.getRouter();
              router.pushUrl({ url: 'pages/webPage' })
              console.log('push URL success')
            }
          }
        })
      }

      Web({ src: "https://expired.badssl.com/", controller: this.webviewCtl })
      //需要联网触发下列接口
        .onSslErrorEventReceive(event => {
          if (event.certChainData) {
            console.log('certChainData success');
            this.certChainDataResult = true;
          }
        })
        .onHttpErrorReceive(event => {
          if (event) {
            this.onHttpErrorReceiveResult = true;
            console.log('GetRequest url:' + event.request.getRequestUrl());

          }
        } )
        .onErrorReceive(event => {
          if (event) {
            this.onErrorReceive = true;
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


        .onSslErrorEvent(event => {
          if (event) {
            this.onSslErrorEvent = true;
            console.log('onSslErrorEvent url: ' + event.url);
            console.log('onSslErrorEvent error: ' + event.error);
            console.log('onSslErrorEvent originalUrl: ' + event.originalUrl);
            console.log('onSslErrorEvent referrer: ' + event.referrer);
            console.log('onSslErrorEvent isFatalError: ' + event.isFatalError);
            console.log('onSslErrorEvent isMainFrame: ' + event.isMainFrame);
            console.log('onSslErrorEvent handler: ' + event.handler);
          }
        })
        .onRequestSelected(() => {
          this.onRequestSelected = true;
          console.log("webTest : onRequestSelected: ");
        })

    }
  }
}