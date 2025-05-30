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
import { waitForAssert } from '../../test/WaitTest'
import { URL, URL_INVALID } from '../../test/Config'

@Entry
@Component
struct WebCookieManagerConfigCookie {
  controller: webView.WebviewController = new webView.WebviewController();
  controllerNull: webView.WebviewController = new webView.WebviewController();
  nativePort: webView.WebMessagePort | null = null;
  responseWeb: WebResourceResponse = new WebResourceResponse()
  @State str: string = ''
  @State javaScriptAccess: boolean = true;


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
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
      }
    }
  }


  build() {
    Column() {
      Row() {
        Button('WebCookieManagerConfigCookieTest click').key('WebCookieManagerConfigCookieTestButton').onClick(async () => {
          console.info('key==>' + this.str)
          switch (this.str) {
            case 'testConfigCookieSyncIncludeHttpOnly001': {
              let resultValue: string = '1';
              try {
                webView.WebCookieManager.clearAllCookiesSync(true);
                webView.WebCookieManager.configCookieSync(URL, 'id=123;HttpOnly', true,false)
                await Utils.sleep(1000);
                webView.WebCookieManager.configCookieSync(URL, 'id=456', true,false);
                await Utils.sleep(1000);
                let cookie = webView.WebCookieManager.fetchCookieSync(URL, true)
                console.log('testConfigCookieSyncIncludeHttpOnly001 fetchCookie cookie : ' + cookie);
                resultValue = cookie
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`testConfigCookieSyncIncludeHttpOnly001 ErrorCode: ${e.code},  Message: ${e.message}`);
                resultValue = String(error.code)
              }

              let check = (v1: string, v2: string): boolean => {
                return v1 === v2 ? true:false;
              }
              await waitForAssert(() =>resultValue, check, 'id=123', 2025032201, this.str);

              break;
            }

            case 'testConfigCookieSyncIncludeHttpOnly002': {
              let resultValue: string = '1';
              try {
                webView.WebCookieManager.clearAllCookiesSync(false);
                webView.WebCookieManager.configCookieSync(URL, 'name=alin;HttpOnly', false,false);
                await Utils.sleep(1000);
                webView.WebCookieManager.configCookieSync(URL, 'name=alex', false,false);
                await Utils.sleep(1000);
                let cookie = webView.WebCookieManager.fetchCookieSync(URL, false)
                console.log('testConfigCookieSyncIncludeHttpOnly002 fetchCookie cookie : ' + cookie);
                resultValue = cookie
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`testConfigCookieSyncIncludeHttpOnly002 ErrorCode: ${e.code},  Message: ${e.message}`);
                resultValue = String(error.code)
              }

              let check = (v1: string, v2: string): boolean => {
                return v1 === v2 ? true:false;
              }
              await waitForAssert(() =>resultValue, check, 'name=alin', 2025032202, this.str);

              break;
            }

            case 'testConfigCookieSyncIncludeHttpOnly003': {
              let resultValue: string = '1';
              try {
                webView.WebCookieManager.clearAllCookiesSync(true);
                webView.WebCookieManager.configCookieSync(URL, 'age=8;HttpOnly', true,false);
                await Utils.sleep(1000);
                webView.WebCookieManager.configCookieSync(URL, 'age=9', true,true);
                await Utils.sleep(1000);
                let cookie = webView.WebCookieManager.fetchCookieSync(URL, true)
                console.log('testConfigCookieSyncIncludeHttpOnly003 fetchCookie cookie : ' + cookie);
                resultValue = cookie
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`testConfigCookieSyncIncludeHttpOnly003 ErrorCode: ${e.code},  Message: ${e.message}`);
                resultValue = String(error.code)
              }

              let check = (v1: string, v2: string): boolean => {
                return v1 === v2 ? true:false;
              }
              await waitForAssert(() =>resultValue, check, 'age=9', 2025032203, this.str);

              break;
            }

            case 'testConfigCookieSyncIncludeHttpOnly004': {
              let resultValue: string = '1';
              try {
                webView.WebCookieManager.clearAllCookiesSync(false);
                webView.WebCookieManager.configCookieSync(URL, 'city=nj;HttpOnly', false,false);
                await Utils.sleep(1000);
                webView.WebCookieManager.configCookieSync(URL, 'city=sh', false,true);
                await Utils.sleep(1000);
                let cookie = webView.WebCookieManager.fetchCookieSync(URL, false)
                console.log('testConfigCookieSyncIncludeHttpOnly004 fetchCookie cookie : ' + cookie);
                resultValue = cookie
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`testConfigCookieSyncIncludeHttpOnly004 ErrorCode: ${e.code},  Message: ${e.message}`);
                resultValue = String(error.code)
              }

              let check = (v1: string, v2: string): boolean => {
                return v1 === v2 ? true:false;
              }
              await waitForAssert(() =>resultValue, check, 'city=sh', 2025032204, this.str);

              break;
            }

            case 'testConfigCookieSyncIncludeHttpOnlyErrorCode005': {
              let resultValue: number = 0;
              try {
                webView.WebCookieManager.clearAllCookiesSync(true);
                webView.WebCookieManager.configCookieSync(URL_INVALID, 'id=123;HttpOnly', true,true);
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`testConfigCookieSyncIncludeHttpOnlyErrorCode005 ErrorCode: ${e.code},  Message: ${e.message}`);
                resultValue = error.code
              }

              let check = (v1: number, v2: number): boolean => {
                return v1 == v2 ? true:false;
              }
              await waitForAssert(() =>resultValue, check, 17100002, 2025032205, this.str);
              break;
            }

            case 'testConfigCookieSyncIncludeHttpOnlyErrorCode006': {
              let resultValue: number = 0;
              try {
                webView.WebCookieManager.clearAllCookiesSync(true);
                webView.WebCookieManager.configCookieSync(URL, '', true,true);
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`testConfigCookieSyncIncludeHttpOnlyErrorCode006 ErrorCode: ${e.code},  Message: ${e.message}`);
                resultValue = error.code
              }

              let check = (v1: number, v2: number): boolean => {
                return v1 == v2 ? true:false;
              }
              await waitForAssert(() =>resultValue, check, 17100005, 2025032206, this.str);
              break;
            }

            case 'testConfigCookieIncludeHttpOnly001': {
              let resultValue: string = '1';
              try {
                webView.WebCookieManager.clearAllCookiesSync(true);
                webView.WebCookieManager.configCookie(URL, 'id=123;HttpOnly', true,false)
                  .then(() => {
                    console.log('testConfigCookieIncludeHttpOnly001 configCookie1 success!');
                  })
                  .catch((error: business_error.BusinessError) => {
                    console.error('testConfigCookieIncludeHttpOnly001 configCookie1 error: ' + JSON.stringify(error));
                    resultValue = String(error.code)
                  })
                await Utils.sleep(1000);
                webView.WebCookieManager.configCookie(URL, 'id=456', true,false)
                  .then(() => {
                    console.log('testConfigCookieIncludeHttpOnly001 configCookie2 success!');
                  })
                  .catch((error: business_error.BusinessError) => {
                    console.error('testConfigCookieIncludeHttpOnly001 configCookie2 error: ' + JSON.stringify(error));
                    resultValue = String(error.code)
                  })
                await Utils.sleep(1000);
                webView.WebCookieManager.fetchCookie(URL, true)
                  .then(cookie => {
                    console.log('testConfigCookieIncludeHttpOnly001 fetchCookie cookie : ' + cookie);
                    resultValue = cookie
                  })
                  .catch((error: business_error.BusinessError) => {
                    console.error(`testConfigCookieIncludeHttpOnly001 fetchCookie ErrorCode: ${error.code},  Message: ${error.message}`);
                    resultValue = String(error.code)
                  })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`testConfigCookieIncludeHttpOnly001 ErrorCode: ${e.code},  Message: ${e.message}`);
                resultValue = String(error.code)
              }

              let check = (v1: string, v2: string): boolean => {
                return v1 === v2 ? true:false;
              }
              await waitForAssert(() =>resultValue, check, 'id=123', 2025032207, this.str);

              break;
            }

            case 'testConfigCookieIncludeHttpOnly002': {
              let resultValue: string = '1';
              try {
                webView.WebCookieManager.clearAllCookiesSync(false);
                webView.WebCookieManager.configCookie(URL, 'name=alin;HttpOnly', false,false)
                  .then(() => {
                    console.log('testConfigCookieIncludeHttpOnly002 configCookie1 success!');
                  })
                  .catch((error: business_error.BusinessError) => {
                    console.error('testConfigCookieIncludeHttpOnly002 configCookie1 error: ' + JSON.stringify(error));
                    resultValue = String(error.code)
                  })
                await Utils.sleep(1000);
                webView.WebCookieManager.configCookie(URL, 'name=alex', false,false)
                  .then(() => {
                    console.log('testConfigCookieIncludeHttpOnly002 configCookie2 success!');
                  })
                  .catch((error: business_error.BusinessError) => {
                    console.error('testConfigCookieIncludeHttpOnly002 configCookie2 error: ' + JSON.stringify(error));
                    resultValue = String(error.code)
                  })
                await Utils.sleep(1000);
                webView.WebCookieManager.fetchCookie(URL, false)
                  .then(cookie => {
                    console.log('testConfigCookieIncludeHttpOnly002 fetchCookie cookie : ' + cookie);
                    resultValue = cookie
                  })
                  .catch((error: business_error.BusinessError) => {
                    console.error(`testConfigCookieIncludeHttpOnly002 fetchCookie ErrorCode: ${error.code},  Message: ${error.message}`);
                    resultValue = String(error.code)
                  })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`testConfigCookieIncludeHttpOnly002 ErrorCode: ${e.code},  Message: ${e.message}`);
                resultValue = String(error.code)
              }

              let check = (v1: string, v2: string): boolean => {
                return v1 === v2 ? true:false;
              }
              await waitForAssert(() =>resultValue, check, 'name=alin', 2025032208, this.str);

              break;
            }

            case 'testConfigCookieIncludeHttpOnly003': {
              let resultValue: string = '1';
              try {
                webView.WebCookieManager.clearAllCookiesSync(true);
                webView.WebCookieManager.configCookie(URL, 'age=8;HttpOnly', true,false)
                  .then(() => {
                    console.log('testConfigCookieIncludeHttpOnly003 configCookie1 success!');
                  })
                  .catch((error: business_error.BusinessError) => {
                    console.error('testConfigCookieIncludeHttpOnly003 configCookie1 error: ' + JSON.stringify(error));
                    resultValue = String(error.code)
                  })
                await Utils.sleep(1000);
                webView.WebCookieManager.configCookie(URL, 'age=9', true,true)
                  .then(() => {
                    console.log('testConfigCookieIncludeHttpOnly003 configCookie2 success!');
                  })
                  .catch((error: business_error.BusinessError) => {
                    console.error('testConfigCookieIncludeHttpOnly003 configCookie2 error: ' + JSON.stringify(error));
                    resultValue = String(error.code)
                  })
                await Utils.sleep(1000);
                webView.WebCookieManager.fetchCookie(URL, true)
                  .then(cookie => {
                    console.log('testConfigCookieIncludeHttpOnly003 fetchCookie cookie : ' + cookie);
                    resultValue = cookie
                  })
                  .catch((error: business_error.BusinessError) => {
                    console.error(`testConfigCookieIncludeHttpOnly003 fetchCookie ErrorCode: ${error.code},  Message: ${error.message}`);
                    resultValue = String(error.code)
                  })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`testConfigCookieIncludeHttpOnly003 ErrorCode: ${e.code},  Message: ${e.message}`);
                resultValue = String(error.code)
              }

              let check = (v1: string, v2: string): boolean => {
                return v1 === v2 ? true:false;
              }
              await waitForAssert(() =>resultValue, check, 'age=9', 2025032209, this.str);

              break;
            }

            case 'testConfigCookieIncludeHttpOnly004': {
              let resultValue: string = '1';
              try {
                webView.WebCookieManager.clearAllCookiesSync(false);
                webView.WebCookieManager.configCookie(URL, 'city=nj;HttpOnly', false,false)
                  .then(() => {
                    console.log('testConfigCookieIncludeHttpOnly004 configCookie1 success!');
                  })
                  .catch((error: business_error.BusinessError) => {
                    console.error('testConfigCookieIncludeHttpOnly004 configCookie1 error: ' + JSON.stringify(error));
                    resultValue = String(error.code)
                  })
                await Utils.sleep(1000);
                webView.WebCookieManager.configCookie(URL, 'city=sh', false,true)
                  .then(() => {
                    console.log('testConfigCookieIncludeHttpOnly004 configCookie2 success!');
                  })
                  .catch((error: business_error.BusinessError) => {
                    console.error('testConfigCookieIncludeHttpOnly004 configCookie2 error: ' + JSON.stringify(error));
                    resultValue = String(error.code)
                  })
                await Utils.sleep(1000);
                webView.WebCookieManager.fetchCookie(URL, false)
                  .then(cookie => {
                    console.log('testConfigCookieIncludeHttpOnly004 fetchCookie cookie : ' + cookie);
                    resultValue = cookie
                  })
                  .catch((error: business_error.BusinessError) => {
                    console.error(`testConfigCookieIncludeHttpOnly004 fetchCookie ErrorCode: ${error.code},  Message: ${error.message}`);
                    resultValue = String(error.code)
                  })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`testConfigCookieIncludeHttpOnly004 ErrorCode: ${e.code},  Message: ${e.message}`);
                resultValue = String(error.code)
              }

              let check = (v1: string, v2: string): boolean => {
                return v1 === v2 ? true:false;
              }
              await waitForAssert(() =>resultValue, check, 'city=sh', 2025032210, this.str);

              break;
            }

            case 'testConfigCookieIncludeHttpOnlyErrorCode005': {
              let resultValue: number = 0;
              try {
                webView.WebCookieManager.clearAllCookiesSync(true);
                webView.WebCookieManager.configCookie(URL_INVALID, 'id=123;HttpOnly', true,true)
                  .then(() => {
                    console.log('testConfigCookieIncludeHttpOnlyErrorCode005 configCookie success!');
                  })
                  .catch((error: business_error.BusinessError) => {
                    console.error('testConfigCookieIncludeHttpOnlyErrorCode005 configCookie error: ' + JSON.stringify(error));
                    resultValue = error.code
                  })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`testConfigCookieIncludeHttpOnlyErrorCode005 ErrorCode: ${e.code},  Message: ${e.message}`);
                resultValue = error.code
              }

              let check = (v1: number, v2: number): boolean => {
                return v1 == v2 ? true:false;
              }
              await waitForAssert(() =>resultValue, check, 17100002, 2025032211, this.str);
              break;
            }

            case 'testConfigCookieIncludeHttpOnlyErrorCode006': {
              let resultValue: number = 0;
              try {
                webView.WebCookieManager.clearAllCookiesSync(true);
                webView.WebCookieManager.configCookie(URL, '', true,true)
                  .then(() => {
                    console.log('testConfigCookieIncludeHttpOnlyErrorCode006 configCookie success!');
                  })
                  .catch((error: business_error.BusinessError) => {
                    console.error('testConfigCookieIncludeHttpOnlyErrorCode006 configCookie error: ' + JSON.stringify(error));
                    resultValue = error.code
                  })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`testConfigCookieIncludeHttpOnlyErrorCode006 ErrorCode: ${e.code},  Message: ${e.message}`);
                resultValue = error.code
              }

              let check = (v1: number, v2: number): boolean => {
                return v1 == v2 ? true:false;
              }
              await waitForAssert(() =>resultValue, check, 17100005, 2025032212, this.str);
              break;
            }

            case 'testConfigCookieErrorCode001': {
              let resultValue: number = 0;
              try {
                webView.WebCookieManager.clearAllCookies();
                webView.WebCookieManager.configCookie(URL_INVALID, 'a=b', (error: business_error.BusinessError) => {
                  if (error) {
                    console.error(`testConfigCookieErrorCode001 configCookie ErrorCode: ${error.code},  Message: ${error.message}`);
                    resultValue = error.code
                  }
                })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                resultValue = error.code
              }

              let check = (v1: number, v2: number): boolean => {
                return v1 == v2 ? true:false;
              }
              await waitForAssert(() =>resultValue, check, 17100002, 2025032213, this.str);
              break;
            }

            case 'testConfigCookieErrorCode002': {
              let resultValue: number = 0;
              try {
                webView.WebCookieManager.clearAllCookies();
                webView.WebCookieManager.configCookie(URL, '', (error: business_error.BusinessError) => {
                  if (error) {
                    console.error(`testConfigCookieErrorCode002 configCookie ErrorCode: ${error.code},  Message: ${error.message}`);
                    resultValue = error.code
                  }
                })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`testConfigCookieErrorCode002 ErrorCode: ${e.code},  Message: ${e.message}`);
                resultValue = error.code
              }

              let check = (v1: number, v2: number): boolean => {
                return v1 == v2 ? true:false;
              }
              await waitForAssert(() =>resultValue, check, 17100005, 2025032214, this.str);
              break;
            }

          }
        })
      }

      Web({ src: $rawfile('index.html'), controller: this.controller })
        .javaScriptAccess(true)

    }
  }
}
