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
import { ScriptItem } from '@ohos.arkui.component'
import { UIContext, Router } from '@ohos.arkui.UIContext'
class StringFields {
  public str: string = 'emitWebRunJavaScriptOnDocumentEnd001';
}
@Entry
@Component
struct WebRunJavaScriptOnDocumentEndTest {
  stringObj: StringFields  = new StringFields ();
  controller: webView.WebviewController = new webView.WebviewController(undefined);
  @State str: string = '';
  private jsStr: string =
    'window.document.getElementById(\'result\').innerHTML = \'runJavaScriptOnDocumentEnd\'';
  //@State scripts: Array<ScriptItem> = new Array<ScriptItem>(
  //  { script: this.jsStr, scriptRules: ['*'] }
  //);
  @State scripts: Array<ScriptItem> = [
    { script: this.jsStr, scriptRules: ['*'] }
  ] as Array<ScriptItem>;
  @State message: Array<string> = new Array<string>();
  private jsEnd: string =
    'console.log("push new js on run end called")';

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
        Button('WebRunJavaScriptOnDocumentEndTestButton click').key('WebRunJavaScriptOnDocumentEndTestButton').onClick((e: ClickEvent) => {
          console.info('key==>' + this.stringObj.str)
          switch (this.stringObj.str) {

            case 'emitWebRunJavaScriptOnDocumentEnd001': {
              let resultData = '';
              try {
                console.info('key==>test 001')
                this.controller.runJavaScript('getResult()', (error, result) => {
                  if (error) {
                    console.info('emitWebRunJavaScriptOnDocumentEnd001 getResult() return error: ' + error);
                  }
                  if (result) {
                    console.info('emitWebRunJavaScriptOnDocumentEnd001 getResult() return result: ' + result);
                    resultData = result;
                  }
                  setTimeout(() => {
                    Utils.emitEvent(resultData,2025022101);
                  }, 2000)
                })
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case 'SwitchNextPageStatic' : {
              console.info('key==>test SwitchNextPageStatic')
              let uiContext: UIContext = this.getUIContext();
              let router: Router = uiContext.getRouter();
              router.pushUrl({ url: 'pages/WebRunJavaScriptOnHeadEndTest' })
              console.log('push URL success')
              break;
            }

          }
        })
      }
      Web({ src: 'resource://rawfile/runJavaScriptOnDocumentEnd.html', controller: this.controller })
        .javaScriptAccess(true)
        .domStorageAccess(true)
        .runJavaScriptOnDocumentEnd(this.scripts)

        .onConsole((event) => {
          if (event) {
            let msg = event.message.getMessage();
            this.message.push(msg);
            console.log('runJavaScriptOnDocumentEnd message===>' + this.message);
          }
          return false
        })
        .width('100%')
        .height('100%')
    }
  }
}
