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

const EVENT_ID_SET_EMIT_KEY = 202440;

@Entry
@Component
struct webViewOnSslErrorEvent {
  @State str: string = ""
  @State OnSslErrorEventFlagOne: boolean = false
  @State OnSslErrorEventFlagTwo: boolean = false
  @State OnSslErrorEventFlagThree: boolean = false
  @State OnSslErrorEventFlagFour: boolean = false
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;
  controller: web_webview.WebviewController = new web_webview.WebviewController()
  controllerTwo: web_webview.WebviewController = new web_webview.WebviewController()

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
        Button("webViewOnSslErrorEvent").id('webViewOnSslErrorEvent').onClick(async () => {
          await Utils.waitForExist(()=>this.isReceive, 'certChainDataWebIsReceive', 1, 1000);
          await Utils.waitForExist(()=>this.isPageEnd, 'certChainDataWebIsPageEnd', 1, 1000);
          console.info("key==>" + this.str);
          this.isReceive = -1;
          switch (this.str) {
            case "OnSslErrorEvent0100": {
              this.OnSslErrorEventFlagOne = true;
              this.controller.clearClientAuthenticationCache();
              this.controller.clearSslCache();
              this.controller.loadUrl('https://expired.badssl.com');
              break;
            }
            case "OnSslErrorEvent0200": {
              this.OnSslErrorEventFlagTwo = true;
              this.controller.clearClientAuthenticationCache();
              this.controller.clearSslCache();
              this.controller.loadUrl('https://untrusted-root.badssl.com/');
              break;
            }
            case "OnSslErrorEvent0300": {
              this.OnSslErrorEventFlagThree = true;
              this.controller.clearClientAuthenticationCache();
              this.controller.clearSslCache();
              this.controller.loadUrl("resource://rawfile/iframe.html")
              break;
            }
            case "OnSslErrorEvent0400": {
              this.OnSslErrorEventFlagFour = true;
              this.controller.clearClientAuthenticationCache();
              this.controller.clearSslCache();
              this.controller.loadUrl("resource://rawfile/iframe.html")
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
            Utils.emitEvent(event.error, 202450)
          }
          if(this.OnSslErrorEventFlagTwo){
            this.OnSslErrorEventFlagTwo = false;
            Utils.emitEvent(event.error, 202460)
          }
          if(this.OnSslErrorEventFlagThree){
            this.OnSslErrorEventFlagThree = false;
            Utils.emitEvent(event.isMainFrame, 202470)
          }
          if(this.OnSslErrorEventFlagFour){
            this.OnSslErrorEventFlagFour = false;
            Utils.emitEvent(event.error, 202480)
          }
        })
        .onPageEnd((event) => {
          if (event) {
            this.isPageEnd = 1;
            console.log("onPageEnd==>")
          }
        })
    }
  }
}