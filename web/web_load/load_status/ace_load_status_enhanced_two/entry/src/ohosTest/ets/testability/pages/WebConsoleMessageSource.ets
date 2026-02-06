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

import webView from '@ohos.web.webview';
import Utils from '../../test/Utils';
import events_emitter from '@ohos.events.emitter';
import {waitForExist} from '../../test/WaitTest.test';

@Entry
@Component
struct WebConsoleMessageSource {
  controller: webView.WebviewController = new webView.WebviewController();
  @State str: string = ''
  @State testConsole: boolean = false
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 119060,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(119060)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
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
      Column() {
        Button('web click')
          .key('WebConsoleMessageGetSourceButton')
          .focusable(true)
          .onClick(async () => {
            await waitForExist(()=>this.isReceive, 'WebConsoleMessageGetSourceButtonIsReceive', 0);
            await waitForExist(()=>this.isPageEnd, 'WebConsoleMessageGetSourceButtonIsPageEnd', 0);
            console.info('key==>' + this.str);
            this.isReceive = -1;
            switch (this.str) {
              case 'emitWebConsoleMessageGetSource0001': {
                try {
                  this.testConsole = true
                  this.isPageEnd = -1;
                  this.controller.loadUrl('resource://rawfile/index.html');
                  await waitForExist(()=>this.isPageEnd, 'WebConsoleMessageGetSourceButtonIsPageEnd', 0);
                  this.controller.runJavaScript('consoleTest()')
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
            }
          })

        Web({ src: $rawfile('index.html'), controller: this.controller })
          .key('webView')
          .height('50%')
          .fileAccess(true)
          .width('100%')
          .javaScriptAccess(true)
          .horizontalScrollBarAccess(true)
          .verticalScrollBarAccess(true)
          .databaseAccess(true)
          .userAgent('Mozilla/5.0 (Windows NT 10.0; WOW64)')
          .onConsole((event) => {
            if (event) {
              if (this.testConsole) {
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