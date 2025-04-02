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

@Entry
@Component
struct WebRunJavaScriptOnDocumentEndTest {
  controller: webView.WebviewController = new webView.WebviewController();
  @State emitKey: string = '';
  private jsStr: string =
  "window.document.getElementById('result').innerHTML = 'runJavaScriptOnDocumentEnd'";
  @State scripts: Array<ScriptItem> = [
     { script: this.jsStr, scriptRules: ['*'] }
  ];

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(10)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.emitKey = eventData.data.ACTION;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button('WebRunJavaScriptOnDocumentEndTestButton click')
          .key('WebRunJavaScriptOnDocumentEndTestButton')
          .onClick(async () => {
            await Utils.sleep(2000);
            console.info('key==>' + this.emitKey)
            switch (this.emitKey) {
              case 'emitWebRunJavaScriptOnDocumentEnd001': {
                let resultData = '';
                try {
                  this.controller.runJavaScript('getResult()', (error, result) => {
                    if (error) {
                      console.info('emitWebRunJavaScriptOnDocumentEnd001 getResult() return error: ' + error);
                    }
                    if (result) {
                      console.info('emitWebRunJavaScriptOnDocumentEnd001 getResult() return result: ' + result);
                      resultData = result;
                    }
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                await Utils.sleep(2000);
                Utils.emitEvent(resultData,2025022101);
                break;
              }
              case 'emitWebRunJavaScriptOnDocumentEnd002': {
                   let resultData = '';
                   this.scripts = [
                         { script: "testValue = 'msg3'", scriptRules: ['*'] },
                         { script: "testValue = 'msg2'", scriptRules: ['*'] }
                      ];
                   try {
                     this.controller.loadUrl($rawfile('runJavaScriptOnDocumentEnd.html'));
                     await Utils.sleep(2000);
                     this.controller.runJavaScript('getTestValue()', (error, result) => {
                       if (error) {
                         console.info('emitWebRunJavaScriptOnDocumentEnd002 getTestValue() return error: ' + error)
                       }
                       if (result) {
                         console.info('emitWebRunJavaScriptOnDocumentEnd002 getTestValue() return result: ' + result)
                         resultData = result;
                       }
                     })
                   } catch (error) {
                     console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                   }
                  await Utils.sleep(2000);
                  Utils.emitEvent(resultData,2025022102);
                  break;
              }
            }
         })
      }
      Web({ src: $rawfile('runJavaScriptOnDocumentEnd.html'), controller: this.controller })
        .javaScriptAccess(true)
        .domStorageAccess(true)
        .runJavaScriptOnDocumentEnd(this.scripts)
        .onPageEnd((event) => {
          if (event) {
           console.log('runJavaScriptOnDocumentEnd onPageEnd url:' + event.url);
           }
        })
        .width('100%')
        .height('100%')
    }
  }
}
