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

@Entry
@Component
struct webMessageExt {
  controller: webView.WebviewController = new webView.WebviewController();
  message: webView.WebMessageExt = new webView.WebMessageExt();
  @State str: string = ""

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
        Button("webMessageExt click").key('WebMessageExtButton').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "testWebMessageExtSetType001": {
              try {
                this.message.setType(webView.WebMessageType.NOT_SUPPORT);
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 36000)
              }
              break;
            }

            case "testWebMessageExtSetType002": {
              try {
                this.message.setType(webView.WebMessageType.STRING);
                let type_value = this.message.getType()
                Utils.emitEvent(type_value, 36001)
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
                Utils.emitEvent(type_value, 36002)
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
                Utils.emitEvent(type_value, 36003)
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
                Utils.emitEvent(type_value, 36004)
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
                Utils.emitEvent(type_value, 36005)
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
                Utils.emitEvent(type_value, 36006)
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
    }
  }
}
