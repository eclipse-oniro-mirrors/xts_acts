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

import webView from '@ohos.web.webview';
import Utils from '../../test/Utils';
import events_emitter from '@ohos.events.emitter';

@Entry
@Component
struct WebAttributeTest {
  controller: webView.WebviewController = new webView.WebviewController();
  @State str: string = ""
  @State testConsole: boolean = false

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
        try {
          this.controller.loadUrl("resource://rawfile/index.html");
        } catch (error) {
          console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
        }
      }
    }
  }

  build() {
    Row() {
      Column() {
        Button("web click")
          .key('WebAttributeTestButton')
          .focusable(true)
          .onClick(async () => {
            console.info("key==>" + this.str)
            switch (this.str) {
              case "emitOnConsole001": {
                try {
                  this.testConsole = true
                  this.controller.loadUrl("resource://rawfile/index.html");
                  await Utils.sleep(2000)
                  this.controller.runJavaScript("consoleTest()")
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitConsoleMessage001": {
                try {
                  this.testConsole = true
                  this.controller.loadUrl("resource://rawfile/index.html");
                  await Utils.sleep(2000)
                  this.controller.runJavaScript("consoleTest()")
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
            }
          })

        Web({ src: $rawfile('index.html'), controller: this.controller })
          .key('webView')
          .height('50%')
          .fileAccess(true)
          .width('100%')
          .javaScriptAccess(true)
          .horizontalScrollBarAccess(true)
          .verticalScrollBarAccess(true)
          .databaseAccess(true)
          .userAgent('Mozilla/5.0 (Windows NT 10.0; WOW64)')
          .onConsole((event) => {
            if (event) {
              if (this.testConsole) {
                Utils.emitEvent(event.message.getMessage(), 70040)
                Utils.emitEvent(event.message.getLineNumber(), 70042)
                Utils.emitEvent(event.message.getSourceId(), 70044)
                Utils.emitEvent(event.message.getMessageLevel(), 70046)
                this.testConsole = false
              }
            }
            return false
          })
      }
      .width('100%')
    }

    .height('100%')
  }
}