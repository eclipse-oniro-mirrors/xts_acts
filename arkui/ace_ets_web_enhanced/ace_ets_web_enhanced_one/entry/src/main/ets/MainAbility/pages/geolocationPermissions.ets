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
import { JsProxyObject } from '../../test/Interfaces';
import business_error from '@ohos.base';

@Entry
@Component
struct geolocationPermissions {
  controller: webView.WebviewController = new webView.WebviewController();
  @State str: string = ""
  @State javaScriptAccess: boolean = true;
  origin: string = "resource://rawfile/"
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
        Button("GeolocationPermissions click").key('GeolocationPermissionsButton').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {

            case "testGetStoredGeolocation001": {
              try {
                webView.GeolocationPermissions.allowGeolocation("file:///")
                webView.GeolocationPermissions.getStoredGeolocation((error, origins) => {
                  if (error) {
                    console.log('getStoredGeolocationAsync error: ' + JSON.stringify(error))
                    return;
                  }
                  if (origins) {
                    let origins_str: string = origins.join()
                    console.log('getStoredGeolocationAsync origins: ' + origins_str);
                    Utils.emitEvent(origins_str, 30060);
                  }
                });
              } catch (error) {
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }

            case "testGetStoredGeolocation002": {
              try {
                webView.GeolocationPermissions.allowGeolocation("file:///")
                webView.GeolocationPermissions.getStoredGeolocation()
                  .then(origins => {
                    let origins_str: string = origins.join();
                    console.log('getStoredGeolocationPromise origins: ' + origins_str);
                    Utils.emitEvent(origins_str, 30061);
                  }).catch((error: business_error.BusinessError) => {
                  console.log('getStoredGeolocationPromise error: ' + JSON.stringify(error));

                });
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }

            case "testGetStoredGeolocation003": {
              try {
                webView.GeolocationPermissions.deleteGeolocation(this.origin)
                await Utils.sleep(1000)
                webView.GeolocationPermissions.getStoredGeolocation((error, origins) => {
                  if (error) {
                    console.log('getStoredGeolocationAsync error: ' + JSON.stringify(error))
                    return;
                  }
                  if (origins) {
                    let origins_str: string = origins.join()
                    console.log('getStoredGeolocationAsync origins: ' + origins_str);
                    Utils.emitEvent(origins_str, 100011);
                  }
                });
              } catch (error) {
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }

            case "testGetStoredGeolocation004": {
              try {
                webView.GeolocationPermissions.deleteGeolocation(this.origin)
                await Utils.sleep(1000)
                webView.GeolocationPermissions.getStoredGeolocation()
                  .then(origins => {
                    let origins_str: string = origins.join();
                    console.log('getStoredGeolocationPromise origins: ' + origins_str);
                    Utils.emitEvent(origins_str, 100012);
                  }).catch((error: business_error.BusinessError) => {
                  console.log('getStoredGeolocationPromise error: ' + JSON.stringify(error));

                });
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }

            case "testDeleteAllGeolocation001": {
              let text: string = '123'
              webView.GeolocationPermissions.allowGeolocation("resource://rawfile/")
              webView.GeolocationPermissions.deleteAllGeolocation()
              webView.GeolocationPermissions.getStoredGeolocation((error, origins) => {
                if (error) {
                  console.log('error:' + JSON.stringify(error));
                  text = origins + ",error ," + JSON.stringify(error);
                  return;
                }
                text = origins.join();
                Utils.emitEvent(text, 30055)
              })
              break;
            }

            case "testGetAccessibleGeolocation001": {
              try {
                webView.GeolocationPermissions.allowGeolocation(this.origin)
                webView.GeolocationPermissions.getAccessibleGeolocation(this.origin, (error, result) => {
                  if (error) {
                    console.log('getAccessibleGeolocation error: ' + JSON.stringify(error))
                    Utils.emitEvent(error, 100008);
                    return;
                  }
                  if (result) {
                    console.log('getAccessibleGeolocationAsync result: ' + result);
                    Utils.emitEvent(result, 100008);
                  }
                });
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(e.code, 100008);
              }
              break;
            }

            case "testGetAccessibleGeolocation002": {
              try {
                webView.GeolocationPermissions.allowGeolocation(this.origin)
                webView.GeolocationPermissions.getAccessibleGeolocation(this.origin)
                  .then(result => {
                    console.log('getAccessibleGeolocationPromise result: ' + result);
                    Utils.emitEvent(result, 100009);
                  }).catch((error: business_error.BusinessError) => {
                  console.log('getAccessibleGeolocationPromise error: ' + JSON.stringify(error));
                  Utils.emitEvent(error, 100009);
                });
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(e.code, 100009);
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
