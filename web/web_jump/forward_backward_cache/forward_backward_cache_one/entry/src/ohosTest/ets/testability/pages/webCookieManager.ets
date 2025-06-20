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

import Utils from '../../test/Utils';
import webView from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';
import { JsProxyObject } from '../../test/Interfaces';
import business_error from '@ohos.base';

@Entry
@Component
struct webCookieManager {
  controller: webView.WebviewController = new webView.WebviewController();
  @State str: string = ""
  @State javaScriptAccess: boolean = true;
  no_error: string = "no error happened"

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
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
      }
    }
  }
  private jsObj: JsProxyObject = {
    test: (res: object) => {
      Utils.emitEvent(String(res), 102);
    },
    toString: (str: string) => {
      console.info("ets toString:" + String(str));
    },
    register: (res: object) => {
      Utils.emitEvent(String(res), 86);
      return "web222"
    }
  }

  build() {
    Column() {
      Row() {
        Button("WebCookieManager click").key('WebCookieManagerButton').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {

            case "testSaveCookieAsync001": {
              try {
                webView.WebCookieManager.saveCookieAsync((error) => {
                  if (error) {
                    console.log("error: " + error);
                  }
                  Utils.emitEvent('done', 30010)
                })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }

            case "testSaveCookieAsync002": {
              try {
                webView.WebCookieManager.saveCookieAsync()
                  .then(() => {
                    console.log("saveCookieAsyncCallback success!");
                    Utils.emitEvent('done', 30011)
                  })
                  .catch((error: business_error.BusinessError) => {
                    console.error("error: " + error);
                  });
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }


            case "testIsCookieAllowed001": {
              webView.WebCookieManager.putAcceptCookieEnabled(true);
              setTimeout(() => {
                Utils.emitEvent(webView.WebCookieManager.isCookieAllowed(), 30015)
              }, 3000)
              break;
            }

            case "testIsCookieAllowed002": {
              webView.WebCookieManager.putAcceptCookieEnabled(false);
              setTimeout(() => {
                Utils.emitEvent(webView.WebCookieManager.isCookieAllowed(), 30016)
              }, 3000)
              break;
            }


            case "testIsThirdPartyCookieAllowed001": {
              webView.WebCookieManager.putAcceptThirdPartyCookieEnabled(true);
              setTimeout(() => {
                let result = webView.WebCookieManager.isThirdPartyCookieAllowed();
                console.log(result.toString());
                Utils.emitEvent(webView.WebCookieManager.isThirdPartyCookieAllowed(), 30025)
              }, 3000)
              break;
            }

            case "testIsThirdPartyCookieAllowed002": {
              webView.WebCookieManager.putAcceptThirdPartyCookieEnabled(false);
              setTimeout(() => {
                let result = webView.WebCookieManager.isThirdPartyCookieAllowed();
                console.log(result.toString());
                Utils.emitEvent(webView.WebCookieManager.isThirdPartyCookieAllowed(), 30026)
              }, 3000)
              break;
            }

            case "testExistCookie001": {
              try {
                let checkEleResult: boolean = false
                webView.WebCookieManager.setCookie('https://www.example.com', 'a=b');
                Utils.sleep(1000);
                checkEleResult = webView.WebCookieManager.existCookie();
                console.log("this.checkEleResult: " + checkEleResult);
                Utils.emitEvent(checkEleResult, 30030)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testDeleteEntireCookie001": {
              try {
                let checkEleResult: boolean = true
                webView.WebCookieManager.setCookie('https://www.example.com', 'a=b');
                Utils.sleep(1000);
                webView.WebCookieManager.deleteEntireCookie();
                Utils.sleep(1000);
                checkEleResult = webView.WebCookieManager.existCookie();
                console.log("this.checkEleResult: " + checkEleResult);
                Utils.emitEvent(checkEleResult, 30031)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testPutAcceptCookieEnabled001": {
              webView.WebCookieManager.putAcceptCookieEnabled(false);
              setTimeout(() => {
                Utils.emitEvent(webView.WebCookieManager.isCookieAllowed(), 30032)
              }, 3000)
              break;
            }

            case "testPutAcceptThirdPartyCookieEnabled001": {
              webView.WebCookieManager.putAcceptThirdPartyCookieEnabled(false);
              setTimeout(() => {
                let result = webView.WebCookieManager.isThirdPartyCookieAllowed();
                console.log(result.toString());
                Utils.emitEvent(webView.WebCookieManager.isThirdPartyCookieAllowed(), 30033)
              }, 3000)
              break;
            }

            case "testDeleteSessionCookie001": {
              webView.WebCookieManager.setCookie('https://www.example.com', 'a=b');
              webView.WebCookieManager.deleteSessionCookie();
              let value = webView.WebCookieManager.getCookie('https://www.example.com');
              Utils.emitEvent(value, 30034)
              break;
            }

            case "testGetCookie001": {
              webView.WebCookieManager.deleteSessionCookie();
              webView.WebCookieManager.setCookie('https://www.example.com', 'a=b');
              let value = webView.WebCookieManager.getCookie('https://www.example.com');
              Utils.emitEvent(value, 100019)
              break;
            }
          }
        })
      }

      Web({ src: $rawfile('index.html'), controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .javaScriptProxy({
          object: this.jsObj,
          name: "backToEts",
          methodList: ["test", "toString"],
          controller: this.controller
        })

    }
  }
}
