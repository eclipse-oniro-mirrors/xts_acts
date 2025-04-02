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
struct WebCookieManagerExistCookie {
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
        Button("WebCookieManagerExistCookie click").key('WebCookieManagerExistCookieTestButton')
          .onClick(async () => {
            console.info("key==>" + this.str)
            switch (this.str) {

              case "testExistCookie002": {
                try {
                  webView.WebCookieManager.configCookieSync('https://www.example.com', 'a=c');
                  let isCookie = webView.WebCookieManager.existCookie()
                  Utils.emitEvent(isCookie, 100302)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testExistCookie003": {
                try {
                  webView.WebCookieManager.configCookie('https://www.example.com', "a=d", (error) => {
                    if (error) {
                      console.log("error: " + JSON.stringify(error));
                    }
                    let isCookie = webView.WebCookieManager.existCookie()
                    Utils.emitEvent(isCookie, 100303)
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testExistCookie004": {
                try {
                  webView.WebCookieManager.configCookie('https://www.example.com', 'a=e')
                    .then(() => {
                      console.log('configCookie success!');
                      let isCookie = webView.WebCookieManager.existCookie()
                      Utils.emitEvent(isCookie, 100304)
                    })
                    .catch((error: business_error.BusinessError) => {
                      console.log('error: ' + JSON.stringify(error));
                    })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testExistCookie005": {
                try {
                  webView.WebCookieManager.setCookie('https://www.example.com', 'a=b');
                  webView.WebCookieManager.clearAllCookiesSync();
                  let isCookie = webView.WebCookieManager.existCookie()
                  Utils.emitEvent(isCookie, 100305)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testExistCookie006": {
                try {
                  webView.WebCookieManager.setCookie('https://www.example.com', 'a=b');
                  webView.WebCookieManager.clearAllCookies((error) => {
                    if (error) {
                      console.log("error: " + error);
                    }
                    let isCookie = webView.WebCookieManager.existCookie()
                    Utils.emitEvent(isCookie, 100306)
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testExistCookie007": {
                try {
                  webView.WebCookieManager.setCookie('https://www.example.com', 'a=b');
                  webView.WebCookieManager.clearAllCookies()
                    .then(() => {
                      console.log("clearAllCookies success!");
                      let isCookie = webView.WebCookieManager.existCookie()
                      Utils.emitEvent(isCookie, 100307)
                    })
                    .catch((error: business_error.BusinessError) => {
                      console.error("error: " + error);
                    });
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testExistCookie008": {
                try {
                  webView.WebCookieManager.setCookie('https://www.example.com', 'a=b');
                  webView.WebCookieManager.clearSessionCookieSync();
                  let isCookie = webView.WebCookieManager.existCookie()
                  Utils.emitEvent(isCookie, 100308)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testExistCookie009": {
                try {
                  webView.WebCookieManager.setCookie('https://www.example.com', 'a=b');
                  webView.WebCookieManager.clearSessionCookie((error) => {
                    if (error) {
                      console.log("error: " + error);
                    }
                    let isCookie = webView.WebCookieManager.existCookie()
                    Utils.emitEvent(isCookie, 100309)
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testExistCookie010": {
                try {
                  webView.WebCookieManager.setCookie('https://www.example.com', 'a=b');
                  webView.WebCookieManager.clearSessionCookie()
                    .then(() => {
                      console.log("clearSessionCookie success!");
                      let isCookie = webView.WebCookieManager.existCookie()
                      Utils.emitEvent(isCookie, 100310)
                    })
                    .catch((error: business_error.BusinessError) => {
                      console.error("error: " + error);
                    });
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testExistCookie011": {
                try {
                  webView.WebCookieManager.configCookieSync('https://www.example.com', 'a=b');
                  webView.WebCookieManager.clearAllCookiesSync();
                  let isCookie = webView.WebCookieManager.existCookie()
                  Utils.emitEvent(isCookie, 100311)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testExistCookie012": {
                try {
                  webView.WebCookieManager.configCookieSync('https://www.example.com', 'a=b');
                  webView.WebCookieManager.clearAllCookies((error) => {
                    if (error) {
                      console.log("error: " + error);
                    }
                    let isCookie = webView.WebCookieManager.existCookie()
                    Utils.emitEvent(isCookie, 100312)
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testExistCookie013": {
                try {
                  webView.WebCookieManager.configCookieSync('https://www.example.com', 'a=b');
                  webView.WebCookieManager.clearAllCookies()
                    .then(() => {
                      console.log("clearAllCookies success!");
                      let isCookie = webView.WebCookieManager.existCookie()
                      Utils.emitEvent(isCookie, 100313)
                    })
                    .catch((error: business_error.BusinessError) => {
                      console.error("error: " + error);
                    });
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testExistCookie014": {
                try {
                  webView.WebCookieManager.configCookieSync('https://www.example.com', 'a=b');
                  webView.WebCookieManager.clearSessionCookieSync();
                  let isCookie = webView.WebCookieManager.existCookie()
                  Utils.emitEvent(isCookie, 100314)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testExistCookie015": {
                try {
                  webView.WebCookieManager.configCookieSync('https://www.example.com', 'a=b');
                  webView.WebCookieManager.clearSessionCookie((error) => {
                    if (error) {
                      console.log("error: " + error);
                    }
                    let isCookie = webView.WebCookieManager.existCookie()
                    Utils.emitEvent(isCookie, 100315)
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testExistCookie016": {
                try {
                  webView.WebCookieManager.configCookieSync('https://www.example.com', 'a=b');
                  webView.WebCookieManager.clearSessionCookie()
                    .then(() => {
                      console.log("clearSessionCookie success!");
                      let isCookie = webView.WebCookieManager.existCookie()
                      Utils.emitEvent(isCookie, 100316)
                    })
                    .catch((error: business_error.BusinessError) => {
                      console.error("error: " + error);
                    });
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testExistCookie017": {
                try {
                  webView.WebCookieManager.configCookieSync('https://www.example.com', 'a=b');
                  webView.WebCookieManager.deleteEntireCookie()
                  let isCookie = webView.WebCookieManager.existCookie()
                  Utils.emitEvent(isCookie, 100317)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testExistCookie018": {
                try {
                  webView.WebCookieManager.configCookie('https://www.example.com', "a=b", (error) => {
                    if (error) {
                      console.log("error: " + JSON.stringify(error));
                    }
                    webView.WebCookieManager.clearAllCookiesSync();
                    let isCookie = webView.WebCookieManager.existCookie()
                    Utils.emitEvent(isCookie, 100318)
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testExistCookie019": {
                try {
                  webView.WebCookieManager.configCookie('https://www.example.com', "a=b", (error) => {
                    if (error) {
                      console.log("error: " + JSON.stringify(error));
                    }
                    webView.WebCookieManager.clearAllCookies((error) => {
                      if (error) {
                        console.log("error: " + error);
                      }
                      let isCookie = webView.WebCookieManager.existCookie()
                      Utils.emitEvent(isCookie, 100319)
                    })
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testExistCookie020": {
                try {
                  webView.WebCookieManager.configCookie('https://www.example.com', "a=b", (error) => {
                    if (error) {
                      console.log("error: " + JSON.stringify(error));
                    }
                    webView.WebCookieManager.clearAllCookies()
                      .then(() => {
                        console.log("clearAllCookies success!");
                        let isCookie = webView.WebCookieManager.existCookie()
                        Utils.emitEvent(isCookie, 100320)
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

              case "testExistCookie021": {
                try {
                  webView.WebCookieManager.configCookie('https://www.example.com', "a=b", (error) => {
                    if (error) {
                      console.log("error: " + JSON.stringify(error));
                    }
                    webView.WebCookieManager.clearSessionCookieSync();
                    let isCookie = webView.WebCookieManager.existCookie()
                    Utils.emitEvent(isCookie, 100321)
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testExistCookie022": {
                try {
                  webView.WebCookieManager.configCookie('https://www.example.com', "a=b", (error) => {
                    if (error) {
                      console.log("error: " + JSON.stringify(error));
                    }
                    webView.WebCookieManager.clearSessionCookie((error) => {
                      if (error) {
                        console.log("error: " + error);
                      }
                      let isCookie = webView.WebCookieManager.existCookie()

                      Utils.emitEvent(isCookie, 100322)
                    })
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testExistCookie023": {
                try {
                  webView.WebCookieManager.configCookie('https://www.example.com', "a=b", (error) => {
                    if (error) {
                      console.log("error: " + JSON.stringify(error));
                    }
                    webView.WebCookieManager.clearSessionCookie()
                      .then(() => {
                        console.log("clearSessionCookie success!");
                        let isCookie = webView.WebCookieManager.existCookie()

                        Utils.emitEvent(isCookie, 100323)
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

              case "testExistCookie024": {
                try {
                  webView.WebCookieManager.configCookie('https://www.example.com', "a=b", (error) => {
                    if (error) {
                      console.log("error: " + JSON.stringify(error));
                    }
                    webView.WebCookieManager.deleteEntireCookie()
                    let isCookie = webView.WebCookieManager.existCookie()
                    Utils.emitEvent(isCookie, 100324)
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testExistCookie025": {
                try {
                  webView.WebCookieManager.configCookie('https://www.example.com', 'a=b')
                    .then(() => {
                      console.log('configCookie success!');
                      webView.WebCookieManager.clearAllCookiesSync();
                      let isCookie = webView.WebCookieManager.existCookie()

                      Utils.emitEvent(isCookie, 100325)
                    })
                    .catch((error: business_error.BusinessError) => {
                      console.log('error: ' + JSON.stringify(error));
                    })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testExistCookie026": {
                try {
                  webView.WebCookieManager.configCookie('https://www.example.com', 'a=b')
                    .then(() => {
                      console.log('configCookie success!');
                      webView.WebCookieManager.clearAllCookies((error) => {
                        if (error) {
                          console.log("error: " + error);
                        }
                        let isCookie = webView.WebCookieManager.existCookie()
                        Utils.emitEvent(isCookie, 100326)
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

              case "testExistCookie027": {
                try {
                  webView.WebCookieManager.configCookie('https://www.example.com', 'a=b')
                    .then(() => {
                      console.log('configCookie success!');
                      webView.WebCookieManager.clearAllCookies()
                        .then(() => {
                          console.log("clearAllCookies success!");
                          let isCookie = webView.WebCookieManager.existCookie()
                          Utils.emitEvent(isCookie, 100327)
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

              case "testExistCookie028": {
                try {
                  webView.WebCookieManager.configCookie('https://www.example.com', 'a=b')
                    .then(() => {
                      console.log('configCookie success!');
                      webView.WebCookieManager.clearSessionCookieSync();
                      let isCookie = webView.WebCookieManager.existCookie()
                      Utils.emitEvent(isCookie, 100328)
                    })
                    .catch((error: business_error.BusinessError) => {
                      console.log('error: ' + JSON.stringify(error));
                    })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testExistCookie029": {
                try {
                  webView.WebCookieManager.configCookie('https://www.example.com', 'a=b')
                    .then(() => {
                      console.log('configCookie success!');
                      webView.WebCookieManager.clearSessionCookie((error) => {
                        if (error) {
                          console.log("error: " + error);
                        }
                        let isCookie = webView.WebCookieManager.existCookie()
                        Utils.emitEvent(isCookie, 100329)
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

              case "testExistCookie030": {
                try {
                  webView.WebCookieManager.configCookieSync('https://www.example.com', 'a=b');
                  webView.WebCookieManager.clearSessionCookie()
                    .then(() => {
                      console.log("clearSessionCookie success!");
                      let isCookie = webView.WebCookieManager.existCookie()
                      Utils.emitEvent(isCookie, 100330)
                    })
                    .catch((error: business_error.BusinessError) => {
                      console.error("error: " + error);
                    });
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testExistCookie031": {
                try {
                  webView.WebCookieManager.configCookie('https://www.example.com', 'a=b')
                    .then(() => {
                      console.log('configCookie success!');
                      webView.WebCookieManager.deleteEntireCookie()
                      let isCookie = webView.WebCookieManager.existCookie()
                      Utils.emitEvent(isCookie, 100331)
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
