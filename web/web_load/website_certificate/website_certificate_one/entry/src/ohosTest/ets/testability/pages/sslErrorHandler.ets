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
import { JsProxyObject } from '../../test/Interfaces.d';

const EVENT_ID_SET_EMIT_KEY = 202540;

@Entry
@Component
struct sslErrorHandler {
  controller: webView.WebviewController = new webView.WebviewController();
  @State str: string = ""
  @State javaScriptAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State errorTestCode: number = 0;
  @State ConfirmCancel: string = '';
  @State onSslErrorEventReceiveCallBack: boolean = false
  @State cancel_result: number = 100;
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;

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
        Button("SslErrorHandler click").key('SslErrorHandlerButton').onClick(async () => {
          await Utils.waitForExist(()=>this.isReceive, 'WebonSslErrorEventButtonIsReceive', 1, 1000);
          await Utils.waitForExist(()=>this.isPageEnd, 'WebonSslErrorEventButtonIsPageEnd', 1, 1000);
          console.info("key==>" + this.str);
          this.isReceive = -1;
          switch (this.str) {

            case "testOnSslErrorEventReceive001": {
              try {
                this.onSslErrorEventReceiveCallBack = false
                this.ConfirmCancel = 'handleCancel'
                this.controller.clearSslCache();
                this.isPageEnd = -1;
                this.controller.loadUrl("https://expired.badssl.com");
                await Utils.waitForExist(()=>this.isPageEnd, 'loadUrlIsPageEnd', 1, 1000);
                Utils.emitEvent(this.onSslErrorEventReceiveCallBack, 202550)
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 202550)
              }
              break;
            }

            case "testSslErrorHandlerHandleCancel001": {
              try {
                this.ConfirmCancel = 'handleCancel'
                this.controller.clearSslCache();
                this.isPageEnd = -1;
                this.controller.loadUrl("https://expired.badssl.com");
                await Utils.waitForExist(()=>this.isPageEnd, 'loadUrlIsPageEnd', 1, 1000);
                this.controller.searchAllAsync('expired.');
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 202560)
              }
              break;
            }

            case "testSslErrorHandlerHandleConfirm001": {
              try {
                let title: string = ' '
                this.ConfirmCancel = 'handleConfirm'
                this.controller.clearSslCache();
                this.isPageEnd = -1;
                this.controller.loadUrl("https://expired.badssl.com");
                await Utils.waitForExist(()=>this.isPageEnd, 'loadUrlIsPageEnd', 1, 1000);
                title = this.controller.getTitle()
                if (title != "index") {
                  Utils.emitEvent(true, 202570)
                } else {
                  Utils.emitEvent(false, 202570)
                }
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 202570)
              }
              break;
            }

            case "testClearSslCache001": {
              try {
                this.onSslErrorEventReceiveCallBack = false
                this.controller.clearClientAuthenticationCache()
                this.controller.clearSslCache();
                this.controller.loadUrl("https://expired.badssl.com");
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 202580)
              }
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
        .onSslErrorEventReceive((event) => {
          if (event) {
            if (this.ConfirmCancel == 'handleConfirm') {
              event.handler.handleConfirm()
            }
            if (this.ConfirmCancel == 'handleCancel') {
              event.handler.handleCancel()
            }
            this.ConfirmCancel = ' ';
            this.onSslErrorEventReceiveCallBack = true
            if (this.str === 'testClearSslCache001') {
              Utils.emitEvent(this.onSslErrorEventReceiveCallBack, 202580)
            }
          }
        })
        .onSearchResultReceive(ret => {
          if (ret) {
            console.log("on search result receive:" + "[cur]" + ret.activeMatchOrdinal +
              "[total]" + ret.numberOfMatches + "[isDone]" + ret.isDoneCounting);
            if (this.str === 'testSslErrorHandlerHandleCancel001') {
              Utils.emitEvent(ret.numberOfMatches, 202560);
            }
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