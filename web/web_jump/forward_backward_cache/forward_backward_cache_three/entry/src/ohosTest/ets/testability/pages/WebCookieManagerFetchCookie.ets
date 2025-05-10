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
struct WebCookieManagerFetchCookie {
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
        Button("WebCookieManagerFetchCookie click").key('WebCookieManagerFetchCookieTestButton')
          .onClick(async () => {
            console.info("key==>" + this.str)
            switch (this.str) {

              case "testFetchCookie001": {
                try {
                  webView.WebCookieManager.setCookie('https://www.example.com', 'a=b');
                  webView.WebCookieManager.fetchCookie('https://www.example.com', (error, cookie) => {
                    if (error) {
                      console.log('error: ' + JSON.stringify(error));
                      return;
                    }
                    console.log('fetchCookie cookie = ' + cookie);
                    Utils.emitEvent(cookie, 100201)
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testFetchCookie002": {
                try {
                  webView.WebCookieManager.configCookieSync('https://www.example.com', 'a=c');
                  webView.WebCookieManager.fetchCookie('https://www.example.com', (error, cookie) => {
                    if (error) {
                      console.log('error: ' + JSON.stringify(error));
                      return;
                    }
                    console.log('fetchCookie cookie = ' + cookie);
                    Utils.emitEvent(cookie, 100202)
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testFetchCookie003": {
                try {
                  webView.WebCookieManager.configCookie('https://www.example.com', "a=d", (error) => {
                    if (error) {
                      console.log("error: " + JSON.stringify(error));
                    }
                    webView.WebCookieManager.fetchCookie('https://www.example.com', (error, cookie) => {
                      if (error) {
                        console.log('error: ' + JSON.stringify(error));
                        return;
                      }
                      console.log('fetchCookie cookie = ' + cookie);
                      Utils.emitEvent(cookie, 100203)
                    })
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testFetchCookie004": {
                try {
                  webView.WebCookieManager.configCookie('https://www.example.com', 'a=e')
                    .then(() => {
                      console.log('configCookie success!');
                      webView.WebCookieManager.fetchCookie('https://www.example.com', (error, cookie) => {
                        if (error) {
                          console.log('error: ' + JSON.stringify(error));
                          return;
                        }
                        console.log('fetchCookie cookie = ' + cookie);
                        Utils.emitEvent(cookie, 100204)
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

              case "testFetchCookie005": {
                try {
                  webView.WebCookieManager.setCookie('https://www.example.com', 'a=b');
                  webView.WebCookieManager.clearAllCookiesSync();
                  webView.WebCookieManager.fetchCookie('https://www.example.com', (error, cookie) => {
                    if (error) {
                      console.log('error: ' + JSON.stringify(error));
                      return;
                    }
                    console.log('fetchCookie cookie = ' + cookie);
                    Utils.emitEvent(cookie, 100205)
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testFetchCookie006": {
                try {
                  webView.WebCookieManager.setCookie('https://www.example.com', 'a=b');
                  webView.WebCookieManager.clearAllCookies((error) => {
                    if (error) {
                      console.log("error: " + error);
                    }
                    webView.WebCookieManager.fetchCookie('https://www.example.com', (error, cookie) => {
                      if (error) {
                        console.log('error: ' + JSON.stringify(error));
                        return;
                      }
                      console.log('fetchCookie cookie = ' + cookie);
                      Utils.emitEvent(cookie, 100206)
                    })
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testFetchCookie007": {
                try {
                  webView.WebCookieManager.setCookie('https://www.example.com', 'a=b');
                  webView.WebCookieManager.clearAllCookies()
                    .then(() => {
                      console.log("clearAllCookies success!");
                      webView.WebCookieManager.fetchCookie('https://www.example.com', (error, cookie) => {
                        if (error) {
                          console.log('error: ' + JSON.stringify(error));
                          return;
                        }
                        console.log('fetchCookie cookie = ' + cookie);
                        Utils.emitEvent(cookie, 100207)
                      })
                    })
                    .catch((error: business_error.BusinessError) => {
                      console.error("error: " + error);
                    });
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testFetchCookie008": {
                try {
                  webView.WebCookieManager.setCookie('https://www.example.com', 'a=b');
                  webView.WebCookieManager.clearSessionCookieSync();
                  webView.WebCookieManager.fetchCookie('https://www.example.com', (error, cookie) => {
                    if (error) {
                      console.log('error: ' + JSON.stringify(error));
                      return;
                    }
                    console.log('fetchCookie cookie = ' + cookie);
                    Utils.emitEvent(cookie, 100208)
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testFetchCookie009": {
                try {
                  webView.WebCookieManager.setCookie('https://www.example.com', 'a=b');
                  webView.WebCookieManager.clearSessionCookie((error) => {
                    if (error) {
                      console.log("error: " + error);
                    }
                    webView.WebCookieManager.fetchCookie('https://www.example.com', (error, cookie) => {
                      if (error) {
                        console.log('error: ' + JSON.stringify(error));
                        return;
                      }
                      console.log('fetchCookie cookie = ' + cookie);
                      Utils.emitEvent(cookie, 100209)
                    })
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testFetchCookie010": {
                try {
                  webView.WebCookieManager.setCookie('https://www.example.com', 'a=b');
                  webView.WebCookieManager.clearSessionCookie()
                    .then(() => {
                      console.log("clearSessionCookie success!");
                      webView.WebCookieManager.fetchCookie('https://www.example.com', (error, cookie) => {
                        if (error) {
                          console.log('error: ' + JSON.stringify(error));
                          return;
                        }
                        console.log('fetchCookie cookie = ' + cookie);
                        Utils.emitEvent(cookie, 100210)
                      })
                    })
                    .catch((error: business_error.BusinessError) => {
                      console.error("error: " + error);
                    });
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testFetchCookie011": {
                try {
                  webView.WebCookieManager.setCookie('https://www.example.com', 'a=b');
                  webView.WebCookieManager.deleteEntireCookie()
                  webView.WebCookieManager.fetchCookie('https://www.example.com', (error, cookie) => {
                    if (error) {
                      console.log('error: ' + JSON.stringify(error));
                      return;
                    }
                    console.log('fetchCookie cookie = ' + cookie);
                    Utils.emitEvent(cookie, 100211)
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testFetchCookie012": {
                try {
                  webView.WebCookieManager.configCookieSync('https://www.example.com', 'a=b');
                  webView.WebCookieManager.clearAllCookiesSync();
                  webView.WebCookieManager.fetchCookie('https://www.example.com', (error, cookie) => {
                    if (error) {
                      console.log('error: ' + JSON.stringify(error));
                      return;
                    }
                    console.log('fetchCookie cookie = ' + cookie);
                    Utils.emitEvent(cookie, 100212)
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testFetchCookie013": {
                try {
                  webView.WebCookieManager.configCookieSync('https://www.example.com', 'a=b');
                  webView.WebCookieManager.clearAllCookies((error) => {
                    if (error) {
                      console.log("error: " + error);
                    }
                    webView.WebCookieManager.fetchCookie('https://www.example.com', (error, cookie) => {
                      if (error) {
                        console.log('error: ' + JSON.stringify(error));
                        return;
                      }
                      console.log('fetchCookie cookie = ' + cookie);
                      Utils.emitEvent(cookie, 100213)
                    })
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testFetchCookie014": {
                try {
                  webView.WebCookieManager.configCookieSync('https://www.example.com', 'a=b');
                  webView.WebCookieManager.clearAllCookies()
                    .then(() => {
                      console.log("clearAllCookies success!");
                      webView.WebCookieManager.fetchCookie('https://www.example.com', (error, cookie) => {
                        if (error) {
                          console.log('error: ' + JSON.stringify(error));
                          return;
                        }
                        console.log('fetchCookie cookie = ' + cookie);
                        Utils.emitEvent(cookie, 100214)
                      })
                    })
                    .catch((error: business_error.BusinessError) => {
                      console.error("error: " + error);
                    });
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testFetchCookie015": {
                try {
                  webView.WebCookieManager.configCookieSync('https://www.example.com', 'a=b');
                  webView.WebCookieManager.clearSessionCookieSync();
                  webView.WebCookieManager.fetchCookie('https://www.example.com', (error, cookie) => {
                    if (error) {
                      console.log('error: ' + JSON.stringify(error));
                      return;
                    }
                    console.log('fetchCookie cookie = ' + cookie);
                    Utils.emitEvent(cookie, 100215)
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testFetchCookie016": {
                try {
                  webView.WebCookieManager.configCookieSync('https://www.example.com', 'a=b');
                  webView.WebCookieManager.clearSessionCookie((error) => {
                    if (error) {
                      console.log("error: " + error);
                    }
                    webView.WebCookieManager.fetchCookie('https://www.example.com', (error, cookie) => {
                      if (error) {
                        console.log('error: ' + JSON.stringify(error));
                        return;
                      }
                      console.log('fetchCookie cookie = ' + cookie);
                      Utils.emitEvent(cookie, 100216)
                    })
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testFetchCookie017": {
                try {
                  webView.WebCookieManager.configCookieSync('https://www.example.com', 'a=b');
                  webView.WebCookieManager.clearSessionCookie()
                    .then(() => {
                      console.log("clearSessionCookie success!");
                      webView.WebCookieManager.fetchCookie('https://www.example.com', (error, cookie) => {
                        if (error) {
                          console.log('error: ' + JSON.stringify(error));
                          return;
                        }
                        console.log('fetchCookie cookie = ' + cookie);
                        Utils.emitEvent(cookie, 100217)
                      })
                    })
                    .catch((error: business_error.BusinessError) => {
                      console.error("error: " + error);
                    });
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testFetchCookie018": {
                try {
                  webView.WebCookieManager.configCookieSync('https://www.example.com', 'a=b');
                  webView.WebCookieManager.deleteEntireCookie()
                  webView.WebCookieManager.fetchCookie('https://www.example.com', (error, cookie) => {
                    if (error) {
                      console.log('error: ' + JSON.stringify(error));
                      return;
                    }
                    console.log('fetchCookie cookie = ' + cookie);
                    Utils.emitEvent(cookie, 100218)
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testFetchCookie019": {
                try {
                  webView.WebCookieManager.configCookie('https://www.example.com', "a=b", (error) => {
                    if (error) {
                      console.log("error: " + JSON.stringify(error));
                    }
                    webView.WebCookieManager.clearAllCookiesSync();
                    webView.WebCookieManager.fetchCookie('https://www.example.com', (error, cookie) => {
                      if (error) {
                        console.log('error: ' + JSON.stringify(error));
                        return;
                      }
                      console.log('fetchCookie cookie = ' + cookie);
                      Utils.emitEvent(cookie, 100219)
                    })
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testFetchCookie020": {
                try {
                  webView.WebCookieManager.configCookie('https://www.example.com', "a=b", (error) => {
                    if (error) {
                      console.log("error: " + JSON.stringify(error));
                    }
                    webView.WebCookieManager.clearAllCookies((error) => {
                      if (error) {
                        console.log("error: " + error);
                      }
                      webView.WebCookieManager.fetchCookie('https://www.example.com', (error, cookie) => {
                        if (error) {
                          console.log('error: ' + JSON.stringify(error));
                          return;
                        }
                        console.log('fetchCookie cookie = ' + cookie);
                        Utils.emitEvent(cookie, 100220)
                      })
                    })
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testFetchCookie021": {
                try {
                  webView.WebCookieManager.configCookie('https://www.example.com', "a=b", (error) => {
                    if (error) {
                      console.log("error: " + JSON.stringify(error));
                    }
                    webView.WebCookieManager.clearAllCookies()
                      .then(() => {
                        console.log("clearAllCookies success!");
                        webView.WebCookieManager.fetchCookie('https://www.example.com', (error, cookie) => {
                          if (error) {
                            console.log('error: ' + JSON.stringify(error));
                            return;
                          }
                          console.log('fetchCookie cookie = ' + cookie);
                          Utils.emitEvent(cookie, 100221)
                        })
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

              case "testFetchCookie022": {
                try {
                  webView.WebCookieManager.configCookie('https://www.example.com', "a=b", (error) => {
                    if (error) {
                      console.log("error: " + JSON.stringify(error));
                    }
                    webView.WebCookieManager.clearSessionCookieSync();
                    webView.WebCookieManager.fetchCookie('https://www.example.com', (error, cookie) => {
                      if (error) {
                        console.log('error: ' + JSON.stringify(error));
                        return;
                      }
                      console.log('fetchCookie cookie = ' + cookie);
                      Utils.emitEvent(cookie, 100222)
                    })
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testFetchCookie023": {
                try {
                  webView.WebCookieManager.configCookie('https://www.example.com', "a=b", (error) => {
                    if (error) {
                      console.log("error: " + JSON.stringify(error));
                    }
                    webView.WebCookieManager.clearSessionCookie((error) => {
                      if (error) {
                        console.log("error: " + error);
                      }
                      webView.WebCookieManager.fetchCookie('https://www.example.com', (error, cookie) => {
                        if (error) {
                          console.log('error: ' + JSON.stringify(error));
                          return;
                        }
                        console.log('fetchCookie cookie = ' + cookie);
                        Utils.emitEvent(cookie, 100223)
                      })
                    })
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testFetchCookie024": {
                try {
                  webView.WebCookieManager.configCookie('https://www.example.com', "a=b", (error) => {
                    if (error) {
                      console.log("error: " + JSON.stringify(error));
                    }
                    webView.WebCookieManager.clearSessionCookie()
                      .then(() => {
                        console.log("clearSessionCookie success!");
                        webView.WebCookieManager.fetchCookie('https://www.example.com', (error, cookie) => {
                          if (error) {
                            console.log('error: ' + JSON.stringify(error));
                            return;
                          }
                          console.log('fetchCookie cookie = ' + cookie);
                          Utils.emitEvent(cookie, 100224)
                        })
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

              case "testFetchCookie025": {
                try {
                  webView.WebCookieManager.configCookie('https://www.example.com', "a=b", (error) => {
                    if (error) {
                      console.log("error: " + JSON.stringify(error));
                    }
                    webView.WebCookieManager.deleteEntireCookie()
                    webView.WebCookieManager.fetchCookie('https://www.example.com', (error, cookie) => {
                      if (error) {
                        console.log('error: ' + JSON.stringify(error));
                        return;
                      }
                      console.log('fetchCookie cookie = ' + cookie);
                      Utils.emitEvent(cookie, 100225)
                    })
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testFetchCookie026": {
                try {
                  webView.WebCookieManager.configCookie('https://www.example.com', 'a=b')
                    .then(() => {
                      console.log('configCookie success!');
                      webView.WebCookieManager.clearAllCookiesSync();
                      webView.WebCookieManager.fetchCookie('https://www.example.com', (error, cookie) => {
                        if (error) {
                          console.log('error: ' + JSON.stringify(error));
                          return;
                        }
                        console.log('fetchCookie cookie = ' + cookie);
                        Utils.emitEvent(cookie, 100226)
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

              case "testFetchCookie027": {
                try {
                  webView.WebCookieManager.configCookie('https://www.example.com', 'a=b')
                    .then(() => {
                      console.log('configCookie success!');
                      webView.WebCookieManager.clearAllCookies((error) => {
                        if (error) {
                          console.log("error: " + error);
                        }
                        webView.WebCookieManager.fetchCookie('https://www.example.com', (error, cookie) => {
                          if (error) {
                            console.log('error: ' + JSON.stringify(error));
                            return;
                          }
                          console.log('fetchCookie cookie = ' + cookie);
                          Utils.emitEvent(cookie, 100227)
                        })
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

              case "testFetchCookie028": {
                try {
                  webView.WebCookieManager.configCookie('https://www.example.com', 'a=b')
                    .then(() => {
                      console.log('configCookie success!');
                      webView.WebCookieManager.clearAllCookies()
                        .then(() => {
                          console.log("clearAllCookies success!");
                          webView.WebCookieManager.fetchCookie('https://www.example.com', (error, cookie) => {
                            if (error) {
                              console.log('error: ' + JSON.stringify(error));
                              return;
                            }
                            console.log('fetchCookie cookie = ' + cookie);
                            Utils.emitEvent(cookie, 100228)
                          })
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

              case "testFetchCookie029": {
                try {
                  webView.WebCookieManager.configCookie('https://www.example.com', 'a=b')
                    .then(() => {
                      console.log('configCookie success!');
                      webView.WebCookieManager.clearSessionCookieSync();
                      webView.WebCookieManager.fetchCookie('https://www.example.com', (error, cookie) => {
                        if (error) {
                          console.log('error: ' + JSON.stringify(error));
                          return;
                        }
                        console.log('fetchCookie cookie = ' + cookie);
                        Utils.emitEvent(cookie, 100229)
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

              case "testFetchCookie030": {
                try {
                  webView.WebCookieManager.configCookie('https://www.example.com', 'a=b')
                    .then(() => {
                      console.log('configCookie success!');
                      webView.WebCookieManager.clearSessionCookie((error) => {
                        if (error) {
                          console.log("error: " + error);
                        }
                        webView.WebCookieManager.fetchCookie('https://www.example.com', (error, cookie) => {
                          if (error) {
                            console.log('error: ' + JSON.stringify(error));
                            return;
                          }
                          console.log('fetchCookie cookie = ' + cookie);
                          Utils.emitEvent(cookie, 100230)
                        })
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

              case "testFetchCookie031": {
                try {
                  webView.WebCookieManager.configCookieSync('https://www.example.com', 'a=b');
                  webView.WebCookieManager.clearSessionCookie()
                    .then(() => {
                      console.log("clearSessionCookie success!");
                      webView.WebCookieManager.fetchCookie('https://www.example.com', (error, cookie) => {
                        if (error) {
                          console.log('error: ' + JSON.stringify(error));
                          return;
                        }
                        console.log('fetchCookie cookie = ' + cookie);
                        Utils.emitEvent(cookie, 100231)
                      })
                    })
                    .catch((error: business_error.BusinessError) => {
                      console.error("error: " + error);
                    });
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testFetchCookie032": {
                try {
                  webView.WebCookieManager.configCookie('https://www.example.com', 'a=b')
                    .then(() => {
                      console.log('configCookie success!');
                      webView.WebCookieManager.deleteEntireCookie()
                      webView.WebCookieManager.fetchCookie('https://www.example.com', (error, cookie) => {
                        if (error) {
                          console.log('error: ' + JSON.stringify(error));
                          return;
                        }
                        console.log('fetchCookie cookie = ' + cookie);
                        Utils.emitEvent(cookie, 100232)
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

              case "testFetchCookie033": {
                try {
                  webView.WebCookieManager.setCookie('https://www.example.com', 'a=b');
                  webView.WebCookieManager.fetchCookie('https://www.example.com')
                    .then(cookie => {
                      console.log("fetchCookie cookie = " + cookie);
                      Utils.emitEvent(cookie, 100233)
                    })
                    .catch((error: business_error.BusinessError) => {
                      console.log('error: ' + JSON.stringify(error));
                    })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testFetchCookie034": {
                try {
                  webView.WebCookieManager.configCookieSync('https://www.example.com', 'a=c');
                  webView.WebCookieManager.fetchCookie('https://www.example.com')
                    .then(cookie => {
                      console.log("fetchCookie cookie = " + cookie);
                      Utils.emitEvent(cookie, 100234)
                    })
                    .catch((error: business_error.BusinessError) => {
                      console.log('error: ' + JSON.stringify(error));
                    })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testFetchCookie035": {
                try {
                  webView.WebCookieManager.configCookie('https://www.example.com', "a=d", (error) => {
                    if (error) {
                      console.log("error: " + JSON.stringify(error));
                    }
                    webView.WebCookieManager.fetchCookie('https://www.example.com')
                      .then(cookie => {
                        console.log("fetchCookie cookie = " + cookie);
                        Utils.emitEvent(cookie, 100235)
                      })
                      .catch((error: business_error.BusinessError) => {
                        console.log('error: ' + JSON.stringify(error));
                      })
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testFetchCookie036": {
                try {
                  webView.WebCookieManager.configCookie('https://www.example.com', 'a=e')
                    .then(() => {
                      console.log('configCookie success!');
                      webView.WebCookieManager.fetchCookie('https://www.example.com')
                        .then(cookie => {
                          console.log("fetchCookie cookie = " + cookie);
                          Utils.emitEvent(cookie, 100236)
                        })
                        .catch((error: business_error.BusinessError) => {
                          console.log('error: ' + JSON.stringify(error));
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

              case "testFetchCookie037": {
                try {
                  webView.WebCookieManager.setCookie('https://www.example.com', 'a=b');
                  webView.WebCookieManager.clearAllCookiesSync();
                  webView.WebCookieManager.fetchCookie('https://www.example.com')
                    .then(cookie => {
                      console.log("fetchCookie cookie = " + cookie);
                      Utils.emitEvent(cookie, 100237)
                    })
                    .catch((error: business_error.BusinessError) => {
                      console.log('error: ' + JSON.stringify(error));
                    })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testFetchCookie038": {
                try {
                  webView.WebCookieManager.setCookie('https://www.example.com', 'a=b');
                  webView.WebCookieManager.clearAllCookies((error) => {
                    if (error) {
                      console.log("error: " + error);
                    }
                    webView.WebCookieManager.fetchCookie('https://www.example.com')
                      .then(cookie => {
                        console.log("fetchCookie cookie = " + cookie);
                        Utils.emitEvent(cookie, 100238)
                      })
                      .catch((error: business_error.BusinessError) => {
                        console.log('error: ' + JSON.stringify(error));
                      })
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testFetchCookie039": {
                try {
                  webView.WebCookieManager.setCookie('https://www.example.com', 'a=b');
                  webView.WebCookieManager.clearAllCookies()
                    .then(() => {
                      console.log("clearAllCookies success!");
                      webView.WebCookieManager.fetchCookie('https://www.example.com')
                        .then(cookie => {
                          console.log("fetchCookie cookie = " + cookie);
                          Utils.emitEvent(cookie, 100239)
                        })
                        .catch((error: business_error.BusinessError) => {
                          console.log('error: ' + JSON.stringify(error));
                        })
                    })
                    .catch((error: business_error.BusinessError) => {
                      console.error("error: " + error);
                    });
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testFetchCookie040": {
                try {
                  webView.WebCookieManager.setCookie('https://www.example.com', 'a=b');
                  webView.WebCookieManager.clearSessionCookieSync();
                  webView.WebCookieManager.fetchCookie('https://www.example.com')
                    .then(cookie => {
                      console.log("fetchCookie cookie = " + cookie);
                      Utils.emitEvent(cookie, 100240)
                    })
                    .catch((error: business_error.BusinessError) => {
                      console.log('error: ' + JSON.stringify(error));
                    })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testFetchCookie041": {
                try {
                  webView.WebCookieManager.setCookie('https://www.example.com', 'a=b');
                  webView.WebCookieManager.clearSessionCookie((error) => {
                    if (error) {
                      console.log("error: " + error);
                    }
                    webView.WebCookieManager.fetchCookie('https://www.example.com')
                      .then(cookie => {
                        console.log("fetchCookie cookie = " + cookie);
                        Utils.emitEvent(cookie, 100241)
                      })
                      .catch((error: business_error.BusinessError) => {
                        console.log('error: ' + JSON.stringify(error));
                      })
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testFetchCookie042": {
                try {
                  webView.WebCookieManager.setCookie('https://www.example.com', 'a=b');
                  webView.WebCookieManager.clearSessionCookie()
                    .then(() => {
                      console.log("clearSessionCookie success!");
                      webView.WebCookieManager.fetchCookie('https://www.example.com')
                        .then(cookie => {
                          console.log("fetchCookie cookie = " + cookie);
                          Utils.emitEvent(cookie, 100242)
                        })
                        .catch((error: business_error.BusinessError) => {
                          console.log('error: ' + JSON.stringify(error));
                        })
                    })
                    .catch((error: business_error.BusinessError) => {
                      console.error("error: " + error);
                    });
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testFetchCookie043": {
                try {
                  webView.WebCookieManager.setCookie('https://www.example.com', 'a=b');
                  webView.WebCookieManager.deleteEntireCookie()
                  webView.WebCookieManager.fetchCookie('https://www.example.com')
                    .then(cookie => {
                      console.log("fetchCookie cookie = " + cookie);
                      Utils.emitEvent(cookie, 100243)
                    })
                    .catch((error: business_error.BusinessError) => {
                      console.log('error: ' + JSON.stringify(error));
                    })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testFetchCookie044": {
                try {
                  webView.WebCookieManager.configCookieSync('https://www.example.com', 'a=b');
                  webView.WebCookieManager.clearAllCookiesSync();
                  webView.WebCookieManager.fetchCookie('https://www.example.com')
                    .then(cookie => {
                      console.log("fetchCookie cookie = " + cookie);
                      Utils.emitEvent(cookie, 100244)
                    })
                    .catch((error: business_error.BusinessError) => {
                      console.log('error: ' + JSON.stringify(error));
                    })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testFetchCookie045": {
                try {
                  webView.WebCookieManager.configCookieSync('https://www.example.com', 'a=b');
                  webView.WebCookieManager.clearAllCookies((error) => {
                    if (error) {
                      console.log("error: " + error);
                    }
                    webView.WebCookieManager.fetchCookie('https://www.example.com')
                      .then(cookie => {
                        console.log("fetchCookie cookie = " + cookie);
                        Utils.emitEvent(cookie, 100245)
                      })
                      .catch((error: business_error.BusinessError) => {
                        console.log('error: ' + JSON.stringify(error));
                      })
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testFetchCookie046": {
                try {
                  webView.WebCookieManager.configCookieSync('https://www.example.com', 'a=b');
                  webView.WebCookieManager.clearAllCookies()
                    .then(() => {
                      console.log("clearAllCookies success!");
                      webView.WebCookieManager.fetchCookie('https://www.example.com')
                        .then(cookie => {
                          console.log("fetchCookie cookie = " + cookie);
                          Utils.emitEvent(cookie, 100246)
                        })
                        .catch((error: business_error.BusinessError) => {
                          console.log('error: ' + JSON.stringify(error));
                        })
                    })
                    .catch((error: business_error.BusinessError) => {
                      console.error("error: " + error);
                    });
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testFetchCookie047": {
                try {
                  webView.WebCookieManager.configCookieSync('https://www.example.com', 'a=b');
                  webView.WebCookieManager.clearSessionCookieSync();
                  webView.WebCookieManager.fetchCookie('https://www.example.com')
                    .then(cookie => {
                      console.log("fetchCookie cookie = " + cookie);
                      Utils.emitEvent(cookie, 100247)
                    })
                    .catch((error: business_error.BusinessError) => {
                      console.log('error: ' + JSON.stringify(error));
                    })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testFetchCookie048": {
                try {
                  webView.WebCookieManager.configCookieSync('https://www.example.com', 'a=b');
                  webView.WebCookieManager.clearSessionCookie((error) => {
                    if (error) {
                      console.log("error: " + error);
                    }
                    webView.WebCookieManager.fetchCookie('https://www.example.com')
                      .then(cookie => {
                        console.log("fetchCookie cookie = " + cookie);
                        Utils.emitEvent(cookie, 100248)
                      })
                      .catch((error: business_error.BusinessError) => {
                        console.log('error: ' + JSON.stringify(error));
                      })
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testFetchCookie049": {
                try {
                  webView.WebCookieManager.configCookieSync('https://www.example.com', 'a=b');
                  webView.WebCookieManager.clearSessionCookie()
                    .then(() => {
                      console.log("clearSessionCookie success!");
                      webView.WebCookieManager.fetchCookie('https://www.example.com')
                        .then(cookie => {
                          console.log("fetchCookie cookie = " + cookie);
                          Utils.emitEvent(cookie, 100249)
                        })
                        .catch((error: business_error.BusinessError) => {
                          console.log('error: ' + JSON.stringify(error));
                        })
                    })
                    .catch((error: business_error.BusinessError) => {
                      console.error("error: " + error);
                    });
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testFetchCookie050": {
                try {
                  webView.WebCookieManager.configCookieSync('https://www.example.com', 'a=b');
                  webView.WebCookieManager.deleteEntireCookie()
                  webView.WebCookieManager.fetchCookie('https://www.example.com')
                    .then(cookie => {
                      console.log("fetchCookie cookie = " + cookie);
                      Utils.emitEvent(cookie, 100250)
                    })
                    .catch((error: business_error.BusinessError) => {
                      console.log('error: ' + JSON.stringify(error));
                    })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testFetchCookie051": {
                try {
                  webView.WebCookieManager.configCookie('https://www.example.com', "a=b", (error) => {
                    if (error) {
                      console.log("error: " + JSON.stringify(error));
                    }
                    webView.WebCookieManager.clearAllCookiesSync();
                    webView.WebCookieManager.fetchCookie('https://www.example.com')
                      .then(cookie => {
                        console.log("fetchCookie cookie = " + cookie);
                        Utils.emitEvent(cookie, 100251)
                      })
                      .catch((error: business_error.BusinessError) => {
                        console.log('error: ' + JSON.stringify(error));
                      })
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testFetchCookie052": {
                try {
                  webView.WebCookieManager.configCookie('https://www.example.com', "a=b", (error) => {
                    if (error) {
                      console.log("error: " + JSON.stringify(error));
                    }
                    webView.WebCookieManager.clearAllCookies((error) => {
                      if (error) {
                        console.log("error: " + error);
                      }
                      webView.WebCookieManager.fetchCookie('https://www.example.com')
                        .then(cookie => {
                          console.log("fetchCookie cookie = " + cookie);
                          Utils.emitEvent(cookie, 100252)
                        })
                        .catch((error: business_error.BusinessError) => {
                          console.log('error: ' + JSON.stringify(error));
                        })
                    })
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testFetchCookie053": {
                try {
                  webView.WebCookieManager.configCookie('https://www.example.com', "a=b", (error) => {
                    if (error) {
                      console.log("error: " + JSON.stringify(error));
                    }
                    webView.WebCookieManager.clearAllCookies()
                      .then(() => {
                        console.log("clearAllCookies success!");
                        webView.WebCookieManager.fetchCookie('https://www.example.com')
                          .then(cookie => {
                            console.log("fetchCookie cookie = " + cookie);
                            Utils.emitEvent(cookie, 100253)
                          })
                          .catch((error: business_error.BusinessError) => {
                            console.log('error: ' + JSON.stringify(error));
                          })
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

              case "testFetchCookie054": {
                try {
                  webView.WebCookieManager.configCookie('https://www.example.com', "a=b", (error) => {
                    if (error) {
                      console.log("error: " + JSON.stringify(error));
                    }
                    webView.WebCookieManager.clearSessionCookieSync();
                    webView.WebCookieManager.fetchCookie('https://www.example.com')
                      .then(cookie => {
                        console.log("fetchCookie cookie = " + cookie);
                        Utils.emitEvent(cookie, 100254)
                      })
                      .catch((error: business_error.BusinessError) => {
                        console.log('error: ' + JSON.stringify(error));
                      })
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testFetchCookie055": {
                try {
                  webView.WebCookieManager.configCookie('https://www.example.com', "a=b", (error) => {
                    if (error) {
                      console.log("error: " + JSON.stringify(error));
                    }
                    webView.WebCookieManager.clearSessionCookie((error) => {
                      if (error) {
                        console.log("error: " + error);
                      }
                      webView.WebCookieManager.fetchCookie('https://www.example.com')
                        .then(cookie => {
                          console.log("fetchCookie cookie = " + cookie);
                          Utils.emitEvent(cookie, 100255)
                        })
                        .catch((error: business_error.BusinessError) => {
                          console.log('error: ' + JSON.stringify(error));
                        })
                    })
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testFetchCookie056": {
                try {
                  webView.WebCookieManager.configCookie('https://www.example.com', "a=b", (error) => {
                    if (error) {
                      console.log("error: " + JSON.stringify(error));
                    }
                    webView.WebCookieManager.clearSessionCookie()
                      .then(() => {
                        console.log("clearSessionCookie success!");
                        webView.WebCookieManager.fetchCookie('https://www.example.com')
                          .then(cookie => {
                            console.log("fetchCookie cookie = " + cookie);
                            Utils.emitEvent(cookie, 100256)
                          })
                          .catch((error: business_error.BusinessError) => {
                            console.log('error: ' + JSON.stringify(error));
                          })
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

              case "testFetchCookie057": {
                try {
                  webView.WebCookieManager.configCookie('https://www.example.com', "a=b", (error) => {
                    if (error) {
                      console.log("error: " + JSON.stringify(error));
                    }
                    webView.WebCookieManager.deleteEntireCookie()
                    webView.WebCookieManager.fetchCookie('https://www.example.com')
                      .then(cookie => {
                        console.log("fetchCookie cookie = " + cookie);
                        Utils.emitEvent(cookie, 100257)
                      })
                      .catch((error: business_error.BusinessError) => {
                        console.log('error: ' + JSON.stringify(error));
                      })
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testFetchCookie058": {
                try {
                  webView.WebCookieManager.configCookie('https://www.example.com', 'a=b')
                    .then(() => {
                      console.log('configCookie success!');
                      webView.WebCookieManager.clearAllCookiesSync();
                      webView.WebCookieManager.fetchCookie('https://www.example.com')
                        .then(cookie => {
                          console.log("fetchCookie cookie = " + cookie);
                          Utils.emitEvent(cookie, 100258)
                        })
                        .catch((error: business_error.BusinessError) => {
                          console.log('error: ' + JSON.stringify(error));
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

              case "testFetchCookie059": {
                try {
                  webView.WebCookieManager.configCookie('https://www.example.com', 'a=b')
                    .then(() => {
                      console.log('configCookie success!');
                      webView.WebCookieManager.clearAllCookies((error) => {
                        if (error) {
                          console.log("error: " + error);
                        }
                        webView.WebCookieManager.fetchCookie('https://www.example.com')
                          .then(cookie => {
                            console.log("fetchCookie cookie = " + cookie);
                            Utils.emitEvent(cookie, 100259)
                          })
                          .catch((error: business_error.BusinessError) => {
                            console.log('error: ' + JSON.stringify(error));
                          })
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

              case "testFetchCookie060": {
                try {
                  webView.WebCookieManager.configCookie('https://www.example.com', 'a=b')
                    .then(() => {
                      console.log('configCookie success!');
                      webView.WebCookieManager.clearAllCookies()
                        .then(() => {
                          console.log("clearAllCookies success!");
                          webView.WebCookieManager.fetchCookie('https://www.example.com')
                            .then(cookie => {
                              console.log("fetchCookie cookie = " + cookie);
                              Utils.emitEvent(cookie, 100260)
                            })
                            .catch((error: business_error.BusinessError) => {
                              console.log('error: ' + JSON.stringify(error));
                            })
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

              case "testFetchCookie061": {
                try {
                  webView.WebCookieManager.configCookie('https://www.example.com', 'a=b')
                    .then(() => {
                      console.log('configCookie success!');
                      webView.WebCookieManager.clearSessionCookieSync();
                      webView.WebCookieManager.fetchCookie('https://www.example.com')
                        .then(cookie => {
                          console.log("fetchCookie cookie = " + cookie);
                          Utils.emitEvent(cookie, 100261)
                        })
                        .catch((error: business_error.BusinessError) => {
                          console.log('error: ' + JSON.stringify(error));
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

              case "testFetchCookie062": {
                try {
                  webView.WebCookieManager.configCookie('https://www.example.com', 'a=b')
                    .then(() => {
                      console.log('configCookie success!');
                      webView.WebCookieManager.clearSessionCookie((error) => {
                        if (error) {
                          console.log("error: " + error);
                        }
                        webView.WebCookieManager.fetchCookie('https://www.example.com')
                          .then(cookie => {
                            console.log("fetchCookie cookie = " + cookie);
                            Utils.emitEvent(cookie, 100262)
                          })
                          .catch((error: business_error.BusinessError) => {
                            console.log('error: ' + JSON.stringify(error));
                          })
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

              case "testFetchCookie063": {
                try {
                  webView.WebCookieManager.configCookieSync('https://www.example.com', 'a=b');
                  webView.WebCookieManager.clearSessionCookie()
                    .then(() => {
                      console.log("clearSessionCookie success!");
                      webView.WebCookieManager.fetchCookie('https://www.example.com')
                        .then(cookie => {
                          console.log("fetchCookie cookie = " + cookie);
                          Utils.emitEvent(cookie, 100263)
                        })
                        .catch((error: business_error.BusinessError) => {
                          console.log('error: ' + JSON.stringify(error));
                        })
                    })
                    .catch((error: business_error.BusinessError) => {
                      console.error("error: " + error);
                    });
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testFetchCookie064": {
                try {
                  webView.WebCookieManager.configCookie('https://www.example.com', 'a=b')
                    .then(() => {
                      console.log('configCookie success!');
                      webView.WebCookieManager.deleteEntireCookie()
                      webView.WebCookieManager.fetchCookie('https://www.example.com')
                        .then(cookie => {
                          console.log("fetchCookie cookie = " + cookie);
                          Utils.emitEvent(cookie, 100264)
                        })
                        .catch((error: business_error.BusinessError) => {
                          console.log('error: ' + JSON.stringify(error));
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
            }
          }

          )
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
