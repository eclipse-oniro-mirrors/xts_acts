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
import Utils from '../../test/Utils';
import web_webview from '@ohos.web.webview';
import buffer from '@ohos.buffer'
import { WebNetErrorList } from '@ohos.web.netErrorList'
import common from '@ohos.app.ability.common';
import abilityAccessCtrl, { PermissionRequestResult } from '@ohos.abilityAccessCtrl';
import business_error, { BusinessError } from '@ohos.base';


@Entry
@Component
struct webViewOnSslErrorEvent {
  @State str: string = ""
  @State OnSslErrorEventFlagOne: boolean = false
  @State OnSslErrorEventFlagTwo: boolean = false
  @State OnSslErrorEventFlagThree: boolean = false
  @State OnSslErrorEventFlagFour: boolean = false
  controller: web_webview.WebviewController = new web_webview.WebviewController()
  controllerTwo: web_webview.WebviewController = new web_webview.WebviewController()

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
        Button("webViewOnSslErrorEvent").id('webViewOnSslErrorEvent').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "OnSslErrorEvent0100": {
              this.OnSslErrorEventFlagOne = true;
              this.controller.clearClientAuthenticationCache();
              this.controller.clearSslCache();
              await Utils.sleep(2000)
              this.controller.loadUrl('https://expired.badssl.com');
              await Utils.sleep(4000);
              break;
            }
            case "OnSslErrorEvent0200": {
              this.OnSslErrorEventFlagTwo = true;
              this.controller.clearClientAuthenticationCache();
              this.controller.clearSslCache();
              await Utils.sleep(2000)
              this.controller.loadUrl('https://incomplete-chain.badssl.com');
              await Utils.sleep(4000);
              break;
            }
            case "OnSslErrorEvent0300": {
              this.OnSslErrorEventFlagThree = true;
              this.controller.clearClientAuthenticationCache();
              this.controller.clearSslCache();
              await Utils.sleep(2000)
              this.controller.loadUrl("resource://rawfile/iframe.html")
              await Utils.sleep(4000);
              break;
            }
            case "OnSslErrorEvent0400": {
              this.OnSslErrorEventFlagFour = true;
              this.controller.clearClientAuthenticationCache();
              this.controller.clearSslCache();
              await Utils.sleep(2000)
              this.controller.loadUrl("resource://rawfile/iframe.html")
              await Utils.sleep(4000);
              break;
            }
          }
        })
      }

      Web({ src: 'www.example.com', controller: this.controller })
        .onSslErrorEvent((event: SslErrorEvent) => {
          console.log("onSslErrorEvent url: " + event.url)
          console.log("onSslErrorEvent error: " + event.error)
          console.log("onSslErrorEvent originalUrl: " + event.originalUrl)
          console.log("onSslErrorEvent referrer: " + event.referrer)
          console.log("onSslErrorEvent isFatalError: " + event.isFatalError)
          console.log("onSslErrorEvent isMainFrame: " + event.isMainFrame)
          if(this.OnSslErrorEventFlagOne){
            this.OnSslErrorEventFlagOne = false;
            Utils.emitEvent(event.error, 400)
          }
          if(this.OnSslErrorEventFlagTwo){
            this.OnSslErrorEventFlagTwo = false;
            Utils.emitEvent(event.error, 401)
          }
          if(this.OnSslErrorEventFlagThree){
            this.OnSslErrorEventFlagThree = false;
            Utils.emitEvent(event.isMainFrame, 402)
          }
          if(this.OnSslErrorEventFlagFour){
            this.OnSslErrorEventFlagFour = false;
            Utils.emitEvent(event.error, 403)
          }
        })
    }
  }
}