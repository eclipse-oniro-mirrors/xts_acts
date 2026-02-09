/**
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
import { waitForExist } from '../../test/WaitTest';
import { URL } from '../../test/Config';

@Entry
@Component
struct WebCookieManagerFetchCookie {
  controller: webView.WebviewController = new webView.WebviewController();
  @State console: string = ''
  @State str: string = ''
  @State isComplete: number = -1;
  @State isReceive: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 136250,
      priority: events_emitter.EventPriority.LOW,
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(136250)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 0;
        if (this.controller) {
          this.isComplete = -1;
          this.controller.loadUrl('resource://rawfile/index.html');
        }
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button('WebCookieManagerFetchCookie click').key('WebCookieManagerFetchCookieTestButton')
          .onClick(async () => {
            await waitForExist(() => this.isComplete, this.str, 0);
            await waitForExist(() => this.isReceive, this.str, 0);
            this.isReceive = -1;

            this.controller.clearHistory();

            console.info('key==>' + this.str)
            switch (this.str) {
              case 'testFetchCookie031': {
                try {
                  webView.WebCookieManager.configCookieSync(URL, 'a=b');
                  webView.WebCookieManager.clearSessionCookie()
                    .then(() => {
                      console.log('clearSessionCookie success!');
                      webView.WebCookieManager.fetchCookie(URL, (error, cookie) => {
                        if (error) {
                          console.log('error: ' + JSON.stringify(error));
                          return;
                        }
                        console.log('fetchCookie cookie = ' + cookie);
                        Utils.emitEvent(cookie ? false : true, 136260)
                      })
                    })
                    .catch((error: business_error.BusinessError) => {
                      console.error('error: ' + error);
                    });
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'testFetchCookie032': {
                try {
                  webView.WebCookieManager.configCookie(URL, 'a=b')
                    .then(() => {
                      console.log('configCookie success!');
                      webView.WebCookieManager.deleteEntireCookie()
                      webView.WebCookieManager.fetchCookie(URL, (error, cookie) => {
                        if (error) {
                          console.log('error: ' + JSON.stringify(error));
                          return;
                        }
                        console.log('fetchCookie cookie = ' + cookie);
                        Utils.emitEvent(cookie ? false : true, 136270)
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

              case 'testFetchCookie033': {
                try {
                  webView.WebCookieManager.setCookie(URL, 'a=b');
                  webView.WebCookieManager.fetchCookie(URL)
                    .then(cookie => {
                      console.log('fetchCookie cookie = ' + cookie);
                      Utils.emitEvent(cookie, 136280)
                    })
                    .catch((error: business_error.BusinessError) => {
                      console.log('error: ' + JSON.stringify(error));
                    })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'testFetchCookie034': {
                try {
                  webView.WebCookieManager.configCookieSync(URL, 'a=c');
                  webView.WebCookieManager.fetchCookie(URL)
                    .then(cookie => {
                      console.log('fetchCookie cookie = ' + cookie);
                      Utils.emitEvent(cookie, 136290)
                    })
                    .catch((error: business_error.BusinessError) => {
                      console.log('error: ' + JSON.stringify(error));
                    })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'testFetchCookie035': {
                try {
                  webView.WebCookieManager.configCookie(URL, 'a=d', (error) => {
                    if (error) {
                      console.log('error: ' + JSON.stringify(error));
                    }
                    webView.WebCookieManager.fetchCookie(URL)
                      .then(cookie => {
                        console.log('fetchCookie cookie = ' + cookie);
                        Utils.emitEvent(cookie, 136300)
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

              case 'testFetchCookie036': {
                try {
                  webView.WebCookieManager.configCookie(URL, 'a=e')
                    .then(() => {
                      console.log('configCookie success!');
                      webView.WebCookieManager.fetchCookie(URL)
                        .then(cookie => {
                          console.log('fetchCookie cookie = ' + cookie);
                          Utils.emitEvent(cookie, 136310)
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

              case 'testFetchCookie037': {
                try {
                  webView.WebCookieManager.setCookie(URL, 'a=b');
                  webView.WebCookieManager.clearAllCookiesSync();
                  webView.WebCookieManager.fetchCookie(URL)
                    .then(cookie => {
                      console.log('fetchCookie cookie = ' + cookie);
                      Utils.emitEvent(cookie ? false : true, 136320)
                    })
                    .catch((error: business_error.BusinessError) => {
                      console.log('error: ' + JSON.stringify(error));
                    })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'testFetchCookie038': {
                try {
                  webView.WebCookieManager.setCookie(URL, 'a=b');
                  webView.WebCookieManager.clearAllCookies((error) => {
                    if (error) {
                      console.log('error: ' + error);
                    }
                    webView.WebCookieManager.fetchCookie(URL)
                      .then(cookie => {
                        console.log('fetchCookie cookie = ' + cookie);
                        Utils.emitEvent(cookie ? false : true, 136330)
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

              case 'testFetchCookie039': {
                try {
                  webView.WebCookieManager.setCookie(URL, 'a=b');
                  webView.WebCookieManager.clearAllCookies()
                    .then(() => {
                      console.log('clearAllCookies success!');
                      webView.WebCookieManager.fetchCookie(URL)
                        .then(cookie => {
                          console.log('fetchCookie cookie = ' + cookie);
                          Utils.emitEvent(cookie ? false : true, 136340)
                        })
                        .catch((error: business_error.BusinessError) => {
                          console.log('error: ' + JSON.stringify(error));
                        })
                    })
                    .catch((error: business_error.BusinessError) => {
                      console.error('error: ' + error);
                    });
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'testFetchCookie040': {
                try {
                  webView.WebCookieManager.setCookie(URL, 'a=b');
                  webView.WebCookieManager.clearSessionCookieSync();
                  webView.WebCookieManager.fetchCookie(URL)
                    .then(cookie => {
                      console.log('fetchCookie cookie = ' + cookie);
                      Utils.emitEvent(cookie ? false : true, 136350)
                    })
                    .catch((error: business_error.BusinessError) => {
                      console.log('error: ' + JSON.stringify(error));
                    })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'testFetchCookie041': {
                try {
                  webView.WebCookieManager.setCookie(URL, 'a=b');
                  webView.WebCookieManager.clearSessionCookie((error) => {
                    if (error) {
                      console.log('error: ' + error);
                    }
                    webView.WebCookieManager.fetchCookie(URL)
                      .then(cookie => {
                        console.log('fetchCookie cookie = ' + cookie);
                        Utils.emitEvent(cookie ? false : true, 136360)
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

              case 'testFetchCookie042': {
                try {
                  webView.WebCookieManager.setCookie(URL, 'a=b');
                  webView.WebCookieManager.clearSessionCookie()
                    .then(() => {
                      console.log('clearSessionCookie success!');
                      webView.WebCookieManager.fetchCookie(URL)
                        .then(cookie => {
                          console.log('fetchCookie cookie = ' + cookie);
                          Utils.emitEvent(cookie ? false : true, 136370)
                        })
                        .catch((error: business_error.BusinessError) => {
                          console.log('error: ' + JSON.stringify(error));
                        })
                    })
                    .catch((error: business_error.BusinessError) => {
                      console.error('error: ' + error);
                    });
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'testFetchCookie043': {
                try {
                  webView.WebCookieManager.setCookie(URL, 'a=b');
                  webView.WebCookieManager.deleteEntireCookie()
                  webView.WebCookieManager.fetchCookie(URL)
                    .then(cookie => {
                      console.log('fetchCookie cookie = ' + cookie);
                      Utils.emitEvent(cookie ? false : true, 136380)
                    })
                    .catch((error: business_error.BusinessError) => {
                      console.log('error: ' + JSON.stringify(error));
                    })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'testFetchCookie044': {
                try {
                  webView.WebCookieManager.configCookieSync(URL, 'a=b');
                  webView.WebCookieManager.clearAllCookiesSync();
                  webView.WebCookieManager.fetchCookie(URL)
                    .then(cookie => {
                      console.log('fetchCookie cookie = ' + cookie);
                      Utils.emitEvent(cookie ? false : true, 136390)
                    })
                    .catch((error: business_error.BusinessError) => {
                      console.log('error: ' + JSON.stringify(error));
                    })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'testFetchCookie045': {
                try {
                  webView.WebCookieManager.configCookieSync(URL, 'a=b');
                  webView.WebCookieManager.clearAllCookies((error) => {
                    if (error) {
                      console.log('error: ' + error);
                    }
                    webView.WebCookieManager.fetchCookie(URL)
                      .then(cookie => {
                        console.log('fetchCookie cookie = ' + cookie);
                        Utils.emitEvent(cookie ? false : true, 136400)
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

              case 'testFetchCookie046': {
                try {
                  webView.WebCookieManager.configCookieSync(URL, 'a=b');
                  webView.WebCookieManager.clearAllCookies()
                    .then(() => {
                      console.log('clearAllCookies success!');
                      webView.WebCookieManager.fetchCookie(URL)
                        .then(cookie => {
                          console.log('fetchCookie cookie = ' + cookie);
                          Utils.emitEvent(cookie ? false : true, 136410)
                        })
                        .catch((error: business_error.BusinessError) => {
                          console.log('error: ' + JSON.stringify(error));
                        })
                    })
                    .catch((error: business_error.BusinessError) => {
                      console.error('error: ' + error);
                    });
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'testFetchCookie047': {
                try {
                  webView.WebCookieManager.configCookieSync(URL, 'a=b');
                  webView.WebCookieManager.clearSessionCookieSync();
                  webView.WebCookieManager.fetchCookie(URL)
                    .then(cookie => {
                      console.log('fetchCookie cookie = ' + cookie);
                      Utils.emitEvent(cookie ? false : true, 136420)
                    })
                    .catch((error: business_error.BusinessError) => {
                      console.log('error: ' + JSON.stringify(error));
                    })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'testFetchCookie048': {
                try {
                  webView.WebCookieManager.configCookieSync(URL, 'a=b');
                  webView.WebCookieManager.clearSessionCookie((error) => {
                    if (error) {
                      console.log('error: ' + error);
                    }
                    webView.WebCookieManager.fetchCookie(URL)
                      .then(cookie => {
                        console.log('fetchCookie cookie = ' + cookie);
                        Utils.emitEvent(cookie ? false : true, 136430)
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

              case 'testFetchCookie049': {
                try {
                  webView.WebCookieManager.configCookieSync(URL, 'a=b');
                  webView.WebCookieManager.clearSessionCookie()
                    .then(() => {
                      console.log('clearSessionCookie success!');
                      webView.WebCookieManager.fetchCookie(URL)
                        .then(cookie => {
                          console.log('fetchCookie cookie = ' + cookie);
                          Utils.emitEvent(cookie ? false : true, 136440)
                        })
                        .catch((error: business_error.BusinessError) => {
                          console.log('error: ' + JSON.stringify(error));
                        })
                    })
                    .catch((error: business_error.BusinessError) => {
                      console.error('error: ' + error);
                    });
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'testFetchCookie050': {
                try {
                  webView.WebCookieManager.configCookieSync(URL, 'a=b');
                  webView.WebCookieManager.deleteEntireCookie()
                  webView.WebCookieManager.fetchCookie(URL)
                    .then(cookie => {
                      console.log('fetchCookie cookie = ' + cookie);
                      Utils.emitEvent(cookie ? false : true, 136450)
                    })
                    .catch((error: business_error.BusinessError) => {
                      console.log('error: ' + JSON.stringify(error));
                    })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'testFetchCookie051': {
                try {
                  webView.WebCookieManager.configCookie(URL, 'a=b', (error) => {
                    if (error) {
                      console.log('error: ' + JSON.stringify(error));
                    }
                    webView.WebCookieManager.clearAllCookiesSync();
                    webView.WebCookieManager.fetchCookie(URL)
                      .then(cookie => {
                        console.log('fetchCookie cookie = ' + cookie);
                        Utils.emitEvent(cookie ? false : true, 136460)
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

              case 'testFetchCookie052': {
                try {
                  webView.WebCookieManager.configCookie(URL, 'a=b', (error) => {
                    if (error) {
                      console.log('error: ' + JSON.stringify(error));
                    }
                    webView.WebCookieManager.clearAllCookies((error) => {
                      if (error) {
                        console.log('error: ' + error);
                      }
                      webView.WebCookieManager.fetchCookie(URL)
                        .then(cookie => {
                          console.log('fetchCookie cookie = ' + cookie);
                          Utils.emitEvent(cookie ? false : true, 136470)
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

              case 'testFetchCookie053': {
                try {
                  webView.WebCookieManager.configCookie(URL, 'a=b', (error) => {
                    if (error) {
                      console.log('error: ' + JSON.stringify(error));
                    }
                    webView.WebCookieManager.clearAllCookies()
                      .then(() => {
                        console.log('clearAllCookies success!');
                        webView.WebCookieManager.fetchCookie(URL)
                          .then(cookie => {
                            console.log('fetchCookie cookie = ' + cookie);
                            Utils.emitEvent(cookie ? false : true, 136480)
                          })
                          .catch((error: business_error.BusinessError) => {
                            console.log('error: ' + JSON.stringify(error));
                          })
                      })
                      .catch((error: business_error.BusinessError) => {
                        console.error('error: ' + error);
                      });
                  })

                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'testFetchCookie054': {
                try {
                  webView.WebCookieManager.configCookie(URL, 'a=b', (error) => {
                    if (error) {
                      console.log('error: ' + JSON.stringify(error));
                    }
                    webView.WebCookieManager.clearSessionCookieSync();
                    webView.WebCookieManager.fetchCookie(URL)
                      .then(cookie => {
                        console.log('fetchCookie cookie = ' + cookie);
                        Utils.emitEvent(cookie ? false : true, 136490)
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

              case 'testFetchCookie055': {
                try {
                  webView.WebCookieManager.configCookie(URL, 'a=b', (error) => {
                    if (error) {
                      console.log('error: ' + JSON.stringify(error));
                    }
                    webView.WebCookieManager.clearSessionCookie((error) => {
                      if (error) {
                        console.log('error: ' + error);
                      }
                      webView.WebCookieManager.fetchCookie(URL)
                        .then(cookie => {
                          console.log('fetchCookie cookie = ' + cookie);
                          Utils.emitEvent(cookie ? false : true, 136500)
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

              case 'testFetchCookie056': {
                try {
                  webView.WebCookieManager.configCookie(URL, 'a=b', (error) => {
                    if (error) {
                      console.log('error: ' + JSON.stringify(error));
                    }
                    webView.WebCookieManager.clearSessionCookie()
                      .then(() => {
                        console.log('clearSessionCookie success!');
                        webView.WebCookieManager.fetchCookie(URL)
                          .then(cookie => {
                            console.log('fetchCookie cookie = ' + cookie);
                            Utils.emitEvent(cookie ? false : true, 136510)
                          })
                          .catch((error: business_error.BusinessError) => {
                            console.log('error: ' + JSON.stringify(error));
                          })
                      })
                      .catch((error: business_error.BusinessError) => {
                        console.error('error: ' + error);
                      });
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'testFetchCookie057': {
                try {
                  webView.WebCookieManager.configCookie(URL, 'a=b', (error) => {
                    if (error) {
                      console.log('error: ' + JSON.stringify(error));
                    }
                    webView.WebCookieManager.deleteEntireCookie()
                    webView.WebCookieManager.fetchCookie(URL)
                      .then(cookie => {
                        console.log('fetchCookie cookie = ' + cookie);
                        Utils.emitEvent(cookie ? false : true, 136520)
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

              case 'testFetchCookie058': {
                try {
                  webView.WebCookieManager.configCookie(URL, 'a=b')
                    .then(() => {
                      console.log('configCookie success!');
                      webView.WebCookieManager.clearAllCookiesSync();
                      webView.WebCookieManager.fetchCookie(URL)
                        .then(cookie => {
                          console.log('fetchCookie cookie = ' + cookie);
                          Utils.emitEvent(cookie ? false : true, 136530)
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

              case 'testFetchCookie059': {
                try {
                  webView.WebCookieManager.configCookie(URL, 'a=b')
                    .then(() => {
                      console.log('configCookie success!');
                      webView.WebCookieManager.clearAllCookies((error) => {
                        if (error) {
                          console.log('error: ' + error);
                        }
                        webView.WebCookieManager.fetchCookie(URL)
                          .then(cookie => {
                            console.log('fetchCookie cookie = ' + cookie);
                            Utils.emitEvent(cookie ? false : true, 136540)
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

              case 'testFetchCookie060': {
                try {
                  webView.WebCookieManager.configCookie(URL, 'a=b')
                    .then(() => {
                      console.log('configCookie success!');
                      webView.WebCookieManager.clearAllCookies()
                        .then(() => {
                          console.log('clearAllCookies success!');
                          webView.WebCookieManager.fetchCookie(URL)
                            .then(cookie => {
                              console.log('fetchCookie cookie = ' + cookie);
                              Utils.emitEvent(cookie ? false : true, 136550)
                            })
                            .catch((error: business_error.BusinessError) => {
                              console.log('error: ' + JSON.stringify(error));
                            })
                        })
                        .catch((error: business_error.BusinessError) => {
                          console.error('error: ' + error);
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
            }
          },
          )
      }

      Web({ src: $rawfile('index.html'), controller: this.controller })
        .onConsole((event) => {
          if (event) {
            this.console = event.message.getMessage()
          }
          return false
        })
        .onPageEnd((event) => {
          console.log('web pageEnd==>' + event.url);
          this.isComplete = 0;
        })
    }
  }
}
