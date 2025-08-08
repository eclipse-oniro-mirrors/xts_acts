/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
struct Index {
  controller: webView.WebviewController = new webView.WebviewController();
  controllerNull: webView.WebviewController = new webView.WebviewController();
  nativePort: webView.WebMessagePort | null = null;
  responseWeb: WebResourceResponse = new WebResourceResponse()
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
        Button("WebCookieManagerErrorCode click").key('WebCookieManagerErrorCodeButton').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {

            case "testGetCookieError001": {
              try {
                let value = webView.WebCookieManager.getCookie('');
                console.log("value: " + value);
                Utils.emitEvent(this.no_error, 20070)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 20070)
              }
              break;
            }

            case "testGetCookieError002": {
              try {
                let value = webView.WebCookieManager.getCookie(',https://www.OpenHarmony.cn');
                console.log("value: " + value);
                Utils.emitEvent(this.no_error, 20071)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 20071)
              }
              break;
            }

            case "testGetCookieError003": {
              try {
                let value = webView.WebCookieManager.getCookie('h,ttp://www.OpenHarmony.cn');
                console.log("value: " + value);
                Utils.emitEvent(this.no_error, 20072)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 20072)
              }
              break;
            }

            case "testGetCookieError004": {
              try {
                let value = webView.WebCookieManager.getCookie('123');
                console.log("value: " + value);
                Utils.emitEvent(this.no_error, 20073)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 20073)
              }
              break;
            }

            case "testSetCookieError001": {
              try {
                webView.WebCookieManager.setCookie('', 'a=b');
                Utils.emitEvent(this.no_error, 20080)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 20080)
              }
              break;
            }

            case "testSetCookieError002": {
              try {
                webView.WebCookieManager.setCookie(',http://www.example.com', 'a=b');
                Utils.emitEvent(this.no_error, 20081)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 20081)
              }
              break;
            }

            case "testSetCookieError003": {
              try {
                webView.WebCookieManager.setCookie('123', 'a=b');
                Utils.emitEvent(this.no_error, 20082)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 20082)
              }
              break;
            }

            case "testSetCookieError004": {
              try {
                webView.WebCookieManager.setCookie('https://www.example.com', '');
                Utils.emitEvent(this.no_error, 20083)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 20083)
              }
              break;
            }

            case "testSetCookieError005": {
              try {
                webView.WebCookieManager.setCookie('https://www.example.com', ' ');
                Utils.emitEvent(this.no_error, 20084)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 20084)
              }
              break;
            }

            case "testFetchCookieSync001": {
              try {
                webView.WebCookieManager.fetchCookieSync('');
                Utils.emitEvent(this.no_error, 5000)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 5000)
              }
              break;
            }

            case "testFetchCookieSync002": {
              try {
                webView.WebCookieManager.fetchCookieSync(',https://ww.OpenHarmony.cn');
                Utils.emitEvent(this.no_error, 5001)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 5001)
              }
              break;
            }

            case "testFetchCookieSync003": {
              try {
                webView.WebCookieManager.fetchCookieSync('h,ttp://ww.OpenHarmony.cn');
                Utils.emitEvent(this.no_error, 5002)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 5002)
              }
              break;
            }

            case "testFetchCookieSync004": {
              try {
                webView.WebCookieManager.fetchCookieSync('123');
                Utils.emitEvent(this.no_error, 5003)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 5003)
              }
              break;
            }

            case "testFetchCookie001": {
              try {
                webView.WebCookieManager.fetchCookie('', (error, cookie) => {
                  if (error) {
                    console.log('error: ' + JSON.stringify(error));
                    Utils.emitEvent(String(error.code), 5004)
                    return;
                  }
                  console.log('fetchCookie cookie = ' + cookie);
                })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 5004)
              }
              break;
            }

            case "testFetchCookie002": {
              try {
                webView.WebCookieManager.fetchCookie(',https://ww.OpenHarmony.cn', (error, cookie) => {
                  if (error) {
                    console.log('error: ' + JSON.stringify(error));
                    Utils.emitEvent(String(error.code), 5005)
                    return;
                  }
                  console.log('fetchCookie cookie = ' + cookie);
                })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 5005)
              }
              break;
            }

            case "testFetchCookie003": {
              try {
                webView.WebCookieManager.fetchCookie('h,ttp://ww.OpenHarmony.cn', (error, cookie) => {
                  if (error) {
                    console.log('error: ' + JSON.stringify(error));
                    Utils.emitEvent(String(error.code), 5006)
                    return;
                  }
                  console.log('fetchCookie cookie = ' + cookie);
                })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 5006)
              }
              break;
            }

            case "testFetchCookie004": {
              try {
                webView.WebCookieManager.fetchCookie('123', (error, cookie) => {
                  if (error) {
                    console.log('error: ' + JSON.stringify(error));
                    Utils.emitEvent(String(error.code), 5007)
                    return;
                  }
                  console.log('fetchCookie cookie = ' + cookie);
                })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 5007)
              }
              break;
            }

            case "testFetchCookie005": {
              try {
                webView.WebCookieManager.fetchCookie('')
                  .then(cookie => {
                    console.log('fetchCookie cookie = ' + cookie);
                  })
                  .catch((error: business_error.BusinessError) => {
                    console.log('error: ' + JSON.stringify(error));
                    Utils.emitEvent(String(error.code), 5008)
                  })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 5008)
              }
              break;
            }

            case "testFetchCookie006": {
              try {
                webView.WebCookieManager.fetchCookie(',https://ww.OpenHarmony.cn')
                  .then(cookie => {
                    console.log('fetchCookie cookie = ' + cookie);
                  })
                  .catch((error: business_error.BusinessError) => {
                    console.log('error: ' + JSON.stringify(error));
                    Utils.emitEvent(String(error.code), 5009)
                  })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 5009)
              }
              break;
            }

            case "testFetchCookie007": {
              try {
                webView.WebCookieManager.fetchCookie('h,ttp://ww.OpenHarmony.cn')
                  .then(cookie => {
                    console.log('fetchCookie cookie = ' + cookie);
                  })
                  .catch((error: business_error.BusinessError) => {
                    console.log('error: ' + JSON.stringify(error));
                    Utils.emitEvent(String(error.code), 5010)
                  })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 5010)
              }
              break;
            }

            case "testFetchCookie008": {
              try {
                webView.WebCookieManager.fetchCookie('123')
                  .then(cookie => {
                    console.log('fetchCookie cookie = ' + cookie);
                  })
                  .catch((error: business_error.BusinessError) => {
                    console.log('error: ' + JSON.stringify(error));
                    Utils.emitEvent(String(error.code), 5011)
                  })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 5011)
              }
              break;
            }

            case "testConfigCookieSync001": {
              try {
                webView.WebCookieManager.configCookieSync('', 'a=b');
                Utils.emitEvent(this.no_error, 5012)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 5012)
              }
              break;
            }

            case "testConfigCookieSync002": {
              try {
                webView.WebCookieManager.configCookieSync(',https://ww.OpenHarmony.cn', 'a=b');
                Utils.emitEvent(this.no_error, 5013)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 5013)
              }
              break;
            }

            case "testConfigCookieSync003": {
              try {
                webView.WebCookieManager.configCookieSync('h,ttp://ww.OpenHarmony.cn', 'a=b');
                Utils.emitEvent(this.no_error, 5014)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 5014)
              }
              break;
            }

            case "testConfigCookieSync004": {
              try {
                webView.WebCookieManager.configCookieSync('123', 'a=b');
                Utils.emitEvent(this.no_error, 5015)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 5015)
              }
              break;
            }

            case "testConfigCookieSync005": {
              try {
                webView.WebCookieManager.configCookieSync('https://www.example.com', '');
                Utils.emitEvent(this.no_error, 5016)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 5016)
              }
              break;
            }

            case "testConfigCookie001": {
              try {
                webView.WebCookieManager.configCookie('', "a=d", (error) => {
                  if (error) {
                    console.log('error: ' + JSON.stringify(error));
                    Utils.emitEvent(String(error.code), 5017)
                    return;
                  }
                })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 5017)
              }
              break;
            }

            case "testConfigCookie002": {
              try {
                webView.WebCookieManager.configCookie(',https://ww.OpenHarmony.cn', "a=d", (error) => {
                  if (error) {
                    console.log('error: ' + JSON.stringify(error));
                    Utils.emitEvent(String(error.code), 5018)
                    return;
                  }
                })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 5018)
              }
              break;
            }

            case "testConfigCookie003": {
              try {
                webView.WebCookieManager.configCookie('h,ttp://ww.OpenHarmony.cn', "a=d", (error) => {
                  if (error) {
                    console.log('error: ' + JSON.stringify(error));
                    Utils.emitEvent(String(error.code), 5019)
                    return;
                  }
                })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 5019)
              }
              break;
            }

            case "testConfigCookie004": {
              try {
                webView.WebCookieManager.configCookie('123', "a=d", (error) => {
                  if (error) {
                    console.log('error: ' + JSON.stringify(error));
                    Utils.emitEvent(String(error.code), 5020)
                    return;
                  }
                })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 5020)
              }
              break;
            }

            case "testConfigCookie005": {
              try {
                webView.WebCookieManager.configCookie('https://www.example.com', "", (error) => {
                  if (error) {
                    console.log('error: ' + JSON.stringify(error));
                    Utils.emitEvent(String(error.code), 5021)
                    return;
                  }
                })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 5021)
              }
              break;
            }

            case "testConfigCookie006": {
              try {
                webView.WebCookieManager.configCookie('', 'a=e')
                  .then(() => {
                    console.log('configCookie success!');
                  })
                  .catch((error: business_error.BusinessError) => {
                    console.log('error: ' + JSON.stringify(error));
                    Utils.emitEvent(String(error.code), 5022)
                  })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 5022)
              }
              break;
            }

            case "testConfigCookie007": {
              try {
                webView.WebCookieManager.configCookie(',https://ww.OpenHarmony.cn', 'a=e')
                  .then(() => {
                    console.log('configCookie success!');
                  })
                  .catch((error: business_error.BusinessError) => {
                    console.log('error: ' + JSON.stringify(error));
                    Utils.emitEvent(String(error.code), 5023)
                  })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 5023)
              }
              break;
            }

            case "testConfigCookie008": {
              try {
                webView.WebCookieManager.configCookie('h,ttp://ww.OpenHarmony.cn', 'a=e')
                  .then(() => {
                    console.log('configCookie success!');
                  })
                  .catch((error: business_error.BusinessError) => {
                    console.log('error: ' + JSON.stringify(error));
                    Utils.emitEvent(String(error.code), 5024)
                  })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 5024)
              }
              break;
            }

            case "testConfigCookie009": {
              try {
                webView.WebCookieManager.configCookie('123', 'a=e')
                  .then(() => {
                    console.log('configCookie success!');
                  })
                  .catch((error: business_error.BusinessError) => {
                    console.log('error: ' + JSON.stringify(error));
                    Utils.emitEvent(String(error.code), 5025)
                  })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 5025)
              }
              break;
            }

            case "testConfigCookie010": {
              try {
                webView.WebCookieManager.configCookie('https://www.example.com', "")
                  .then(() => {
                    console.log('configCookie success!');
                  })
                  .catch((error: business_error.BusinessError) => {
                    console.log('error: ' + JSON.stringify(error));
                    Utils.emitEvent(String(error.code), 5026)
                  })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 5026)
              }
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
