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
import image from '@ohos.multimedia.image';

@Entry
@Component
struct httpAuthHandler {
  controller: webView.WebviewController = new webView.WebviewController();
  @State str: string = ""
  @State onScrollCallBack: boolean = false
  @State javaScriptAccess: boolean = true
  @State icon: image.PixelMap | undefined = undefined;
  @State onShowFileSelectorCallBack: boolean = false
  @State HttpAuthHandlerCallBack: string = ''
  @State HttpAuthHandlerConfirmCallBack: boolean = false
  @State HttpAuthHandlerCancelCallBack: boolean = false
  @State HttpAuthHandlerIsHttpAuthInfoSavedCallBack: boolean = false
  @State Http_Error_Code: number = 0
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
        Button("HttpAuthHandler click").key('HttpAuthHandlerButton').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {

            case "testHttpAuthHandlerConfirm001": {
              try {
                this.HttpAuthHandlerCallBack = 'confirm'
                this.HttpAuthHandlerConfirmCallBack = false
                await Utils.sleep(1000)
                this.controller.loadUrl("http://httpbin.org/basic-auth/2222/3333")
                await Utils.sleep(3000)
                Utils.emitEvent(this.HttpAuthHandlerConfirmCallBack, 32040)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 32040)
              }
              break;
            }

            case "testHttpAuthHandlerCancel001": {
              try {
                this.Http_Error_Code = 0
                this.HttpAuthHandlerCallBack = 'cancel'
                this.HttpAuthHandlerCancelCallBack = false
                await Utils.sleep(1000)
                this.controller.loadUrl("http://httpbin.org/basic-auth/2222/3333")
                await Utils.sleep(3000)
                Utils.emitEvent(this.Http_Error_Code, 32041)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 32041)
              }
              break;
            }

            case "testHttpAuthHandlerIsHttpAuthInfoSaved001": {
              try {
                this.HttpAuthHandlerCallBack = 'isHttpAuthInfoSaved'
                this.HttpAuthHandlerCancelCallBack = false
                await Utils.sleep(1000)
                this.controller.loadUrl("http://httpbin.org/basic-auth/2222/3333")
                await Utils.sleep(3000)
                Utils.emitEvent(this.HttpAuthHandlerIsHttpAuthInfoSavedCallBack, 32042)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 32042)
              }
              break;
            }

          }
        })
      }

      Web({ src: $rawfile('index.html'), controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .key("onShowFileSelectorKey")
        .javaScriptProxy({
          object: this.jsObj,
          name: "backToEts",
          methodList: ["test", "toString"],
          controller: this.controller
        })
        .onHttpAuthRequest((event) => {
          if (event) {
            if (this.HttpAuthHandlerCallBack == 'confirm') {
              this.HttpAuthHandlerConfirmCallBack = event.handler.confirm('2222', '3333')
              this.HttpAuthHandlerCallBack = ''
            }
            if (this.HttpAuthHandlerCallBack == 'cancel') {
              event.handler.cancel()
              this.HttpAuthHandlerCancelCallBack = true
              this.HttpAuthHandlerCallBack = ''
            }
            if (this.HttpAuthHandlerCallBack == 'isHttpAuthInfoSaved') {
              this.HttpAuthHandlerIsHttpAuthInfoSavedCallBack = event.handler.isHttpAuthInfoSaved()
              this.HttpAuthHandlerCallBack = ''
            }
          }
          return true
        })
        .onHttpErrorReceive((event) => {
          if (event) {
            if (this.HttpAuthHandlerCancelCallBack == true) {
              this.Http_Error_Code = event.response.getResponseCode()
              this.HttpAuthHandlerCancelCallBack = false
            }
          }
        })
    }
  }
}
