/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
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
import { waitForExist } from '../../test/WaitTest.test';
import business_error from '@ohos.base';

@Entry
@Component
struct webStorageGetOriginQuotaCallbackError {
  controller: webView.WebviewController = new webView.WebviewController();
  @State str: string = ''
  @State javaScriptAccess: boolean = true;
  @State databaseAccess: boolean = true
  @State searchNumber: number = 2;
  @State ports: webView.WebMessagePort[] = [];
  @State message: string = '123';
  @State origin: string = 'resource://rawfile/';
  @State isComplete: number = -1;
  @State isReceive: number = -1;
  no_error: string = 'no error happened'

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 135161,
      priority: events_emitter.EventPriority.LOW,
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(135161)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
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
      console.info('ets toString:' + String(str));
    },
    register: (res: object) => {
      Utils.emitEvent(String(res), 86);
      return 'web222'
    },
  }

  build() {
    Column() {
      Row() {
        Button('WebStorageGetOriginQuotaCallbackError click').key('WebStorageGetOriginQuotaCallbackErrorButton').onClick(async () => {
          await waitForExist(() => this.isComplete, this.str, 0);
          await waitForExist(() => this.isReceive, this.str, 0);
          this.isReceive = -1;
          console.info('key==>' + this.str)
          switch (this.str) {
            case 'testGetOriginQuotaCallbackEmptyString': {
              try {
                webView.WebStorage.getOriginQuota('', (error, quota) => {
                  if (error) {
                    console.error('error: ' + JSON.stringify(error));
                    Utils.emitEvent(String(error.code), 135067);
                    return;
                  }
                  console.log('quota: ' + quota);
                  Utils.emitEvent(this.no_error, 135067);
                });
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code}, Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 135067);
              }
              break;
            }

            case 'testGetOriginQuotaCallbackNull': {
              try {
                webView.WebStorage.getOriginQuota(null, (error, quota) => {
                  if (error) {
                    console.error('error: ' + JSON.stringify(error));
                    Utils.emitEvent(String(error.code), 135069);
                    return;
                  }
                  console.log('quota: ' + quota);
                  Utils.emitEvent(this.no_error, 135069);
                });
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code}, Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 135069);
              }
              break;
            }

            case 'testGetOriginQuotaCallbackUndefined': {
              try {
                webView.WebStorage.getOriginQuota(undefined, (error, quota) => {
                  if (error) {
                    console.error('error: ' + JSON.stringify(error));
                    Utils.emitEvent(String(error.code), 135071);
                    return;
                  }
                  console.log('quota: ' + quota);
                  Utils.emitEvent(this.no_error, 135071);
                });
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code}, Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 135071);
              }
              break;
            }
          }
        })
      }

      Web({ src: $rawfile('getOriginQuotaCallbackError.html'), controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .javaScriptProxy({
          object: this.jsObj,
          name: 'backToEts',
          methodList: ['test', 'toString'],
          controller: this.controller,
        })
        .databaseAccess(this.databaseAccess)
        .onPageEnd((event) => {
          if (event) {
            console.log('onPageEnd==>', event.url);
            this.isComplete = 0;
          }
        })
    }
  }
}
