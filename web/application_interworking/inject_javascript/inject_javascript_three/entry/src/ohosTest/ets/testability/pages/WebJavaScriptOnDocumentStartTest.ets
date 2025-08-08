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
struct WebJavaScriptOnDocumentStartTest {
  controller: webView.WebviewController = new webView.WebviewController();
  @State emitKey: string = '';
  private jsStr: string =
  "window.document.getElementById('result').innerHTML = 'javaScriptOnDocumentStart'";
  @State scripts: Array<ScriptItem> = [
     { script: this.jsStr, scriptRules: ['*'] }
  ];
  @State message: Array<string> = [];
  @State isComplete: number = -1;
  private jsStart: string =
    'console.log("push new js on start called")';

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
        Button('WebJavaScriptOnDocumentStartTestButton click')
          .key('WebJavaScriptOnDocumentStartTestButton')
          .onClick(async () => {
            await Utils.sleep(2000);
            console.info('key==>' + this.emitKey)
            switch (this.emitKey) {
              case 'emitWebJavaScriptOnDocumentStart001': {
                try {
                  await waitForExist(()=>this.isComplete, this.emitKey, 0);
                  let check = (v1:Array<string>, v2:boolean): boolean => {
                    return v1.includes('push new js on start called')
                  }
                  await waitForAssert(()=>this.message, check, true, 2025040804, this.emitKey);
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
        .onControllerAttached(() => {
          this.scripts.push({ script: this.jsStart, scriptRules: ['*'] });
          console.log('javaScriptOnDocumentStart scripts==>' + JSON.stringify(this.scripts));
        })
        .onPageEnd((event) => {
          if (event) {
            this.isComplete = 0;
            console.log('javaScriptOnDocumentStart isComplete==>'+this.isComplete);
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
