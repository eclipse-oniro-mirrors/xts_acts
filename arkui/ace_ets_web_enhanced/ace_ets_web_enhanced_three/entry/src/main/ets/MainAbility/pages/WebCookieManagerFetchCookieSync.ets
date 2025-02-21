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
import business_error from '@ohos.base'

@Entry
@Component
struct WebCookieManagerFetchCookieSync {
  controller: webView.WebviewController = new webView.WebviewController();
  controllerTwo: webView.WebviewController = new webView.WebviewController();
  @State console: string = ""
  @State str: string = ""

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
        if (this.controller) {
          this.controller.loadUrl("resource://rawfile/index.html");
          this.controller.clearHistory()
        }
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("WebCookieManagerFetchCookieSync click").key('WebCookieManagerFetchCookieSyncTestButton')
          .onClick(async () => {
            console.info("key==>" + this.str)
            switch (this.str) {
              case "testFetchCookieSync001": {
                try {
                  webView.WebCookieManager.setCookie('https://www.example.com', 'a=b');
                  let value = webView.WebCookieManager.fetchCookieSync('https://www.example.com');
                  console.log("fetchCookieSync cookie = " + value);
                  Utils.emitEvent(value, 100101)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testFetchCookieSync002": {
                try {
                  webView.WebCookieManager.configCookieSync('https://www.example.com', 'a=c');
                  let value = webView.WebCookieManager.fetchCookieSync('https://www.example.com');
                  console.log("fetchCookieSync cookie = " + value);
                  Utils.emitEvent(value, 100102)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testFetchCookieSync003": {
                try {
                  webView.WebCookieManager.configCookie('https://www.example.com', "a=d", (error) => {
                    if (error) {
                      console.log("error: " + JSON.stringify(error));
                    }
                    let value = webView.WebCookieManager.fetchCookieSync('https://www.example.com');
                    console.log("fetchCookieSync cookie = " + value);
                    Utils.emitEvent(value, 100103)
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testFetchCookieSync004": {
                try {
                  webView.WebCookieManager.configCookie('https://www.example.com', 'a=e')
                    .then(() => {
                      console.log('configCookie success!');
                      let value = webView.WebCookieManager.fetchCookieSync('https://www.example.com');
                      console.log("fetchCookieSync cookie = " + value);
                      Utils.emitEvent(value, 100104)
                    })
                    .catch((error: business_error.BusinessError) => {
                      console.log('error: ' + JSON.stringify(error));
                    })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testFetchCookieSync005": {
                try {
                  webView.WebCookieManager.setCookie('https://www.example.com', 'a=b');
                  webView.WebCookieManager.clearAllCookiesSync();
                  let value = webView.WebCookieManager.fetchCookieSync('https://www.example.com');
                  console.log("fetchCookieSync cookie = " + value);
                  Utils.emitEvent(value, 100105)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testFetchCookieSync006": {
                try {
                  webView.WebCookieManager.setCookie('https://www.example.com', 'a=b');
                  webView.WebCookieManager.clearAllCookies((error) => {
                    if (error) {
                      console.log("error: " + error);
                    }
                    let value = webView.WebCookieManager.fetchCookieSync('https://www.example.com');
                    console.log("fetchCookieSync cookie = " + value);
                    Utils.emitEvent(value, 100106)
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testFetchCookieSync007": {
                try {
                  webView.WebCookieManager.setCookie('https://www.example.com', 'a=b');
                  webView.WebCookieManager.clearAllCookies()
                    .then(() => {
                      console.log("clearAllCookies success!");
                      let value = webView.WebCookieManager.fetchCookieSync('https://www.example.com');
                      console.log("fetchCookieSync cookie = " + value);
                      Utils.emitEvent(value, 100107)
                    })
                    .catch((error: business_error.BusinessError) => {
                      console.error("error: " + error);
                    });
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testFetchCookieSync008": {
                try {
                  webView.WebCookieManager.setCookie('https://www.example.com', 'a=b');
                  webView.WebCookieManager.clearSessionCookieSync();
                  let value = webView.WebCookieManager.fetchCookieSync('https://www.example.com');
                  console.log("fetchCookieSync cookie = " + value);
                  Utils.emitEvent(value, 100108)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testFetchCookieSync009": {
                try {
                  webView.WebCookieManager.setCookie('https://www.example.com', 'a=b');
                  webView.WebCookieManager.clearSessionCookie((error) => {
                    if (error) {
                      console.log("error: " + error);
                    }
                    let value = webView.WebCookieManager.fetchCookieSync('https://www.example.com');
                    console.log("fetchCookieSync cookie = " + value);
                    Utils.emitEvent(value, 100109)
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testFetchCookieSync010": {
                try {
                  webView.WebCookieManager.setCookie('https://www.example.com', 'a=b');
                  webView.WebCookieManager.clearSessionCookie()
                    .then(() => {
                      console.log("clearSessionCookie success!");
                      let value = webView.WebCookieManager.fetchCookieSync('https://www.example.com');
                      console.log("fetchCookieSync cookie = " + value);
                      Utils.emitEvent(value, 100110)
                    })
                    .catch((error: business_error.BusinessError) => {
                      console.error("error: " + error);
                    });
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testFetchCookieSync011": {
                try {
                  webView.WebCookieManager.setCookie('https://www.example.com', 'a=b');
                  webView.WebCookieManager.deleteEntireCookie()
                  let value = webView.WebCookieManager.fetchCookieSync('https://www.example.com');
                  console.log("fetchCookieSync cookie = " + value);
                  Utils.emitEvent(value, 100111)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testFetchCookieSync012": {
                try {
                  webView.WebCookieManager.configCookieSync('https://www.example.com', 'a=b');
                  webView.WebCookieManager.clearAllCookiesSync();
                  let value = webView.WebCookieManager.fetchCookieSync('https://www.example.com');
                  console.log("fetchCookieSync cookie = " + value);
                  Utils.emitEvent(value, 100112)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testFetchCookieSync013": {
                try {
                  webView.WebCookieManager.configCookieSync('https://www.example.com', 'a=b');
                  webView.WebCookieManager.clearAllCookies((error) => {
                    if (error) {
                      console.log("error: " + error);
                    }
                    let value = webView.WebCookieManager.fetchCookieSync('https://www.example.com');
                    console.log("fetchCookieSync cookie = " + value);
                    Utils.emitEvent(value, 100113)
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testFetchCookieSync014": {
                try {
                  webView.WebCookieManager.configCookieSync('https://www.example.com', 'a=b');
                  webView.WebCookieManager.clearAllCookies()
                    .then(() => {
                      console.log("clearAllCookies success!");
                      let value = webView.WebCookieManager.fetchCookieSync('https://www.example.com');
                      console.log("fetchCookieSync cookie = " + value);
                      Utils.emitEvent(value, 100114)
                    })
                    .catch((error: business_error.BusinessError) => {
                      console.error("error: " + error);
                    });
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testFetchCookieSync015": {
                try {
                  webView.WebCookieManager.configCookieSync('https://www.example.com', 'a=b');
                  webView.WebCookieManager.clearSessionCookieSync();
                  let value = webView.WebCookieManager.fetchCookieSync('https://www.example.com');
                  console.log("fetchCookieSync cookie = " + value);
                  Utils.emitEvent(value, 100115)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testFetchCookieSync016": {
                try {
                  webView.WebCookieManager.configCookieSync('https://www.example.com', 'a=b');
                  webView.WebCookieManager.clearSessionCookie((error) => {
                    if (error) {
                      console.log("error: " + error);
                    }
                    let value = webView.WebCookieManager.fetchCookieSync('https://www.example.com');
                    console.log("fetchCookieSync cookie = " + value);
                    Utils.emitEvent(value, 100116)
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testFetchCookieSync017": {
                try {
                  webView.WebCookieManager.configCookieSync('https://www.example.com', 'a=b');
                  webView.WebCookieManager.clearSessionCookie()
                    .then(() => {
                      console.log("clearSessionCookie success!");
                      let value = webView.WebCookieManager.fetchCookieSync('https://www.example.com');
                      console.log("fetchCookieSync cookie = " + value);
                      Utils.emitEvent(value, 100117)
                    })
                    .catch((error: business_error.BusinessError) => {
                      console.error("error: " + error);
                    });
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testFetchCookieSync018": {
                try {
                  webView.WebCookieManager.configCookieSync('https://www.example.com', 'a=b');
                  webView.WebCookieManager.deleteEntireCookie()
                  let value = webView.WebCookieManager.fetchCookieSync('https://www.example.com');
                  console.log("fetchCookieSync cookie = " + value);
                  Utils.emitEvent(value, 100118)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testFetchCookieSync019": {
                try {
                  webView.WebCookieManager.configCookie('https://www.example.com', "a=b", (error) => {
                    if (error) {
                      console.log("error: " + JSON.stringify(error));
                    }
                    webView.WebCookieManager.clearAllCookiesSync();
                    let value = webView.WebCookieManager.fetchCookieSync('https://www.example.com');
                    console.log("fetchCookieSync cookie = " + value);
                    Utils.emitEvent(value, 100119)
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testFetchCookieSync020": {
                try {
                  webView.WebCookieManager.configCookie('https://www.example.com', "a=b", (error) => {
                    if (error) {
                      console.log("error: " + JSON.stringify(error));
                    }
                    webView.WebCookieManager.clearAllCookies((error) => {
                      if (error) {
                        console.log("error: " + error);
                      }
                      let value = webView.WebCookieManager.fetchCookieSync('https://www.example.com');
                      console.log("fetchCookieSync cookie = " + value);
                      Utils.emitEvent(value, 100120)
                    })
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testFetchCookieSync021": {
                try {
                  webView.WebCookieManager.configCookie('https://www.example.com', "a=b", (error) => {
                    if (error) {
                      console.log("error: " + JSON.stringify(error));
                    }
                    webView.WebCookieManager.clearAllCookies()
                      .then(() => {
                        console.log("clearAllCookies success!");
                        let value = webView.WebCookieManager.fetchCookieSync('https://www.example.com');
                        console.log("fetchCookieSync cookie = " + value);
                        Utils.emitEvent(value, 100121)
                      })
                      .catch((error: business_error.BusinessError) => {
                        console.error("error: " + error);
                      });
                  })

                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testFetchCookieSync022": {
                try {
                  webView.WebCookieManager.configCookie('https://www.example.com', "a=b", (error) => {
                    if (error) {
                      console.log("error: " + JSON.stringify(error));
                    }
                    webView.WebCookieManager.clearSessionCookieSync();
                    let value = webView.WebCookieManager.fetchCookieSync('https://www.example.com');
                    console.log("fetchCookieSync cookie = " + value);
                    Utils.emitEvent(value, 100122)
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testFetchCookieSync023": {
                try {
                  webView.WebCookieManager.configCookie('https://www.example.com', "a=b", (error) => {
                    if (error) {
                      console.log("error: " + JSON.stringify(error));
                    }
                    webView.WebCookieManager.clearSessionCookie((error) => {
                      if (error) {
                        console.log("error: " + error);
                      }
                      let value = webView.WebCookieManager.fetchCookieSync('https://www.example.com');
                      console.log("fetchCookieSync cookie = " + value);
                      Utils.emitEvent(value, 100123)
                    })
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testFetchCookieSync024": {
                try {
                  webView.WebCookieManager.configCookie('https://www.example.com', "a=b", (error) => {
                    if (error) {
                      console.log("error: " + JSON.stringify(error));
                    }
                    webView.WebCookieManager.clearSessionCookie()
                      .then(() => {
                        console.log("clearSessionCookie success!");
                        let value = webView.WebCookieManager.fetchCookieSync('https://www.example.com');
                        console.log("fetchCookieSync cookie = " + value);
                        Utils.emitEvent(value, 100124)
                      })
                      .catch((error: business_error.BusinessError) => {
                        console.error("error: " + error);
                      });
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testFetchCookieSync025": {
                try {
                  webView.WebCookieManager.configCookie('https://www.example.com', "a=b", (error) => {
                    if (error) {
                      console.log("error: " + JSON.stringify(error));
                    }
                    webView.WebCookieManager.deleteEntireCookie()
                    let value = webView.WebCookieManager.fetchCookieSync('https://www.example.com');
                    console.log("fetchCookieSync cookie = " + value);
                    Utils.emitEvent(value, 100125)
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testFetchCookieSync026": {
                try {
                  webView.WebCookieManager.configCookie('https://www.example.com', 'a=b')
                    .then(() => {
                      console.log('configCookie success!');
                      webView.WebCookieManager.clearAllCookiesSync();
                      let value = webView.WebCookieManager.fetchCookieSync('https://www.example.com');
                      console.log("fetchCookieSync cookie = " + value);
                      Utils.emitEvent(value, 100126)
                    })
                    .catch((error: business_error.BusinessError) => {
                      console.log('error: ' + JSON.stringify(error));
                    })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testFetchCookieSync027": {
                try {
                  webView.WebCookieManager.configCookie('https://www.example.com', 'a=b')
                    .then(() => {
                      console.log('configCookie success!');
                      webView.WebCookieManager.clearAllCookies((error) => {
                        if (error) {
                          console.log("error: " + error);
                        }
                        let value = webView.WebCookieManager.fetchCookieSync('https://www.example.com');
                        console.log("fetchCookieSync cookie = " + value);
                        Utils.emitEvent(value, 100127)
                      })
                    })
                    .catch((error: business_error.BusinessError) => {
                      console.log('error: ' + JSON.stringify(error));
                    })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testFetchCookieSync028": {
                try {
                  webView.WebCookieManager.configCookie('https://www.example.com', 'a=b')
                    .then(() => {
                      console.log('configCookie success!');
                      webView.WebCookieManager.clearAllCookies()
                        .then(() => {
                          console.log("clearAllCookies success!");
                          let value = webView.WebCookieManager.fetchCookieSync('https://www.example.com');
                          console.log("fetchCookieSync cookie = " + value);
                          Utils.emitEvent(value, 100128)
                        })
                        .catch((error: business_error.BusinessError) => {
                          console.error("error: " + error);
                        });
                    })
                    .catch((error: business_error.BusinessError) => {
                      console.log('error: ' + JSON.stringify(error));
                    })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testFetchCookieSync029": {
                try {
                  webView.WebCookieManager.configCookie('https://www.example.com', 'a=b')
                    .then(() => {
                      console.log('configCookie success!');
                      webView.WebCookieManager.clearSessionCookieSync();
                      let value = webView.WebCookieManager.fetchCookieSync('https://www.example.com');
                      console.log("fetchCookieSync cookie = " + value);
                      Utils.emitEvent(value, 100129)
                    })
                    .catch((error: business_error.BusinessError) => {
                      console.log('error: ' + JSON.stringify(error));
                    })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testFetchCookieSync030": {
                try {
                  webView.WebCookieManager.configCookie('https://www.example.com', 'a=b')
                    .then(() => {
                      console.log('configCookie success!');
                      webView.WebCookieManager.clearSessionCookie((error) => {
                        if (error) {
                          console.log("error: " + error);
                        }
                        let value = webView.WebCookieManager.fetchCookieSync('https://www.example.com');
                        console.log("fetchCookieSync cookie = " + value);
                        Utils.emitEvent(value, 100130)
                      })
                    })
                    .catch((error: business_error.BusinessError) => {
                      console.log('error: ' + JSON.stringify(error));
                    })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testFetchCookieSync031": {
                try {
                  webView.WebCookieManager.configCookieSync('https://www.example.com', 'a=b');
                  webView.WebCookieManager.clearSessionCookie()
                    .then(() => {
                      console.log("clearSessionCookie success!");
                      let value = webView.WebCookieManager.fetchCookieSync('https://www.example.com');
                      console.log("fetchCookieSync cookie = " + value);
                      Utils.emitEvent(value, 100131)
                    })
                    .catch((error: business_error.BusinessError) => {
                      console.error("error: " + error);
                    });
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testFetchCookieSync032": {
                try {
                  webView.WebCookieManager.configCookie('https://www.example.com', 'a=b')
                    .then(() => {
                      console.log('configCookie success!');
                      webView.WebCookieManager.deleteEntireCookie()
                      let value = webView.WebCookieManager.fetchCookieSync('https://www.example.com');
                      console.log("fetchCookieSync cookie = " + value);
                      Utils.emitEvent(value, 100132)
                    })
                    .catch((error: business_error.BusinessError) => {
                      console.log('error: ' + JSON.stringify(error));
                    })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
            }
          })
      }

      Web({ src: $rawfile('index.html'), controller: this.controller })
        .onConsole((event) => {
          if (event) {
            this.console = event.message.getMessage()
          }
          return false
        })

    }
  }
}
