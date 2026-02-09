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
import {waitForExist} from '../../test/WaitTest';

@Entry
@Component
struct webMessageExt {
  controller: webView.WebviewController = new webView.WebviewController();
  message: webView.WebMessageExt = new webView.WebMessageExt();
  @State str: string = ""
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 119930,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(119930)
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

  build() {
    Column() {
      Row() {
        Button("webMessageExt click").key('WebMessageExtButton').onClick(async () => {
          await waitForExist(()=>this.isReceive, 'WebMessageExtButtonIsReceive', 0);
          await waitForExist(()=>this.isPageEnd, 'WebMessageExtButtonIsPageEnd', 0);
          console.info('key==>' + this.str);
          this.isReceive = -1;
          switch (this.str) {
            case "testWebMessageExtSetType001": {
              try {
                this.message.setType(webView.WebMessageType.NOT_SUPPORT);
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 119940)
              }
              break;
            }

            case "testWebMessageExtSetType002": {
              try {
                this.message.setType(webView.WebMessageType.STRING);
                let type_value = this.message.getType()
                Utils.emitEvent(type_value, 119950)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }

            case "testWebMessageExtSetType003": {
              try {
                this.message.setType(webView.WebMessageType.NUMBER);
                let type_value = this.message.getType()
                Utils.emitEvent(type_value, 119960)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }

            case "testWebMessageExtSetType004": {
              try {
                this.message.setType(webView.WebMessageType.BOOLEAN);
                let type_value = this.message.getType()
                Utils.emitEvent(type_value, 119970)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }

            case "testWebMessageExtSetType005": {
              try {
                this.message.setType(webView.WebMessageType.ARRAY_BUFFER);
                let type_value = this.message.getType()
                Utils.emitEvent(type_value, 119980)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }

            case "testWebMessageExtSetType006": {
              try {
                this.message.setType(webView.WebMessageType.ARRAY);
                let type_value = this.message.getType()
                Utils.emitEvent(type_value, 119990)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }

            case "testWebMessageExtSetType007": {
              try {
                this.message.setType(webView.WebMessageType.ERROR);
                let type_value = this.message.getType()
                Utils.emitEvent(type_value, 120000)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
          }
        })
      }

      Web({ src: $rawfile('index.html'), controller: this.controller })
        .onPageEnd(()=>{
          this.isPageEnd = 0;
        })
    }
  }
}
