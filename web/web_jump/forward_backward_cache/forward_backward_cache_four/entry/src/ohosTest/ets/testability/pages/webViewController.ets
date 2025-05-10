/**
 * Copyright (c) 2023 iSoftStone Information Technology (Group) Co.,Ltd.
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
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import testsuite from '../../test/List.test';
import Utils from '../../test/Utils';
import web_webview from '@ohos.web.webview';



@Entry
@Component
struct Index {
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  @State str: string = "emitFetchCookieSync";
  @State cookieResult: string = "";

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data?.ACTION != null) {
        this.str = eventData.data?.ACTION;
      }
    }
  }

  aboutToAppear() {
    let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
    let abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments()
    console.info('start run testcase!!!')
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite)
  }

  build() {
    Column() {
      Row() {
        Button("web click").key('webcomponent').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {

            case "emitFetchCookieSync": {
              try {
                web_webview.WebCookieManager.configCookie('https://www.example.com', "a=b", (error) => {
                  if (error) {
                    console.log("error: " + JSON.stringify(error));
                  }
                })
                this.cookieResult = web_webview.WebCookieManager.fetchCookieSync('https://www.example.com');
                console.log("fetchCookieSync cookie = " + this.cookieResult);
                Utils.emitEvent(this.cookieResult, 126)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitFetchCookieCallback": {
              try {
                web_webview.WebCookieManager.configCookie('https://www.example.com', "a=c", (error) => {
                  if (error) {
                    console.log("error: " + JSON.stringify(error));
                  }
                })
                web_webview.WebCookieManager.fetchCookie('https://www.example.com', (error, cookie) => {
                  if (error) {
                    console.log('error: ' + JSON.stringify(error));
                    return;
                  }
                  if (cookie) {
                    console.log('fetchCookie cookie = ' + cookie);
                    Utils.emitEvent(cookie, 128)
                  }
                })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitFetchCookiePromise": {
              try {
                web_webview.WebCookieManager.configCookie('https://www.example.com', "a=d", (error) => {
                  if (error) {
                    console.log("error: " + JSON.stringify(error));
                  }
                })
                web_webview.WebCookieManager.fetchCookie('https://www.example.com')
                  .then(cookie => {
                    console.log("emitFetchCookiePromise cookie = " + cookie);
                    Utils.emitEvent(cookie, 130)
                  })
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
                Utils.emitEvent(this.cookieResult, 132)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitConfigCookieCallback": {
              try {
                web_webview.WebCookieManager.configCookie('https://www.example.com', "a=f", (error) => {
                  if (error) {
                    console.log("error: " + JSON.stringify(error));
                  }
                })
                this.cookieResult = web_webview.WebCookieManager.fetchCookieSync('https://www.example.com');
                console.log("emitConfigCookieCallback cookie = " + this.cookieResult);
                Utils.emitEvent(this.cookieResult, 134)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitConfigCookiePromise": {
              try {
                web_webview.WebCookieManager.configCookie('https://www.example.com', 'a=g')
                  .then(() => {
                    console.log('configCookie success!');
                  })
                this.cookieResult = web_webview.WebCookieManager.fetchCookieSync('https://www.example.com');
                console.log("emitConfigCookiePromise cookie = " + this.cookieResult);
                Utils.emitEvent(this.cookieResult, 136)
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
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitClearAllCookiesPromise": {
              try {
                web_webview.WebCookieManager.configCookieSync('https://www.example.com', 'a=b');
                web_webview.WebCookieManager.clearAllCookies()
                  .then(() => {
                    console.log("clearAllCookies success!");
                  })
                this.cookieResult = web_webview.WebCookieManager.fetchCookieSync('https://www.example.com');
                console.log("emitClearAllCookiesPromise cookie = " + this.cookieResult);
                Utils.emitEvent(this.cookieResult, 142)
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
              } catch (error) {
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
              } catch (error) {
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