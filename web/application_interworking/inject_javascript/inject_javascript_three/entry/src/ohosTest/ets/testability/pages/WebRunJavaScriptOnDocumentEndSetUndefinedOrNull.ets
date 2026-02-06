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
struct WebRunJavaScriptOnDocumentEndSetUndefinedOrNull {
  controller: webView.WebviewController = new webView.WebviewController();
  @State scripts: Array<ScriptItem>|null|undefined = null
  @State emitKey: string = '';
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 2511251,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(2511251)
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
        Button('RunJavaScriptOnDocumentEndSetUndefinedOrNull')
          .key('RunJavaScriptOnDocumentEndSetUndefinedOrNull')
          .onClick(async () => {
            await waitForExist(() => this.isPageEnd, 'RunJavaScriptOnDocumentEndSetUndefined_isPageEnd', 0);
            await waitForExist(() => this.isReceive, 'RunJavaScriptOnDocumentEndSetUndefined_isReceive', 0);
            this.isReceive = -1;
            console.info('key==>' + this.emitKey)
            switch (this.emitKey) {
              case 'testRunJavaScriptOnDocumentEndSetUndefined': {
                try {
                  this.isPageEnd = -1
                  this.scripts = [{ script: "window.document.getElementById('result').innerHTML = 'SetUndefined'", scriptRules: ['*'] }]
                  this.controller.refresh()
                  await waitForExist(() => this.isPageEnd, 'testRunJavaScriptOnDocumentEndSetUndefined1_isPageEnd', 0);
                  let resultOne:string = 'resultOne'
                  this.controller.runJavaScript('getResult()', (error, result) => {
                    if (error) {
                      console.info('testRunJavaScriptOnDocumentEndSetUndefined1 getResult() return error: ' + error);
                      resultOne = String(error.code)
                    }
                    if (result) {
                      console.info('testRunJavaScriptOnDocumentEndSetUndefined1 getResult() return result: ' + result);
                      resultOne = result
                    }
                  });
                  resultOne = await waitForExist(() => resultOne, 'testRunJavaScriptOnDocumentEndSetUndefined1', '"SetUndefined"');
                  this.isPageEnd = -1
                  this.scripts = undefined
                  this.controller.refresh()
                  await waitForExist(() => this.isPageEnd, 'testRunJavaScriptOnDocumentEndSetUndefined2_isPageEnd', 0);
                  let resultTwo:string = 'resultTwo'
                  this.controller.runJavaScript('getResult()', (error, result) => {
                    if (error) {
                      console.info('testRunJavaScriptOnDocumentEndSetUndefined2 getResult() return error: ' + error);
                      resultTwo = String(error.code)
                    }
                    if (result) {
                      console.info('testRunJavaScriptOnDocumentEndSetUndefined2 getResult() return result: ' + result);
                      resultTwo = result
                    }
                  });
                  resultTwo = await waitForExist(() => resultTwo, 'testRunJavaScriptOnDocumentEndSetUndefined2', '"test msg"');
                  if (resultOne === '"SetUndefined"' &&  resultTwo === '"test msg"') {
                    Utils.emitEvent(resultTwo,25112511)
                  } else {
                    Utils.emitEvent(resultOne,25112511)
                  }

                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(error.code,25112511);
                }
                break;
              }
              case 'testRunJavaScriptOnDocumentEndSetNull': {
                try {
                  this.isPageEnd = -1
                  this.scripts = [{ script: "window.document.getElementById('result').innerHTML = 'SetNull'", scriptRules: ['*'] }]
                  this.controller.refresh()
                  await waitForExist(() => this.isPageEnd, 'testRunJavaScriptOnDocumentEndSetNull1_isPageEnd', 0);
                  let resultOne:string = 'resultOne'
                  this.controller.runJavaScript('getResult()', (error, result) => {
                    if (error) {
                      console.info('testRunJavaScriptOnDocumentEndSetNull1 getResult() return error: ' + error);
                      resultOne = String(error.code)
                    }
                    if (result) {
                      console.info('testRunJavaScriptOnDocumentEndSetNull1 getResult() return result: ' + result);
                      resultOne = result
                    }
                  });
                  resultOne = await waitForExist(() => resultOne, 'testRunJavaScriptOnDocumentEndSetNull1', '"SetNull"');
                  this.isPageEnd = -1
                  this.scripts = null
                  this.controller.refresh()
                  await waitForExist(() => this.isPageEnd, 'testRunJavaScriptOnDocumentEndSetNull2_isPageEnd', 0);
                  let resultTwo:string = 'resultTwo'
                  this.controller.runJavaScript('getResult()', (error, result) => {
                    if (error) {
                      console.info('testRunJavaScriptOnDocumentEndSetNull2 getResult() return error: ' + error);
                      resultTwo = String(error.code)
                    }
                    if (result) {
                      console.info('testRunJavaScriptOnDocumentEndSetNull2 getResult() return result: ' + result);
                      resultTwo = result
                    }
                  });
                  resultTwo = await waitForExist(() => resultTwo, 'testRunJavaScriptOnDocumentEndSetNull2', '"test msg"');
                  if (resultOne === '"SetNull"' &&  resultTwo === '"test msg"') {
                    Utils.emitEvent(resultTwo,25112512)
                  } else {
                    Utils.emitEvent(resultOne,25112512)
                  }

                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(error.code,25112512);
                }
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
            this.isPageEnd = 0;
            console.log('runJavaScriptOnDocumentEnd onPageEnd url:' + event.url);
           }
        })
        .onConsole((event) => {
          if (event) {
            console.log('runJavaScriptOnDocumentEnd message===>' + event.message.getMessage());
          }
          return false
        })
        .width('100%')
        .height('100%')
    }
  }
}
