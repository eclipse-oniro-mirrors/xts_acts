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
struct WebRunJavaScriptOnHeadEndTest {
  controller: webView.WebviewController = new webView.WebviewController();
  @State emitKey: string = '';
  private jsStr: string = "testValue = 'testValue'";
  @State scripts: Array<ScriptItem> = [
     { script: this.jsStr, scriptRules: ['*'] }
  ];
  @State message: Array<string> = [];
  @State isComplete: number = -1;
  private jsHead: string =
    'console.log("push new js on head called")';
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 173160,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(173160)
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
        Button('WebRunJavaScriptOnHeadEndTestButton click')
          .key('WebRunJavaScriptOnHeadEndTestButton')
          .onClick(async () => {
          await waitForExist(() => this.isPageEnd, this.emitKey, 0);
          await waitForExist(() => this.isReceive, this.emitKey, 0);
          this.isReceive = -1;
            console.info('key==>' + this.emitKey)
            switch (this.emitKey) {
              case 'emitWebRunJavaScriptOnHeadEnd001': {
                let resultData = '';
                try {
                  this.controller.runJavaScript('getTestValue()', (error, result) => {
                    if (error) {
                      console.info('emitWebRunJavaScriptOnHeadEnd001 getTestValue() return error: ' + error)
                    }
                    if (result) {
                      console.info('emitWebRunJavaScriptOnHeadEnd001 getTestValue() return result: ' + result)
                      resultData = result;
                    }
                  });
                   resultData = await waitForExist(() => resultData, 'emitWebRunJavaScriptOnHeadEnd001', null);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                Utils.emitEvent(resultData,173170);
                break;
              }
              case 'emitWebRunJavaScriptOnHeadEnd002': {
                 let resultData = '';
                 let jsString = "window.document.getElementById('result').innerHTML = 'runJavaScriptOnHeadEnd'";
                 this.scripts = [
                       { script: jsString, scriptRules: ['*'] }
                    ];
                 try {
                  this.isPageEnd = -1;
                   this.controller.loadUrl($rawfile('runJavaScriptOnHeadEnd.html'));
                   await waitForExist(() => this.isPageEnd, this.emitKey, 0);
                   this.controller.runJavaScript('getResult()', (error, result) => {
                     if (error) {
                       console.info('emitWebRunJavaScriptOnHeadEnd002 getResult() return error: ' + error)
                     }
                     if (result) {
                       console.info('emitWebRunJavaScriptOnHeadEnd002 getResult() return result: ' + result)
                       resultData = result;
                     }
                   });
                   resultData = await waitForExist(() => resultData, 'emitWebRunJavaScriptOnHeadEnd002', null);
                 } catch (error) {
                   console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                 }
                 Utils.emitEvent(resultData,173180);
                 break;
              }
              case 'emitWebRunJavaScriptOnHeadEnd003': {
                   let resultData = '';
                   this.scripts = [
                         { script: "testValue = 'testValue2'", scriptRules: ['*'] },
                         { script: "testValue = 'testValue1'", scriptRules: ['*'] }
                      ];
                   try {
                     this.isPageEnd = -1;
                     this.controller.loadUrl($rawfile('runJavaScriptOnHeadEnd.html'));
                     await waitForExist(() => this.isPageEnd, this.emitKey, 0);
                      this.isPageEnd = -1;
                      this.controller.refresh();
                      await waitForExist(() => this.isPageEnd, this.emitKey, 0);
                     this.controller.runJavaScript('getTestValue()', (error, result) => {
                       if (error) {
                         console.info('emitWebRunJavaScriptOnHeadEnd003 getTestValue() return error: ' + error)
                       }
                       if (result) {
                         console.info('emitWebRunJavaScriptOnHeadEnd003 getTestValue() return result: ' + result)
                         resultData = result;
                       }
                     });
                     resultData = await waitForExist(() => resultData, 'emitWebRunJavaScriptOnHeadEnd003', null);
                   } catch (error) {
                     console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                   }
                   Utils.emitEvent(resultData,173190);
                   break;
              }
              case 'emitWebRunJavaScriptOnHeadEnd004': {
                try {
                  await waitForExist(()=>this.isComplete, this.emitKey, 0);
                  let check = (v1:Array<string>, v2:boolean): boolean => {
                    return v1.includes('push new js on head called')
                  }
                  await waitForAssert(()=>this.message, check, true, 173200, this.emitKey);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
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
        .onControllerAttached(() => {
          this.scripts.push({ script: this.jsHead, scriptRules: ['*'] });
          console.log('runJavaScriptOnHeadEnd scripts==>' + JSON.stringify(this.scripts));
        })
        .onPageEnd((event) => {
          if (event) {
           this.isPageEnd = 0;
           this.isComplete = 0;
           console.log('runJavaScriptOnHeadEnd isComplete==>'+this.isComplete);
           console.log('runJavaScriptOnHeadEnd onPageEnd url:' + event.url);
           }
        })
        .onConsole((event) => {
          if (event) {
            let msg = event.message.getMessage();
            this.message.push(msg);
            console.log('runJavaScriptOnHeadEnd message===>' + this.message);
          }
          return false
        })
        .width('100%')
        .height('100%')
    }
  }
}
