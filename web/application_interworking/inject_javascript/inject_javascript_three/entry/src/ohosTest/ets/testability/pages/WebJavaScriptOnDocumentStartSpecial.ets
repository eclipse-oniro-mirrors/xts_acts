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

import Utils from '../../test/Utils';
import webView from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';
import {waitForAssert, waitForExist} from '../../test/WaitTest';

@Entry
@Component
struct WebJavaScriptOnDocumentStartSpecial {
  controller: webView.WebviewController = new webView.WebviewController();
  @State emitKey: string = '';
  @State scripts: Array<ScriptItem> | null | undefined = [
     { script: 'console.log("javaScriptOnDocumentStart")', scriptRules: ['*'] }
  ];
  @State message: Array<string> = [];
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 148,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(148)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.emitKey = eventData.data.ACTION;
        this.isReceive = 0;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button('jsOnDocumentStart_null_undefined')
          .key('WebJavaScriptOnDocumentStartSpecialButton')
          .onClick(async () => {
            await waitForExist(() => this.isPageEnd, this.emitKey, 0, 1000);
            await waitForExist(() => this.isReceive, this.emitKey, 0, 1000);
            this.isReceive = -1;
            console.info('key==>' + this.emitKey)
            switch (this.emitKey) {
              case 'emitWebJavaScriptOnDocumentStartSetNull': {
                try {
                  this.isPageEnd = -1;
                  this.scripts = null;
                  this.controller.refresh();
                  await waitForExist(() => this.isPageEnd, this.emitKey, 0, 1000);
                  console.log(this.emitKey + ' onConsole message length==>' + this.message.length);
                  if (this.message.length == 1) {
                    Utils.emitEvent(true, 25112601);
                  } else {
                    Utils.emitEvent(false, 25112601);
                  }
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'emitWebJavaScriptOnDocumentStartSetUndefined': {
                try {
                  this.isPageEnd = -1;
                  this.scripts = undefined;
                  this.controller.refresh();
                  await waitForExist(() => this.isPageEnd, this.emitKey, 0, 1000);
                  console.log(this.emitKey + ' onConsole message length==>' + this.message.length);
                  if (this.message.length == 1) {
                    Utils.emitEvent(true, 25112602);
                  } else {
                    Utils.emitEvent(false, 25112602);
                  }
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
            }
         })
      }
      Web({ src: $rawfile('runJavaScriptOnDocumentEnd.html'), controller: this.controller })
        .javaScriptAccess(true)
        .domStorageAccess(true)
        .javaScriptOnDocumentStart(this.scripts)
        .onPageEnd((event) => {
          if (event) {
            this.isPageEnd = 0;
            console.log('javaScriptOnDocumentStart onPageEnd url:' + event.url);
           }
        })
        .onConsole((event) => {
          if (event) {
            let msg = event.message.getMessage();
            this.message.push(msg);
            console.log('javaScriptOnDocumentStart message===>' + this.message);
          }
          return false
        })
        .width('100%')
        .height('100%')
    }
  }
}
