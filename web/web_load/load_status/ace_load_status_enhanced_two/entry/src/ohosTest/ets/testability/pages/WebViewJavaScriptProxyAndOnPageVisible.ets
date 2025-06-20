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
import { Driver, ON } from '@ohos.UiTest';

class TestObj {
  constructor() {
  }

  test(): string {
    return "ArkUI Web Component"
  }

  toString(): void {
    console.log('Web Component toString')
  }
}

@Entry
@Component
struct WebViewJavaScriptProxyAndOnPageVisible {
  testObj: TestObj = new TestObj()
  @State str: string = ""
  @State fileSelectorMode: number = 0
  @State sslErrorType: number = -1
  @State zoomCounts: number = 200
  @State fontSize: number = 28
  @State onPageVisibleCalled: boolean = false
  controller: webView.WebviewController = new webView.WebviewController();

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
        Button("web clicks").key('buttonJavaScriptProxyAndPageVisible').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "emitOnPageVisible": {
              this.onPageVisibleCalled = false
              await Utils.sleep(2000);
              this.controller.loadUrl("resource://rawfile/icon.html")
              break;
            }
          }
        })
      }

      Web({ src: $rawfile("indexThree.html"), controller: this.controller })
        .key("WebViewJavaScriptProxyAndOnPageVisibleWebView")
        .textZoomAtio(this.zoomCounts)
        .defaultFontSize(this.fontSize)
        .onShowFileSelector((event) => {
          console.log('onShowFileSelector =====>')
          if (event) {
            console.log('onShowFileSelector event.fileSelector.getMode() return:', event.fileSelector.getMode())
            let fileSelectorObj: FileSelectorParam = event.fileSelector
            this.fileSelectorMode = fileSelectorObj.getMode()
          }
          return true
        })
        .javaScriptProxy({
          object: this.testObj,
          name: "objName",
          methodList: ["test", "toString"],
          controller: this.controller,
        })
        .onPageVisible((event) => {
          console.log('onPageVisible url:' + event.url)
          if (!this.onPageVisibleCalled) {
            Utils.emitEvent(event.url + '', 1372)
            this.onPageVisibleCalled = true
          }
        })
        .onSslErrorEventReceive((event) => {
          if (event) {
            console.log('onSslErrorEventReceive =====> event.error:' + event.error)
            this.sslErrorType = event.error
          }
        })
        .overviewModeAccess(false)
    }
  }
}
