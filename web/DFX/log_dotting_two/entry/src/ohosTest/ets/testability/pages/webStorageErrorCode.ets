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
import { JsProxyObject } from '../../test/Interfaces';
import business_error from '@ohos.base';

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
        Button("WebStorageErrorCode click").key('WebStorageErrorCodeButton').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {

            case "testDeleteOriginError001": {
              try {
                webView.WebStorage.deleteOrigin('');
                Utils.emitEvent(this.no_error, 20030)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 20030)
              }
              break;
            }

            case "testDeleteOriginError002": {
              try {
                webView.WebStorage.deleteOrigin(',htt://');
                Utils.emitEvent(this.no_error, 20031)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 20031)
              }
              break;
            }

            case "testDeleteOriginError003": {
              try {
                webView.WebStorage.deleteOrigin('ww.OpenHarmony.cn');
                Utils.emitEvent(this.no_error, 20032)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(error.code), 20032)
              }
              break;
            }

            case "testDeleteOriginError004": {
              try {
                webView.WebStorage.deleteOrigin('123');
                Utils.emitEvent(this.no_error, 20033)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(error.code), 20033)
              }
              break;
            }

            case "testGetOriginQuotaError001": {
              try {
                webView.WebStorage.getOriginQuota('', (error, quota) => {
                  if (error) {
                    console.log('error: ' + JSON.stringify(error));
                    console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                    Utils.emitEvent(String(error.code), 20050)
                    return;
                  }
                  console.log('quota: ' + quota);
                  Utils.emitEvent(this.no_error, 20050)
                })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 20050)
              }
              break;
            }

            case "testGetOriginQuotaError002": {
              try {
                webView.WebStorage.getOriginQuota(',htt://', (error, quota) => {
                  if (error) {
                    console.log('error: ' + JSON.stringify(error));
                    console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                    Utils.emitEvent(String(error.code), 20051)
                    return;
                  }
                  console.log('quota: ' + quota);
                  Utils.emitEvent(this.no_error, 20051)
                })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 20051)
              }
              break;
            }

            case "testGetOriginQuotaError003": {
              try {
                webView.WebStorage.getOriginQuota('ww.OpenHarmony.cn', (error, quota) => {
                  if (error) {
                    console.log('error: ' + JSON.stringify(error));
                    console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                    Utils.emitEvent(String(error.code), 20052)
                    return;
                  }
                  console.log('quota: ' + quota);
                  Utils.emitEvent(this.no_error, 20052)
                })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 20052)
              }
              break;
            }

            case "testGetOriginQuotaError004": {
              try {
                webView.WebStorage.getOriginQuota('123', (error, quota) => {
                  if (error) {
                    console.log('error: ' + JSON.stringify(error));
                    console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                    Utils.emitEvent(String(error.code), 20053)
                    return;
                  }
                  console.log('quota: ' + quota);
                  Utils.emitEvent(this.no_error, 20053)
                })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 20053)
              }
              break;
            }

            case "testGetOriginQuotaError005": {
              try {
                webView.WebStorage.getOriginQuota('')
                  .then(quota => {
                    console.log('quota: ' + quota);
                    Utils.emitEvent(this.no_error, 20054)
                  })
                  .catch((e: business_error.BusinessError) => {
                    console.log('error: ' + JSON.stringify(e));
                    console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    Utils.emitEvent(String(e.code), 20054)
                  })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 20054)
              }
              break;
            }

            case "testGetOriginQuotaError006": {
              try {
                webView.WebStorage.getOriginQuota(',htt://')
                  .then(quota => {
                    console.log('quota: ' + quota);
                    Utils.emitEvent(this.no_error, 20055)
                  })
                  .catch((e: business_error.BusinessError) => {
                    console.log('error: ' + JSON.stringify(e));
                    console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    Utils.emitEvent(String(e.code), 20055)
                  })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 20055)
              }
              break;
            }

            case "testGetOriginQuotaError007": {
              try {
                webView.WebStorage.getOriginQuota('ww.OpenHarmony.cn')
                  .then(quota => {
                    console.log('quota: ' + quota);
                    Utils.emitEvent(this.no_error, 20056)
                  })
                  .catch((e: business_error.BusinessError) => {
                    console.log('error: ' + JSON.stringify(e));
                    console.error(`testGetOriginQuotaError007 -> ErrorCode: ${e.code},  Message: ${e.message}`);
                    Utils.emitEvent(String(e.code), 20056)
                  })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 20056)
              }
              break;
            }

            case "testGetOriginQuotaError008": {
              try {
                webView.WebStorage.getOriginQuota('123')
                  .then(quota => {
                    console.log('quota: ' + quota);
                    Utils.emitEvent(this.no_error, 20057)
                  })
                  .catch((e: business_error.BusinessError) => {
                    console.log('error: ' + JSON.stringify(e));
                    console.error(`testGetOriginQuotaError008 -> ErrorCode: ${e.code},  Message: ${e.message}`);
                    Utils.emitEvent(String(e.code), 20057)
                  })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 20057)
              }
              break;
            }

            case "testGetOriginUsageError001": {
              try {
                webView.WebStorage.getOriginUsage('', (error, usage) => {
                  if (error) {
                    console.log('error: ' + JSON.stringify(error));
                    console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                    Utils.emitEvent(String(error.code), 20060)
                    return;
                  }
                  console.log('usage: ' + usage);
                  Utils.emitEvent(this.no_error, 20060)
                })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 20060)
              }
              break;
            }

            case "testGetOriginUsageError002": {
              try {
                webView.WebStorage.getOriginUsage(',htt://', (error, usage) => {
                  if (error) {
                    console.log('error: ' + JSON.stringify(error));
                    console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                    Utils.emitEvent(String(error.code), 20061)
                    return;
                  }
                  console.log('usage: ' + usage);
                  Utils.emitEvent(this.no_error, 20061)
                })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 20061)
              }
              break;
            }

            case "testGetOriginUsageError003": {
              try {
                webView.WebStorage.getOriginUsage('ww.OpenHarmony.cn', (error, usage) => {
                  if (error) {
                    console.log('error: ' + JSON.stringify(error));
                    console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                    Utils.emitEvent(String(error.code), 20062)
                    return;
                  }
                  console.log('usage: ' + usage);
                  Utils.emitEvent(this.no_error, 20062)
                })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 20062)
              }
              break;
            }

            case "testGetOriginUsageError004": {
              try {
                webView.WebStorage.getOriginUsage('123', (error, usage) => {
                  if (error) {
                    console.log('error: ' + JSON.stringify(error));
                    console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                    Utils.emitEvent(String(error.code), 20063)
                    return;
                  }
                  console.log('usage: ' + usage);
                  Utils.emitEvent(this.no_error, 20063)
                })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 20063)
              }
              break;
            }

            case "testGetOriginUsageError005": {
              try {
                webView.WebStorage.getOriginUsage('')
                  .then(usage => {
                    console.log('usage: ' + usage);
                    Utils.emitEvent(this.no_error, 20064)
                  })
                  .catch((e: business_error.BusinessError) => {
                    console.log('error: ' + JSON.stringify(e));
                    console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    Utils.emitEvent(String(e.code), 20064)
                  })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 20064)
              }
              break;
            }

            case "testGetOriginUsageError006": {
              try {
                webView.WebStorage.getOriginUsage(',htt://')
                  .then(usage => {
                    console.log('usage: ' + usage);
                    Utils.emitEvent(this.no_error, 20065)
                  })
                  .catch((e: business_error.BusinessError) => {
                    console.log('error: ' + JSON.stringify(e));
                    console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    Utils.emitEvent(String(e.code), 20065)
                  })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 20065)
              }
              break;
            }

            case "testGetOriginUsageError007": {
              try {
                webView.WebStorage.getOriginUsage('ww.OpenHarmony.cn')
                  .then(usage => {
                    console.log('usage: ' + usage);
                    Utils.emitEvent(this.no_error, 20066)
                  })
                  .catch((e: business_error.BusinessError) => {
                    console.log('error: ' + JSON.stringify(e));
                    console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    Utils.emitEvent(String(e.code), 20066)
                  })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 20066)
              }
              break;
            }

            case "testGetOriginUsageError008": {
              try {
                webView.WebStorage.getOriginUsage('123')
                  .then(usage => {
                    console.log('usage: ' + usage);
                    Utils.emitEvent(this.no_error, 20067)
                  })
                  .catch((e: business_error.BusinessError) => {
                    console.log('error: ' + JSON.stringify(e));
                    console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    Utils.emitEvent(String(e.code), 20067)
                  })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 20067)
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
        .databaseAccess(this.databaseAccess)
    }
  }
}
