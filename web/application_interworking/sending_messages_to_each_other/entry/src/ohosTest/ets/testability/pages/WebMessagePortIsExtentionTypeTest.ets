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

import webView from '@ohos.web.webview';
import Utils from '../../test/Utils';
import { JsProxyObject } from '../../test/Interfaces.d';
import events_emitter from '@ohos.events.emitter';
import {waitForAssert, waitForExist} from '../../test/WaitTest';

@Entry
@Component
struct WebMessagePortIsExtentionTypeTest {
  controller: webView.WebviewController = new webView.WebviewController();
  nativePort: webView.WebMessagePort | null = null;
  message: webView.WebMessageExt = new webView.WebMessageExt();
  origin: string = "resource://rawfile/"
  @State ports: webView.WebMessagePort[] = [];
  @State str: string = ""
  @State startTime: number = 0
  @State endTime: number = 0
  @State testing: boolean = false;
  @State callBackId: number = 0;
  @State javaScriptAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 170360,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(170360)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 0;
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
    Row() {
      Column() {
        Button("IsExtentionType click").key('IsExtentionTypeButton').onClick(async () => {
          await waitForExist(()=>this.isReceive, 'WebMessageExtButtonIsReceive', 0);
          await waitForExist(()=>this.isPageEnd, 'WebMessageExtButtonIsPageEnd', 0);
          console.info("key==>" + this.str);
          this.isReceive = -1;
          switch (this.str) {

            case "testIsExtentionType001": {
              try {
                let buffer = new ArrayBuffer(8);
                this.message.setType(webView.WebMessageType.ARRAY_BUFFER);
                this.message.setArrayBuffer(buffer);
                this.ports[0].postMessageEventExt(this.message);
              } catch (error) {
                Utils.emitEvent(error.code, 170370)
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'testCreateWebMessagePortsReturnArrayLengthEqual0': {
              try {
                let webMessagePorts:webView.WebMessagePort[] = this.controller.createWebMessagePorts();
                webMessagePorts.splice(0)
                console.log('[createWebMessagePorts] WebMessagePort length:' + webMessagePorts.length)
                Utils.emitEvent(webMessagePorts.length, 2510228)
              } catch (error) {
                Utils.emitEvent(error.code, 2510228)
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'testCreateWebMessagePortsReturnArrayLengthLarger0': {
              try {
                let webMessagePorts:webView.WebMessagePort[] = this.controller.createWebMessagePorts(true);
                console.log('[createWebMessagePorts] WebMessagePort length:' + webMessagePorts.length)
                Utils.emitEvent(webMessagePorts.length, 25102209)
              } catch (error) {
                Utils.emitEvent(error.code, 25102209)
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

          }
        })

        Web({ src: $rawfile('onMessageEventExt.html'), controller: this.controller })
          .javaScriptAccess(this.javaScriptAccess)
          .javaScriptProxy({
            object: this.jsObj,
            name: "backToEts",
            methodList: ["test", "toString"],
            controller: this.controller
          })
          .onPageEnd((event) => {
            if (event) {
              this.ports = this.controller.createWebMessagePorts(false);
              this.controller.postMessage("init_web_messageport", [this.ports[1]], "*");
              this.nativePort = this.ports[0];
              this.nativePort.onMessageEvent((result) => {
                try {
                  console.log(`onMessageEvent log : ${result}`);
                } catch (resError) {
                  console.log(`log error code: ${resError.code}, Message: ${resError.message}`);
                }
              });
              console.log('url:' + event.url)
              this.isPageEnd = 0
            }
          })
          .databaseAccess(this.databaseAccess)
      }
      .width('100%')
    }
    .height('100%')
  }
}