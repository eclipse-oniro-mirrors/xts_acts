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

import { Button, ClickEvent, Column, Component, Entry, Row, Web, WebDarkMode, $rawfile } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import webView from '@ohos.web.webview';
import { BusinessError, Callback, RecordData } from '@ohos.base';
import events_emitter from '@ohos.events.emitter';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Hypium } from '../../../hypium/index';
import testsuite from '../../src/test/List.test';
import Utils from '../../src/test/Util.test';
import image from '@ohos.multimedia.image';
import emitter from '@ohos.events.emitter';
import { UIContext, Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct webConfigCookieCharacter {
  controller: webView.WebviewController = new webView.WebviewController(undefined);
  @State str: string = '';
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;

  aboutToAppear() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack: Callback<events_emitter.EventData> = (eventData: events_emitter.EventData): void => {
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      const data = eventData.data as Record<string, RecordData>;
      if (data != null && data['ACTION'] != null) {
        let strValue: string = String(data['ACTION']);
        this.str = strValue;
      }
    }
  }


  build() {
    Column() {
      Row() {
        Button('ConfigCookie click').key('webConfigCookieCharacterButton').onClick((e:ClickEvent) => {
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
                webView.WebCookieManager.configCookie("", 'a=b\nc')
                  .then(() => {
                    console.log('configCookie success!');
                    let value = webView.WebCookieManager.fetchCookieSync("");
                    console.log(this.str + 'fetchCookieSync cookie = ' + value);
                    Utils.emitEvent(value,133460);
                  })
                  .catch((error) => {
                    console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                    if (error.code == 801) {
                      Utils.emitEvent('a=b',133460);
                    } else{
                      Utils.emitEvent(error.code,133460);
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
                webView.WebCookieManager.configCookie("https://www.baidu.com", 'a=b\tc')
                  .then(() => {
                    console.log('configCookie success!');
                    let value = webView.WebCookieManager.fetchCookieSync("https://www.baidu.com");
                    console.log(this.str + 'fetchCookieSync cookie = ' + value);
                  })
                  .catch((error) => {
                    console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
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
                webView.WebCookieManager.configCookie("https://www.baidu.com", 'a=b\rc')
                  .then(() => {
                    console.log('configCookie success!');
                    let value = webView.WebCookieManager.fetchCookieSync("https://www.baidu.com");
                    console.log(this.str + 'fetchCookieSync cookie = ' + value);
                    Utils.emitEvent(value,133480);
                  })
                  .catch((error) => {
                    console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
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
                webView.WebCookieManager.configCookie("https://www.baidu.com", 'a=b\0c')
                  .then(() => {
                    console.log('configCookie success!');
                    let value = webView.WebCookieManager.fetchCookieSync("https://www.baidu.com");
                    console.log(this.str + 'fetchCookieSync cookie = ' + value);
                    Utils.emitEvent(value,133490);
                  })
                  .catch((error) => {
                    console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
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
                webView.WebCookieManager.configCookie("", 'a=b,HttpOnly\nc', false, true)
                  .then(() => {
                    console.log('configCookie success!');
                    let value = webView.WebCookieManager.fetchCookieSync("");
                    console.log(this.str + 'fetchCookieSync cookie = ' + value);
                    Utils.emitEvent(value,133500);
                  })
                  .catch((error) => {
                    console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                    if (error.code == 801) {
                      Utils.emitEvent('a=b',133500);
                    } else{
                      Utils.emitEvent(error.code,133500);
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
                webView.WebCookieManager.configCookie("https://www.baidu.com", 'a=b,HttpOnly\tc', false, true)
                  .then(() => {
                    console.log('configCookie success!');
                    let value = webView.WebCookieManager.fetchCookieSync("https://www.baidu.com");
                    console.log(this.str + 'fetchCookieSync cookie = ' + value);
                  })
                  .catch((error) => {
                    console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
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
                webView.WebCookieManager.configCookie("https://www.baidu.com", 'a=b,HttpOnly\rc', false, true)
                  .then(() => {
                    console.log('configCookie success!');
                    let value = webView.WebCookieManager.fetchCookieSync("https://www.baidu.com");
                    console.log(this.str + 'fetchCookieSync cookie = ' + value);
                    Utils.emitEvent(value,133520);
                  })
                  .catch((error) => {
                    console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
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
                webView.WebCookieManager.configCookie("https://www.baidu.com", 'a=b,HttpOnly\0c', false, true)
                  .then(() => {
                    console.log('configCookie success!');
                    let value = webView.WebCookieManager.fetchCookieSync("https://www.baidu.com");
                    console.log(this.str + 'fetchCookieSync cookie = ' + value);
                    Utils.emitEvent(value,133530);
                  })
                  .catch((error) => {
                    console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
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
                webView.WebCookieManager.configCookie("", 'a=b\nc', (error) => {
                  if (error) {
                    console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                    if (error.code == 801) {
                      Utils.emitEvent('a=b',133540);
                    } else{
                      Utils.emitEvent(error.code,133540);
                    }
                  } else {
                    console.log('configCookie success!');
                    let value = webView.WebCookieManager.fetchCookieSync("");
                    console.log(this.str + 'fetchCookieSync cookie = ' + value);
                    Utils.emitEvent(value,133540);
                  }
                })
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                if (error.code == 801) {
                  Utils.emitEvent('a=b',133540);
                } else{
                  Utils.emitEvent(error.code,133540);
                }
              }
              break;
            }
            case 'emitConfigCookieIncognitoCharacter001': {
              try {
                webView.WebCookieManager.configCookie("https://www.baidu.com", 'a=b\nc', true, false)
                  .then(() => {
                    console.log('configCookie success!');
                    let value = webView.WebCookieManager.fetchCookieSync("https://www.baidu.com", true);
                    console.log(this.str + 'fetchCookieSync cookie = ' + value);
                    Utils.emitEvent(value,133550);
                  })
                  .catch((error) => {
                    console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
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
                webView.WebCookieManager.configCookie("https://www.baidu.com", 'a=b,HttpOnly\nc', true, true)
                  .then(() => {
                    console.log('configCookie success!');
                    let value = webView.WebCookieManager.fetchCookieSync("https://www.baidu.com", true);
                    console.log(this.str + 'fetchCookieSync cookie = ' + value);
                    Utils.emitEvent(value,133560);
                  })
                  .catch((error) => {
                    console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
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
            case 'SwitchNextPageStatic' : {
              let uiContext: UIContext = this.getUIContext();
              let router: Router = uiContext.getRouter();
              router.pushUrl({ url: 'pages/webConfigCookieSyncCharacter' })
              console.log('push URL success')
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
