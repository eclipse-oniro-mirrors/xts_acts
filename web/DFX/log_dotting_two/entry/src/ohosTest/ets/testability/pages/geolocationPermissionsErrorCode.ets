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
  responseWeb: WebResourceResponse = new WebResourceResponse()
  @State str: string = ""
  @State javaScriptAccess: boolean = true;
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
        Button("GeolocationPermissionsErrorCode click")
          .key('GeolocationPermissionsErrorCodeButton')
          .onClick(async () => {
            console.info("key==>" + this.str)
            switch (this.str) {

              case "testGetAccessibleGeolocationError001": {
                try {
                  webView.GeolocationPermissions.getAccessibleGeolocation('', (error, result) => {
                    if (error) {
                      console.log('error: ' + JSON.stringify(error));
                      console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                      Utils.emitEvent(String(error.code), 20020)
                      return;
                    }
                    console.log('result: ' + result);
                    Utils.emitEvent(this.no_error, 20020)
                  });
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(String(e.code), 20020)
                }
                break;
              }

              case "testGetAccessibleGeolocationError002": {
                try {
                  webView.GeolocationPermissions.getAccessibleGeolocation(',htt://', (error, result) => {
                    if (error) {
                      console.log('error: ' + JSON.stringify(error));
                      console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                      Utils.emitEvent(String(error.code), 20021)
                      return;
                    }
                    console.log('result: ' + result);
                    Utils.emitEvent(this.no_error, 20021)
                  });
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(String(e.code), 20021)
                }
                break;
              }


              case "testGetAccessibleGeolocationError003": {
                try {
                  webView.GeolocationPermissions.getAccessibleGeolocation('ww.OpenHarmony.cn', (error, result) => {
                    if (error) {
                      console.log('error: ' + JSON.stringify(error));
                      console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                      Utils.emitEvent(String(error.code), 20022)
                      return;
                    }
                    console.log('result: ' + result);
                    Utils.emitEvent(this.no_error, 20022)
                  });
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(String(e.code), 20022)
                }
                break;
              }

              case "testGetAccessibleGeolocationError004": {
                try {
                  webView.GeolocationPermissions.getAccessibleGeolocation('123', (error, result) => {
                    if (error) {
                      console.log('error: ' + JSON.stringify(error));
                      console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                      Utils.emitEvent(String(error.code), 20023)
                      return;
                    }
                    console.log('result: ' + result);
                    Utils.emitEvent(this.no_error, 20023)
                  });
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(String(e.code), 20023)
                }
                break;
              }

              case "testGetAccessibleGeolocationError005": {
                try {
                  webView.GeolocationPermissions.getAccessibleGeolocation('')
                    .then(result => {
                      console.log('result: ' + result);
                      Utils.emitEvent(this.no_error, 20024)
                    }).catch((error: business_error.BusinessError) => {
                    console.log('error: ' + JSON.stringify(error));
                    console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                    Utils.emitEvent(String(error.code), 20024)
                  });
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(String(e.code), 20024)
                }
                break;
              }

              case "testGetAccessibleGeolocationError006": {
                try {
                  webView.GeolocationPermissions.getAccessibleGeolocation(',htt://')
                    .then(result => {
                      console.log('result: ' + result);
                      Utils.emitEvent(this.no_error, 20025)
                    }).catch((error: business_error.BusinessError) => {
                    console.log('error: ' + JSON.stringify(error));
                    console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                    Utils.emitEvent(String(error.code), 20025)
                  });
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(String(e.code), 20025)
                }
                break;
              }

              case "testGetAccessibleGeolocationError007": {
                try {
                  webView.GeolocationPermissions.getAccessibleGeolocation('ww.OpenHarmony.cn')
                    .then(result => {
                      Utils.emitEvent(this.no_error, 20026)
                      console.log('result: ' + result);
                    }).catch((error: business_error.BusinessError) => {
                    console.log('error: ' + JSON.stringify(error));
                    console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                    Utils.emitEvent(String(error.code), 20026)
                  });
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(String(e.code), 20026)
                }
                break;
              }

              case "testGetAccessibleGeolocationError008": {
                try {
                  webView.GeolocationPermissions.getAccessibleGeolocation('123')
                    .then(result => {
                      console.log('result: ' + result);
                      Utils.emitEvent(this.no_error, 20027)
                    }).catch((error: business_error.BusinessError) => {
                    console.log('error: ' + JSON.stringify(error));
                    console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                    Utils.emitEvent(String(error.code), 20027)
                  });
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(String(e.code), 20027)
                }
                break;
              }

              case "testDeleteGeolocationError001": {
                try {
                  webView.GeolocationPermissions.deleteGeolocation('');
                  Utils.emitEvent(this.no_error, 20010)
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(e.code, 20010)
                }
                break;
              }

              case "testDeleteGeolocationError002": {
                try {
                  webView.GeolocationPermissions.deleteGeolocation(',htt://');
                  Utils.emitEvent(this.no_error, 20011)
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(e.code, 20011)
                }
                break;
              }

              case "testDeleteGeolocationError003": {
                try {
                  webView.GeolocationPermissions.deleteGeolocation('ww.OpenHarmony.cn');
                  Utils.emitEvent(this.no_error, 20012)
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(e.code, 20012)
                }
                break;
              }

              case "testDeleteGeolocationError004": {
                try {
                  webView.GeolocationPermissions.deleteGeolocation('123');
                  Utils.emitEvent(this.no_error, 20013)
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(e.code, 20013)
                }
                break;
              }

              case "testAllowGeolocationError001": {
                try {
                  webView.GeolocationPermissions.allowGeolocation('');
                  Utils.emitEvent(this.no_error, 20000)
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(e.code, 20000)
                }
                break;
              }

              case "testAllowGeolocationError002": {
                try {
                  webView.GeolocationPermissions.allowGeolocation(',htt://');
                  Utils.emitEvent(this.no_error, 20001)
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(e.code, 20001)
                }
                break;
              }

              case "testAllowGeolocationError003": {
                try {
                  webView.GeolocationPermissions.allowGeolocation('ww.OpenHarmony.cn');
                  Utils.emitEvent(this.no_error, 20002)
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(e.code, 20002)
                }
                break;
              }

              case "testAllowGeolocationError004": {
                try {
                  webView.GeolocationPermissions.allowGeolocation('123');
                  Utils.emitEvent(this.no_error, 20003)
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(e.code, 20003)
                }
                break;
              }

              case "testGetAccessibleGeolocationErrorMess001": {
                try {
                  webView.GeolocationPermissions.getAccessibleGeolocation('', (error, result) => {
                    if (error) {
                      console.log('error: ' + JSON.stringify(error));
                      console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                      Utils.emitEvent(String(error.message), 11816)
                      return;
                    }
                    console.log('result: ' + result);
                    Utils.emitEvent(this.no_error, 11816)
                  });
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(String(e.message), 11816)
                }
                break;
              }

              case "testGetAccessibleGeolocationErrorMess002": {
                try {
                  webView.GeolocationPermissions.getAccessibleGeolocation(',htt://', (error, result) => {
                    if (error) {
                      console.log('error: ' + JSON.stringify(error));
                      console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                      Utils.emitEvent(String(error.message), 11818)
                      return;
                    }
                    console.log('result: ' + result);
                    Utils.emitEvent(this.no_error, 11818)
                  });
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(String(e.message), 11818)
                }
                break;
              }

              case "testGetAccessibleGeolocationErrorMess003": {
                try {
                  webView.GeolocationPermissions.getAccessibleGeolocation('ww.OpenHarmony.cn', (error, result) => {
                    if (error) {
                      console.log('error: ' + JSON.stringify(error));
                      console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                      Utils.emitEvent(String(error.message), 11820)
                      return;
                    }
                    console.log('result: ' + result);
                    Utils.emitEvent(this.no_error, 11820)
                  });
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(String(e.message), 11820)
                }
                break;
              }

              case "testGetAccessibleGeolocationErrorMess004": {
                try {
                  webView.GeolocationPermissions.getAccessibleGeolocation('123', (error, result) => {
                    if (error) {
                      console.log('error: ' + JSON.stringify(error));
                      console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                      Utils.emitEvent(String(error.message), 11822)
                      return;
                    }
                    console.log('result: ' + result);
                    Utils.emitEvent(this.no_error, 11822)
                  });
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(String(e.message), 11822)
                }
                break;
              }

              case "testGetAccessibleGeolocationErrorMess005": {
                try {
                  webView.GeolocationPermissions.getAccessibleGeolocation('')
                    .then(result => {
                      console.log('result: ' + result);
                      Utils.emitEvent(this.no_error, 11824)
                    }).catch((error: business_error.BusinessError) => {
                    console.log('error: ' + JSON.stringify(error));
                    console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                    Utils.emitEvent(String(error.message), 11824)
                  });
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(String(e.message), 11824)
                }
                break;
              }

              case "testGetAccessibleGeolocationErrorMess006": {
                try {
                  webView.GeolocationPermissions.getAccessibleGeolocation(',htt://')
                    .then(result => {
                      console.log('result: ' + result);
                      Utils.emitEvent(this.no_error, 11826)
                    }).catch((error: business_error.BusinessError) => {
                    console.log('error: ' + JSON.stringify(error));
                    console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                    Utils.emitEvent(String(error.message), 11826)
                  });
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(String(e.message), 11826)
                }
                break;
              }

              case "testGetAccessibleGeolocationErrorMess007": {
                try {
                  webView.GeolocationPermissions.getAccessibleGeolocation('ww.OpenHarmony.cn')
                    .then(result => {
                      Utils.emitEvent(this.no_error, 11828)
                      console.log('result: ' + result);
                    }).catch((error: business_error.BusinessError) => {
                    console.log('error: ' + JSON.stringify(error));
                    console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                    Utils.emitEvent(String(error.message), 11828)
                  });
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(String(e.message), 11828)
                }
                break;
              }

              case "testGetAccessibleGeolocationErrorMess008": {
                try {
                  webView.GeolocationPermissions.getAccessibleGeolocation('123')
                    .then(result => {
                      console.log('result: ' + result);
                      Utils.emitEvent(this.no_error, 11830)
                    }).catch((error: business_error.BusinessError) => {
                    console.log('error: ' + JSON.stringify(error));
                    console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                    Utils.emitEvent(String(error.message), 11830)
                  });
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(String(e.message), 11830)
                }
                break;
              }

              case "testDeleteGeolocationErrorMess001": {
                try {
                  console.log('bxb'+ProtectedResourceType.SENSOR)
                  webView.GeolocationPermissions.deleteGeolocation('');
                  Utils.emitEvent(this.no_error, 11832)
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(e.message, 11832)
                }
                break;
              }

              case "testDeleteGeolocationErrorMess002": {
                try {
                  webView.GeolocationPermissions.deleteGeolocation(',htt://');
                  Utils.emitEvent(this.no_error, 11834)
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(e.message, 11834)
                }
                break;
              }

              case "testDeleteGeolocationErrorMess003": {
                try {
                  webView.GeolocationPermissions.deleteGeolocation('ww.OpenHarmony.cn');
                  Utils.emitEvent(this.no_error, 11836)
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(e.message, 11836)
                }
                break;
              }

              case "testDeleteGeolocationErrorMess004": {
                try {
                  webView.GeolocationPermissions.deleteGeolocation('123');
                  Utils.emitEvent(this.no_error, 11838)
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(e.message, 11838)
                }
                break;
              }

              case "testAllowGeolocationErrorMess001": {
                try {
                  webView.GeolocationPermissions.allowGeolocation('');
                  Utils.emitEvent(this.no_error, 11840)
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(e.message, 11840)
                }
                break;
              }

              case "testAllowGeolocationErrorMess002": {
                try {
                  webView.GeolocationPermissions.allowGeolocation(',htt://');
                  Utils.emitEvent(this.no_error, 11842)
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(e.message, 11842)
                }
                break;
              }

              case "testAllowGeolocationErrorMess003": {
                try {
                  webView.GeolocationPermissions.allowGeolocation('ww.OpenHarmony.cn');
                  Utils.emitEvent(this.no_error, 11844)
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(e.message, 11844)
                }
                break;
              }

              case "testAllowGeolocationErrorMess004": {
                try {
                  webView.GeolocationPermissions.allowGeolocation('123');
                  Utils.emitEvent(this.no_error, 11846)
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent(e.message, 11846)
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

    }
  }
}
