/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { Entry, Component, Column, Row, Button, ClickEvent, Web } from "@ohos.arkui.component"
import { State } from "@ohos.arkui.stateManagement"
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Hypium } from '../../../hypium';
import testsuite from '../../src/test/List.test';
import Utils from '../../src/test/Util.test';
import { BusinessError } from '@ohos.base';
import web_webview from '@ohos.web.webview';
import { Callback, RecordData } from '@ohos.base'
import events_emitter from '@ohos.events.emitter';

class StringFields {
  public str: string = '';
}
@Entry
@Component
struct Index {
  stringObj: StringFields  = new StringFields ();
  controller: web_webview.WebviewController = new web_webview.WebviewController(undefined);
  @State str: string = "emitFetchCookieSync";
  @State cookieResult: string = "";

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
        this.stringObj.str = strValue;
        console.info('this.stringObj.str has been updated to: ' + this.stringObj.str);
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("web click").key('webcomponent').onClick((e: ClickEvent) => {
          console.info("key==>" + this.stringObj.str)
          switch (this.stringObj.str) {
            case "emitConfigCookieCallback": {
              try {
                setTimeout(() => {
                web_webview.WebCookieManager.configCookie('https://www.example.com', "a=f", (error) => {
                  if (error) {
                    console.log("error: " + JSON.stringify(error));
                  }
                })
                }, 2000)
                setTimeout(() => {
                this.cookieResult = web_webview.WebCookieManager.fetchCookieSync('https://www.example.com');
                console.log("emitConfigCookieCallback cookie = " + this.cookieResult);
                Utils.emitEvent(this.cookieResult, 134);
                web_webview.WebCookieManager.clearAllCookies();
                }, 3000)
              } catch (error:BusinessError) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitFetchCookieCallback": {
              try {
                setTimeout(() => {
                web_webview.WebCookieManager.configCookie('https://www.example.com', "a=c", (error) => {
                  if (error) {
                    console.log("error: " + JSON.stringify(error));
                  }
                })
                }, 2000)
                setTimeout(() => {
                web_webview.WebCookieManager.fetchCookie('https://www.example.com', (error, cookie) => {
                  if (error) {
                    console.log('error: ' + JSON.stringify(error));
                    return;
                  }
                  if (cookie) {
                    console.log('fetchCookie cookie = ' + cookie);
                    Utils.emitEvent(cookie, 128)
                    web_webview.WebCookieManager.clearAllCookies();
                  }
                })
                }, 3000)
              } catch (error:BusinessError) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitFetchCookiePromise": {
              try {
                setTimeout(() => {
                web_webview.WebCookieManager.configCookie('https://www.example.com', "a=d", (error) => {
                  if (error) {
                    console.log("error: " + JSON.stringify(error));
                  }
                })
                }, 2000)
                setTimeout(() => {
                web_webview.WebCookieManager.fetchCookie('https://www.example.com')
                  .then((cookie:string) => {
                    console.log("emitFetchCookiePromise cookie = " + cookie);
                    Utils.emitEvent(cookie, 130)
                  })
                }, 4000)
              } catch (error:BusinessError) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitConfigCookieSync": {
              try {
                web_webview.WebCookieManager.configCookieSync('https://www.example.com', 'a=e');
                this.cookieResult = web_webview.WebCookieManager.fetchCookieSync('https://www.example.com');
                console.log("emitConfigCookieSync cookie = " + this.cookieResult);
                Utils.emitEvent(this.cookieResult, 132)
              } catch (error:BusinessError) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitConfigCookiePromise": {
              try {
                setTimeout(() => {
                web_webview.WebCookieManager.configCookie('https://www.example.com', 'a=g')
                  .then(() => {
                    console.log('configCookie success!');
                  })
                }, 2000)
                setTimeout(() => {
                this.cookieResult = web_webview.WebCookieManager.fetchCookieSync('https://www.example.com');
                console.log("emitConfigCookiePromise cookie = " + this.cookieResult);
                Utils.emitEvent(this.cookieResult, 136)
                }, 3000)
              } catch (error:BusinessError) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitClearAllCookiesSync": {
              try {
                web_webview.WebCookieManager.configCookieSync('https://www.example.com', 'a=b');
                web_webview.WebCookieManager.clearAllCookiesSync();
                this.cookieResult = web_webview.WebCookieManager.fetchCookieSync('https://www.example.com');
                console.log("emitClearAllCookiesSync cookie = " + this.cookieResult);
                Utils.emitEvent(this.cookieResult, 138)
              } catch (error:BusinessError) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitClearAllCookiesCallback": {
              try {
                web_webview.WebCookieManager.configCookieSync('https://www.example.com', 'a=b');
                web_webview.WebCookieManager.clearAllCookies((error) => {
                  if (error) {
                    console.log("error: " + error);
                  }
                })
                this.cookieResult = web_webview.WebCookieManager.fetchCookieSync('https://www.example.com');
                console.log("emitClearAllCookiesCallback cookie = " + this.cookieResult);
                Utils.emitEvent(this.cookieResult, 140)
              } catch (error:BusinessError) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitClearAllCookiesPromise": {
              try {
                setTimeout(() => {
                web_webview.WebCookieManager.configCookieSync('https://www.example.com', 'a=b');
                web_webview.WebCookieManager.clearAllCookies()
                  .then(() => {
                  console.log("clearAllCookies success!");
                })
                }, 2000)
                setTimeout(() => {
                this.cookieResult = web_webview.WebCookieManager.fetchCookieSync('https://www.example.com');
                console.log("emitClearAllCookiesPromise cookie = " + this.cookieResult);
                Utils.emitEvent(this.cookieResult, 142)
                }, 4000)
              } catch (error:BusinessError) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitClearSessionCookieSync": {
              try {
                web_webview.WebCookieManager.configCookieSync('https://www.example.com', 'a=b');
                web_webview.WebCookieManager.clearSessionCookieSync();
                this.cookieResult = web_webview.WebCookieManager.fetchCookieSync('https://www.example.com');
                console.log("emitClearSessionCookieSync cookie = " + this.cookieResult);
                Utils.emitEvent(this.cookieResult, 144)
              } catch (error:BusinessError) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitClearSessionCookieCallback": {
              try {
                web_webview.WebCookieManager.configCookieSync('https://www.example.com', 'a=b');
                web_webview.WebCookieManager.clearSessionCookie((error) => {
                  if (error) {
                    console.log("error: " + error);
                  }
                })
                this.cookieResult = web_webview.WebCookieManager.fetchCookieSync('https://www.example.com');
                console.log("emitClearSessionCookieCallback cookie = " + this.cookieResult);
                Utils.emitEvent(this.cookieResult, 146)
              } catch (error:BusinessError) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitClearSessionCookiePromise": {
              try {
                web_webview.WebCookieManager.configCookieSync('https://www.example.com', 'a=b');
                web_webview.WebCookieManager.clearSessionCookie()
                  .then(() => {
                    console.log("clearSessionCookie success!");
                  })
                this.cookieResult = web_webview.WebCookieManager.fetchCookieSync('https://www.example.com');
                console.log("emitClearSessionCookiePromise cookie = " + this.cookieResult);
                Utils.emitEvent(this.cookieResult, 148)
              } catch (error:BusinessError) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

          }
        })
      }

      Web({ src: 'www.example.com', controller: this.controller })

    }
  }
}
