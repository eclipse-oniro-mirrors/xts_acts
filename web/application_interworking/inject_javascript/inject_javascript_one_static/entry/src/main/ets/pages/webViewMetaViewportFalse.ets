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
import webview from '@ohos.web.webview';
import { FullScreenExitHandler,$rawfile,OnRenderExitedEvent, OnPageBeginEvent, RenderProcessNotRespondingReason, RenderProcessNotRespondingData, Entry, Component, Column, Row, Button, ClickEvent, Web } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import Utils from '../../src/test/Util.test';
import emitter from '@ohos.events.emitter';
import events_emitter from '@ohos.events.emitter';
import { Callback } from '@ohos.base'
import image from '@ohos.multimedia.image';
import web_webview from '@ohos.web.webview';
import { BusinessError, RecordData } from '@ohos.base';
class StringFields {
  str: string = '';
}
@Entry
@Component
struct webViewOnMetaViewportFalse {
  stringObj: StringFields  = new StringFields ();
  controller: webview.WebviewController = new webview.WebviewController(undefined);
  handler: FullScreenExitHandler = new FullScreenExitHandler();
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = true;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State checkEleResult: string = '';


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
        Button('web click')
          .key('webViewMetaViewportFalse')
          .onClick( (e:ClickEvent) => {
            console.info('key==>' + this.stringObj.str)
            switch (this.stringObj.str) {
              case 'emitWebViewMetaViewportFalse': {
                try {
                  console.info('emitWebViewMetaViewportFalse==>')
                  this.controller.runJavaScript('isElementMetaViewport()', (error:BusinessError<void>|null, result: String|undefined) => {
                    console.log('The isElementMetaViewport() return value is: ${result}')
                    if (result) {
                      Utils.emitEvent( result , 10002)
                    }
                  })
                } catch (error) {
                  console.error('ErrorCode: ${error.code}, Message: ${error.message}');
                }
                break;
              }

            }
          })
      }

      Web({ src: 'resource://rawfile/metaViewport.html', controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
        .metaViewport(false)
    }
  }
}
