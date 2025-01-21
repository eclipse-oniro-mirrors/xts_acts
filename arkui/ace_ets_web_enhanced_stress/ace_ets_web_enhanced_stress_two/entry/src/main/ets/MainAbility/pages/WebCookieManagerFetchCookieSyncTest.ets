/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import { JsProxyObject } from '../../test/Interfaces.d';
import events_emitter from '@ohos.events.emitter';

@Entry
@Component
struct WebCookieManagerFetchCookieSyncTest {
  controller: webView.WebviewController = new webView.WebviewController();
  nativePort: webView.WebMessagePort | null = null;
  message: webView.WebMessageExt = new webView.WebMessageExt();
  @State str: string = ""
  @State buttonKey: string = '';
  @State stressTimes: number = 0;
  @State successTimes: number = 0;
  @State testing: boolean = false;
  @State callBackId: number = 0;
  @State javaScriptAccess: boolean = true;
  @State databaseAccess: boolean = true;

  onPageShow() {
    Utils.registerEventPage((eventData: events_emitter.EventData) => {
      if (eventData.data) {
        this.str = eventData.data.CASE_NAME;
        this.callBackId = eventData.data.CALL_BACK_ID;
        this.stressTimes = eventData.data.STRESS_TIMES;
        this.buttonKey = eventData.data.BUTTON_KEY
      }
    })
  }

  onPageHide() {
    Utils.unRegisterEventPage()
  }

  private jsObj: JsProxyObject = {
    test: (res: object) => {
      console.info("ets test:" + String(res));
    },
    toString: (str: string) => {
      console.info("ets toString:" + String(str));
    },
    register: (res: object) => {
      console.info("register toString:" + String(res));
      return "web222"
    }
  }

  build() {
    Row() {
      Column() {
        Button(this.buttonKey)
          .key(this.buttonKey)
          .onClick(async () => {
            console.info("key==>" + this.str)
            switch (this.str) {

              case "testWebCookieManagerFetchCookieSync001": {
                for (let i = 0; i < this.stressTimes; i++) {
                  webView.WebCookieManager.fetchCookieSync('https://www.example.com');
                  Utils.stressingLog('WebCookieManager.fetchCookieSync()', i + 1, this.stressTimes)
                }
                Utils.emitEvent(true, this.callBackId)
                break;
              }

            }
          })

        Web({ src: $rawfile('index.html'), controller: this.controller })
          .javaScriptAccess(this.javaScriptAccess)
          .javaScriptProxy({
            object: this.jsObj,
            name: "backToEts",
            methodList: ["test", "toString"],
            controller: this.controller
          })
          .onPageEnd((event) => {
            if (event) {
              console.log('url:' + event.url)
            }
          })
          .databaseAccess(this.databaseAccess)
      }
      .width('100%')
    }
    .height('100%')
  }
}