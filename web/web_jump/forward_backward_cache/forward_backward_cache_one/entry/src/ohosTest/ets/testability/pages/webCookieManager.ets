/**
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

import Utils from '../../test/Utils';
import webView from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';
import { JsProxyObject } from '../../test/Interfaces';
import { waitForExist } from '../../test/WaitTest.test';
import { Constants } from '../../test/Constants.test'
import business_error from '@ohos.base';

@Entry
@Component
struct webCookieManager {
  controller: webView.WebviewController = new webView.WebviewController();
  @State str: string = ''
  @State javaScriptAccess: boolean = true;
  @State isComplete: number = -1;
  @State isReceive: number = -1;
  no_error: string = 'no error happened'

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 134750,
      priority: events_emitter.EventPriority.LOW,
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(134750)
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
  private jsObj: JsProxyObject = {
    test: (res: object) => {
      Utils.emitEvent(String(res), 102);
    },
    toString: (str: string) => {
      console.info('ets toString:' + String(str));
    },
    register: (res: object) => {
      Utils.emitEvent(String(res), 86);
      return 'web222'
    },
  }

  build() {
    Column() {
      Row() {
        Button('WebCookieManager click').key('WebCookieManagerButton').onClick(async () => {
          await waitForExist(() => this.isComplete, this.str, 0);
          await waitForExist(() => this.isReceive, this.str, 0);
          this.isReceive = -1;
          console.info('key==>' + this.str)
          switch (this.str) {
            case 'testSaveCookieAsync001': {
              try {
                webView.WebCookieManager.saveCookieAsync((error) => {
                  if (error) {
                    console.log('error: ' + error);
                  }
                  Utils.emitEvent('done', 134760)
                })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }

            case 'testSaveCookieAsync002': {
              try {
                webView.WebCookieManager.saveCookieAsync()
                  .then(() => {
                    console.log('saveCookieAsyncCallback success!');
                    Utils.emitEvent('done', 134770)
                  })
                  .catch((error: business_error.BusinessError) => {
                    console.error('error: ' + error);
                  });
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }

            case 'testIsCookieAllowed001': {
              webView.WebCookieManager.putAcceptCookieEnabled(true);
              Utils.emitEvent(webView.WebCookieManager.isCookieAllowed(), 134780)
              break;
            }

            case 'testIsCookieAllowed002': {
              webView.WebCookieManager.putAcceptCookieEnabled(false);
              Utils.emitEvent(webView.WebCookieManager.isCookieAllowed(), 134790)
              break;
            }


            case 'testIsThirdPartyCookieAllowed001': {
              webView.WebCookieManager.putAcceptThirdPartyCookieEnabled(true);
              let result = webView.WebCookieManager.isThirdPartyCookieAllowed();
              console.log(result.toString());
              Utils.emitEvent(webView.WebCookieManager.isThirdPartyCookieAllowed(), 134800)
              break;
            }

            case 'testIsThirdPartyCookieAllowed002': {
              webView.WebCookieManager.putAcceptThirdPartyCookieEnabled(false);
              let result = webView.WebCookieManager.isThirdPartyCookieAllowed();
              console.log(result.toString());
              Utils.emitEvent(webView.WebCookieManager.isThirdPartyCookieAllowed(), 134810)
              break;
            }

            case 'testExistCookie001': {
              try {
                let checkEleResult: boolean = false
                webView.WebCookieManager.setCookie(Constants.EXAMPLE_URL, 'a=b');
                checkEleResult = webView.WebCookieManager.existCookie();
                console.log('this.checkEleResult: ' + checkEleResult);
                Utils.emitEvent(checkEleResult, 134820)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case 'testDeleteEntireCookie001': {
              try {
                let checkEleResult: boolean = true
                webView.WebCookieManager.setCookie(Constants.EXAMPLE_URL, 'a=b');
                webView.WebCookieManager.deleteEntireCookie();
                checkEleResult = webView.WebCookieManager.existCookie();
                console.log('this.checkEleResult: ' + checkEleResult);
                Utils.emitEvent(checkEleResult, 134830)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case 'testPutAcceptCookieEnabled001': {
              webView.WebCookieManager.putAcceptCookieEnabled(false);
              Utils.emitEvent(webView.WebCookieManager.isCookieAllowed(), 134840)
              break;
            }

            case 'testPutAcceptThirdPartyCookieEnabled001': {
              webView.WebCookieManager.putAcceptThirdPartyCookieEnabled(false);
              let result = webView.WebCookieManager.isThirdPartyCookieAllowed();
              console.log(result.toString());
              Utils.emitEvent(webView.WebCookieManager.isThirdPartyCookieAllowed(), 134850)
              break;
            }

            case 'testDeleteSessionCookie001': {
              webView.WebCookieManager.setCookie(Constants.EXAMPLE_URL, 'a=b');
              webView.WebCookieManager.deleteSessionCookie();
              let value = webView.WebCookieManager.getCookie(Constants.EXAMPLE_URL);
              Utils.emitEvent(value ? false : true, 134860)
              break;
            }

            case 'testGetCookie001': {
              webView.WebCookieManager.deleteSessionCookie();
              webView.WebCookieManager.setCookie(Constants.EXAMPLE_URL, 'a=b');
              let value = webView.WebCookieManager.getCookie(Constants.EXAMPLE_URL);
              Utils.emitEvent(value, 134870)
              break;
            }
          }
        })
      }

      Web({ src: $rawfile('index.html'), controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .javaScriptProxy({
          object: this.jsObj,
          name: 'backToEts',
          methodList: ['test', 'toString'],
          controller: this.controller,
        })
        .onPageEnd((event) => {
          if (event) {
            console.log('onPageEnd==>', event.url);
            this.isComplete = 0;
          }
        })
    }
  }
}
