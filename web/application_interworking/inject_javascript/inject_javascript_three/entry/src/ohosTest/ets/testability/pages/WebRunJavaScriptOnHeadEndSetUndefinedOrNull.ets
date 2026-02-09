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
struct WebRunJavaScriptOnHeadEndSetUndefinedOrNull {
  controller: webView.WebviewController = new webView.WebviewController();
  @State scripts: Array<ScriptItem>|null|undefined = null
  @State emitKey: string = '';
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 2511253,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(2511253)
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
        Button('RunJavaScriptOnHeadEndSetUndefinedOrNull')
          .key('RunJavaScriptOnHeadEndSetUndefinedOrNull')
          .onClick(async () => {
            await waitForExist(() => this.isReceive, 'RunJavaScriptOnHeadEndSetUndefinedOrNull_isReceive', 0);
            await waitForExist(() => this.isPageEnd, 'RunJavaScriptOnHeadEndSetUndefinedOrNull_isPageEnd', 0);
            this.isReceive = -1;
            console.info('key==>' + this.emitKey)
            switch (this.emitKey) {
              case 'testRunJavaScriptOnHeadEndSetUndefined': {
                try {
                  this.isPageEnd = -1
                  this.scripts = [{ script: "testValue = 'SetUndefined'", scriptRules: ['*'] }]
                  this.controller.refresh()
                  await waitForExist(() => this.isPageEnd, 'testRunJavaScriptOnHeadEndSetUndefined1_isPageEnd', 0);
                  let resultOne:string = 'resultOne'
                  this.controller.runJavaScript('getTestValue()', (error, result) => {
                    if (error) {
                      console.info('testRunJavaScriptOnHeadEndSetUndefined1 getTestValue() return error: ' + error)
                      resultOne = String(error.code)
                    }
                    if (result) {
                      console.info('testRunJavaScriptOnHeadEndSetUndefined1 getTestValue() return result: ' + result)
                      resultOne = result
                    }
                  });
                  resultOne = await waitForExist(() => resultOne, 'testRunJavaScriptOnHeadEndSetUndefined1', '"SetUndefined"');
                  this.isPageEnd = -1
                  this.scripts = undefined
                  this.controller.refresh()
                  await waitForExist(() => this.isPageEnd, 'testRunJavaScriptOnHeadEndSetUndefined2_isPageEnd', 0);
                  let resultTwo:string = 'resultTwo'
                  this.controller.runJavaScript('getTestValue()', (error, result) => {
                    if (error) {
                      console.info('testRunJavaScriptOnHeadEndSetUndefined2 getTestValue() return error: ' + error)
                      resultTwo = String(error.code)
                    }
                    if (result) {
                      console.info('testRunJavaScriptOnHeadEndSetUndefined2 getTestValue() return result: ' + result)
                      resultTwo = result
                    }
                  });
                  resultTwo = await waitForExist(() => resultTwo, 'testRunJavaScriptOnHeadEndSetUndefined2', '"msg"');
                  if (resultOne === '"SetUndefined"' &&  resultTwo === '"msg"') {
                    Utils.emitEvent(resultTwo,25112531)
                  } else {
                    Utils.emitEvent(resultOne,25112531)
                  }
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(error.code,25112531);
                }
                break;
              }
              case 'testRunJavaScriptOnHeadEndSetNull': {
                try {
                  this.isPageEnd = -1
                  this.scripts = [{ script: "testValue = 'SetNull'", scriptRules: ['*'] }]
                  this.controller.refresh()
                  await waitForExist(() => this.isPageEnd, 'testRunJavaScriptOnHeadEndSetNull1_isPageEnd', 0);
                  let resultOne:string = 'resultOne'
                  this.controller.runJavaScript('getTestValue()', (error, result) => {
                    if (error) {
                      console.info('testRunJavaScriptOnHeadEndSetNull1 getTestValue() return error: ' + error)
                      resultOne = String(error.code)
                    }
                    if (result) {
                      console.info('testRunJavaScriptOnHeadEndSetNull1 getTestValue() return result: ' + result)
                      resultOne = result
                    }
                  });
                  resultOne = await waitForExist(() => resultOne, 'testRunJavaScriptOnHeadEndSetNull1', '"SetNull"');
                  this.isPageEnd = -1
                  this.scripts = undefined
                  this.controller.refresh()
                  await waitForExist(() => this.isPageEnd, 'testRunJavaScriptOnHeadEndSetNull2_isPageEnd', 0);
                  let resultTwo:string = 'resultTwo'
                  this.controller.runJavaScript('getTestValue()', (error, result) => {
                    if (error) {
                      console.info('testRunJavaScriptOnHeadEndSetNull2 getTestValue() return error: ' + error)
                      resultTwo = String(error.code)
                    }
                    if (result) {
                      console.info('testRunJavaScriptOnHeadEndSetNull2 getTestValue() return result: ' + result)
                      resultTwo = result
                    }
                  });
                  resultTwo = await waitForExist(() => resultTwo, 'testRunJavaScriptOnHeadEndSetNull2', '"msg"');
                  if (resultOne === '"SetNull"' &&  resultTwo === '"msg"') {
                    Utils.emitEvent(resultTwo,25112532)
                  } else {
                    Utils.emitEvent(resultOne,25112532)
                  }
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(error.code,25112532);
                }
                break;
              }

            }
         })
      }
      Web({ src: $rawfile('runJavaScriptOnHeadEnd.html'), controller: this.controller })
        .javaScriptAccess(true)
        .domStorageAccess(true)
        .runJavaScriptOnHeadEnd(this.scripts)
        .onPageEnd((event) => {
          if (event) {
            this.isPageEnd = 0;
            console.log('runJavaScriptOnHeadEnd onPageEnd url:' + event.url);
           }
        })
        .onConsole((event) => {
          if (event) {
            console.log('runJavaScriptOnHeadEnd message===>' + event.message.getMessage());
          }
          return false
        })
        .width('100%')
        .height('100%')
    }
  }
}
