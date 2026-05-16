/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import { Entry, Component, Column, Row, Button, ClickEvent, Web, WebBypassVsyncCondition } from "@ohos.arkui.component"
import { State } from "@ohos.arkui.stateManagement"
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Hypium } from '../../../hypium';
import testsuite from '../../src/test/List.test';
import Utils from '../../src/test/Util.test';
import { BusinessError } from '@ohos.base';
import web_webview from '@ohos.web.webview';
import { Callback, RecordData } from '@ohos.base'
import events_emitter from '@ohos.events.emitter';
import { webview } from '@kit.ArkWeb';

export class StringFields {
  public str: string = '';
}

@Entry
@Component
struct Index {
  stringObj: StringFields  = new StringFields ();
  controller: web_webview.WebviewController = new web_webview.WebviewController(undefined);
  @State str: string = "emitFetchCookieSync";
  @State cookieResult: string = "";
  @State no_error: string = 'no error happened';
  @State userAgent: string = "";
  @State errorCode: int = 0;
  @State condition: WebBypassVsyncCondition = WebBypassVsyncCondition.NONE;

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

            case "emitFetchCookiePromise003": {
              try {
                setTimeout(() => {
                  web_webview.WebCookieManager.configCookie('', '', (error, cookie) => {
                    if (error) {
                      console.log("configCookie error: " + JSON.stringify(error));
                    }
                  });
                }, 2000);
                setTimeout(() => {
                  web_webview.WebCookieManager.fetchCookie('')
                    .then((cookie: string) => {
                      console.log("emitFetchCookiePromise cookie = " + cookie);
                      Utils.emitEvent(cookie, 133);
                    })
                    .catch((error) => {
                      console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                      Utils.emitEvent(String(error.code) + String(error.message), 133);
                    });
                }, 2000);
              } catch (error) {
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }

            case "emitSetSocketIdleTimeout001": {
              try {
                console.info('test setSocketIdleTimeout with null');
                web_webview.WebviewController.setSocketIdleTimeout(300);
                Utils.emitEvent('success', 1749101);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 1749101);
              }
              break;
            }

            case "emitSetScrollbarMode002": {
              console.log("ScrollbarMode.FORCE_DISPLAY_SCROLLBAR111:", web_webview.ScrollbarMode.OVERLAY_LAYOUT_SCROLLBAR);
              try {
                web_webview.WebviewController.setScrollbarMode(web_webview.ScrollbarMode.OVERLAY_LAYOUT_SCROLLBAR);
                console.log("ScrollbarMode.FORCE_DISPLAY_SCROLLBAR000:", web_webview.ScrollbarMode.OVERLAY_LAYOUT_SCROLLBAR);
                Utils.emitEvent(web_webview.ScrollbarMode.OVERLAY_LAYOUT_SCROLLBAR, 202512091)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "emitWebBypassVsyncCondition001": {
              try {
                this.condition = WebBypassVsyncCondition.SCROLLBY_FROM_ZERO_OFFSET;
                Utils.emitEvent(WebBypassVsyncCondition.SCROLLBY_FROM_ZERO_OFFSET, 20251209)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "emitClearSessionCookiePromise": {
              try {
                setTimeout(() => {
                  web_webview.WebCookieManager.configCookieSync('https://www.example.com', 'a=b');
                  web_webview.WebCookieManager.clearSessionCookie()
                    .then(() => {
                      console.log("clearSessionCookie success!");
                    })
                },2000)
                setTimeout(() => {
                  this.cookieResult = web_webview.WebCookieManager.fetchCookieSync('https://www.example.com');
                  console.log("emitClearSessionCookiePromise cookie = " + this.cookieResult);
                  Utils.emitEvent(this.cookieResult, 148)
                },2000)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "emitClearSessionCookieCallback": {
              try {
                setTimeout(() => {
                  web_webview.WebCookieManager.configCookieSync('https://www.example.com', 'a=b');
                  web_webview.WebCookieManager.clearSessionCookie((error) => {
                    if (error) {
                      console.log("error: " + error);
                    }
                  })
                },2000)
                setTimeout(() => {
                  this.cookieResult = web_webview.WebCookieManager.fetchCookieSync('https://www.example.com');
                  console.log("emitClearSessionCookieCallback cookie = " + this.cookieResult);
                  Utils.emitEvent(this.cookieResult, 146)
                },2000)
              } catch (error) {
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
              } catch (error) {
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
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "emitClearAllCookiesCallback": {
              try {
                setTimeout(() => {
                  web_webview.WebCookieManager.configCookieSync('https://www.example.com', 'a=b');
                  web_webview.WebCookieManager.clearAllCookies((error) => {
                    if (error) {
                      console.log("error: " + error);
                    }
                  })
                }, 1000);
                setTimeout(() => {
                  this.cookieResult = web_webview.WebCookieManager.fetchCookieSync('https://www.example.com');
                  console.log("emitClearAllCookiesCallback cookie = " + this.cookieResult);
                  Utils.emitEvent(this.cookieResult, 140)
                }, 2000);
              } catch (error) {
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
              } catch (error) {
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
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "emitConfigCookieSync": {
              try {
                web_webview.WebCookieManager.configCookieSync('https://www.example.com', 'a=e');
                this.cookieResult = web_webview.WebCookieManager.fetchCookieSync('https://www.example.com');
                console.log("emitConfigCookieSync cookie = " + this.cookieResult);
                Utils.emitEvent(this.cookieResult, 112)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case 'testFetchCookieIncognitoError007': {
              try {
                web_webview.WebCookieManager.configCookie('', '');
                Utils.emitEvent(this.no_error, 123216);
              } catch (error) {
                const actualCode = String(error.code);
                const actualMsg = String(error.message);
                const actualResult = `${actualCode}${actualMsg}`;
                console.error(`actualResult: ${actualResult}`);
                if (error.code == 401){
                  Utils.emitEvent(actualResult, 123216);
                } else {
                  Utils.emitEvent(actualResult, 123216);
                }
                web_webview.WebCookieManager.clearAllCookies();
              }
              break;
            }

          }
        })
      }

      Web({ src: 'https://www.example.com', controller: this.controller })
        .bypassVsyncCondition(this.condition)
    }
  }
}
