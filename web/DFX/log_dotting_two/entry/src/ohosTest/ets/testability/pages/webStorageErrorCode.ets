/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

const EVENT_ID_SET_EMIT_KEY = 115070;

@Entry
@Component
struct Index {
  controller: webView.WebviewController = new webView.WebviewController();
  controllerNull: webView.WebviewController = new webView.WebviewController();
  nativePort: webView.WebMessagePort | null = null;
  @State str: string = ""
  @State javaScriptAccess: boolean = true;
  @State databaseAccess: boolean = true
  @State searchNumber: number = 2;
  @State ports: webView.WebMessagePort[] = [];
  @State message: string = "123";
  @State isPageEnd: number = -1;
  @State isReceive: number = -1;
  no_error: string = "no error happened"

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

  build() {
    Column() {
      Row() {
        Button("WebStorageErrorCode click").key('WebStorageErrorCodeButton').onClick(async () => {
          await Utils.waitForExist(()=>this.isPageEnd, 'WebStorageErrorCodeButtonIsPageEnd', 1, 1000);
          await Utils.waitForExist(()=>this.isReceive, 'WebStorageErrorCodeButtonIsReceive', 1, 1000);
          console.info("key==>" + this.str);
          this.isReceive = -1;
          switch (this.str) {

            case "testDeleteOriginError001": {
              try {
                webView.WebStorage.deleteOrigin('');
                Utils.emitEvent(this.no_error, 115080)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 115080)
              }
              break;
            }

            case "testDeleteOriginError002": {
              try {
                webView.WebStorage.deleteOrigin(',htt://');
                Utils.emitEvent(this.no_error, 115090)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 115090)
              }
              break;
            }

            case "testDeleteOriginError003": {
              try {
                webView.WebStorage.deleteOrigin('ww.OpenHarmony.cn');
                Utils.emitEvent(this.no_error, 115100)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(error.code), 115100)
              }
              break;
            }

            case "testDeleteOriginError004": {
              try {
                webView.WebStorage.deleteOrigin('123');
                Utils.emitEvent(this.no_error, 115110)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(error.code), 115110)
              }
              break;
            }

            case "testGetOriginQuotaError001": {
              try {
                webView.WebStorage.getOriginQuota('', (error, quota) => {
                  if (error) {
                    console.log('error: ' + JSON.stringify(error));
                    console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                    Utils.emitEvent(String(error.code), 115120)
                    return;
                  }
                  console.log('quota: ' + quota);
                  Utils.emitEvent(this.no_error, 115120)
                })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 115120)
              }
              break;
            }

            case "testGetOriginQuotaError002": {
              try {
                webView.WebStorage.getOriginQuota(',htt://', (error, quota) => {
                  if (error) {
                    console.log('error: ' + JSON.stringify(error));
                    console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                    Utils.emitEvent(String(error.code), 115130)
                    return;
                  }
                  console.log('quota: ' + quota);
                  Utils.emitEvent(this.no_error, 115130)
                })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 115130)
              }
              break;
            }

