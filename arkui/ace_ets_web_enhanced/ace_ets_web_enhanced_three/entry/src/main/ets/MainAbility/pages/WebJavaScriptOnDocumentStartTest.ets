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
struct WebJavaScriptOnDocumentStartTest {
  controller: webView.WebviewController = new webView.WebviewController();
  @State str: string = ""
  @State javaScriptAccess: boolean = true;
  @State pageEnd: string = "";
  @State switchCase: number = 0;
  @State scripts: Array<ScriptItem> = [
    { script: "if (typeof(Storage) !== 'undefined') {" +
    "   localStorage.setItem('color', 'Red');" +
    "}", scriptRules: ["*"] }
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
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("WebJavaScriptOnDocumentStartTest click")
          .key('WebJavaScriptOnDocumentStartTestButton')
          .onClick(async () => {
            console.info("key==>" + this.str)
            switch (this.str) {

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
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testJavaScriptOnDocumentStart002": {
                try {
                  this.scripts = [
                    { script: "if (typeof(Storage) !== 'undefined') {" +
                    "   localStorage.setItem('color', 'Blue');" +
                    "}", scriptRules: ["123"] }
                  ];
                  this.controller.loadUrl($rawfile('javaScriptOnDocumentStart.html'))
                  await Utils.sleep(2000)
                  this.controller.runJavaScript("getResult()", (error, result) => {
                    if (error) {
                      console.info('getResult() return error: ' + error)
                    }
                    if (result) {
                      console.info('getResult() return result: ' + result)
                      Utils.emitEvent(result, 4501)
                    }
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

            }
          })
      }

      Web({ src: $rawfile('javaScriptOnDocumentStart.html'), controller: this.controller })
        .javaScriptAccess(true)
        .domStorageAccess(true)
        .backgroundColor(Color.Grey)
        .javaScriptOnDocumentStart(this.scripts)
        .onPageEnd((event) => {
          if (event) {
            console.log('url:' + event.url)
          }
        })
        .width('100%')
        .height('100%')
    }
  }
}
