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
import webView from '@ohos.web.webview';
import { Entry, Component, Column, Row, Button, ClickEvent, Web,OnPageEndEvent,ScriptItem } from "@ohos.arkui.component"
import { State } from "@ohos.arkui.stateManagement" // should be insert by ui-plugins
import { BusinessError, RecordData } from '@ohos.base';
import Utils from '../../src/test/Util.test';
import events_emitter from '@ohos.events.emitter';
import emitter from '@ohos.events.emitter';
import { Callback, RecordData } from '@ohos.base'
import { UIContext, Router } from '@ohos.arkui.UIContext'

class StringFields {
  public str: string = '';
}

@Entry
@Component
struct WebJavaScriptOnDocumentStartTest {
  stringObj: StringFields  = new StringFields ();
  controller: webView.WebviewController = new webView.WebviewController(undefined);
  @State str: string = ""
  @State javaScriptAccess: boolean = true;
  @State pageEnd: string = "";
  @State switchCase: number = 0;
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
        Button("WebJavaScriptOnDocumentStartTest click")
          .key('WebJavaScriptOnDocumentStartTestButton')
          .onClick((): void => {
            console.info("key==>" +  this.stringObj.str)
            switch (this.stringObj.str) {

              case "testJavaScriptOnDocumentStart001": {
                try {
                  this.controller.runJavaScript("getResult()", (error, result) => {
                    if (error) {
                      console.info('getResult() return error: ' + error)
                    }
                    if (result) {
                      console.info('getResult() return result: ' + result)
                      Utils.emitEvent(result, 4500)
                    }
                  })
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }



              case 'SwitchNextPageStatic' : {
                let uiContext: UIContext = this.getUIContext();
                let router: Router = uiContext.getRouter();
                router.pushUrl({ url: 'pages/webtwo' })
                console.log('push URL success')
              }

            }
          })
      }

      Web({ src: 'resource://rawfile/javaScriptOnDocumentStart.html', controller: this.controller })
        .javaScriptAccess(true)
        .domStorageAccess(true)
        .javaScriptOnDocumentStart(this.scripts)
        .onPageEnd((event: OnPageEndEvent): void => {
          if (event) {
            console.log('url:' + event.url)
          }
        })
        .width('100%')
        .height('100%')
    }
  }
}
