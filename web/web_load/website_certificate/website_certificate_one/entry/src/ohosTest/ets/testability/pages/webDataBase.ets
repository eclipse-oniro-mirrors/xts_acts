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
import { JsProxyObject } from '../../test/Interfaces';

@Entry
@Component
struct webDataBase {
  controller: webView.WebviewController = new webView.WebviewController();
  @State str: string = ""
  @State javaScriptAccess: boolean = true;
  @State username_password: string[] = [];
  @State host: string = "www.SpinCast.org";
  @State realm: string = "protected example";
  no_error: string = "no error happened"

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
  private jsObj: JsProxyObject = {
    test: (res: object) => {
      Utils.emitEvent(String(res), 102);
    },
    toString: (str: string) => {
      console.info("ets toString:" + String(str));
    },
    register: (res: object) => {
      Utils.emitEvent(String(res), 86);
      return "web222"
    }
  }

  build() {
    Column() {
      Row() {
        Button("WebDataBase click").key('WebDataBaseButton').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {

            case "testSaveHttpAuthCredentials001": {
              webView.WebDataBase.saveHttpAuthCredentials(this.host, this.realm, "StrOmgGol", "LaRoChe");
              await Utils.sleep(3000);
              let result = webView.WebDataBase.existHttpAuthCredentials();
              Utils.emitEvent(result, 30040)
              break;
            }

            case "testGetHttpAuthCredentials001": {
              webView.WebDataBase.saveHttpAuthCredentials(this.host, this.realm, "StrOmgGol", "LaRoChe");
              this.username_password = webView.WebDataBase.getHttpAuthCredentials(this.host, this.realm);
              await Utils.sleep(3000);
              let result = this.username_password[0];
              Utils.emitEvent(result, 30045)

              break;
            }


            case "testExistHttpAuthCredentials001": {
              webView.WebDataBase.saveHttpAuthCredentials(this.host, this.realm, "StrOmgGol", "LaRoChe");
              await Utils.sleep(3000);
              let result = webView.WebDataBase.existHttpAuthCredentials();
              Utils.emitEvent(result, 30046)

              break;
            }

            case "testDeleteHttpAuthCredentials001": {
              webView.WebDataBase.deleteHttpAuthCredentials();
              let result = webView.WebDataBase.existHttpAuthCredentials();
              Utils.emitEvent(result, 30050)
              break;
            }
          }
        })
      }


      Web({ src: $rawfile('index.html'), controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .javaScriptProxy({
          object: this.jsObj,
          name: "backToEts",
          methodList: ["test", "toString"],
          controller: this.controller
        })

    }
  }
}
