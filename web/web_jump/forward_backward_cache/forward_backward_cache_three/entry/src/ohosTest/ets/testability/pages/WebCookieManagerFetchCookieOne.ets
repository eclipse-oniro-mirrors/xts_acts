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
      eventId: 135900,
      priority: events_emitter.EventPriority.LOW,
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(135900)
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

              case 'testFetchCookie001': {
                try {
                  webView.WebCookieManager.setCookie(URL, 'a=b');
                  webView.WebCookieManager.fetchCookie(URL, (error, cookie) => {
                    if (error) {
                      console.log('error: ' + JSON.stringify(error));
                      return;
                    }
                    console.log('fetchCookie cookie = ' + cookie);
                    Utils.emitEvent(cookie, 135910)
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'testFetchCookie002': {
                try {
                  webView.WebCookieManager.configCookieSync(URL, 'a=c');
                  webView.WebCookieManager.fetchCookie(URL, (error, cookie) => {
                    if (error) {
                      console.log('error: ' + JSON.stringify(error));
                      return;
                    }
                    console.log('fetchCookie cookie = ' + cookie);
                    Utils.emitEvent(cookie, 135920)
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'testFetchCookie003': {
                try {
                  webView.WebCookieManager.configCookie(URL, 'a=d', (error) => {
                    if (error) {
                      console.log('error: ' + JSON.stringify(error));
                    }
                    webView.WebCookieManager.fetchCookie(URL, (error, cookie) => {
                      if (error) {
                        console.log('error: ' + JSON.stringify(error));
                        return;
                      }
                      console.log('fetchCookie cookie = ' + cookie);
                      Utils.emitEvent(cookie, 135930)
                    })
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'testFetchCookie004': {
                try {
                  webView.WebCookieManager.configCookie(URL, 'a=e')
                    .then(() => {
                      console.log('configCookie success!');
                      webView.WebCookieManager.fetchCookie(URL, (error, cookie) => {
                        if (error) {
                          console.log('error: ' + JSON.stringify(error));
                          return;
                        }
                        console.log('fetchCookie cookie = ' + cookie);
                        Utils.emitEvent(cookie, 135940)
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

              case 'testFetchCookie005': {
                try {
                  webView.WebCookieManager.setCookie(URL, 'a=b');
                  webView.WebCookieManager.clearAllCookiesSync();
                  webView.WebCookieManager.fetchCookie(URL, (error, cookie) => {
                    if (error) {
                      console.log('error: ' + JSON.stringify(error));
                      return;
                    }
                    console.log('fetchCookie cookie = ' + cookie);
                    Utils.emitEvent(cookie ? false : true, 135950)
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'testFetchCookie006': {
                try {
                  webView.WebCookieManager.setCookie(URL, 'a=b');
                  webView.WebCookieManager.clearAllCookies((error) => {
                    if (error) {
                      console.log('error: ' + error);
                    }
                    webView.WebCookieManager.fetchCookie(URL, (error, cookie) => {
                      if (error) {
                        console.log('error: ' + JSON.stringify(error));
                        return;
                      }
                      console.log('fetchCookie cookie = ' + cookie);
                      Utils.emitEvent(cookie ? false : true, 135960)
                    })
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'testFetchCookie007': {
                try {
                  webView.WebCookieManager.setCookie(URL, 'a=b');
                  webView.WebCookieManager.clearAllCookies()
                    .then(() => {
                      console.log('clearAllCookies success!');
                      webView.WebCookieManager.fetchCookie(URL, (error, cookie) => {
                        if (error) {
                          console.log('error: ' + JSON.stringify(error));
                          return;
                        }
                        console.log('fetchCookie cookie = ' + cookie);
                        Utils.emitEvent(cookie ? false : true, 135970)
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

              case 'testFetchCookie008': {
                try {
                  webView.WebCookieManager.setCookie(URL, 'a=b');
                  webView.WebCookieManager.clearSessionCookieSync();
                  webView.WebCookieManager.fetchCookie(URL, (error, cookie) => {
                    if (error) {
                      console.log('error: ' + JSON.stringify(error));
                      return;
                    }
                    console.log('fetchCookie cookie = ' + cookie);
                    Utils.emitEvent(cookie ? false : true, 135980)
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'testFetchCookie009': {
                try {
                  webView.WebCookieManager.setCookie(URL, 'a=b');
                  webView.WebCookieManager.clearSessionCookie((error) => {
                    if (error) {
                      console.log('error: ' + error);
                    }
                    webView.WebCookieManager.fetchCookie(URL, (error, cookie) => {
                      if (error) {
                        console.log('error: ' + JSON.stringify(error));
                        return;
                      }
                      console.log('fetchCookie cookie = ' + cookie);
                      Utils.emitEvent(cookie ? false : true, 135990)
                    })
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'testFetchCookie010': {
                try {
                  webView.WebCookieManager.setCookie(URL, 'a=b');
                  webView.WebCookieManager.clearSessionCookie()
                    .then(() => {
                      console.log('clearSessionCookie success!');
                      webView.WebCookieManager.fetchCookie(URL, (error, cookie) => {
                        if (error) {
                          console.log('error: ' + JSON.stringify(error));
                          return;
                        }
                        console.log('fetchCookie cookie = ' + cookie);
                        Utils.emitEvent(cookie ? false : true, 136000)
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

              case 'testFetchCookie011': {
                try {
                  webView.WebCookieManager.setCookie(URL, 'a=b');
                  webView.WebCookieManager.deleteEntireCookie()
                  webView.WebCookieManager.fetchCookie(URL, (error, cookie) => {
                    if (error) {
                      console.log('error: ' + JSON.stringify(error));
                      return;
                    }
                    console.log('fetchCookie cookie = ' + cookie);
                    Utils.emitEvent(cookie ? false : true, 136010)
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'testFetchCookie012': {
                try {
                  webView.WebCookieManager.configCookieSync(URL, 'a=b');
                  webView.WebCookieManager.clearAllCookiesSync();
                  webView.WebCookieManager.fetchCookie(URL, (error, cookie) => {
                    if (error) {
                      console.log('error: ' + JSON.stringify(error));
                      return;
                    }
                    console.log('fetchCookie cookie = ' + cookie);
                    Utils.emitEvent(cookie ? false : true, 136020)
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'testFetchCookie013': {
                try {
                  webView.WebCookieManager.configCookieSync(URL, 'a=b');
                  webView.WebCookieManager.clearAllCookies((error) => {
                    if (error) {
                      console.log('error: ' + error);
                    }
                    webView.WebCookieManager.fetchCookie(URL, (error, cookie) => {
                      if (error) {
                        console.log('error: ' + JSON.stringify(error));
                        return;
                      }
                      console.log('fetchCookie cookie = ' + cookie);
                      Utils.emitEvent(cookie ? false : true, 136030)
                    })
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'testFetchCookie014': {
                try {
                  webView.WebCookieManager.configCookieSync(URL, 'a=b');
                  webView.WebCookieManager.clearAllCookies()
                    .then(() => {
                      console.log('clearAllCookies success!');
                      webView.WebCookieManager.fetchCookie(URL, (error, cookie) => {
                        if (error) {
                          console.log('error: ' + JSON.stringify(error));
                          return;
                        }
                        console.log('fetchCookie cookie = ' + cookie);
                        Utils.emitEvent(cookie ? false : true, 136040)
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

              case 'testFetchCookie015': {
                try {
                  webView.WebCookieManager.configCookieSync(URL, 'a=b');
                  webView.WebCookieManager.clearSessionCookieSync();
                  webView.WebCookieManager.fetchCookie(URL, (error, cookie) => {
                    if (error) {
                      console.log('error: ' + JSON.stringify(error));
                      return;
                    }
                    console.log('fetchCookie cookie = ' + cookie);
                    Utils.emitEvent(cookie ? false : true, 136050)
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'testFetchCookie016': {
                try {
                  webView.WebCookieManager.configCookieSync(URL, 'a=b');
                  webView.WebCookieManager.clearSessionCookie((error) => {
                    if (error) {
                      console.log('error: ' + error);
                    }
                    webView.WebCookieManager.fetchCookie(URL, (error, cookie) => {
                      if (error) {
                        console.log('error: ' + JSON.stringify(error));
                        return;
                      }
                      console.log('fetchCookie cookie = ' + cookie);
                      Utils.emitEvent(cookie ? false : true, 136060)
                    })
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'testFetchCookie017': {
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
                        Utils.emitEvent(cookie ? false : true, 136070)
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

              case 'testFetchCookie018': {
                try {
                  webView.WebCookieManager.configCookieSync(URL, 'a=b');
                  webView.WebCookieManager.deleteEntireCookie()
                  webView.WebCookieManager.fetchCookie(URL, (error, cookie) => {
                    if (error) {
                      console.log('error: ' + JSON.stringify(error));
                      return;
                    }
                    console.log('fetchCookie cookie = ' + cookie);
                    Utils.emitEvent(cookie ? false : true, 136080)
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'testFetchCookie019': {
                try {
                  webView.WebCookieManager.configCookie(URL, 'a=b', (error) => {
                    if (error) {
                      console.log('error: ' + JSON.stringify(error));
                    }
                    webView.WebCookieManager.clearAllCookiesSync();
                    webView.WebCookieManager.fetchCookie(URL, (error, cookie) => {
                      if (error) {
                        console.log('error: ' + JSON.stringify(error));
                        return;
                      }
                      console.log('fetchCookie cookie = ' + cookie);
                      Utils.emitEvent(cookie ? false : true, 136090)
                    })
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'testFetchCookie020': {
                try {
                  webView.WebCookieManager.configCookie(URL, 'a=b', (error) => {
                    if (error) {
                      console.log('error: ' + JSON.stringify(error));
                    }
                    webView.WebCookieManager.clearAllCookies((error) => {
                      if (error) {
                        console.log('error: ' + error);
                      }
                      webView.WebCookieManager.fetchCookie(URL, (error, cookie) => {
                        if (error) {
                          console.log('error: ' + JSON.stringify(error));
                          return;
                        }
                        console.log('fetchCookie cookie = ' + cookie);
                        Utils.emitEvent(cookie ? false : true, 136100)
                      })
                    })
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'testFetchCookie021': {
                try {
                  webView.WebCookieManager.configCookie(URL, 'a=b', (error) => {
                    if (error) {
                      console.log('error: ' + JSON.stringify(error));
                    }
                    webView.WebCookieManager.clearAllCookies()
                      .then(() => {
                        console.log('clearAllCookies success!');
                        webView.WebCookieManager.fetchCookie(URL, (error, cookie) => {
                          if (error) {
                            console.log('error: ' + JSON.stringify(error));
                            return;
                          }
                          console.log('fetchCookie cookie = ' + cookie);
                          Utils.emitEvent(cookie ? false : true, 136110)
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

              case 'testFetchCookie022': {
                try {
                  webView.WebCookieManager.configCookie(URL, 'a=b', (error) => {
                    if (error) {
                      console.log('error: ' + JSON.stringify(error));
                    }
                    webView.WebCookieManager.clearSessionCookieSync();
                    webView.WebCookieManager.fetchCookie(URL, (error, cookie) => {
                      if (error) {
                        console.log('error: ' + JSON.stringify(error));
                        return;
                      }
                      console.log('fetchCookie cookie = ' + cookie);
                      Utils.emitEvent(cookie ? false : true, 136120)
                    })
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'testFetchCookie023': {
                try {
                  webView.WebCookieManager.configCookie(URL, 'a=b', (error) => {
                    if (error) {
                      console.log('error: ' + JSON.stringify(error));
                    }
                    webView.WebCookieManager.clearSessionCookie((error) => {
                      if (error) {
                        console.log('error: ' + error);
                      }
                      webView.WebCookieManager.fetchCookie(URL, (error, cookie) => {
                        if (error) {
                          console.log('error: ' + JSON.stringify(error));
                          return;
                        }
                        console.log('fetchCookie cookie = ' + cookie);
                        Utils.emitEvent(cookie ? false : true, 136130)
                      })
                    })
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'testFetchCookie024': {
                try {
                  webView.WebCookieManager.configCookie(URL, 'a=b', (error) => {
                    if (error) {
                      console.log('error: ' + JSON.stringify(error));
                    }
                    webView.WebCookieManager.clearSessionCookie()
                      .then(() => {
                        console.log('clearSessionCookie success!');
                        webView.WebCookieManager.fetchCookie(URL, (error, cookie) => {
                          if (error) {
                            console.log('error: ' + JSON.stringify(error));
                            return;
                          }
                          console.log('fetchCookie cookie = ' + cookie);
                          Utils.emitEvent(cookie ? false : true, 136140)
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

              case 'testFetchCookie025': {
                try {
                  webView.WebCookieManager.configCookie(URL, 'a=b', (error) => {
                    if (error) {
                      console.log('error: ' + JSON.stringify(error));
                    }
                    webView.WebCookieManager.deleteEntireCookie()
                    webView.WebCookieManager.fetchCookie(URL, (error, cookie) => {
                      if (error) {
                        console.log('error: ' + JSON.stringify(error));
                        return;
                      }
                      console.log('fetchCookie cookie = ' + cookie);
                      Utils.emitEvent(cookie ? false : true, 136150)
                    })
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'testFetchCookie026': {
                try {
                  webView.WebCookieManager.configCookie(URL, 'a=b')
                    .then(() => {
                      console.log('configCookie success!');
                      webView.WebCookieManager.clearAllCookiesSync();
                      webView.WebCookieManager.fetchCookie(URL, (error, cookie) => {
                        if (error) {
                          console.log('error: ' + JSON.stringify(error));
                          return;
                        }
                        console.log('fetchCookie cookie = ' + cookie);
                        Utils.emitEvent(cookie ? false : true, 136160)
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

              case 'testFetchCookie027': {
                try {
                  webView.WebCookieManager.configCookie(URL, 'a=b')
                    .then(() => {
                      console.log('configCookie success!');
                      webView.WebCookieManager.clearAllCookies((error) => {
                        if (error) {
                          console.log('error: ' + error);
                        }
                        webView.WebCookieManager.fetchCookie(URL, (error, cookie) => {
                          if (error) {
                            console.log('error: ' + JSON.stringify(error));
                            return;
                          }
                          console.log('fetchCookie cookie = ' + cookie);
                          Utils.emitEvent(cookie ? false : true, 136170)
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

              case 'testFetchCookie028': {
                try {
                  webView.WebCookieManager.configCookie(URL, 'a=b')
                    .then(() => {
                      console.log('configCookie success!');
                      webView.WebCookieManager.clearAllCookies()
                        .then(() => {
                          console.log('clearAllCookies success!');
                          webView.WebCookieManager.fetchCookie(URL, (error, cookie) => {
                            if (error) {
                              console.log('error: ' + JSON.stringify(error));
                              return;
                            }
                            console.log('fetchCookie cookie = ' + cookie);
                            Utils.emitEvent(cookie ? false : true, 136180)
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

              case 'testFetchCookie029': {
                try {
                  webView.WebCookieManager.configCookie(URL, 'a=b')
                    .then(() => {
                      console.log('configCookie success!');
                      webView.WebCookieManager.clearSessionCookieSync();
                      webView.WebCookieManager.fetchCookie(URL, (error, cookie) => {
                        if (error) {
                          console.log('error: ' + JSON.stringify(error));
                          return;
                        }
                        console.log('fetchCookie cookie = ' + cookie);
                        Utils.emitEvent(cookie ? false : true, 136190)
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

              case 'testFetchCookie030': {
                try {
                  webView.WebCookieManager.configCookie(URL, 'a=b')
                    .then(() => {
                      console.log('configCookie success!');
                      webView.WebCookieManager.clearSessionCookie((error) => {
                        if (error) {
                          console.log('error: ' + error);
                        }
                        webView.WebCookieManager.fetchCookie(URL, (error, cookie) => {
                          if (error) {
                            console.log('error: ' + JSON.stringify(error));
                            return;
                          }
                          console.log('fetchCookie cookie = ' + cookie);
                          Utils.emitEvent(cookie ? false : true, 136200)
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
