/*
 * Copyright (c) 113550 Huawei Device Co., Ltd.
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

const EVENT_ID_SET_EMIT_KEY = 113550;

@Entry
@Component
struct Index {
  controller: webView.WebviewController = new webView.WebviewController();
  controllerNull: webView.WebviewController = new webView.WebviewController();
  nativePort: webView.WebMessagePort | null = null;
  responseWeb: WebResourceResponse = new WebResourceResponse()
  @State str: string = ""
  @State javaScriptAccess: boolean = true;
  @State isPageEnd: number = -1;
  @State isReceive: number = -1;
  no_error: string = "no error happened"

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: EVENT_ID_SET_EMIT_KEY,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(EVENT_ID_SET_EMIT_KEY)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 1;
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
          await Utils.waitForExist(()=>this.isPageEnd, 'WebCookieManagerErrorCodeButtonIsPageEnd', 1, 1000);
          await Utils.waitForExist(()=>this.isReceive, 'WebCookieManagerErrorCodeButtonIsReceive', 1, 1000);
          console.info("key==>" + this.str);
          this.isReceive = -1;
          switch (this.str) {

            case "testGetCookieError001": {
              try {
                let value = webView.WebCookieManager.getCookie('');
                console.log("value: " + value);
                Utils.emitEvent(this.no_error, 113560)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 113560)
              }
              break;
            }

            case "testGetCookieError002": {
              try {
                let value = webView.WebCookieManager.getCookie(',https://www.OpenHarmony.cn');
                console.log("value: " + value);
                Utils.emitEvent(this.no_error, 113570)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 113570)
              }
              break;
            }

            case "testGetCookieError003": {
              try {
                let value = webView.WebCookieManager.getCookie('h,ttp://www.OpenHarmony.cn');
                console.log("value: " + value);
                Utils.emitEvent(this.no_error, 113580)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 113580)
              }
              break;
            }

            case "testGetCookieError004": {
              try {
                let value = webView.WebCookieManager.getCookie('123');
                console.log("value: " + value);
                Utils.emitEvent(this.no_error, 113590)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 113590)
              }
              break;
            }

            case "testSetCookieError001": {
              try {
                webView.WebCookieManager.setCookie('', 'a=b');
                Utils.emitEvent(this.no_error, 113600)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 113600)
              }
              break;
            }

            case "testSetCookieError002": {
              try {
                webView.WebCookieManager.setCookie(',http://www.example.com', 'a=b');
                Utils.emitEvent(this.no_error, 113610)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 113610)
              }
              break;
            }

            case "testSetCookieError003": {
              try {
                webView.WebCookieManager.setCookie('123', 'a=b');
                Utils.emitEvent(this.no_error, 113620)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 113620)
              }
              break;
            }

            case "testSetCookieError004": {
              try {
                webView.WebCookieManager.setCookie('https://www.example.com', '');
                Utils.emitEvent(this.no_error, 113630)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 113630)
              }
              break;
            }

            case "testSetCookieError005": {
              try {
                webView.WebCookieManager.setCookie('https://www.example.com', ' ');
                Utils.emitEvent(this.no_error, 113640)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 113640)
              }
              break;
            }

            case "testFetchCookieSync001": {
              try {
                webView.WebCookieManager.fetchCookieSync('');
                Utils.emitEvent(this.no_error, 113650)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 113650)
              }
              break;
            }

            case "testFetchCookieSync002": {
              try {
                webView.WebCookieManager.fetchCookieSync(',https://ww.OpenHarmony.cn');
                Utils.emitEvent(this.no_error, 113660)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 113660)
              }
              break;
            }

            case "testFetchCookieSync003": {
              try {
                webView.WebCookieManager.fetchCookieSync('h,ttp://ww.OpenHarmony.cn');
                Utils.emitEvent(this.no_error, 113670)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 113670)
              }
              break;
            }

            case "testFetchCookieSync004": {
              try {
                webView.WebCookieManager.fetchCookieSync('123');
                Utils.emitEvent(this.no_error, 113680)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 113680)
              }
              break;
            }

            case "testFetchCookie001": {
              try {
                webView.WebCookieManager.fetchCookie('', (error, cookie) => {
                  if (error) {
                    console.log('error: ' + JSON.stringify(error));
                    Utils.emitEvent(error.code + error.message, 113690)
                    return;
                  }
                  console.log('fetchCookie cookie = ' + cookie);
                })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(error.code + error.message, 113690)
              }
              break;
            }

            case "testFetchCookie002": {
              try {
                webView.WebCookieManager.fetchCookie(',https://ww.OpenHarmony.cn', (error, cookie) => {
                  if (error) {
                    console.log('error: ' + JSON.stringify(error));
                    Utils.emitEvent(error.code + error.message, 113700)
                    return;
                  }
                  console.log('fetchCookie cookie = ' + cookie);
                })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(error.code + error.message, 113700)
              }
              break;
            }

            case "testFetchCookie003": {
              try {
                webView.WebCookieManager.fetchCookie('h,ttp://ww.OpenHarmony.cn', (error, cookie) => {
                  if (error) {
                    console.log('error: ' + JSON.stringify(error));
                    Utils.emitEvent(error.code + error.message, 113710)
                    return;
                  }
                  console.log('fetchCookie cookie = ' + cookie);
                })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(error.code + error.message, 113710)
              }
              break;
            }

            case "testFetchCookie004": {
              try {
                webView.WebCookieManager.fetchCookie('123', (error, cookie) => {
                  if (error) {
                    console.log('error: ' + JSON.stringify(error));
                    Utils.emitEvent(error.code + error.message, 113720)
                    return;
                  }
                  console.log('fetchCookie cookie = ' + cookie);
                })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(error.code + error.message, 113720)
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
                    Utils.emitEvent(error.code + error.message, 113730)
                  })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(error.code + error.message, 113730)
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
                    Utils.emitEvent(error.code + error.message, 113740)
                  })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(error.code + error.message, 113740)
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
                    Utils.emitEvent(error.code + error.message, 113750)
                  })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(error.code + error.message, 113750)
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
                    Utils.emitEvent(error.code + error.message, 113760)
                  })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(error.code + error.message, 113760)
              }
              break;
            }

            case "testConfigCookieSync001": {
              try {
                webView.WebCookieManager.configCookieSync('', 'a=b');
                Utils.emitEvent(this.no_error, 113770)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 113770)
              }
              break;
            }

            case "testConfigCookieSync002": {
              try {
                webView.WebCookieManager.configCookieSync(',https://ww.OpenHarmony.cn', 'a=b');
                Utils.emitEvent(this.no_error, 113780)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 113780)
              }
              break;
            }

            case "testConfigCookieSync003": {
              try {
                webView.WebCookieManager.configCookieSync('h,ttp://ww.OpenHarmony.cn', 'a=b');
                Utils.emitEvent(this.no_error, 113790)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 113790)
              }
              break;
            }

            case "testConfigCookieSync004": {
              try {
                webView.WebCookieManager.configCookieSync('123', 'a=b');
                Utils.emitEvent(this.no_error, 113800)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 113800)
              }
              break;
            }

            case "testConfigCookieSync005": {
              try {
                webView.WebCookieManager.configCookieSync('https://www.example.com', '');
                Utils.emitEvent(this.no_error, 113810)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 113810)
              }
              break;
            }

            case "testConfigCookie001": {
              try {
                webView.WebCookieManager.configCookie('', "a=d", (error) => {
                  if (error) {
                    console.log('error: ' + JSON.stringify(error));
                    Utils.emitEvent(error.code + error.message, 113820)
                    return;
                  }
                })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(error.code + error.message, 113820)
              }
              break;
            }

            case "testConfigCookie002": {
              try {
                webView.WebCookieManager.configCookie(',https://ww.OpenHarmony.cn', "a=d", (error) => {
                  if (error) {
                    console.log('error: ' + JSON.stringify(error));
                    Utils.emitEvent(error.code + error.message, 113830)
                    return;
                  }
                })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(error.code + error.message, 113830)
              }
              break;
            }

            case "testConfigCookie003": {
              try {
                webView.WebCookieManager.configCookie('h,ttp://ww.OpenHarmony.cn', "a=d", (error) => {
                  if (error) {
                    console.log('error: ' + JSON.stringify(error));
                    Utils.emitEvent(error.code + error.message, 113840)
                    return;
                  }
                })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(error.code + error.message, 113840)
              }
              break;
            }

            case "testConfigCookie004": {
              try {
                webView.WebCookieManager.configCookie('123', "a=d", (error) => {
                  if (error) {
                    console.log('error: ' + JSON.stringify(error));
                    Utils.emitEvent(error.code + error.message, 113850)
                    return;
                  }
                })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(error.code + error.message, 113850)
              }
              break;
            }

            case "testConfigCookie005": {
              try {
                webView.WebCookieManager.configCookie('https://www.example.com', "", (error) => {
                  if (error) {
                    console.log('error: ' + JSON.stringify(error));
                    Utils.emitEvent(String(error.code), 113860)
                    return;
                  }
                })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 113860)
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
                    Utils.emitEvent(error.code + error.message, 113870)
                  })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(error.code + error.message, 113870)
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
                    Utils.emitEvent(error.code + error.message, 113880)
                  })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(error.code + error.message, 113880)
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
                    Utils.emitEvent(error.code + error.message, 113890)
                  })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(error.code + error.message, 113890)
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
                    Utils.emitEvent(error.code + error.message, 113900)
                  })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(error.code + error.message, 113900)
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
                    Utils.emitEvent(String(error.code), 113910)
                  })
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 113910)
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
        .onPageEnd((event) => {
          console.log('onPageEnd url:' + event.url);
          this.isPageEnd = 1;
        })
    }
  }
}