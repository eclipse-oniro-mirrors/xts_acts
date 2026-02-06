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

const EVENT_ID_SET_EMIT_KEY = 113010;

@Entry
@Component
struct Index {
  controller: webView.WebviewController = new webView.WebviewController();
  controllerNull: webView.WebviewController = new webView.WebviewController();
  nativePort: webView.WebMessagePort | null = null;
  responseWeb: WebResourceResponse = new WebResourceResponse()
  @State str: string = ""
  @State javaScriptAccess: boolean = true;
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
        Button("GeolocationPermissionsErrorCode click")
          .key('GeolocationPermissionsErrorCodeButton')
          .onClick(async () => {
            await Utils.waitForExist(()=>this.isPageEnd, 'GeolocationPermissionsErrorCodeButtonIsPageEnd', 1, 1000);
            await Utils.waitForExist(()=>this.isReceive, 'GeolocationPermissionsErrorCodeButtonIsReceive', 1, 1000);
            console.info("key==>" + this.str);
            this.isReceive = -1;
            switch (this.str) {
              case "testGetAccessibleGeolocationError001": {
                try {
                  webView.GeolocationPermissions.getAccessibleGeolocation('', (error, result) => {
                    if (error) {
                      console.log('error: ' + JSON.stringify(error));
                      console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                      Utils.emitEvent(String(error.code), 113020)
                      return;
                    }
                    console.log('result: ' + result);
                    Utils.emitEvent(this.no_error, 113020)
                  });
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(String(e.code), 113020)
                }
                break;
              }

              case "testGetAccessibleGeolocationError002": {
                try {
                  webView.GeolocationPermissions.getAccessibleGeolocation(',htt://', (error, result) => {
                    if (error) {
                      console.log('error: ' + JSON.stringify(error));
                      console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                      Utils.emitEvent(String(error.code), 113030)
                      return;
                    }
                    console.log('result: ' + result);
                    Utils.emitEvent(this.no_error, 113030)
                  });
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(String(e.code), 113030)
                }
                break;
              }


              case "testGetAccessibleGeolocationError003": {
                try {
                  webView.GeolocationPermissions.getAccessibleGeolocation('ww.OpenHarmony.cn', (error, result) => {
                    if (error) {
                      console.log('error: ' + JSON.stringify(error));
                      console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                      Utils.emitEvent(String(error.code), 113040)
                      return;
                    }
                    console.log('result: ' + result);
                    Utils.emitEvent(this.no_error, 113040)
                  });
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(String(e.code), 113040)
                }
                break;
              }

              case "testGetAccessibleGeolocationError004": {
                try {
                  webView.GeolocationPermissions.getAccessibleGeolocation('123', (error, result) => {
                    if (error) {
                      console.log('error: ' + JSON.stringify(error));
                      console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                      Utils.emitEvent(String(error.code), 113050)
                      return;
                    }
                    console.log('result: ' + result);
                    Utils.emitEvent(this.no_error, 113050)
                  });
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(String(e.code), 113050)
                }
                break;
              }

              case "testGetAccessibleGeolocationError005": {
                try {
                  webView.GeolocationPermissions.getAccessibleGeolocation('')
                    .then(result => {
                      console.log('result: ' + result);
                      Utils.emitEvent(this.no_error, 113060)
                    }).catch((error: business_error.BusinessError) => {
                    console.log('error: ' + JSON.stringify(error));
                    console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                    Utils.emitEvent(String(error.code), 113060)
                  });
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(String(e.code), 113060)
                }
                break;
              }

              case "testGetAccessibleGeolocationError006": {
                try {
                  webView.GeolocationPermissions.getAccessibleGeolocation(',htt://')
                    .then(result => {
                      console.log('result: ' + result);
                      Utils.emitEvent(this.no_error, 113070)
                    }).catch((error: business_error.BusinessError) => {
                    console.log('error: ' + JSON.stringify(error));
                    console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                    Utils.emitEvent(String(error.code), 113070)
                  });
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(String(e.code), 113070)
                }
                break;
              }

              case "testGetAccessibleGeolocationError007": {
                try {
                  webView.GeolocationPermissions.getAccessibleGeolocation('ww.OpenHarmony.cn')
                    .then(result => {
                      Utils.emitEvent(this.no_error, 113080)
                      console.log('result: ' + result);
                    }).catch((error: business_error.BusinessError) => {
                    console.log('error: ' + JSON.stringify(error));
                    console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                    Utils.emitEvent(String(error.code), 113080)
                  });
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(String(e.code), 113080)
                }
                break;
              }

              case "testGetAccessibleGeolocationError008": {
                try {
                  webView.GeolocationPermissions.getAccessibleGeolocation('123')
                    .then(result => {
                      console.log('result: ' + result);
                      Utils.emitEvent(this.no_error, 113090)
                    }).catch((error: business_error.BusinessError) => {
                    console.log('error: ' + JSON.stringify(error));
                    console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                    Utils.emitEvent(String(error.code), 113090)
                  });
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(String(e.code), 113090)
                }
                break;
              }

              case "testDeleteGeolocationError001": {
                try {
                  webView.GeolocationPermissions.deleteGeolocation('');
                  Utils.emitEvent(this.no_error, 113100)
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(e.code, 113100)
                }
                break;
              }

              case "testDeleteGeolocationError002": {
                try {
                  webView.GeolocationPermissions.deleteGeolocation(',htt://');
                  Utils.emitEvent(this.no_error, 113110)
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(e.code, 113110)
                }
                break;
              }

              case "testDeleteGeolocationError003": {
                try {
                  webView.GeolocationPermissions.deleteGeolocation('ww.OpenHarmony.cn');
                  Utils.emitEvent(this.no_error, 113120)
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(e.code, 113120)
                }
                break;
              }

              case "testDeleteGeolocationError004": {
                try {
                  webView.GeolocationPermissions.deleteGeolocation('123');
                  Utils.emitEvent(this.no_error, 113130)
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(e.code, 113130)
                }
                break;
              }

              case "testAllowGeolocationError001": {
                try {
                  webView.GeolocationPermissions.allowGeolocation('');
                  Utils.emitEvent(this.no_error, 113140)
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(e.code, 113140)
                }
                break;
              }

              case "testAllowGeolocationError002": {
                try {
                  webView.GeolocationPermissions.allowGeolocation(',htt://');
                  Utils.emitEvent(this.no_error, 113150)
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(e.code, 113150)
                }
                break;
              }

              case "testAllowGeolocationError003": {
                try {
                  webView.GeolocationPermissions.allowGeolocation('ww.OpenHarmony.cn');
                  Utils.emitEvent(this.no_error, 113160)
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(e.code, 113160)
                }
                break;
              }

              case "testAllowGeolocationError004": {
                try {
                  webView.GeolocationPermissions.allowGeolocation('123');
                  Utils.emitEvent(this.no_error, 113170)
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(e.code, 113170)
                }
                break;
              }

              case "testGetAccessibleGeolocationErrorMess001": {
                try {
                  webView.GeolocationPermissions.getAccessibleGeolocation('', (error, result) => {
                    if (error) {
                      console.log('error: ' + JSON.stringify(error));
                      console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                      Utils.emitEvent(String(error.message), 113180)
                      return;
                    }
                    console.log('result: ' + result);
                    Utils.emitEvent(this.no_error, 113180)
                  });
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(String(e.message), 113180)
                }
                break;
              }

              case "testGetAccessibleGeolocationErrorMess002": {
                try {
                  webView.GeolocationPermissions.getAccessibleGeolocation(',htt://', (error, result) => {
                    if (error) {
                      console.log('error: ' + JSON.stringify(error));
                      console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                      Utils.emitEvent(String(error.message), 113190)
                      return;
                    }
                    console.log('result: ' + result);
                    Utils.emitEvent(this.no_error, 113190)
                  });
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(String(e.message), 113190)
                }
                break;
              }

              case "testGetAccessibleGeolocationErrorMess003": {
                try {
                  webView.GeolocationPermissions.getAccessibleGeolocation('ww.OpenHarmony.cn', (error, result) => {
                    if (error) {
                      console.log('error: ' + JSON.stringify(error));
                      console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                      Utils.emitEvent(String(error.message), 113200)
                      return;
                    }
                    console.log('result: ' + result);
                    Utils.emitEvent(this.no_error, 113200)
                  });
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(String(e.message), 113200)
                }
                break;
              }

              case "testGetAccessibleGeolocationErrorMess004": {
                try {
                  webView.GeolocationPermissions.getAccessibleGeolocation('123', (error, result) => {
                    if (error) {
                      console.log('error: ' + JSON.stringify(error));
                      console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                      Utils.emitEvent(String(error.message), 113210)
                      return;
                    }
                    console.log('result: ' + result);
                    Utils.emitEvent(this.no_error, 113210)
                  });
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(String(e.message), 113210)
                }
                break;
              }

              case "testGetAccessibleGeolocationErrorMess005": {
                try {
                  webView.GeolocationPermissions.getAccessibleGeolocation('')
                    .then(result => {
                      console.log('result: ' + result);
                      Utils.emitEvent(this.no_error, 113220)
                    }).catch((error: business_error.BusinessError) => {
                    console.log('error: ' + JSON.stringify(error));
                    console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                    Utils.emitEvent(String(error.message), 113220)
                  });
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(String(e.message), 113220)
                }
                break;
              }

              case "testGetAccessibleGeolocationErrorMess006": {
                try {
                  webView.GeolocationPermissions.getAccessibleGeolocation(',htt://')
                    .then(result => {
                      console.log('result: ' + result);
                      Utils.emitEvent(this.no_error, 113230)
                    }).catch((error: business_error.BusinessError) => {
                    console.log('error: ' + JSON.stringify(error));
                    console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                    Utils.emitEvent(String(error.message), 113230)
                  });
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(String(e.message), 113230)
                }
                break;
              }

              case "testGetAccessibleGeolocationErrorMess007": {
                try {
                  webView.GeolocationPermissions.getAccessibleGeolocation('ww.OpenHarmony.cn')
                    .then(result => {
                      Utils.emitEvent(this.no_error, 113240)
                      console.log('result: ' + result);
                    }).catch((error: business_error.BusinessError) => {
                    console.log('error: ' + JSON.stringify(error));
                    console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                    Utils.emitEvent(String(error.message), 113240)
                  });
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(String(e.message), 113240)
                }
                break;
              }

              case "testGetAccessibleGeolocationErrorMess008": {
                try {
                  webView.GeolocationPermissions.getAccessibleGeolocation('123')
                    .then(result => {
                      console.log('result: ' + result);
                      Utils.emitEvent(this.no_error, 113250)
                    }).catch((error: business_error.BusinessError) => {
                    console.log('error: ' + JSON.stringify(error));
                    console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                    Utils.emitEvent(String(error.message), 113250)
                  });
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(String(e.message), 113250)
                }
                break;
              }

              case "testDeleteGeolocationErrorMess001": {
                try {
                  console.log('bxb'+ProtectedResourceType.SENSOR)
                  webView.GeolocationPermissions.deleteGeolocation('');
                  Utils.emitEvent(this.no_error, 113260)
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(e.message, 113260)
                }
                break;
              }

              case "testDeleteGeolocationErrorMess002": {
                try {
                  webView.GeolocationPermissions.deleteGeolocation(',htt://');
                  Utils.emitEvent(this.no_error, 113270)
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(e.message, 113270)
                }
                break;
              }

              case "testDeleteGeolocationErrorMess003": {
                try {
                  webView.GeolocationPermissions.deleteGeolocation('ww.OpenHarmony.cn');
                  Utils.emitEvent(this.no_error, 113280)
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(e.message, 113280)
                }
                break;
              }

              case "testDeleteGeolocationErrorMess004": {
                try {
                  webView.GeolocationPermissions.deleteGeolocation('123');
                  Utils.emitEvent(this.no_error, 113290)
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(e.message, 113290)
                }
                break;
              }

              case "testAllowGeolocationErrorMess001": {
                try {
                  webView.GeolocationPermissions.allowGeolocation('');
                  Utils.emitEvent(this.no_error, 113300)
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(e.message, 113300)
                }
                break;
              }

              case "testAllowGeolocationErrorMess002": {
                try {
                  webView.GeolocationPermissions.allowGeolocation(',htt://');
                  Utils.emitEvent(this.no_error, 113310)
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(e.message, 113310)
                }
                break;
              }

              case "testAllowGeolocationErrorMess003": {
                try {
                  webView.GeolocationPermissions.allowGeolocation('ww.OpenHarmony.cn');
                  Utils.emitEvent(this.no_error, 113320)
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(e.message, 113320)
                }
                break;
              }

              case "testAllowGeolocationErrorMess004": {
                try {
                  webView.GeolocationPermissions.allowGeolocation('123');
                  Utils.emitEvent(this.no_error, 113330)
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(e.message, 113330)
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
        .onPageEnd((event) => {
          console.log('onPageEnd url:' + event.url);
          this.isPageEnd = 1;
        })
    }
  }
}