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
struct webConfigCookieCharacter {
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
        Button('ConfigCookie click').key('webConfigCookieCharacterButton').onClick(async () => {
          await waitForExist(()=>this.isReceive, this.str, 0);
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
                    Utils.emitEvent(value,2025060401);
                  })
                  .catch((error: business_error.BusinessError) => {
                    console.log(this.str + 'error: ' + JSON.stringify(error));
                    if (error.code == 801) {
                      Utils.emitEvent('a=b',2025060401);
                    }
                  })
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                if (error.code == 801) {
                  Utils.emitEvent('a=b',2025060401);
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
                      Utils.emitEvent('17100005',2025060402);
                    } else {
                      Utils.emitEvent(String(error.code),2025060402);
                    }
                  })
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                if (error.code == 801) {
                  Utils.emitEvent('17100005',2025060402);
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
                    Utils.emitEvent(value,2025060403);
                  })
                  .catch((error: business_error.BusinessError) => {
                    console.log(this.str + 'error: ' + JSON.stringify(error));
                    if (error.code == 801) {
                      Utils.emitEvent('a=b',2025060403);
                    }
                  })
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                if (error.code == 801) {
                  Utils.emitEvent('a=b',2025060403);
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
                    Utils.emitEvent(value,2025060404);
                  })
                  .catch((error: business_error.BusinessError) => {
                    console.log(this.str + 'error: ' + JSON.stringify(error));
                    if (error.code == 801) {
                      Utils.emitEvent('a=b',2025060404);
                    }
                  })
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                if (error.code == 801) {
                  Utils.emitEvent('a=b',2025060404);
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
                    Utils.emitEvent(value,2025060405);
                  })
                  .catch((error: business_error.BusinessError) => {
                    console.log(this.str + 'error: ' + JSON.stringify(error));
                    if (error.code == 801) {
                      Utils.emitEvent('a=b',2025060405);
                    }
                  })
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                if (error.code == 801) {
                  Utils.emitEvent('a=b',2025060405);
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
                      Utils.emitEvent('17100005',2025060406);
                    } else {
                      Utils.emitEvent(String(error.code),2025060406);
                    }
                  })
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                if (error.code == 801) {
                  Utils.emitEvent('17100005',2025060406);
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
                    Utils.emitEvent(value,2025060407);
                  })
                  .catch((error: business_error.BusinessError) => {
                    console.log(this.str + 'error: ' + JSON.stringify(error));
                    if (error.code == 801) {
                      Utils.emitEvent('a=b',2025060407);
                    }
                  })
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                if (error.code == 801) {
                  Utils.emitEvent('a=b',2025060407);
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
                    Utils.emitEvent(value,2025060408);
                  })
                  .catch((error: business_error.BusinessError) => {
                    console.log(this.str + 'error: ' + JSON.stringify(error));
                    if (error.code == 801) {
                      Utils.emitEvent('a=b',2025060408);
                    }
                  })
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                if (error.code == 801) {
                  Utils.emitEvent('a=b',2025060408);
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
                      Utils.emitEvent('a=b',2025060409);
                    }
                  } else {
                    console.log('configCookie success!');
                    let value = webView.WebCookieManager.fetchCookieSync(URL);
                    console.log(this.str + 'fetchCookieSync cookie = ' + value);
                    Utils.emitEvent(value,2025060409);
                  }
                })
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                if (error.code == 801) {
                  Utils.emitEvent('a=b',2025060409);
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
                    Utils.emitEvent(value,2025060410);
                  })
                  .catch((error: business_error.BusinessError) => {
                    console.log(this.str + 'error: ' + JSON.stringify(error));
                    if (error.code == 801) {
                      Utils.emitEvent('a=b',2025060410);
                    }
                  })
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                if (error.code == 801) {
                  Utils.emitEvent('a=b',2025060410);
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
                    Utils.emitEvent(value,2025060411);
                  })
                  .catch((error: business_error.BusinessError) => {
                    console.log(this.str + 'error: ' + JSON.stringify(error));
                    if (error.code == 801) {
                      Utils.emitEvent('a=b',2025060411);
                    }
                  })
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                if (error.code == 801) {
                  Utils.emitEvent('a=b',2025060411);
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
