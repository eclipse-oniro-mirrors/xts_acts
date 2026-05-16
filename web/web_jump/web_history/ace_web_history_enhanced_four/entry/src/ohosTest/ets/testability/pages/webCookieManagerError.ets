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

import Utils from '../../test/Utils.test';
import webView from '@ohos.web.webview';
import business_error from '@ohos.base';
import events_emitter from '@ohos.events.emitter';
import { waitForExist } from '../../test/WaitTest.test';
import { URL } from '../../test/Config.test';

@Entry
@Component
struct webCookieManagerError {
  controller: webView.WebviewController = new webView.WebviewController();
  @State str: string = '';
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 134000,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(134000)
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

  build() {
    Column() {
      Row() {
        Button('CookieManager Error click').key('webCookieManagerErrorButton').onClick(async () => {
          await waitForExist(() => this.isPageEnd, this.str, 0, 1000);
          await waitForExist(() => this.isReceive, this.str, 0, 1000);
          this.isReceive = -1;
          console.info('key==>' + this.str);
          switch (this.str) {
            case 'emitGetCookieError001': {
              try {
                let value = webView.WebCookieManager.getCookie(null);
                console.log(this.str + 'getCookie cookie = ' + value);
                Utils.emitEvent('no_error', 134011);
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                console.log(this.str + 'errorCode type: ' + typeof(error.code));
                Utils.emitEvent(error.code, 134011);
              }
              break;
            }
            case 'emitGetCookieError002': {
              try {
                let value = webView.WebCookieManager.getCookie(undefined);
                console.log(this.str + 'getCookie cookie = ' + value);
                Utils.emitEvent('no_error', 134012);
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                console.log(this.str + 'errorCode type: ' + typeof(error.code));
                Utils.emitEvent(error.code, 134012);
              }
              break;
            }
            case 'emitGetCookieError003': {
              try {
                let value = webView.WebCookieManager.getCookie('');
                console.log(this.str + 'getCookie cookie = ' + value);
                Utils.emitEvent('no_error', 134013);
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                console.log(this.str + 'errorCode type: ' + typeof(error.code));
                Utils.emitEvent(error.code, 134013);
              }
              break;
            }
            case 'emitFetchCookieSyncError001': {
              try {
                let value = webView.WebCookieManager.fetchCookieSync(null, true);
                console.log(this.str + 'fetchCookieSync cookie = ' + value);
                Utils.emitEvent('no_error', 134014);
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                console.log(this.str + 'errorCode type: ' + typeof(error.code));
                Utils.emitEvent(error.code, 134014);
              }
              break;
            }
            case 'emitFetchCookieSyncError002': {
              try {
                let value = webView.WebCookieManager.fetchCookieSync(undefined, true);
                console.log(this.str + 'fetchCookieSync cookie = ' + value);
                Utils.emitEvent('no_error', 134015);
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                console.log(this.str + 'errorCode type: ' + typeof(error.code));
                Utils.emitEvent(error.code, 134015);
              }
              break;
            }
            case 'emitFetchCookiePromiseUrlError001': {
              try {
                webView.WebCookieManager.fetchCookie(null)
                  .then((value: string) => {
                    console.log(this.str + 'fetchCookie cookie = ' + value);
                    Utils.emitEvent('no_error', 134016);
                  })
                  .catch((error: business_error.BusinessError) => {
                    console.log(this.str + 'error: ' + JSON.stringify(error));
                    console.log(this.str + 'errorCode type: ' + typeof(error.code));
                    Utils.emitEvent(error.code, 134016);
                  })
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(error.code, 134016);
              }
              break;
            }
            case 'emitFetchCookiePromiseUrlError002': {
              try {
                webView.WebCookieManager.fetchCookie(undefined)
                  .then((value: string) => {
                    console.log(this.str + 'fetchCookie cookie = ' + value);
                    Utils.emitEvent('no_error', 134017);
                  })
                  .catch((error: business_error.BusinessError) => {
                    console.log(this.str + 'error: ' + JSON.stringify(error));
                    console.log(this.str + 'errorCode type: ' + typeof(error.code));
                    Utils.emitEvent(error.code, 134017);
                  })
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(error.code, 134017);
              }
              break;
            }
            case 'emitFetchCookieIncognitoPromiseError001': {
              try {
                webView.WebCookieManager.fetchCookie(null, true)
                  .then((value: string) => {
                    console.log(this.str + 'fetchCookie cookie = ' + value);
                    Utils.emitEvent('no_error', 134018);
                  })
                  .catch((error: business_error.BusinessError) => {
                    console.log(this.str + 'error: ' + JSON.stringify(error));
                    console.log(this.str + 'errorCode type: ' + typeof(error.code));
                    Utils.emitEvent(error.code, 134018);
                  })
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(error.code, 134018);
              }
              break;
            }
            case 'emitFetchCookieIncognitoPromiseError002': {
              try {
                webView.WebCookieManager.fetchCookie(undefined, true)
                  .then((value: string) => {
                    console.log(this.str + 'fetchCookie cookie = ' + value);
                    Utils.emitEvent('no_error', 134019);
                  })
                  .catch((error: business_error.BusinessError) => {
                    console.log(this.str + 'error: ' + JSON.stringify(error));
                    console.log(this.str + 'errorCode type: ' + typeof(error.code));
                    Utils.emitEvent(error.code, 134019);
                  })
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(error.code, 134019);
              }
              break;
            }
            case 'emitFetchCookieCallbackUrlError001': {
              try {
                webView.WebCookieManager.fetchCookie(null, (error, value) => {
                  if (error) {
                    console.log(this.str + 'error: ' + JSON.stringify(error));
                    console.log(this.str + 'errorCode type: ' + typeof(error.code));
                    Utils.emitEvent(error.code, 134020);
                  } else {
                    console.log(this.str + 'fetchCookie cookie = ' + value);
                    Utils.emitEvent('no_error', 134020);
                  }
                })
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(error.code, 134020);
              }
              break;
            }
            case 'emitFetchCookieCallbackUrlError002': {
              try {
                webView.WebCookieManager.fetchCookie(undefined, (error, value) => {
                  if (error) {
                    console.log(this.str + 'error: ' + JSON.stringify(error));
                    console.log(this.str + 'errorCode type: ' + typeof(error.code));
                    Utils.emitEvent(error.code, 134021);
                  } else {
                    console.log(this.str + 'fetchCookie cookie = ' + value);
                    Utils.emitEvent('no_error', 134021);
                  }
                })
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(error.code, 134021);
              }
              break;
            }
            case 'emitSetCookieUrlError001': {
              try {
                webView.WebCookieManager.setCookie(null, 'a=b');
                console.log(this.str + 'setCookie success');
                Utils.emitEvent('no_error', 134022);
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                console.log(this.str + 'errorCode type: ' + typeof(error.code));
                Utils.emitEvent(error.code, 134022);
              }
              break;
            }
            case 'emitSetCookieUrlError002': {
              try {
                webView.WebCookieManager.setCookie(undefined, 'a=b');
                console.log(this.str + 'setCookie success');
                Utils.emitEvent('no_error', 134023);
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                console.log(this.str + 'errorCode type: ' + typeof(error.code));
                Utils.emitEvent(error.code, 134023);
              }
              break;
            }
            case 'emitSetCookieUrlError003': {
              try {
                webView.WebCookieManager.setCookie('', 'a=b');
                console.log(this.str + 'setCookie success');
                Utils.emitEvent('no_error', 134024);
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                console.log(this.str + 'errorCode type: ' + typeof(error.code));
                Utils.emitEvent(error.code, 134024);
              }
              break;
            }
            case 'emitSetCookieValueError001': {
              try {
                webView.WebCookieManager.setCookie(URL, null);
                console.log(this.str + 'setCookie success');
                Utils.emitEvent('no_error', 134025);
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                console.log(this.str + 'errorCode type: ' + typeof(error.code));
                Utils.emitEvent(error.code, 134025);
              }
              break;
            }
            case 'emitSetCookieValueError002': {
              try {
                webView.WebCookieManager.setCookie(URL, undefined);
                console.log(this.str + 'setCookie success');
                Utils.emitEvent('no_error', 134026);
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                console.log(this.str + 'errorCode type: ' + typeof(error.code));
                Utils.emitEvent(error.code, 134026);
              }
              break;
            }
            case 'emitSetCookieValueError003': {
              try {
                webView.WebCookieManager.setCookie(URL, '');
                console.log(this.str + 'setCookie success');
                Utils.emitEvent('no_error', 134027);
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                console.log(this.str + 'errorCode type: ' + typeof(error.code));
                Utils.emitEvent(error.code, 134027);
              }
              break;
            }
            case 'emitConfigCookieSyncUrlError001': {
              try {
                webView.WebCookieManager.configCookieSync(null, 'a=b', false, false);
                console.log(this.str + 'configCookieSync success');
                Utils.emitEvent('no_error', 134028);
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                console.log(this.str + 'errorCode type: ' + typeof(error.code));
                Utils.emitEvent(error.code, 134028);
              }
              break;
            }
            case 'emitConfigCookieSyncUrlError002': {
              try {
                webView.WebCookieManager.configCookieSync(undefined, 'a=b', true, false);
                console.log(this.str + 'configCookieSync success');
                Utils.emitEvent('no_error', 134029);
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                console.log(this.str + 'errorCode type: ' + typeof(error.code));
                Utils.emitEvent(error.code, 134029);
              }
              break;
            }
            case 'emitConfigCookieSyncUrlError003': {
              try {
                webView.WebCookieManager.configCookieSync('', 'a=b', true, true);
                console.log(this.str + 'configCookieSync success');
                Utils.emitEvent('no_error', 134030);
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                console.log(this.str + 'errorCode type: ' + typeof(error.code));
                Utils.emitEvent(error.code, 134030);
              }
              break;
            }
            case 'emitConfigCookieSyncValueError001': {
              try {
                webView.WebCookieManager.configCookieSync(URL, null, false, false);
                console.log(this.str + 'configCookieSync success');
                Utils.emitEvent('no_error', 134031);
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                console.log(this.str + 'errorCode type: ' + typeof(error.code));
                Utils.emitEvent(error.code, 134031);
              }
              break;
            }
            case 'emitConfigCookieSyncValueError002': {
              try {
                webView.WebCookieManager.configCookieSync(URL, undefined, false, true);
                console.log(this.str + 'configCookieSync success');
                Utils.emitEvent('no_error', 134032);
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                console.log(this.str + 'errorCode type: ' + typeof(error.code));
                Utils.emitEvent(error.code, 134032);
              }
              break;
            }
            case 'emitConfigCookiePromiseUrlError001': {
              try {
                webView.WebCookieManager.configCookie(null, 'a=e')
                  .then(() => {
                    console.log('configCookie success!');
                    Utils.emitEvent('no_error', 134033);
                  })
                  .catch((error: business_error.BusinessError) => {
                    console.log('error: ' + JSON.stringify(error));
                    console.log(this.str + 'errorCode type: ' + typeof(error.code));
                    Utils.emitEvent(error.code, 134033);
                  })
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(error.code, 134033);
              }
              break;
            }
            case 'emitConfigCookiePromiseUrlError002': {
              try {
                webView.WebCookieManager.configCookie(undefined, 'a=e')
                  .then(() => {
                    console.log('configCookie success!');
                    Utils.emitEvent('no_error', 134034);
                  })
                  .catch((error: business_error.BusinessError) => {
                    console.log('error: ' + JSON.stringify(error));
                    console.log(this.str + 'errorCode type: ' + typeof(error.code));
                    Utils.emitEvent(error.code, 134034);
                  })
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(error.code, 134034);
              }
              break;
            }
            case 'emitConfigCookiePromiseValueError001': {
              try {
                webView.WebCookieManager.configCookie(URL, null)
                  .then(() => {
                    console.log('configCookie success!');
                    Utils.emitEvent('no_error', 134035);
                  })
                  .catch((error: business_error.BusinessError) => {
                    console.log('error: ' + JSON.stringify(error));
                    console.log(this.str + 'errorCode type: ' + typeof(error.code));
                    Utils.emitEvent(error.code, 134035);
                  })
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(error.code, 134035);
              }
              break;
            }
            case 'emitConfigCookiePromiseValueError002': {
              try {
                webView.WebCookieManager.configCookie(URL, undefined)
                  .then(() => {
                    console.log('configCookie success!');
                    Utils.emitEvent('no_error', 134036);
                  })
                  .catch((error: business_error.BusinessError) => {
                    console.log('error: ' + JSON.stringify(error));
                    console.log(this.str + 'errorCode type: ' + typeof(error.code));
                    Utils.emitEvent(error.code, 134036);
                  })
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(error.code, 134036);
              }
              break;
            }
            case 'emitConfigCookiePromiseValueError003': {
              try {
                webView.WebCookieManager.configCookie(URL, '')
                  .then(() => {
                    console.log('configCookie success!');
                    Utils.emitEvent('no_error', 134037);
                  })
                  .catch((error: business_error.BusinessError) => {
                    console.log('error: ' + JSON.stringify(error));
                    console.log(this.str + 'errorCode type: ' + typeof(error.code));
                    Utils.emitEvent(error.code, 134037);
                  })
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(error.code, 134037);
              }
              break;
            }
            case 'emitConfigCookieIncludeHttpOnlyUrlError001': {
              try {
                webView.WebCookieManager.configCookie(null, 'a=b', false, false)
                  .then(() => {
                    console.info('configCookie success!');
                    Utils.emitEvent('no_error', 134038);
                  })
                  .catch((error: BusinessError) => {
                    console.info('error: ' + JSON.stringify(error));
                    console.log(this.str + 'errorCode type: ' + typeof(error.code));
                    Utils.emitEvent(error.code, 134038);
                  })
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(error.code, 134038);
              }
              break;
            }
            case 'emitConfigCookieIncludeHttpOnlyUrlError002': {
              try {
                webView.WebCookieManager.configCookie(undefined, 'a=b', true, false)
                  .then(() => {
                    console.info('configCookie success!');
                    Utils.emitEvent('no_error', 134039);
                  })
                  .catch((error: BusinessError) => {
                    console.info('error: ' + JSON.stringify(error));
                    console.log(this.str + 'errorCode type: ' + typeof(error.code));
                    Utils.emitEvent(error.code, 134039);
                  })
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(error.code, 134039);
              }
              break;
            }
            case 'emitConfigCookieIncludeHttpOnlyUrlError003': {
              try {
                webView.WebCookieManager.configCookie('', 'a=b', true, true)
                  .then(() => {
                    console.info('configCookie success!');
                    Utils.emitEvent('no_error', 134040);
                  })
                  .catch((error: BusinessError) => {
                    console.info('error: ' + JSON.stringify(error));
                    console.log(this.str + 'errorCode type: ' + typeof(error.code));
                    Utils.emitEvent(error.code, 134040);
                  })
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(error.code, 134040);
              }
              break;
            }
            case 'emitConfigCookieIncludeHttpOnlyValueError001': {
              try {
                webView.WebCookieManager.configCookie(URL, null, true, false)
                  .then(() => {
                    console.info('configCookie success!');
                    Utils.emitEvent('no_error', 134041);
                  })
                  .catch((error: BusinessError) => {
                    console.info('error: ' + JSON.stringify(error));
                    console.log(this.str + 'errorCode type: ' + typeof(error.code));
                    Utils.emitEvent(error.code, 134041);
                  })
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(error.code, 134041);
              }
              break;
            }
            case 'emitConfigCookieIncludeHttpOnlyValueError002': {
              try {
                webView.WebCookieManager.configCookie(URL, undefined, true, false)
                  .then(() => {
                    console.info('configCookie success!');
                    Utils.emitEvent('no_error', 134042);
                  })
                  .catch((error: BusinessError) => {
                    console.info('error: ' + JSON.stringify(error));
                    console.log(this.str + 'errorCode type: ' + typeof(error.code));
                    Utils.emitEvent(error.code, 134042);
                  })
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(error.code, 134042);
              }
              break;
            }
            case 'emitConfigCookieIncludeHttpOnlyValueError003': {
              try {
                webView.WebCookieManager.configCookie(URL, '', true, false)
                  .then(() => {
                    console.info('configCookie success!');
                    Utils.emitEvent('no_error', 134043);
                  })
                  .catch((error: BusinessError) => {
                    console.info('error: ' + JSON.stringify(error));
                    console.log(this.str + 'errorCode type: ' + typeof(error.code));
                    Utils.emitEvent(error.code, 134043);
                  })
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(error.code, 134043);
              }
              break;
            }
            case 'emitConfigCookieCallbackUrlError001': {
              try {
                webView.WebCookieManager.configCookie(null, 'a=d', (error) => {
                  if (error) {
                    console.log('error: ' + JSON.stringify(error));
                    console.log(this.str + 'errorCode type: ' + typeof(error.code));
                    Utils.emitEvent(error.code, 134044);
                  }
                })
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(error.code, 134044);
              }
              break;
            }
            case 'emitConfigCookieCallbackUrlError002': {
              try {
                webView.WebCookieManager.configCookie(undefined, 'a=d', (error) => {
                  if (error) {
                    console.log('error: ' + JSON.stringify(error));
                    console.log(this.str + 'errorCode type: ' + typeof(error.code));
                    Utils.emitEvent(error.code, 134045);
                  }
                })
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(error.code, 134045);
              }
              break;
            }
            case 'emitConfigCookieCallbackValueError001': {
              try {
                webView.WebCookieManager.configCookie(URL, null, (error) => {
                  if (error) {
                    console.log('error: ' + JSON.stringify(error));
                    console.log(this.str + 'errorCode type: ' + typeof(error.code));
                    Utils.emitEvent(error.code, 134046);
                  }
                })
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(error.code, 134046);
              }
              break;
            }
            case 'emitConfigCookieCallbackValueError002': {
              try {
                webView.WebCookieManager.configCookie(URL, undefined, (error) => {
                  if (error) {
                    console.log('error: ' + JSON.stringify(error));
                    console.log(this.str + 'errorCode type: ' + typeof(error.code));
                    Utils.emitEvent(error.code, 134047);
                  }
                })
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(error.code, 134047);
              }
              break;
            }
            case 'emitConfigCookieCallbackValueError003': {
              try {
                webView.WebCookieManager.configCookie(URL, '', (error) => {
                  if (error) {
                    console.log('error: ' + JSON.stringify(error));
                    console.log(this.str + 'errorCode type: ' + typeof(error.code));
                    Utils.emitEvent(error.code, 134048);
                  }
                })
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(error.code, 134048);
              }
              break;
            }
          }
        })
      }
      Web({ src: $rawfile('index.html'), controller: this.controller })
        .onPageEnd((event) => {
          console.log('web pageEnd==>' + event.url);
          this.isPageEnd = 0;
        })
    }
  }
}
