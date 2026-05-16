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

import { Entry, Text,Column, Component, Button, ClickEvent, Web, Row, Stack,ThreatType ,WebRotateEffect,WebResourceResponse,CopyOptions} from '@ohos.arkui.component'  // TextAttribute should be insert by ui-plugins
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
  @State outputStr: string = '';
  webviewCtl: web_webview.WebviewController = new web_webview.WebviewController(undefined);
  webResourceResponse: WebResourceResponse = new WebResourceResponse();
  @State rotateRenderEffectArr: WebRotateEffect[]= [WebRotateEffect.RESIZE_COVER_EFFECT,WebRotateEffect.TOPLEFT_EFFECT]
  @State emitKey: string = '';
  @State isReceive: number = -1;
  @State str:string = ''
  @State isPageEnd: number = -1;
  @State isOnResourceLoad: number = -1;
  @State isOnLoadFinished: number = -1;
  @State isOnInterceptRequest: number = -1;
  @State databaseAccess: boolean = true;
  @State copyOption: CopyOptions = CopyOptions.None;
  @State horizontalScrollBarAccess: boolean = true;
  @State enableNativeEmbedMode: boolean = true;
  @State onHttpAuthRequestResult: boolean = false;

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
        Button('web click').key('web').onClick((e: ClickEvent) => {
          console.info('key==>' + this.stringObj.str)
          switch (this.stringObj.str) {

            case 'emitonHttpAuthRequest': {
              this.webviewCtl.refresh();
              this.webviewCtl.loadUrl('https://httpbin.org/basic-auth/2222/3333');
              Utils.emitEvent(this.onHttpAuthRequestResult, 161009);
              break;
            }
            case 'emitonSwitchNextPage': {
              let uiContext: UIContext = this.getUIContext();
              let router: Router = uiContext.getRouter();
              router.pushUrl({ url: 'pages/webViewMetaViewport' })
              console.log('push URL success')
            }
          }
        })
      }


      Web({ src: 'https://httpbin.org/basic-auth/2222/3333', controller: this.webviewCtl })
        .onHttpAuthRequest(event => {
          if (event) {
            this.onHttpAuthRequestResult = true;
            console.log('onHttpAuthRequest host==>' + event.host);
            console.log('onHttpAuthRequest realm==>' + event.realm);
            console.log('onHttpAuthRequest isHttpAuthInfoSaved: ', event.handler.isHttpAuthInfoSaved());
          }
          return true
        })
    }

  }
}