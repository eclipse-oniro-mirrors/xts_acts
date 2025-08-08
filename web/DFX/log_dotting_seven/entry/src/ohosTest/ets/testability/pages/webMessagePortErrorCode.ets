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
import business_error from '@ohos.base';
import {waitForAssert, waitForExist} from '../../test/WaitTest';

@Entry
@Component
struct Index {
  controller: webView.WebviewController = new webView.WebviewController();
  controllerNull: webView.WebviewController = new webView.WebviewController();
  nativePort: webView.WebMessagePort | null = null;
  responseWeb: WebResourceResponse = new WebResourceResponse();
  @State str: string = '';
  @State javaScriptAccess: boolean = true;
  @State ports: webView.WebMessagePort[] = [];
  @State webResult: string = ' ';
  @State errorCode: string = '0';
  no_error: string = 'no error happened';
  message: webView.WebMessageExt = new webView.WebMessageExt();

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
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
      }
    }
  }


  build() {
    Column() {
      Row() {
        Button('WebMessagePortErrorCode click').key('WebMessagePortErrorCodeButton').onClick(async () => {
          console.info('key==>' + this.str);
          switch (this.str) {
            case 'testPostMessageEventExtError001': {
              try {
                this.ports = this.controller.createWebMessagePorts(true);
                if (this.ports) {
                  this.message.setType(1);
                  this.message.setString('helloFromEts');
                  this.ports[0].close();
                  this.ports[0].postMessageEventExt(this.message);
                }
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                if (e.code == 801) {
                  Utils.emitEvent('17100010', 2025042204);
                } else {
                  let check = (v1: string, v2: string): boolean => {
                    return v1 == v2 ? true: false;
                  }
                  this.errorCode = String(e.code)
                  await waitForAssert(()=>this.errorCode, check, '17100010', 2025042204, this.str);
                }
              }
              break;
            }

            case 'testCreateWebMessagePortsError001': {
              try {
                this.controllerNull.createWebMessagePorts(true);
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                if (e.code == 801) {
                  Utils.emitEvent('17100001', 2025042205);
                } else {
                  let check = (v1: string, v2: string): boolean => {
                    return v1 == v2 ? true: false;
                  }
                  this.errorCode = String(e.code)
                  await waitForAssert(()=>this.errorCode, check, '17100001', 2025042205, this.str);
                }
              }
              break;
            }

          }
        })
      }

      Web({ src: $rawfile('index.html'), controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)

    }
  }
}
