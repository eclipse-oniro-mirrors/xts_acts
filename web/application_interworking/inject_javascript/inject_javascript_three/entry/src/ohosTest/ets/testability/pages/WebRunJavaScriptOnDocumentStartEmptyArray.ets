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
struct WebRunJavaScriptOnDocumentStartEmptyArray {
  controller: webView.WebviewController = new webView.WebviewController();
  @State emitKey: string = '';
  @State scripts: Array<ScriptItem> = [];
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 2511258,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(2511258)
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
        Button('RunJavaScriptOnDocumentStartEmptyArray')
          .key('RunJavaScriptOnDocumentStartEmptyArray')
          .onClick(async () => {
            await waitForExist(() => this.isReceive, 'RunJavaScriptOnDocumentStartEmptyArray_isReceive', 0);
            await waitForExist(() => this.isPageEnd, 'RunJavaScriptOnDocumentStartEmptyArray_isPageEnd', 0);
            console.info('key==>' + this.emitKey)
            this.isReceive = -1;
            switch (this.emitKey) {
              case 'testRunJavaScriptOnDocumentStartEmptyArray': {
                try {
                  this.isPageEnd = -1
                  this.scripts = []
                  this.controller.refresh()
                  await waitForExist(() => this.isPageEnd, 'testRunJavaScriptOnDocumentStartEmptyArray_isPageEnd', 0);
                  let result:string = 'result'
                  this.controller.runJavaScript('getResult()', (error, result) => {
                    if (error) {
                      console.info('testRunJavaScriptOnDocumentStartEmptyArray getResult() return error: ' + error);
                      result = String(error.code)
                    }
                    if (result) {
                      console.info('testRunJavaScriptOnDocumentStartEmptyArray getResult() return result: ' + result);
                      result = result
                    }
                  });
                  result = await waitForExist(() => result, 'testRunJavaScriptOnDocumentStartEmptyArray', '""');
                  if (result === '""') {
                    Utils.emitEvent('result', 20200312)
                  } else {
                    Utils.emitEvent('result', 20200312)
                  }
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(error.code, 20200312);
                }
                break;
              }
            }
          })
      }
      Web({ src: $rawfile('runJavaScriptOnDocumentStart.html'), controller: this.controller })
        .javaScriptAccess(true)
        .domStorageAccess(true)
        .runJavaScriptOnDocumentStart(this.scripts)
        .onPageBegin((event) => {
          if (event) {
            console.log('runJavaScriptOnDocumentStartEmptyArray onPageBegin url:' + event.url);
          }
        })
        .onPageEnd((event) => {
          if (event) {
            this.isPageEnd = 0;
            console.log('runJavaScriptOnDocumentStartEmptyArray onPageEnd url:' + event.url);
          }
        })
        .onConsole((event) => {
          if (event) {
            console.log('runJavaScriptOnDocumentStartEmptyArray message===>' + event.message.getMessage());
          }
          return false
        })
        .width('100%')
        .height('100%')
    }
  }
}