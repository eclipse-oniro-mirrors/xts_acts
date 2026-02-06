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

import events_emitter from '@ohos.events.emitter';
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import testsuite from '../../test/List.test';
import Utils from '../../test/Utils';
import web_webview from '@ohos.web.webview';
const EVENT_ID_SET_EIMIT_KEY = 142501;

@Entry
@Component
struct webViewOnSslError {
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  @State str: string = "emitOnsslerroreventreceive";
  @State firstId: number = 142511;
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = false;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State sslerrorText: string = "no call error"
  @State userAgent: string = "Mozilla/5.0 (Window NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko)" +
    " CHrome/105.0.0.0 Safari/537.36 Edg/105.0.1343.27";
  @State isPageEnd:number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: EVENT_ID_SET_EIMIT_KEY,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("webViewOnSslError page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data?.ACTION != null) {
        this.str = eventData.data?.ACTION;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("web click").key('webViewOnSslError').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "emitOnsslerroreventreceive": {
              try {
                this.isPageEnd = -1;
                this.controller.clearSslCache();
                await Utils.waitForExist(() => this.isPageEnd, this.str, 1, 1000);
                this.controller.loadUrl("https://wrong.host.badssl.com");
                console.log("action of emitOnsslerroreventreceive is loadUrl");
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
          }
        })
      }

      Web({ src: 'https://wrong.host.badssl.com', controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
        .userAgent(this.userAgent)
        .onSslErrorEventReceive((event) => {
          console.log("event result is :" + JSON.stringify(event.handler) + event.error);
          this.sslerrorText = JSON.stringify(event.error)
          Utils.emitEvent(this.sslerrorText, this.firstId)
          return true
        })
        .onErrorReceive((event) => {
          console.log('getErrorInfo:' + event.error.getErrorInfo())
          console.log('getErrorCode:' + event.error.getErrorCode())
          console.log('url:' + event.request.getRequestUrl())
        })
        .onPageEnd(() => {
          this.isPageEnd = 1;
        })
    }
  }
}