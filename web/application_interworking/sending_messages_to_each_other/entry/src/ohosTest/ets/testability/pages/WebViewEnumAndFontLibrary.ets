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
import business_error, { BusinessError } from '@ohos.base';


@Entry
@Component
struct WebViewEnumAndFontLibrary {
  controller: webView.WebviewController = new webView.WebviewController();
  @State str: string = ""
  @State count: string = ""
  @State javaScriptAccess: boolean = true
  @State databaseAccess: boolean = true

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
        Button("web click").key('buttonEnumAndFontLibrary').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "emitMessageLevelDebug": {
              this.controller.runJavaScript("getMessageLevelDebug()")
              await Utils.sleep(2000);
              Utils.emitEvent(this.count.toString(), 601)
              break;
            }
            case "emitMessageLevelInfo": {
              this.controller.runJavaScript("getMessageLevelInfo()")
              await Utils.sleep(2000);
              Utils.emitEvent(this.count.toString(), 602)
              break;
            }
            case "emitMessageLevelWarn": {
              this.controller.runJavaScript("getMessageLevelWarn()")
              await Utils.sleep(2000);
              Utils.emitEvent(this.count.toString(), 603)
              break;
            }
            case "emitMessageLevelError": {
              this.controller.runJavaScript("getMessageLevelError()")
              await Utils.sleep(2000);
              Utils.emitEvent(this.count.toString(), 604)
              break;
            }
            case "emitMessageLevelLog": {
              this.controller.runJavaScript("getMessageLevelLog()")
              await Utils.sleep(2000);
              Utils.emitEvent(this.count.toString(), 605)
              break;
            }
          }
        })
      }

      Web({ src: $rawfile("indexJru.html"), controller: this.controller })
        .key("webCenter")
        .onConsole((event) => {
          if (event) {
            console.log('getMessage:' + event.message?.getMessage())
            console.log('getSourceId:' + event.message?.getSourceId())
            console.log('getLineNumber:' + event.message?.getLineNumber())
            console.log('getMessageLevel:' + event.message?.getMessageLevel())
            this.count = event.message.getMessageLevel().toString()
            console.log("mixed>>>:", event.message.getMessage(), event.message.getMessageLevel())
          }
          return false
        })
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(true)
        .imageAccess(true)
        .domStorageAccess(false)
        .onlineImageAccess(false)
        .databaseAccess(this.databaseAccess)
    }
  }
}
