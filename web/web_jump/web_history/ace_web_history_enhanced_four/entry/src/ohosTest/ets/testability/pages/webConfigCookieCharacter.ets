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
import { JsProxyObject } from '../../test/Interfaces';
import image from '@ohos.multimedia.image';
import {waitForAssert, waitForExist} from '../../test/WaitTest.test';
import { URL } from '../../test/Config.test';

@Entry
@Component
struct webConfigCookieCharacter {
  controller: webView.WebviewController = new webView.WebviewController();
  @State str: string = '';
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 133450,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(133450)
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
        Button('ConfigCookie click').key('webConfigCookieCharacterButton').onClick(async () => {
          await waitForExist(() => this.isPageEnd, this.str, 0);
          await waitForExist(() => this.isReceive, this.str, 0);
          this.isReceive = -1;
          console.info('key==>' + this.str);
          webView.WebCookieManager.clearAllCookies((error) => {
            if (error) {
              console.log(this.str + 'clearAllCookies error: ' + JSON.stringify(error));
            }
          })
          switch (this.str) {
            case 'emitConfigCookieCharacter001': {
              try {
                webView.WebCookieManager.configCookie(URL, 'a=b\nc')
                  .then(() => {
                    console.log('configCookie success!');
                    let value = webView.WebCookieManager.fetchCookieSync(URL);
                    console.log(this.str + 'fetchCookieSync cookie = ' + value);
                    Utils.emitEvent(value,133460);
                  })
                  .catch((error: business_error.BusinessError) => {
                    console.log(this.str + 'error: ' + JSON.stringify(error));
                    if (error.code == 801) {
                      Utils.emitEvent('a=b',133460);
                    }
                  })
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                if (error.code == 801) {
                  Utils.emitEvent('a=b',133460);
                }
              }
              break;
            }
            case 'emitConfigCookieCharacter002': {
              try {
                webView.WebCookieManager.configCookie(URL, 'a=b\tc')
                  .then(() => {
                    console.log('configCookie success!');
                    let value = webView.WebCookieManager.fetchCookieSync(URL);
                    console.log(this.str + 'fetchCookieSync cookie = ' + value);
                  })
                  .catch((error: business_error.BusinessError) => {
                    console.log(this.str + 'error: ' + JSON.stringify(error));
                    if (error.code == 801) {
                      Utils.emitEvent('17100005',133470);
                    } else {
                      Utils.emitEvent(String(error.code),133470);
                    }
                  })
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                if (error.code == 801) {
                  Utils.emitEvent('17100005',133470);
                }
              }
              break;
            }
            case 'emitConfigCookieCharacter003': {
              try {
                webView.WebCookieManager.configCookie(URL, 'a=b\rc')
                  .then(() => {
                    console.log('configCookie success!');
                    let value = webView.WebCookieManager.fetchCookieSync(URL);
                    console.log(this.str + 'fetchCookieSync cookie = ' + value);
                    Utils.emitEvent(value,133480);
                  })
                  .catch((error: business_error.BusinessError) => {
                    console.log(this.str + 'error: ' + JSON.stringify(error));
                    if (error.code == 801) {
                      Utils.emitEvent('a=b',133480);
                    }
                  })
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                if (error.code == 801) {
                  Utils.emitEvent('a=b',133480);
                }
              }
              break;
            }
            case 'emitConfigCookieCharacter004': {
              try {
                webView.WebCookieManager.configCookie(URL, 'a=b\0c')
                  .then(() => {
                    console.log('configCookie success!');
                    let value = webView.WebCookieManager.fetchCookieSync(URL);
                    console.log(this.str + 'fetchCookieSync cookie = ' + value);
                    Utils.emitEvent(value,133490);
                  })
                  .catch((error: business_error.BusinessError) => {
                    console.log(this.str + 'error: ' + JSON.stringify(error));
                    if (error.code == 801) {
                      Utils.emitEvent('a=b',133490);
                    }
                  })
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                if (error.code == 801) {
                  Utils.emitEvent('a=b',133490);
                }
              }
              break;
            }
            case 'emitConfigCookieIncludeHttpOnlyCharacter001': {
              try {
                webView.WebCookieManager.configCookie(URL, 'a=b,HttpOnly\nc', false, true)
                  .then(() => {
                    console.log('configCookie success!');
                    let value = webView.WebCookieManager.fetchCookieSync(URL);
                    console.log(this.str + 'fetchCookieSync cookie = ' + value);
                    Utils.emitEvent(value,133500);
                  })
                  .catch((error: business_error.BusinessError) => {
                    console.log(this.str + 'error: ' + JSON.stringify(error));
                    if (error.code == 801) {
                      Utils.emitEvent('a=b',133500);
                    }
                  })
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                if (error.code == 801) {
                  Utils.emitEvent('a=b',133500);
                }
              }
              break;
            }
            case 'emitConfigCookieIncludeHttpOnlyCharacter002': {
              try {
                webView.WebCookieManager.configCookie(URL, 'a=b,HttpOnly\tc', false, true)
                  .then(() => {
                    console.log('configCookie success!');
                    let value = webView.WebCookieManager.fetchCookieSync(URL);
                    console.log(this.str + 'fetchCookieSync cookie = ' + value);
                  })
                  .catch((error: business_error.BusinessError) => {
                    console.log(this.str + 'error: ' + JSON.stringify(error));
                    if (error.code == 801) {
                      Utils.emitEvent('17100005',133510);
                    } else {
                      Utils.emitEvent(String(error.code),133510);
                    }
                  })
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                if (error.code == 801) {
                  Utils.emitEvent('17100005',133510);
                }
              }
              break;
            }
            case 'emitConfigCookieIncludeHttpOnlyCharacter003': {
              try {
                webView.WebCookieManager.configCookie(URL, 'a=b,HttpOnly\rc', false, true)
                  .then(() => {
                    console.log('configCookie success!');
                    let value = webView.WebCookieManager.fetchCookieSync(URL);
                    console.log(this.str + 'fetchCookieSync cookie = ' + value);
                    Utils.emitEvent(value,133520);
                  })
                  .catch((error: business_error.BusinessError) => {
                    console.log(this.str + 'error: ' + JSON.stringify(error));
                    if (error.code == 801) {
                      Utils.emitEvent('a=b',133520);
                    }
                  })
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                if (error.code == 801) {
                  Utils.emitEvent('a=b',133520);
                }
              }
              break;
            }
            case 'emitConfigCookieIncludeHttpOnlyCharacter004': {
              try {
                webView.WebCookieManager.configCookie(URL, 'a=b,HttpOnly\0c', false, true)
                  .then(() => {
                    console.log('configCookie success!');
                    let value = webView.WebCookieManager.fetchCookieSync(URL);
                    console.log(this.str + 'fetchCookieSync cookie = ' + value);
                    Utils.emitEvent(value,133530);
                  })
                  .catch((error: business_error.BusinessError) => {
                    console.log(this.str + 'error: ' + JSON.stringify(error));
                    if (error.code == 801) {
                      Utils.emitEvent('a=b',133530);
                    }
                  })
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                if (error.code == 801) {
                  Utils.emitEvent('a=b',133530);
                }
              }
              break;
            }
            case 'emitConfigCookieCallbackCharacter001': {
              try {
                webView.WebCookieManager.configCookie(URL, 'a=b\nc', (error) => {
                  if (error) {
                    console.log(this.str + 'error: ' + JSON.stringify(error));
                    if (error.code == 801) {
                      Utils.emitEvent('a=b',133540);
                    }
                  } else {
                    console.log('configCookie success!');
                    let value = webView.WebCookieManager.fetchCookieSync(URL);
                    console.log(this.str + 'fetchCookieSync cookie = ' + value);
                    Utils.emitEvent(value,133540);
                  }
                })
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                if (error.code == 801) {
                  Utils.emitEvent('a=b',133540);
                }
              }
              break;
            }
            case 'emitConfigCookieIncognitoCharacter001': {
              try {
                webView.WebCookieManager.configCookie(URL, 'a=b\nc', true, false)
                  .then(() => {
                    console.log('configCookie success!');
                    let value = webView.WebCookieManager.fetchCookieSync(URL, true);
                    console.log(this.str + 'fetchCookieSync cookie = ' + value);
                    Utils.emitEvent(value,133550);
                  })
                  .catch((error: business_error.BusinessError) => {
                    console.log(this.str + 'error: ' + JSON.stringify(error));
                    if (error.code == 801) {
                      Utils.emitEvent('a=b',133550);
                    }
                  })
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                if (error.code == 801) {
                  Utils.emitEvent('a=b',133550);
                }
              }
              break;
            }
            case 'emitConfigCookieIncognitoIncludeHttpOnlyCharacter001': {
              try {
                webView.WebCookieManager.configCookie(URL, 'a=b,HttpOnly\nc', true, true)
                  .then(() => {
                    console.log('configCookie success!');
                    let value = webView.WebCookieManager.fetchCookieSync(URL, true);
                    console.log(this.str + 'fetchCookieSync cookie = ' + value);
                    Utils.emitEvent(value,133560);
                  })
                  .catch((error: business_error.BusinessError) => {
                    console.log(this.str + 'error: ' + JSON.stringify(error));
                    if (error.code == 801) {
                      Utils.emitEvent('a=b',133560);
                    }
                  })
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                if (error.code == 801) {
                  Utils.emitEvent('a=b',133560);
                }
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
