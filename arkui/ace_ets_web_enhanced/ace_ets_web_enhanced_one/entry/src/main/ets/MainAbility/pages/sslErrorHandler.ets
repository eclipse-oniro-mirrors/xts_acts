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
        Button("SslErrorHandler click").key('SslErrorHandlerButton').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {

            case "testOnSslErrorEventReceive001": {
              try {
                this.onSslErrorEventReceiveCallBack = false
                this.ConfirmCancel = 'handleCancel'
                this.controller.clearSslCache();
                await Utils.sleep(2000)
                this.controller.loadUrl("https://expired.badssl.com");
                await Utils.sleep(6000)
                Utils.emitEvent(this.onSslErrorEventReceiveCallBack, 30272)
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 30272)
              }
              break;
            }

            case "testSslErrorHandlerHandleCancel001": {
              try {
                this.ConfirmCancel = 'handleCancel'
                this.cancel_result = 10000
                this.controller.clearSslCache();
                await Utils.sleep(2000)
                this.controller.loadUrl("https://expired.badssl.com");
                await Utils.sleep(3000)
                this.controller.searchAllAsync('expired.');
                await Utils.sleep(3000)
                Utils.emitEvent(this.cancel_result, 30271)
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 30271)
              }
              break;
            }

            case "testSslErrorHandlerHandleConfirm001": {
              try {
                let title: string = ' '
                this.ConfirmCancel = 'handleConfirm'
                this.controller.clearSslCache();
                await Utils.sleep(2000)
                this.controller.loadUrl("https://expired.badssl.com");
                await Utils.sleep(6000)
                title = this.controller.getTitle()
                if (title != "index") {
                  Utils.emitEvent(true, 30270)
                } else {
                  Utils.emitEvent(false, 30270)
                }
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 30270)
              }
              break;
            }

            case "testClearSslCache001": {
              try {
                this.onSslErrorEventReceiveCallBack = false
                this.controller.clearClientAuthenticationCache()
                this.controller.clearSslCache();
                await Utils.sleep(2000)
                this.controller.loadUrl("https://expired.badssl.com");
                await Utils.sleep(6000)
                Utils.emitEvent(this.onSslErrorEventReceiveCallBack, 100073)
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 100073)
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
            this.ConfirmCancel = ' '
            this.onSslErrorEventReceiveCallBack = true
          }
        })
        .onSearchResultReceive(ret => {
          if (ret) {
            console.log("on search result receive:" + "[cur]" + ret.activeMatchOrdinal +
            "[total]" + ret.numberOfMatches + "[isDone]" + ret.isDoneCounting);
            this.cancel_result = ret.numberOfMatches
          }
        })
    }
  }
}
