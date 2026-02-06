/**
 * Copyright (c) 2023-2025 Huawei Device Co., Ltd.
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
import { waitForExist } from '../../test/WaitTest.test';
import { Constants } from '../../test/Constants.test';

@Entry
@Component
struct Index {
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  @State str: string = 'emitFetchCookieSync';
  @State cookieResult: string = '';
  @State isComplete: number = -1;
  @State isReceive: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 137200,
      priority: events_emitter.EventPriority.LOW,
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(137200)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data?.ACTION != null) {
        this.str = eventData.data?.ACTION;
        this.isReceive = 0;
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
        Button('web click').key('webcomponent').onClick(async () => {
          await waitForExist(() => this.isComplete, this.str, 0);
          await waitForExist(() => this.isReceive, this.str, 0);
          this.isReceive = -1;

          console.info('key==>' + this.str)
          switch (this.str) {

            case 'emitFetchCookieSync': {
              try {
                web_webview.WebCookieManager.configCookie(Constants.EXAMPLE_URL, 'a=b', (error) => {
                  if (error) {
                    console.log('error: ' + JSON.stringify(error));
                  }
                })
                this.cookieResult = web_webview.WebCookieManager.fetchCookieSync(Constants.EXAMPLE_URL);
                console.log('fetchCookieSync cookie = ' + this.cookieResult);
                Utils.emitEvent(this.cookieResult, 137210)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'emitFetchCookieCallback': {
              try {
                web_webview.WebCookieManager.configCookie(Constants.EXAMPLE_URL, 'a=c', (error) => {
                  if (error) {
                    console.log('error: ' + JSON.stringify(error));
                  }
                })
                web_webview.WebCookieManager.fetchCookie(Constants.EXAMPLE_URL, (error, cookie) => {
                  if (error) {
                    console.log('error: ' + JSON.stringify(error));
                    return;
                  }
                  if (cookie) {
                    console.log('fetchCookie cookie = ' + cookie);
                    Utils.emitEvent(cookie, 137220)
                  }
                })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'emitFetchCookiePromise': {
              try {
                web_webview.WebCookieManager.configCookie(Constants.EXAMPLE_URL, 'a=d', (error) => {
                  if (error) {
                    console.log('error: ' + JSON.stringify(error));
                  }
                })
                web_webview.WebCookieManager.fetchCookie(Constants.EXAMPLE_URL)
                  .then(cookie => {
                    console.log('emitFetchCookiePromise cookie = ' + cookie);
                    Utils.emitEvent(cookie, 137230)
                  })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'emitConfigCookieSync': {
              try {
                web_webview.WebCookieManager.configCookieSync(Constants.EXAMPLE_URL, 'a=e');
                this.cookieResult = web_webview.WebCookieManager.fetchCookieSync(Constants.EXAMPLE_URL);
                console.log('emitConfigCookieSync cookie = ' + this.cookieResult);
                Utils.emitEvent(this.cookieResult, 137240)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'emitConfigCookieCallback': {
              try {
                web_webview.WebCookieManager.configCookie(Constants.EXAMPLE_URL, 'a=f', (error) => {
                  if (error) {
                    console.log('error: ' + JSON.stringify(error));
                  }
                })
                this.cookieResult = web_webview.WebCookieManager.fetchCookieSync(Constants.EXAMPLE_URL);
                console.log('emitConfigCookieCallback cookie = ' + this.cookieResult);
                Utils.emitEvent(this.cookieResult, 137250)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'emitConfigCookiePromise': {
              try {
                web_webview.WebCookieManager.configCookie(Constants.EXAMPLE_URL, 'a=g')
                  .then(() => {
                    console.log('configCookie success!');
                  })
                this.cookieResult = web_webview.WebCookieManager.fetchCookieSync(Constants.EXAMPLE_URL);
                console.log('emitConfigCookiePromise cookie = ' + this.cookieResult);
                Utils.emitEvent(this.cookieResult, 137260)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'emitClearAllCookiesSync': {
              try {
                web_webview.WebCookieManager.configCookieSync(Constants.EXAMPLE_URL, 'a=b');
                web_webview.WebCookieManager.clearAllCookiesSync();
                this.cookieResult = web_webview.WebCookieManager.fetchCookieSync(Constants.EXAMPLE_URL);
                console.log('emitClearAllCookiesSync cookie = ' + this.cookieResult);
                Utils.emitEvent(this.cookieResult ? false : true, 137270)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'emitClearAllCookiesCallback': {
              try {
                web_webview.WebCookieManager.configCookieSync(Constants.EXAMPLE_URL, 'a=b');
                web_webview.WebCookieManager.clearAllCookies((error) => {
                  if (error) {
                    console.log('error: ' + error);
                  }
                })
                this.cookieResult = web_webview.WebCookieManager.fetchCookieSync(Constants.EXAMPLE_URL);
                console.log('emitClearAllCookiesCallback cookie = ' + this.cookieResult);
                Utils.emitEvent(this.cookieResult ? false : true, 137280)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'emitClearAllCookiesPromise': {
              try {
                web_webview.WebCookieManager.configCookieSync(Constants.EXAMPLE_URL, 'a=b');
                web_webview.WebCookieManager.clearAllCookies()
                  .then(() => {
                    console.log('clearAllCookies success!');
                  })
                this.cookieResult = web_webview.WebCookieManager.fetchCookieSync(Constants.EXAMPLE_URL);
                console.log('emitClearAllCookiesPromise cookie = ' + this.cookieResult);
                Utils.emitEvent(this.cookieResult ? false : true, 137290)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'emitClearSessionCookieSync': {
              try {
                web_webview.WebCookieManager.configCookieSync(Constants.EXAMPLE_URL, 'a=b');
                web_webview.WebCookieManager.clearSessionCookieSync();
                this.cookieResult = web_webview.WebCookieManager.fetchCookieSync(Constants.EXAMPLE_URL);
                console.log('emitClearSessionCookieSync cookie = ' + this.cookieResult);
                Utils.emitEvent(this.cookieResult ? false : true, 137300)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'emitClearSessionCookieCallback': {
              try {
                web_webview.WebCookieManager.configCookieSync(Constants.EXAMPLE_URL, 'a=b');
                web_webview.WebCookieManager.clearSessionCookie((error) => {
                  if (error) {
                    console.log('error: ' + error);
                  }
                })
                this.cookieResult = web_webview.WebCookieManager.fetchCookieSync(Constants.EXAMPLE_URL);
                console.log('emitClearSessionCookieCallback cookie = ' + this.cookieResult);
                Utils.emitEvent(this.cookieResult ? false : true, 137310)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'emitClearSessionCookiePromise': {
              try {
                web_webview.WebCookieManager.configCookieSync(Constants.EXAMPLE_URL, 'a=b');
                web_webview.WebCookieManager.clearSessionCookie()
                  .then(() => {
                    console.log('clearSessionCookie success!');
                  })
                this.cookieResult = web_webview.WebCookieManager.fetchCookieSync(Constants.EXAMPLE_URL);
                console.log('emitClearSessionCookiePromise cookie = ' + this.cookieResult);
                Utils.emitEvent(this.cookieResult ? false : true, 137320)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

          }
        })
      }

      Web({ src: 'www.example.com', controller: this.controller })
        .onPageEnd((event) => {
          console.log('web pageEnd==>' + event.url);
          this.isComplete = 0;
        })
    }
  }
}