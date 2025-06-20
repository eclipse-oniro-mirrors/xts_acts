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

import Utils from '../../test/Utils.test';
import webView from '@ohos.web.webview';
import business_error from '@ohos.base';
import events_emitter from '@ohos.events.emitter';
import { JsProxyObject } from '../../test/Interfaces';
import image from '@ohos.multimedia.image';
import {waitForAssert, waitForExist} from '../../test/WaitTest.test';
import { URL } from '../../test/Config.test';

@Entry
@Component
struct webConfigCookieSyncCharacter {
  controller: webView.WebviewController = new webView.WebviewController();
  @State str: string = '';
  @State isReceive: number = -1;

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
        this.isReceive = 0;
      }
    }
  }


  build() {
    Column() {
      Row() {
        Button('ConfigCookieSync click').key('webConfigCookieSyncCharacterButton').onClick(async () => {
          await waitForExist(()=>this.isReceive, this.str, 0);
          console.info('key==>' + this.str);
          switch (this.str) {
            case 'emitConfigCookieSyncCharacter001': {
              try {
                webView.WebCookieManager.clearAllCookiesSync();
                webView.WebCookieManager.configCookieSync(URL, 'a=b\nc');
                let value = webView.WebCookieManager.fetchCookieSync(URL);
                console.log(this.str + 'fetchCookieSync cookie = ' + value);
                Utils.emitEvent(value,2025060412);
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                if (error.code == 801) {
                  Utils.emitEvent('a=b',2025060412);
                }
              }
              break;
            }
            case 'emitConfigCookieSyncCharacter002': {
              try {
                webView.WebCookieManager.clearAllCookiesSync();
                webView.WebCookieManager.configCookieSync(URL, 'a=b\tc');
                let value = webView.WebCookieManager.fetchCookieSync(URL);
                console.log(this.str + 'fetchCookieSync cookie = ' + value);
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                if (error.code == 801) {
                  Utils.emitEvent('17100005',2025060413);
                } else {
                  Utils.emitEvent(String(error.code),2025060413);
                }
              }
              break;
            }
            case 'emitConfigCookieSyncCharacter003': {
              try {
                webView.WebCookieManager.clearAllCookiesSync();
                webView.WebCookieManager.configCookieSync(URL, 'a=b\rc');
                let value = webView.WebCookieManager.fetchCookieSync(URL);
                console.log(this.str + 'fetchCookieSync cookie = ' + value);
                Utils.emitEvent(value,2025060414);
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                if (error.code == 801) {
                  Utils.emitEvent('a=b',2025060414);
                }
              }
              break;
            }
            case 'emitConfigCookieSyncCharacter004': {
              try {
                webView.WebCookieManager.clearAllCookiesSync();
                webView.WebCookieManager.configCookieSync(URL, 'a=b\0c');
                let value = webView.WebCookieManager.fetchCookieSync(URL);
                console.log(this.str + 'fetchCookieSync cookie = ' + value);
                Utils.emitEvent(value,2025060415);
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                if (error.code == 801) {
                  Utils.emitEvent('a=b',2025060415);
                }
              }
              break;
            }
            case 'emitConfigCookieSyncIncludeHttpOnlyCharacter001': {
              try {
                webView.WebCookieManager.clearAllCookiesSync();
                webView.WebCookieManager.configCookieSync(URL, 'a=b,HttpOnly\nc', false, true);
                let value = webView.WebCookieManager.fetchCookieSync(URL);
                console.log(this.str + 'fetchCookieSync cookie = ' + value);
                Utils.emitEvent(value,2025060416);
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                if (error.code == 801) {
                  Utils.emitEvent('a=b',20250616);
                }
              }
              break;
            }
            case 'emitConfigCookieSyncIncludeHttpOnlyCharacter002': {
              try {
                webView.WebCookieManager.clearAllCookiesSync();
                webView.WebCookieManager.configCookie(URL, 'a=b,HttpOnly\tc', false, true)
                  .then(() => {
                    console.log('configCookie success!');
                    let value = webView.WebCookieManager.fetchCookieSync(URL);
                    console.log(this.str + 'fetchCookieSync cookie = ' + value);
                  })
                  .catch((error: business_error.BusinessError) => {
                    console.log(this.str + 'error: ' + JSON.stringify(error));
                    if (error.code == 801) {
                      Utils.emitEvent('17100005',2025060417);
                    } else {
                      Utils.emitEvent(String(error.code),2025060417);
                    }
                  })
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                if (error.code == 801) {
                  Utils.emitEvent('17100005',2025060417);
                }
              }
              break;
            }
            case 'emitConfigCookieSyncIncludeHttpOnlyCharacter003': {
              try {
                webView.WebCookieManager.clearAllCookiesSync();
                webView.WebCookieManager.configCookie(URL, 'a=b,HttpOnly\rc', false, true)
                  .then(() => {
                    console.log('configCookie success!');
                    let value = webView.WebCookieManager.fetchCookieSync(URL);
                    console.log(this.str + 'fetchCookieSync cookie = ' + value);
                    Utils.emitEvent(value,2025060418);
                  })
                  .catch((error: business_error.BusinessError) => {
                    console.log(this.str + 'error: ' + JSON.stringify(error));
                    if (error.code == 801) {
                      Utils.emitEvent('a=b',2025060418);
                    }
                  })
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                if (error.code == 801) {
                  Utils.emitEvent('a=b',2025060418);
                }
              }
              break;
            }
            case 'emitConfigCookieSyncIncludeHttpOnlyCharacter004': {
              try {
                webView.WebCookieManager.clearAllCookiesSync();
                webView.WebCookieManager.configCookie(URL, 'a=b,HttpOnly\0c', false, true)
                  .then(() => {
                    console.log('configCookie success!');
                    let value = webView.WebCookieManager.fetchCookieSync(URL);
                    console.log(this.str + 'fetchCookieSync cookie = ' + value);
                    Utils.emitEvent(value,2025060419);
                  })
                  .catch((error: business_error.BusinessError) => {
                    console.log(this.str + 'error: ' + JSON.stringify(error));
                    if (error.code == 801) {
                      Utils.emitEvent('a=b',2025060419);
                    }
                  })
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                if (error.code == 801) {
                  Utils.emitEvent('a=b',2025060419);
                }
              }
              break;
            }
            case 'emitConfigCookieSyncIncognitoCharacter001': {
              try {
                webView.WebCookieManager.clearAllCookiesSync(true);
                webView.WebCookieManager.configCookie(URL, 'a=b\nc', true, false)
                  .then(() => {
                    console.log('configCookie success!');
                    let value = webView.WebCookieManager.fetchCookieSync(URL, true);
                    console.log(this.str + 'fetchCookieSync cookie = ' + value);
                    Utils.emitEvent(value,2025060420);
                  })
                  .catch((error: business_error.BusinessError) => {
                    console.log(this.str + 'error: ' + JSON.stringify(error));
                    if (error.code == 801) {
                      Utils.emitEvent('a=b',2025060420);
                    }
                  })
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                if (error.code == 801) {
                  Utils.emitEvent('a=b',2025060420);
                }
              }
              break;
            }
            case 'emitConfigCookieSyncIncognitoIncludeHttpOnlyCharacter001': {
              try {
                webView.WebCookieManager.clearAllCookiesSync(true);
                webView.WebCookieManager.configCookie(URL, 'a=b,HttpOnly\nc', true, true)
                  .then(() => {
                    console.log('configCookie success!');
                    let value = webView.WebCookieManager.fetchCookieSync(URL, true);
                    console.log(this.str + 'fetchCookieSync cookie = ' + value);
                    Utils.emitEvent(value,2025060421);
                  })
                  .catch((error: business_error.BusinessError) => {
                    console.log(this.str + 'error: ' + JSON.stringify(error));
                    if (error.code == 801) {
                      Utils.emitEvent('a=b',2025060421);
                    }
                  })
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                if (error.code == 801) {
                  Utils.emitEvent('a=b',2025060421);
                }
              }
              break;
            }

          }
        })
      }

      Web({ src: $rawfile('index.html'), controller: this.controller })
    }
  }
}
