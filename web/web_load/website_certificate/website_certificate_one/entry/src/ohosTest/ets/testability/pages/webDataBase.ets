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

const EVENT_ID_SET_EMIT_KEY = 202620;

@Entry
@Component
struct webDataBase {
  controller: webView.WebviewController = new webView.WebviewController();
  @State str: string = ""
  @State javaScriptAccess: boolean = true;
  @State username_password: string[] = [];
  @State host: string = "www.SpinCast.org";
  @State realm: string = "protected example";
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;
  no_error: string = "no error happened"

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: EVENT_ID_SET_EMIT_KEY,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(EVENT_ID_SET_EMIT_KEY)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 1;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("WebDataBase click").key('WebDataBaseButton').onClick(async () => {
          await Utils.waitForExist(()=>this.isReceive, 'WebDataBaseButtonIsReceive', 1, 1000);
          await Utils.waitForExist(()=>this.isPageEnd, 'WebDataBaseButtonIsPageEnd', 1, 1000);
          console.info("key==>" + this.str)
          this.isReceive = -1;
          switch (this.str) {

            case "testSaveHttpAuthCredentials001": {
              webView.WebDataBase.saveHttpAuthCredentials(this.host, this.realm, "StrOmgGol", "LaRoChe");
              let result = webView.WebDataBase.existHttpAuthCredentials();
              Utils.emitEvent(result, 202630)
              break;
            }

            case "testGetHttpAuthCredentials001": {
              webView.WebDataBase.saveHttpAuthCredentials(this.host, this.realm, "StrOmgGol", "LaRoChe");
              this.username_password = webView.WebDataBase.getHttpAuthCredentials(this.host, this.realm);
              let result = this.username_password[0];
              Utils.emitEvent(result, 202640)
              break;
            }


            case "testExistHttpAuthCredentials001": {
              webView.WebDataBase.saveHttpAuthCredentials(this.host, this.realm, "StrOmgGol", "LaRoChe");
              let result = webView.WebDataBase.existHttpAuthCredentials();
              Utils.emitEvent(result, 202650)
              break;
            }

            case "testDeleteHttpAuthCredentials001": {
              webView.WebDataBase.saveHttpAuthCredentials(this.host, this.realm, "StrOmgGol", "LaRoChe");
              webView.WebDataBase.deleteHttpAuthCredentials();
              let result = webView.WebDataBase.existHttpAuthCredentials();
              Utils.emitEvent(result, 202660)
              break;
            }
          }
        })
      }


      Web({ src: $rawfile('index.html'), controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .onPageEnd((event) => {
          if (event) {
            console.log("onPageEnd==> event.url:" + event.url)
            this.isPageEnd = 1;
          }
        })
    }
  }
}