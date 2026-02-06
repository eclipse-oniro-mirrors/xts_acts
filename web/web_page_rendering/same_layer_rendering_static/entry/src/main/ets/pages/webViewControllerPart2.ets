/*
 * Copyright (c) 2024-2026 Huawei Device Co., Ltd.
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
import { NativeEmbedStatus, Entry, Component, Column, Row, Button, ClickEvent, Web, EmbedOptions } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import web_webview from '@ohos.web.webview'
import { BusinessError } from '@ohos.base';
import Utils from '../../src/test/Util.test';
import events_emitter from '@ohos.events.emitter';
import { Callback } from '@ohos.base'
import image from '@ohos.multimedia.image';
import  { BusinessError, RecordData } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext'

@Entry
@Component
struct webViewControllerPart2 {
  controller: webView.WebviewController = new webView.WebviewController(undefined);
  @State str: string = ''

  aboutToAppear() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack: Callback<events_emitter.EventData> = (eventData: events_emitter.EventData): void => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && (eventData.data as Record<string , RecordData>)?.['ACTION'] != null) {
        this.str = '' + (eventData.data as Record<string , RecordData>)?.['ACTION'];
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button('WebViewControllerPart2 click').key('WebViewControllerPart2Button').onClick( (e:ClickEvent) => {
          console.info('key==>' + this.str)
          switch (this.str) {
            case 'testNativeEmbedStatus001': {
              try {
                console.log('testNativeEmbedStatus001 :'+NativeEmbedStatus.ENTER_BFCACHE)
                Utils.emitEvent(NativeEmbedStatus.ENTER_BFCACHE, 37021);
              } catch (error) {
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }

            case 'testNativeEmbedStatus002': {
              try {
                console.log('testNativeEmbedStatus002 :'+NativeEmbedStatus.LEAVE_BFCACHE)
                Utils.emitEvent(NativeEmbedStatus.LEAVE_BFCACHE, 37022);
              } catch (error) {
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }

            case 'emitonSwitchNextPage1': {
              let uiContext: UIContext = this.getUIContext();
              let router: Router = uiContext.getRouter();
              router.pushUrl({ url: 'pages/webViewRegisterNativeEmbedRule' })
              break;
            }
          }
        })
      }

      Web({ src: 'resource://rawfile/index.html', controller: this.controller })
        .key('onShowFileSelectorKey')
        .enableNativeEmbedMode(true)
        .nativeEmbedOptions({ supportDefaultIntrinsicSize: false })
    }
  }
}
