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
struct WebSslErrorTest {
  controller: webView.WebviewController = new webView.WebviewController();
  @State str: string = ""
  @State sslErrorType: number = -1

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
        Button("WebSslErrorTestButton").key('WebSslErrorTestButton').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "emitSslErrorDateInvalid": {
              this.controller.clearClientAuthenticationCache();
              this.controller.clearSslCache();
              await Utils.sleep(2000)
              this.controller.loadUrl('https://expired.badssl.com');
              await Utils.sleep(15000);
              Utils.emitEvent(Number(this.sslErrorType), 70892)
              break;
            }
            case "emitSslErrorUntrusted": {
              this.controller.loadUrl('https://untrusted-root.badssl.com/');
              await Utils.sleep(15000);
              Utils.emitEvent(Number(this.sslErrorType), 70893)
              break;
            }
          }
        })
      }

      Web({ src: $rawfile("index.html"), controller: this.controller })
        .javaScriptAccess(true)
        .geolocationAccess(true)
        .databaseAccess(true)
        .onSslErrorEventReceive((event) => {
          if (event) {
            console.log('onSslErrorEventReceive =====> event.error:' + event.error)
            this.sslErrorType = event.error
          }
        })
    }
  }
}
