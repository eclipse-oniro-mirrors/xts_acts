/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import {
  Entry,
  ScriptItem,
  $rawfile,
  Component,
  Column,
  Row,
  Button,
  ClickEvent,
  Web
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement' // should be insert by ui-plugins
import webView from '@ohos.web.webview'
import { BusinessError } from '@ohos.base';
import emitter from '@ohos.events.emitter';
import Utils from '../../src/test/Util.test';
import events_emitter from '@ohos.events.emitter';
import { Callback, RecordData } from '@ohos.base'

class StringFields {
  public str: string = '';
}

@Entry
@Component
struct WebRunJavaScriptOnHeadEndTest {
  stringObj: StringFields  = new StringFields ();
  controller: webView.WebviewController = new webView.WebviewController(undefined);
  @State emitKey: string = '';
  @State str: string = '';
  private jsStr: string = 'testValue = \'testValue\'';
  @State scripts: Array<ScriptItem> = new Array<ScriptItem>(
    { script: this.jsStr, scriptRules: ['*'] }
  );
  @State message: Array<string> = new Array<string>();
  @State isComplete: number = -1;
  private jsHead: string =
    'console.log("push new js on head called")';

  aboutToAppear() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack: Callback<events_emitter.EventData> = (eventData: events_emitter.EventData): void => {
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      const data = eventData.data as Record<string, RecordData>;
      if (data != null && data['ACTION'] != null) {
        let strValue: string = String(data['ACTION']);
        this.stringObj.str = strValue;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button('WebRunJavaScriptOnHeadEndTestButton click').key('WebRunJavaScriptOnHeadEndTestButton').onClick((e: ClickEvent) => {
          console.info('key==>' + this.stringObj.str)
          switch (this.stringObj.str) {
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
                })
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              setTimeout(() => {
                Utils.emitEvent(resultData,2025022103);
              }, 2000)
            }


          }
        })
      }
      Web({ src: 'resource://rawfile/runJavaScriptOnHeadEnd.html', controller: this.controller })
        .javaScriptAccess(true)
        .domStorageAccess(true)
        .runJavaScriptOnHeadEnd(this.scripts)
        .onPageEnd((event) => {
          if (event) {
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
