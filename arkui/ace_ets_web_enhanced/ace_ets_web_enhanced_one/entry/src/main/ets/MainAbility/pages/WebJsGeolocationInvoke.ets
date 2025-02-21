/**
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

import events_emitter from '@ohos.events.emitter';
import Utils from '../../test/Utils';
import webView from '@ohos.web.webview';
import business_error from '@ohos.base';

@Entry
@Component
struct WebJsGeolocationInvoke {
  controller: webView.WebviewController = new webView.WebviewController();
  @State str: string = '';
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = true;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State userAgent: string = "Mozilla/5.0 (Window NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko)" +
  " CHrome/105.0.0.0 Safari/537.36 Edg/105.0.1343.27";
  @State geolocationAccess: boolean = true
  @State invokeType: number = 1
  @State invokeError: string = ''
  @State invokeResult: boolean = false
  @State invokeError2: string = ''
  @State invokeResult2: boolean = false
  @State invokeError3: string = ''
  @State invokeResult3: boolean = false
  @State invokeError4: string = ''
  @State invokeResult4: boolean = false

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
        try {
          webView.GeolocationPermissions.deleteAllGeolocation();
        } catch (error) {
          let e: business_error.BusinessError = error as business_error.BusinessError;
          console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
        }
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("web click").key('WebJsGeolocationInvokeTestButton').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "emitJsGeolocationInvoke001": {
              try {
                this.invokeType = 1
                await Utils.sleep(1000)
                this.controller.loadUrl("resource://rawfile/geo2.html");
                await Utils.sleep(2000)
                this.controller.runJavaScript("requestPosition()", (error) => {
                  if (error) {
                    console.info('requestPosition() return error: ' + error)
                  }
                })
                await Utils.sleep(2000)
                console.log('invokeResult result: ' + this.invokeResult);
                console.log('invokeError result: ' + this.invokeError);
                this.controller.runJavaScript("getGeoResultCode()", (error, result) => {
                  if (error) {
                    console.info('getGeoResultCode() return error: ' + error)
                  }
                  if (result) {
                    console.info('getGeoResultCode() return result: ' + result)
                    if (result != '"1"' && this.invokeError == '' && this.invokeResult) {
                      Utils.emitEvent(true, 70027)
                    }
                  }
                })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitJsGeolocationInvoke002": {
              try {
                this.invokeType = 2
                await Utils.sleep(1000)
                this.controller.loadUrl("resource://rawfile/geo2.html");
                await Utils.sleep(2000)
                this.controller.runJavaScript("requestPosition()", (error) => {
                  if (error) {
                    console.info('requestPosition() return error: ' + error)
                  }
                })
                await Utils.sleep(2000)
                console.log('invokeResult2 result: ' + this.invokeResult2);
                console.log('invokeError2 result: ' + this.invokeError2);
                this.controller.runJavaScript("getGeoResultCode()", (error, result) => {
                  if (error) {
                    console.info('getGeoResultCode() return error: ' + error)
                  }
                  if (result) {
                    console.info('getGeoResultCode() return result: ' + result)
                    if (result != '"1"' && this.invokeError2 == '17100011') {
                      Utils.emitEvent(true, 70029)
                    }
                  }
                })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitJsGeolocationInvoke003": {
              try {
                this.invokeType = 3
                await Utils.sleep(1000)
                this.controller.loadUrl("resource://rawfile/geo2.html");
                await Utils.sleep(2000)
                this.controller.runJavaScript("requestPosition()", (error) => {
                  if (error) {
                    console.info('requestPosition() return error: ' + error)
                  }
                })
                await Utils.sleep(2000)
                console.log('invokeResult3 result: ' + this.invokeResult3);
                console.log('invokeError3 result: ' + this.invokeError3);
                this.controller.runJavaScript("getGeoResultCode()", (error, result) => {
                  if (error) {
                    console.info('getGeoResultCode() return error: ' + error)
                  }
                  if (result) {
                    console.info('getGeoResultCode() return result: ' + result)
                    if (result == '"1"' && this.invokeError3 == '' && !this.invokeResult3) {
                      Utils.emitEvent(true, 70031)
                    }
                  }
                })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitJsGeolocationInvoke004": {
              try {
                this.invokeType = 4
                await Utils.sleep(1000)
                this.controller.loadUrl("resource://rawfile/geo2.html");
                await Utils.sleep(2000)
                this.controller.runJavaScript("requestPosition()", (error) => {
                  if (error) {
                    console.info('requestPosition() return error: ' + error)
                  }
                })
                await Utils.sleep(2000)
                console.log('invokeResult4 result: ' + this.invokeResult4);
                console.log('invokeError4 result: ' + this.invokeError4);
                this.controller.runJavaScript("getGeoResultCode()", (error, result) => {
                  if (error) {
                    console.info('getGeoResultCode() return error: ' + error)
                  }
                  if (result) {
                    console.info('getGeoResultCode() return result: ' + result)
                    if (result == '"1"' && this.invokeError4 == '17100011') {
                      Utils.emitEvent(true, 70033)
                    }
                  }
                })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
          }
        })
      }

      Web({ src: $rawfile('index.html'), controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
        .geolocationAccess(this.geolocationAccess)
        .userAgent(this.userAgent)
        .onGeolocationShow((event) => {
          console.log("onGeolocationShow==>")
          if (event) {
            if (this.invokeType == 1) {
              event.geolocation.invoke(event.origin, true, true)
            } else if (this.invokeType == 2) {
              event.geolocation.invoke(event.origin, true, false)
            } else if (this.invokeType == 3) {
              event.geolocation.invoke(event.origin, false, true)
            } else {
              event.geolocation.invoke(event.origin, false, false)
            }
            webView.GeolocationPermissions.getAccessibleGeolocation(event.origin, (error, result) => {
              if (error) {
                console.log('getAccessibleGeolocationAsync error: ' + JSON.stringify(error));
                if (this.invokeType == 1) {
                  this.invokeError = (error.code + '')
                } else if (this.invokeType == 2) {
                  this.invokeError2 = (error.code + '')
                } else if (this.invokeType == 3) {
                  this.invokeError3 = (error.code + '')
                } else {
                  this.invokeError4 = (error.code + '')
                }

                return
              }
              console.log('getAccessibleGeolocationAsync result: ' + result);
              if (this.invokeType == 1) {
                this.invokeResult = result
              } else if (this.invokeType == 2) {
                this.invokeResult2 = result
              } else if (this.invokeType == 3) {
                this.invokeResult3 = result
              } else {
                this.invokeResult4 = result
              }
            });
          }
        })
        .onGeolocationHide(() => {
          console.log("onGeolocationHide==>")
        })
    }
  }
}