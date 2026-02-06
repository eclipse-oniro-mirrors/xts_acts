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
const EVENT_ID_SET_EIMIT_KEY = 142015;

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
  @State isReceive:number = -1;
  @State isCancel:number = -1;
  @State isConfirm:number = -1;
  @State isSave:number = -1;
  @State isCode:number = -1;
  no_error: string = "no error happened"

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: EVENT_ID_SET_EIMIT_KEY,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(EVENT_ID_SET_EIMIT_KEY)
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
        Button("HttpAuthHandler click").key('HttpAuthHandlerButton').onClick(async () => {
          await Utils.waitForExist(()=>this.isReceive, this.str, 1);
          console.info("key==>" + this.str)
          this.isReceive = -1;
          switch (this.str) {

            case "testHttpAuthHandlerConfirm001": {
              try {
                this.HttpAuthHandlerCallBack = 'confirm'
                this.HttpAuthHandlerConfirmCallBack = false
                this.controller.loadUrl("http://httpbin.org/basic-auth/2222/3333")
                await Utils.waitForExist(()=>this.isConfirm, this.str, 1);
                this.isConfirm = -1;
                Utils.emitEvent(this.HttpAuthHandlerConfirmCallBack, 142035)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 142035)
              }
              break;
            }

            case "testHttpAuthHandlerCancel001": {
              try {
                this.Http_Error_Code = 0
                this.HttpAuthHandlerCallBack = 'cancel'
                this.HttpAuthHandlerCancelCallBack = false
                this.controller.loadUrl("http://httpbin.org/basic-auth/2222/3333")
                await Utils.waitForExist(()=>this.isCancel, this.str, 1);
                await Utils.waitForExist(()=>this.isCode, this.str, 1);
                this.isCancel = -1;
                this.isCode = -1;
                Utils.emitEvent(this.Http_Error_Code, 142025)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 142025)
              }
              break;
            }

            case "testHttpAuthHandlerIsHttpAuthInfoSaved001": {
              try {
                console.info("key==>testHttpAuthHandlerIsHttpAuthInfoSaved001")
                this.HttpAuthHandlerCallBack = 'isHttpAuthInfoSaved'
                this.HttpAuthHandlerCancelCallBack = false
                this.controller.loadUrl("http://httpbin.org/basic-auth/2222/3333")
                console.info("key==>loadUrltestHttpAuthHandlerIsHttpAuthInfoSaved001")
                await Utils.waitForExist(()=>this.isSave, this.str, 1);
                this.isSave = -1;
                Utils.emitEvent(this.HttpAuthHandlerIsHttpAuthInfoSavedCallBack, 142045)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 142045)
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
              this.isConfirm = 1;
            }
            if (this.HttpAuthHandlerCallBack == 'cancel') {
              event.handler.cancel()
              this.HttpAuthHandlerCancelCallBack = true
              this.HttpAuthHandlerCallBack = ''
              this.isCancel = 1;
            }
            if (this.HttpAuthHandlerCallBack == 'isHttpAuthInfoSaved') {
              this.HttpAuthHandlerIsHttpAuthInfoSavedCallBack = event.handler.isHttpAuthInfoSaved()
              this.HttpAuthHandlerCallBack = ''
              this.isSave = 1;
            }
          }
          return true
        })
        .onHttpErrorReceive((event) => {
          if (event) {
            if (this.HttpAuthHandlerCancelCallBack == true) {
              this.Http_Error_Code = event.response.getResponseCode()
              this.HttpAuthHandlerCancelCallBack = false
              this.isCode = 1;
            }
          }
        })
    }
  }
}
