/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import {
  Entry,
  Text,
  Column,
  Row,
  Component,
  Button,
  ClickEvent,
  Web,
  SslErrorEvent
} from '@ohos.arkui.component';
import { Callback, RecordData } from '@ohos.base'
import { State } from '@ohos.arkui.stateManagement';
import Utils from '../../src/test/Util.test';
import web_webview from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';
import emitter from '@ohos.events.emitter';
import image from '@ohos.multimedia.image';

class StringFields {
  public str: string = '';
}

@Entry
@Component
struct webViewOnSslErrorEvent {
  stringObj: StringFields  = new StringFields ();
  @State str: string = ''
  @State OnSslErrorEventFlagOne: boolean = false
  @State OnSslErrorEventFlagTwo: boolean = false
  @State OnSslErrorEventFlagThree: boolean = false
  @State OnSslErrorEventFlagFour: boolean = false
  controller: web_webview.WebviewController = new web_webview.WebviewController(undefined)
  controllerTwo: web_webview.WebviewController = new web_webview.WebviewController(undefined)

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
        Button('webViewOnSslErrorEvent').id('webViewOnSslErrorEvent').onClick((e: ClickEvent) => {
          console.info('key==>' +  this.stringObj.str)
          switch (this.stringObj.str) {
            case 'OnSslErrorEvent0100': {
              this.OnSslErrorEventFlagOne = true;
              this.controller.clearClientAuthenticationCache();
              this.controller.clearSslCache();
              this.controller.loadUrl('https://expired.badssl.com');
              break;
            }
            case 'OnSslErrorEvent0200': {
              this.OnSslErrorEventFlagTwo = true;
              this.controller.clearClientAuthenticationCache();
              this.controller.clearSslCache();
              this.controller.loadUrl('https://expired.badssl.com');
              break;
            }
            case 'OnSslErrorEvent0300': {
              this.OnSslErrorEventFlagThree = true;
              this.controller.clearClientAuthenticationCache();
              this.controller.clearSslCache();
              this.controller.loadUrl('https://expired.badssl.com')
              break;
            }
            case 'OnSslErrorEvent0400': {
              this.OnSslErrorEventFlagFour = true;
              this.controller.clearClientAuthenticationCache();
              this.controller.clearSslCache();
              this.controller.loadUrl('https://expired.badssl.com')
              break;
            }
          }
        })
      }

      Web({ src: 'www.example.com', controller: this.controller })
        .onSslErrorEvent((event: SslErrorEvent): void => {
          console.log('onSslErrorEvent url: ' + event.url)
          console.log('onSslErrorEvent error: ' + event.error)
          console.log('onSslErrorEvent originalUrl: ' + event.originalUrl)
          console.log('onSslErrorEvent referrer: ' + event.referrer)
          console.log('onSslErrorEvent isFatalError: ' + event.isFatalError)
          console.log('onSslErrorEvent isMainFrame: ' + event.isMainFrame)
          if (event.handler) {
            console.log('onSslErrorEvent handler: ')
          } else {
            console.log('onSslErrorEvent handler not exist ')
          }
          if (this.OnSslErrorEventFlagOne) {
            this.OnSslErrorEventFlagOne = false;
            Utils.emitEvent(event.error, 400)
          }
          if (this.OnSslErrorEventFlagTwo) {
            this.OnSslErrorEventFlagTwo = false;
            Utils.emitEvent(event.error, 401)
          }
          if (this.OnSslErrorEventFlagThree) {
            this.OnSslErrorEventFlagThree = false;
            Utils.emitEvent(event.isMainFrame, 402)
          }
          if (this.OnSslErrorEventFlagFour) {
            this.OnSslErrorEventFlagFour = false;
            Utils.emitEvent(event.error, 403)
          }
        })

    }
  }
}