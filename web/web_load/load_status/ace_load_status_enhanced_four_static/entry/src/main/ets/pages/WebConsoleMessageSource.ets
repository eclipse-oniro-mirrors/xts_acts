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


import { Entry, Component, Column, Row, Button, ClickEvent, Web } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import { BusinessError, Callback, RecordData } from '@ohos.base';

import webView from '@ohos.web.webview';
import emitter from '@ohos.events.emitter';
import events_emitter from '@ohos.events.emitter';

import Utils from '../../src/test/Util.test';


@Entry
@Component
struct WebConsoleMessageSource {
  controller: webView.WebviewController = new webView.WebviewController(undefined);
  @State str: string = '';
  @State testConsole: boolean = false;
  @State isReceive: int = -1;
  @State isPageEnd: int = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 119060,
      priority: events_emitter.EventPriority.LOW
    };
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack);
  }

  onPageHide() {
    events_emitter.off(119060);
  }

  private valueChangeCallBack: Callback<events_emitter.EventData> = (eventData: events_emitter.EventData):void => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      const data = eventData.data as Record<string, RecordData>;
      if (data != null && data['ACTION'] != null) {
        this.str = String(data['ACTION']);
        try {
          this.controller.loadUrl('resource://rawfile/index.html');
        } catch (error) {
          console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
        }
        this.isReceive = 0;
      }
    }
  }

  build() {
    Row() {
      Column(undefined) {
        Button('web click')
          .key('WebConsoleMessageGetSourceButton')
          .focusable(true)
          .onClick((e: ClickEvent) => {
            setTimeout(() => {
              console.log(this.str);
            }, 2000)
            console.info('key==>' + this.str);
            this.isReceive = -1;
            switch (this.str) {
              case 'emitWebConsoleMessageGetSource0001': {
                try {
                  this.testConsole = true
                  this.isPageEnd = -1;
                  this.controller.loadUrl('resource://rawfile/index.html');
                  setTimeout(() => {
                    console.log(this.str);
                  }, 2000)
                  this.controller.runJavaScript('consoleTest()')
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
            }
          })

        Web({ src:'resource://rawfile/index.html', controller: this.controller })
          .key('webView')
          .height('50%')
          .fileAccess(true)
          .width('100%')
          .javaScriptAccess(true)
          .horizontalScrollBarAccess(true)
          .verticalScrollBarAccess(true)
          .databaseAccess(true)
          .onConsole((event): boolean => {
            if (event) {
              if (this.testConsole) {
                console.log('event.message.getSource()', event.message.getSource());
                Utils.emitEvent(event.message.getSource(), 119100)
                this.testConsole = false
              }
            }
            return false
          })
          .onPageEnd(()=>{
            this.isPageEnd = 0;
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}