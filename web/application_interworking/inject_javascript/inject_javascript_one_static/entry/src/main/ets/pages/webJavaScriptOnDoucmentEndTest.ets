/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import webView from '@ohos.web.webview';
import { Entry, Component, Column, Row, Button, ClickEvent, Web,OnPageEndEvent,ScriptItem } from "@ohos.arkui.component"
import { State } from "@ohos.arkui.stateManagement" // should be insert by ui-plugins
import { BusinessError, RecordData } from '@ohos.base';
import Utils from '../../src/test/Util.test';
import events_emitter from '@ohos.events.emitter';
import emitter from '@ohos.events.emitter';
import { Callback, RecordData } from '@ohos.base'
import { UIContext, Router } from '@ohos.arkui.UIContext'

export class StringFields {
  public str: string = '';
}

function checkResult(result: Array<string>): Boolean{
  return result.includes('push new js on end called');
}

@Entry
@Component
struct WebJavaScriptOnDocumentEndTest {
  stringObj: StringFields  = new StringFields ();
  controller: webView.WebviewController = new webView.WebviewController(undefined);
  @State str: string = ""
  @State javaScriptAccess: boolean = true;
  @State pageEnd: string = "";
  @State switchCase: number = 0;
  @State message: Array<string> = [] as Array<string>;
  private jsEnd: string =
    'console.log("push new js on end called")';
  @State scripts: Array<ScriptItem> = [
    { script: "if (typeof(Storage) !== 'undefined') {" +
      "   localStorage.setItem('color', 'Red');" +
      '}', scriptRules: ['*'] }
  ] as Array<ScriptItem>;

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
        Button("WebJavaScriptOnDocumentEndTest click")
          .key('WebJavaScriptOnDocumentEndTestButton')
          .onClick((): void => {
            console.info("key==>" +  this.stringObj.str)
            switch (this.stringObj.str) {

              case "testJavaScriptOnDocumentEnd001": {
                try {
                  this.controller.runJavaScript("getResult()", (error, result) => {
                    if (error) {
                      console.info('getResult() return error: ' + error)
                    }
                    if (result) {
                      console.info('testJavaScriptOnDocumentEnd001 getResult() return result: ' + result)
                      Utils.emitEvent(result, 202603201)
                    }
                  })
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testJavaScriptOnDocumentEnd002": {
                try {
                  this.scripts = [
                    { script: "if (typeof(Storage) !== 'undefined') {" +
                      "   localStorage.setItem('color', 'Blue');" +
                      "}", scriptRules: ["123"] }
                  ];
                  this.controller.loadUrl("resource://rawfile//javaScriptOnDocumentStart.html");
                  this.controller.runJavaScript("getResult()", (error, result) => {
                    if (error) {
                      console.info('getResult() return error: ' + error)
                    }
                    if (result) {
                      console.info('getResult() return result: ' + result)
                      Utils.emitEvent(result, 202603202)
                    }
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testJavaScriptOnDocumentEnd003": {
                Utils.emitEvent(checkResult(this.message), 202603203)
                break;
              }

              case 'SwitchNextPageStatic' : {
                let uiContext: UIContext = this.getUIContext();
                let router: Router = uiContext.getRouter();
                router.pushUrl({ url: 'pages/webJavaScriptOnDocumentStartUndefinedTest' })
                console.log('push URL success')
              }

            }
          })
      }

      Web({ src: 'resource://rawfile/javaScriptOnDocumentStart.html', controller: this.controller })
        .javaScriptAccess(true)
        .domStorageAccess(true)
        .javaScriptOnDocumentEnd(this.scripts)
        .onControllerAttached(() => {
          this.scripts.push({ script: this.jsEnd, scriptRules: ['*'] });
          console.log('javaScriptOnDocumentEnd scripts==>' + JSON.stringify(this.scripts));
        })
        .onPageEnd((event: OnPageEndEvent): void => {
          if (event) {
            console.log('url:' + event.url)
          }
        })
        .onConsole((event) => {
          if (event) {
            let msg = event.message.getMessage();
            this.message.push(msg);
            console.log('javaScriptOnDocumentEnd message===>' + this.message);
          }
          return false
        })
        .width('100%')
        .height('100%')
    }
  }
}
