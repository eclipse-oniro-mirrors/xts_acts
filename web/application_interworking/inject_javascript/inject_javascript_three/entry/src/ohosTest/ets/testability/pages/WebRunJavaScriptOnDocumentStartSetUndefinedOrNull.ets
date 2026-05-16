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
struct WebRunJavaScriptOnDocumentStartSetUndefinedOrNull {
  controller: webView.WebviewController = new webView.WebviewController();
  @State scripts: Array<ScriptItem>|null|undefined = null
  @State emitKey: string = '';
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 2511252,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(2511252)
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
        Button('RunJavaScriptOnDocumentStartSetUndefinedOrNull')
          .key('RunJavaScriptOnDocumentStartSetUndefinedOrNull')
          .onClick(async () => {
            await waitForExist(() => this.isReceive, 'RunJavaScriptOnDocumentStartSetUndefinedOrNull_isReceive', 0);
            await waitForExist(() => this.isPageEnd, 'RunJavaScriptOnDocumentStartSetUndefinedOrNull_isPageEnd', 0);
            console.info('key==>' + this.emitKey)
            this.isReceive = -1;
            switch (this.emitKey) {
              case 'testRunJavaScriptOnDocumentStartSetUndefined': {
                try {
                  this.isPageEnd = -1
                  this.scripts = [{ script: "if (typeof(Storage) !== 'undefined') {" +
                                       "   localStorage.setItem('color', 'SetUndefined');" +
                                       '}', scriptRules: ['*'] }]
                  this.controller.refresh()
                  await waitForExist(() => this.isPageEnd, 'testRunJavaScriptOnDocumentStartSetUndefined1_isPageEnd', 0);
                  let resultOne:string = 'resultOne'
                  this.controller.runJavaScript('getResult()', (error, result) => {
                    if (error) {
                      console.info('testRunJavaScriptOnDocumentStartSetUndefined1 getResult() return error: ' + error);
                      resultOne = String(error.code)
                    }
                    if (result) {
                      console.info('testRunJavaScriptOnDocumentStartSetUndefined1 getResult() return result: ' + result);
                      resultOne = result
                    }
                  });
                  resultOne = await waitForExist(() => resultOne, 'testRunJavaScriptOnDocumentStartSetUndefined1', '"SetUndefined"');
                  this.isPageEnd = -1
                  this.scripts = undefined
                  this.controller.refresh()
                  await waitForExist(() => this.isPageEnd, 'testRunJavaScriptOnDocumentStartSetUndefined2_isPageEnd', 0);
                  let resultTwo:string = 'resultTwo'
                  this.controller.runJavaScript('getResult()', (error, result) => {
                    if (error) {
                      console.info('testRunJavaScriptOnDocumentStartSetUndefined2 getResult() return error: ' + error);
                      resultTwo = String(error.code)
                    }
                    if (result) {
                      console.info('testRunJavaScriptOnDocumentStartSetUndefined2 getResult() return result: ' + result);
                      resultTwo = result
                    }
                  });
                  resultTwo = await waitForExist(() => resultTwo, 'testRunJavaScriptOnDocumentStartSetUndefined2', '""');
                  if (resultOne === '"SetUndefined"' &&  resultTwo === '""') {
                    Utils.emitEvent(resultTwo,25112521)
                  } else {
                    Utils.emitEvent(resultOne,25112521)
                  }

                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(error.code,25112521);
                }
                break;
              }
              case 'testRunJavaScriptOnDocumentStartSetNull': {
                try {
                  this.isPageEnd = -1
                  this.scripts = [{ script: "if (typeof(Storage) !== 'undefined') {" +
                                       "   localStorage.setItem('color', 'SetNull');" +
                                       '}', scriptRules: ['*'] }]
                  this.controller.refresh()
                  await waitForExist(() => this.isPageEnd, 'testRunJavaScriptOnDocumentStartSetNull1_isPageEnd', 0);
                  let resultOne:string = 'resultOne'
                  this.controller.runJavaScript('getResult()', (error, result) => {
                    if (error) {
                      console.info('testRunJavaScriptOnDocumentStartSetNull1 getResult() return error: ' + error);
                      resultOne = String(error.code)
                    }
                    if (result) {
                      console.info('testRunJavaScriptOnDocumentStartSetNull1 getResult() return result: ' + result);
                      resultOne = result
                    }
                  });
                  resultOne = await waitForExist(() => resultOne, 'testRunJavaScriptOnDocumentStartSetNull1', '"SetNull"');
                  this.isPageEnd = -1
                  this.scripts = null
                  this.controller.refresh()
                  await waitForExist(() => this.isPageEnd, 'testRunJavaScriptOnDocumentStartSetNull2_isPageEnd', 0);
                  let resultTwo:string = 'resultTwo'
                  this.controller.runJavaScript('getResult()', (error, result) => {
                    if (error) {
                      console.info('testRunJavaScriptOnDocumentStartSetNull2 getResult() return error: ' + error);
                      resultTwo = String(error.code)
                    }
                    if (result) {
                      console.info('testRunJavaScriptOnDocumentStartSetNull2 getResult() return result: ' + result);
                      resultTwo = result
                    }
                  });
                  resultTwo = await waitForExist(() => resultTwo, 'testRunJavaScriptOnDocumentStartSetNull2', '""');
                  if (resultOne === '"SetNull"' &&  resultTwo === '""') {
                    Utils.emitEvent(resultTwo,25112522)
                  } else {
                    Utils.emitEvent(resultOne,25112522)
                  }

                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(error.code,25112522);
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
           console.log('runJavaScriptOnDocumentStart onPageBegin url:' + event.url);
          }
        })
        .onPageEnd((event) => {
          if (event) {
           this.isPageEnd = 0;
           console.log('runJavaScriptOnDocumentStart onPageEnd url:' + event.url);
          }
        })
        .onConsole((event) => {
          if (event) {
            console.log('runJavaScriptOnDocumentStart message===>' + event.message.getMessage());
          }
          return false
        })
        .width('100%')
        .height('100%')
    }
  }
}
