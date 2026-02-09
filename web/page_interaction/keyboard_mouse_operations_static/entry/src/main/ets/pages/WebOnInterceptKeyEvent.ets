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
  $rawfile,
  Button,
  ClickEvent,
  Column,
  Component,
  Entry,
  KeyEvent,
  OnPageBeginEvent,
  OnRenderExitedEvent,
  RenderProcessNotRespondingData,
  RenderProcessNotRespondingReason,
  Row,
  Web
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import web_webview from '@ohos.web.webview'
import webView from '@ohos.web.webview'
import { BusinessError, Callback, RecordData } from '@ohos.base';
import { Utils } from '../../src/test/Util.test';
import events_emitter from '@ohos.events.emitter';
import { JsProxyObject } from '../../src/test/Interfaces';
import image from '@ohos.multimedia.image';
import { Driver, ON } from '@ohos.UiTest';

class StringFields {
  str: string = '';
}

class StringFields1 {
  onInterceptKeyEventCode: number = 0;
}

@Entry
@Component
struct WebOnInterceptKeyEvent {
  controller: webView.WebviewController = new webView.WebviewController(undefined);
  @State str: string = "";
  stringObj: StringFields  = new StringFields ();
  stringObj1: StringFields1  = new StringFields1 ();
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = false;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State mediaPlayGestureAccess: boolean = true;
  @State interceptKeyEvent: boolean = false;

  aboutToAppear() {
    console.info("Entry aboutToAppear");
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
    console.info("Finish aboutToAppear " + this.valueChangeCallBack);
  }

  private valueChangeCallBack: Callback<events_emitter.EventData> = (eventData: events_emitter.EventData): void => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      const data = eventData.data as Record<string, RecordData>;
      if (data && data["ACTION"] != null) {
        console.info('Received ACTION value: ' + data["ACTION"]);
        let strValue: string = String(data["ACTION"]);
        console.info('strValue has been updated to: ' + strValue);
        this.str = strValue;
        console.info('this.str has been updated to: ' + this.str);
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("WebOnInterceptKeyEventTestButton")
          .key('WebOnInterceptKeyEventTestButton').onClick( (e:ClickEvent) => {
          switch (this.str) {
            case "emitOnInterceptKeyEvent002": {
              try {
                this.interceptKeyEvent = true
                this.controller.loadUrl('resource://rawfile/keyEvent.html')
                Utils.emitEvent(this.stringObj1.onInterceptKeyEventCode, 70422)
              } catch (error:BusinessError) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitOnInterceptKeyEvent003": {
              try {
                this.interceptKeyEvent = false
                this.controller.loadUrl('resource://rawfile/keyEvent.html')
                Utils.emitEvent(this.stringObj1.onInterceptKeyEventCode, 70425)
              } catch (error:BusinessError) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
          }
        })
      }

      Web({ src: $rawfile('index.html'), controller: this.controller })
        .key('WebOnInterceptKeyEventWebView')
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .mediaPlayGestureAccess(this.mediaPlayGestureAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
        .onInterceptKeyEvent((event: KeyEvent):boolean => {
          console.log("onInterceptKeyEvent==>")
          if (event) {
            this.stringObj1.onInterceptKeyEventCode = event.keyCode
          }
          return this.interceptKeyEvent;
        })
    }
  }
}