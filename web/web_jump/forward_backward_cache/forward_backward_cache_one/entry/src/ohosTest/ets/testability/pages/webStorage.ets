/*
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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
import { waitForExist } from '../../test/WaitTest.test';
import business_error from '@ohos.base';

@Entry
@Component
struct webStorage {
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
      eventId: 134900,
      priority: events_emitter.EventPriority.LOW,
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(134900)
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
        Button('WebStorage click').key('WebStorageButton').onClick(async () => {
          await waitForExist(() => this.isComplete, this.str, 0);
          await waitForExist(() => this.isReceive, this.str, 0);
          this.isReceive = -1;
          console.info('key==>' + this.str)
          switch (this.str) {
            case 'testGetOrigins001': {
              try {
                webView.WebStorage.getOrigins((error, origins) => {
                  if (error) {
                    console.log('error: ' + JSON.stringify(error));
                    return;
                  }
                  for (let i = 0; i < origins.length; i++) {
                    console.log('origin: ' + origins[i].origin);
                    console.log('usage: ' + origins[i].usage);
                    console.log('quota: ' + origins[i].quota);
                  }
                  Utils.emitEvent(origins[0].origin, 134910)
                })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 134910)
              }
              break;
            }

            case 'testGetOrigins002': {
              try {
                webView.WebStorage.getOrigins()
                  .then(origins => {
                    for (let i = 0; i < origins.length; i++) {
                      console.log('origin: ' + origins[i].origin);
                      console.log('usage: ' + origins[i].usage);
                      console.log('quota: ' + origins[i].quota);
                    }
                    Utils.emitEvent(origins[0].origin, 134920)
                  })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 134920)
              }
              break;
            }

            case 'testWebStorageOriginOrigin001': {
              try {
                webView.WebStorage.getOrigins()
                  .then(origins => {
                    for (let i = 0; i < origins.length; i++) {
                      console.log('origin: ' + origins[i].origin);
                      console.log('usage: ' + origins[i].usage);
                      console.log('quota: ' + origins[i].quota);
                    }
                    Utils.emitEvent(origins[0].origin, 134930)
                  })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 134930)
              }
              break;
            }

            case 'testWebStorageOriginUsage001': {
              try {
                webView.WebStorage.getOrigins()
                  .then(origins => {
                    for (let i = 0; i < origins.length; i++) {
                      console.log('origin: ' + origins[i].origin);
                      console.log('usage: ' + origins[i].usage);
                      console.log('quota: ' + origins[i].quota);
                    }
                    if (origins[0].usage > 0) {
                      Utils.emitEvent(true, 134940)
                    } else {
                      Utils.emitEvent(false, 134940)
                    }
                  })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(false, 134940)
              }
              break;
            }

            case 'testWebStorageOriginQuota001': {
              try {
                webView.WebStorage.getOrigins()
                  .then(origins => {
                    for (let i = 0; i < origins.length; i++) {
                      console.log('origin: ' + origins[i].origin);
                      console.log('usage: ' + origins[i].usage);
                      console.log('quota: ' + origins[i].quota);
                    }
                    Utils.emitEvent(origins[0].quota > 0, 134950)
                  })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(false, 134950)
              }
              break;
            }

            case 'testWebStorageOriginGetOrigins001': {
              try {
                webView.WebStorage.getOrigins((error, origins) => {
                  if (error) {
                    console.log('error: ' + JSON.stringify(error));
                    Utils.emitEvent(false, 134960)
                    return;
                  }
                  for (let i = 0; i < origins.length; i++) {
                    console.log('origin: ' + origins[i].origin);
                    console.log('usage: ' + origins[i].usage);
                    console.log('quota: ' + origins[i].quota);
                  }
                  let result = origins[0].usage
                  if (result > 0) {
                    Utils.emitEvent(true, 134960)
                  } else {
                    Utils.emitEvent(false, 134960)
                  }
                })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(false, 134960)
              }
              break;
            }

            case 'testWebStorageOriginGetOriginQuota001': {
              try {
                webView.WebStorage.getOriginQuota(this.origin, (error, quota) => {
                  if (error) {
                    console.log('error: ' + JSON.stringify(error));
                    return;
                  }
                  console.log('quota: ' + quota);
                  Utils.emitEvent(quota > 0, 134970)
                })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code + '', 134970)
              }
              break;
            }

            case 'testWebStorageOriginGetOriginQuota002': {
              try {
                webView.WebStorage.getOriginQuota(this.origin)
                  .then(quota => {
                    console.log('quota: ' + quota);
                    Utils.emitEvent(quota > 0, 134980)
                  })
                  .catch((e: business_error.BusinessError) => {
                    console.log('error: ' + JSON.stringify(e));
                    Utils.emitEvent(e.code + '', 134980)
                  })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code + '', 134980)
              }
              break;
            }

            case 'testWebStorageOriginGetOriginUsage001': {
              try {
                webView.WebStorage.getOriginUsage(this.origin, (error, usage) => {
                  if (error) {
                    console.log('error: ' + JSON.stringify(error));
                    Utils.emitEvent(error.code + '', 134990)
                    return;
                  }
                  console.log('usage: ' + usage);
                  Utils.emitEvent(usage > 0, 134990)
                })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code + '', 134990)
              }
              break;
            }

            case 'testWebStorageOriginGetOriginUsage002': {
              try {
                webView.WebStorage.getOriginUsage(this.origin)
                  .then(usage => {
                    console.log('usage: ' + usage);
                    Utils.emitEvent(usage > 0, 135000)
                  })
                  .catch((e: business_error.BusinessError) => {
                    console.log('error: ' + JSON.stringify(e));
                    Utils.emitEvent(e.code + '', 135000)
                  })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code + '', 135000)
              }
              break;
            }

            case 'testDeleteAllData001': {
              try {
                let getUsage = -1
                webView.WebStorage.deleteAllData()
                webView.WebStorage.getOrigins((error, origins) => {
                  getUsage = origins[0].usage;
                })
                await waitForExist(() => getUsage, this.str, 0, 100);
                webView.WebStorage.getOrigins((error, origins) => {
                  if (error) {
                    console.error('error: ' + JSON.stringify(error));
                    Utils.emitEvent(String(error.code), 135010)
                    return;
                  }
                  for (let i = 0; i < origins.length; i++) {
                    console.log('origin: ' + origins[i].origin);
                    console.log('usage: ' + origins[i].usage);
                    console.log('quota: ' + origins[i].quota);
                  }
                  Utils.emitEvent(origins[0].usage, 135010)
                })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 135010)
              }
              break;
            }

            case 'testDeleteOrigin001': {
              try {
                let getUsage = -1
                webView.WebStorage.deleteOrigin(this.origin);
                webView.WebStorage.getOriginUsage(this.origin)
                  .then(usage => {
                    console.log('usage is: ' + usage);
                    getUsage = usage;
                  })
                await waitForExist(() => getUsage, this.str, 0, 100);
                webView.WebStorage.getOriginUsage(this.origin)
                  .then(usage => {
                    console.log('usage is: ' + usage);
                    getUsage = usage;
                    Utils.emitEvent(getUsage, 135020);
                  })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 135020);
              }
              break;
            }

          }
        })
      }

      Web({ src: $rawfile('addOrigin.html'), controller: this.controller })
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
