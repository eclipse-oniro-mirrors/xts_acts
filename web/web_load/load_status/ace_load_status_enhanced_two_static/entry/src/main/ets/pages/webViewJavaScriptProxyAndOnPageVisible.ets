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

import { OnSslErrorEventReceiveEvent, OnPageVisibleEvent, FileSelectorParam, OnShowFileSelectorEvent, Entry, Component, Column, Row, Button, ClickEvent, Web } from '@ohos.arkui.component'
import Utils from '../../src/test/Util.test';
import webView from '@ohos.web.webview';
import emitter from '@ohos.events.emitter';
import events_emitter from '@ohos.events.emitter';
import { BusinessError, Callback, RecordData } from '@ohos.base';
import { State } from '@ohos.arkui.stateManagement' // should be insert by ui-plugins

class StringFields {
  public str: string = '';
}

@Entry
@Component
struct WebViewJavaScriptProxyAndOnPageVisible {
  stringObj: StringFields  = new StringFields ();
  @State str: string = ''
  @State fileSelectorMode: number = 0
  @State sslErrorType: number = -1
  @State zoomCounts: number = 200
  @State fontSize: Int = 28
  @State onPageVisibleCalled: boolean = false
  controller: webView.WebviewController = new webView.WebviewController(undefined);

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
        Button('web clicks').key('buttonJavaScriptProxyAndPageVisible').onClick((e: ClickEvent) => {
          console.info('key==>' +  this.stringObj.str)
          switch (this.stringObj.str) {

            case 'emitOnPageVisible': {
              this.onPageVisibleCalled = false
              this.controller.loadUrl('resource://rawfile/icon.html')
              break;
            }

          }
        })
      }

      Web({ src: 'resource://rawfile/indexThree.html', controller: this.controller })
        .key('WebViewJavaScriptProxyAndOnPageVisibleWebView')
        .defaultFontSize(this.fontSize)
        .onShowFileSelector((event: OnShowFileSelectorEvent): Boolean => {
          console.log('onShowFileSelector =====>')
          if (event) {
            console.log('onShowFileSelector event.fileSelector.getMode() return:', event.fileSelector.getMode())
            let fileSelectorObj: FileSelectorParam = event.fileSelector
            this.fileSelectorMode = fileSelectorObj.getMode()
          }
          return true
        })
        .onPageVisible((event: OnPageVisibleEvent): void => {
          if (!this.onPageVisibleCalled) {
            Utils.emitEvent(event.url + '', 1372)
            this.onPageVisibleCalled = true
          }
        })
        .onSslErrorEventReceive((event: OnSslErrorEventReceiveEvent): void => {
          if (event) {
            console.log('onSslErrorEventReceive =====> event.error:' + event.error)
            this.sslErrorType = event.error
          }
        })
        .overviewModeAccess(false)
    }
  }
}