            case "testGetOriginQuotaError003": {
              try {
                webView.WebStorage.getOriginQuota('ww.OpenHarmony.cn', (error, quota) => {
                  if (error) {
                    console.log('error: ' + JSON.stringify(error));
                    console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                    Utils.emitEvent(String(error.code), 115140)
                    return;
                  }
                  console.log('quota: ' + quota);
                  Utils.emitEvent(this.no_error, 115140)
                })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 115140)
              }
              break;
            }

            case "testGetOriginQuotaError004": {
              try {
                webView.WebStorage.getOriginQuota('123', (error, quota) => {
                  if (error) {
                    console.log('error: ' + JSON.stringify(error));
                    console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                    Utils.emitEvent(String(error.code), 115150)
                    return;
                  }
                  console.log('quota: ' + quota);
                  Utils.emitEvent(this.no_error, 115150)
                })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 115150)
              }
              break;
            }

            case "testGetOriginQuotaError005": {
              try {
                webView.WebStorage.getOriginQuota('')
                  .then(quota => {
                    console.log('quota: ' + quota);
                    Utils.emitEvent(this.no_error, 115160)
                  })
                  .catch((e: business_error.BusinessError) => {
                    console.log('error: ' + JSON.stringify(e));
                    console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    Utils.emitEvent(String(e.code), 115160)
                  })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 115160)
              }
              break;
            }

            case "testGetOriginQuotaError006": {
              try {
                webView.WebStorage.getOriginQuota(',htt://')
                  .then(quota => {
                    console.log('quota: ' + quota);
                    Utils.emitEvent(this.no_error, 115170)
                  })
                  .catch((e: business_error.BusinessError) => {
                    console.log('error: ' + JSON.stringify(e));
                    console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    Utils.emitEvent(String(e.code), 115170)
                  })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 115170)
              }
              break;
            }

            case "testGetOriginQuotaError007": {
              try {
                webView.WebStorage.getOriginQuota('ww.OpenHarmony.cn')
                  .then(quota => {
                    console.log('quota: ' + quota);
                    Utils.emitEvent(this.no_error, 115180)
                  })
                  .catch((e: business_error.BusinessError) => {
                    console.log('error: ' + JSON.stringify(e));
                    console.error(`testGetOriginQuotaError007 -> ErrorCode: ${e.code},  Message: ${e.message}`);
                    Utils.emitEvent(String(e.code), 115180)
                  })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 115180)
              }
              break;
            }

            case "testGetOriginQuotaError008": {
              try {
                webView.WebStorage.getOriginQuota('123')
                  .then(quota => {
                    console.log('quota: ' + quota);
                    Utils.emitEvent(this.no_error, 115190)
                  })
                  .catch((e: business_error.BusinessError) => {
                    console.log('error: ' + JSON.stringify(e));
                    console.error(`testGetOriginQuotaError008 -> ErrorCode: ${e.code},  Message: ${e.message}`);
                    Utils.emitEvent(String(e.code), 115190)
                  })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 115190)
              }
              break;
            }

            case "testGetOriginUsageError001": {
              try {
                webView.WebStorage.getOriginUsage('', (error, usage) => {
                  if (error) {
                    console.log('error: ' + JSON.stringify(error));
                    console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                    Utils.emitEvent(String(error.code), 115200)
                    return;
                  }
                  console.log('usage: ' + usage);
                  Utils.emitEvent(this.no_error, 115200)
                })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 115200)
              }
              break;
            }

            case "testGetOriginUsageError002": {
              try {
                webView.WebStorage.getOriginUsage(',htt://', (error, usage) => {
                  if (error) {
                    console.log('error: ' + JSON.stringify(error));
                    console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                    Utils.emitEvent(String(error.code), 115210)
                    return;
                  }
                  console.log('usage: ' + usage);
                  Utils.emitEvent(this.no_error, 115210)
                })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 115210)
              }
              break;
            }

            case "testGetOriginUsageError003": {
              try {
                webView.WebStorage.getOriginUsage('ww.OpenHarmony.cn', (error, usage) => {
                  if (error) {
                    console.log('error: ' + JSON.stringify(error));
                    console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                    Utils.emitEvent(String(error.code), 115220)
                    return;
                  }
                  console.log('usage: ' + usage);
                  Utils.emitEvent(this.no_error, 115220)
                })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 115220)
              }
              break;
            }

            case "testGetOriginUsageError004": {
              try {
                webView.WebStorage.getOriginUsage('123', (error, usage) => {
                  if (error) {
                    console.log('error: ' + JSON.stringify(error));
                    console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                    Utils.emitEvent(String(error.code), 115230)
                    return;
                  }
                  console.log('usage: ' + usage);
                  Utils.emitEvent(this.no_error, 115230)
                })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 115230)
              }
              break;
            }

            case "testGetOriginUsageError005": {
              try {
                webView.WebStorage.getOriginUsage('')
                  .then(usage => {
                    console.log('usage: ' + usage);
                    Utils.emitEvent(this.no_error, 115240)
                  })
                  .catch((e: business_error.BusinessError) => {
                    console.log('error: ' + JSON.stringify(e));
                    console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    Utils.emitEvent(String(e.code), 115240)
                  })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 115240)
              }
              break;
            }

            case "testGetOriginUsageError006": {
              try {
                webView.WebStorage.getOriginUsage(',htt://')
                  .then(usage => {
                    console.log('usage: ' + usage);
                    Utils.emitEvent(this.no_error, 115250)
                  })
                  .catch((e: business_error.BusinessError) => {
                    console.log('error: ' + JSON.stringify(e));
                    console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    Utils.emitEvent(String(e.code), 115250)
                  })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 115250)
              }
              break;
            }

            case "testGetOriginUsageError007": {
              try {
                webView.WebStorage.getOriginUsage('ww.OpenHarmony.cn')
                  .then(usage => {
                    console.log('usage: ' + usage);
                    Utils.emitEvent(this.no_error, 115260)
                  })
                  .catch((e: business_error.BusinessError) => {
                    console.log('error: ' + JSON.stringify(e));
                    console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    Utils.emitEvent(String(e.code), 115260)
                  })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 115260)
              }
              break;
            }

            case "testGetOriginUsageError008": {
              try {
                webView.WebStorage.getOriginUsage('123')
                  .then(usage => {
                    console.log('usage: ' + usage);
                    Utils.emitEvent(this.no_error, 115270)
                  })
                  .catch((e: business_error.BusinessError) => {
                    console.log('error: ' + JSON.stringify(e));
                    console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    Utils.emitEvent(String(e.code), 115270)
                  })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 115270)
              }
              break;
            }

          }
        })
      }

      Web({ src: $rawfile('index.html'), controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .databaseAccess(this.databaseAccess)
        .onPageEnd((event) => {
          console.log('onPageEnd url:' + event.url);
          this.isPageEnd = 1;
        })
    }
  }
}