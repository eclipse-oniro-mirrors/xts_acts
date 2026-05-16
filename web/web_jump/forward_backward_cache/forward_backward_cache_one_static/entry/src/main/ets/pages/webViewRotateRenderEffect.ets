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
  @State outputStr: string = '';
  webviewCtl: web_webview.WebviewController = new web_webview.WebviewController(undefined);
  @State rotateRenderEffectArr: WebRotateEffect[]= [WebRotateEffect.RESIZE_COVER_EFFECT,WebRotateEffect.TOPLEFT_EFFECT]
  @State emitKey: string = '';
  @State isReceive: number = -1;
  @State str:string = ''
  @State isPageEnd: number = -1;
  @State isOnLoadStarted: number = -1;

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
            case 'emitRotateRenderEffect01': {
              try {
                Utils.emitEvent(this.rotateRenderEffectArr[0], 202511011)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case 'emitRotateRenderEffect02': {
              try {
                Utils.emitEvent(this.rotateRenderEffectArr[1], 202511021)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "onPageEnd": {
              setTimeout(() => {
                Utils.emitEvent(this.isPageEnd, 202511094)
              }, 3000)

              break;
            }

            case "onLoadStarted": {
              this.webviewCtl.refresh();
              this.webviewCtl.loadUrl("www.baidu.com");
              Utils.emitEvent(this.isOnLoadStarted, 202511091)
              break;
            }

            case 'emitonSwitchNextPage': {
              let uiContext: UIContext = this.getUIContext();
              let router: Router = uiContext.getRouter();
              router.pushUrl({ url: 'pages/certChainData' })
              console.log('push URL success')
            }
          }
        })
      }

      Stack() {
        Web({ src: 'www.baidu.com', controller: this.webviewCtl })
          .rotateRenderEffect(WebRotateEffect.RESIZE_COVER_EFFECT)
          .width('100%')
          .height('100%')
          .onPageEnd((event) => {
            console.log('onPageEnd url:' + event.url);
            this.isPageEnd = 0;
          })
          .onLoadStarted(event => {
            if (event) {
              console.log('onLoadStarted url==>' + event.url);
              if (event.url) {
                this.isOnLoadStarted = 1;
              }
            }
          })
      }
    }
  }
}