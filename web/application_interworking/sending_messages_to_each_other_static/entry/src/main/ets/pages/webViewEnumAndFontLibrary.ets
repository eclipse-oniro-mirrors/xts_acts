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

import webView from '@ohos.web.webview';
import { Driver, ON } from '@ohos.UiTest';
import { OnConsoleEvent, Entry, Component, Column, Row, Button, ClickEvent, Web } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement' // should be insert by ui-plugins
import { BusinessError } from '@ohos.base';
import Utils from '../../src/test/Utils.test';
import events_emitter from '@ohos.events.emitter';
import { Callback, RecordData } from '@ohos.base'
import { UIContext, Router } from '@ohos.arkui.UIContext'
import image from '@ohos.multimedia.image';

class StringFields {
  public str: string = '';
}

@Entry
@Component
struct WebViewEnumAndFontLibrary {
  stringObj: StringFields  = new StringFields ();
  controller: webView.WebviewController = new webView.WebviewController(undefined);
  @State str: string = ''
  @State count: string = ''
  @State javaScriptAccess: boolean = true
  @State databaseAccess: boolean = true

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
        Button('web click').key('buttonEnumAndFontLibrary').onClick( (e:ClickEvent) => {
          console.info('key==>' +  this.stringObj.str)
          switch (this.stringObj.str) {
            case 'emitMessageLevelDebug': {
              this.controller.runJavaScript('getMessageLevelDebug()')
              setTimeout(() => {
              Utils.emitEvent(this.count.toString(), 601)
              }, 1500)
              break;
            }
            case 'emitMessageLevelInfo': {
              this.controller.runJavaScript('getMessageLevelInfo()')
              setTimeout(() => {
              Utils.emitEvent(this.count.toString(), 602)
              }, 1500)
              break;
            }
            case 'emitMessageLevelWarn': {
              this.controller.runJavaScript('getMessageLevelWarn()')
              setTimeout(() => {
              Utils.emitEvent(this.count.toString(), 603)
              }, 1500)
              break;
            }
            case 'emitMessageLevelError': {
              this.controller.runJavaScript('getMessageLevelError()')
              setTimeout(() => {
              Utils.emitEvent(this.count.toString(), 604)
              }, 1500)
              break;
            }
            case 'emitMessageLevelLog': {
              this.controller.runJavaScript('getMessageLevelLog()')
              setTimeout(() => {
              Utils.emitEvent(this.count.toString(), 605)
              }, 1500)
              break;
            }

            case 'SwitchNextPageStatic' : {
              let uiContext: UIContext = this.getUIContext();
              let router: Router = uiContext.getRouter();
              router.pushUrl({ url: 'pages/webMessagePortIsExtentionTypeTest' })
              console.log('push URL success')
            }

          }
        })
      }

      Web({ src: 'resource://rawfile/indexJru.html', controller: this.controller })
        .key('webCenter')
        .onConsole((event:OnConsoleEvent):boolean => {
          if (event) {
            console.log('getMessage:' + event.message?.getMessage())
            console.log('getSourceId:' + event.message?.getSourceId())
            console.log('getLineNumber:' + event.message?.getLineNumber())
            console.log('getMessageLevel:' + event.message?.getMessageLevel())
            this.count = event.message.getMessageLevel().toString()
            console.log('mixed>>>:', event.message.getMessage(), event.message.getMessageLevel())
          }
          return false
        })
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(true)
        .imageAccess(true)
        .domStorageAccess(false)
        .onlineImageAccess(false)
        .databaseAccess(this.databaseAccess)
    }
  }
}
