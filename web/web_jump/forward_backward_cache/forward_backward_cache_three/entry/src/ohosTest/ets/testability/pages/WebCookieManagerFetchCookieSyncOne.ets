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
import business_error from '@ohos.base'
import { waitForExist } from '../../test/WaitTest';
import { URL } from '../../test/Config';

@Entry
@Component
struct WebCookieManagerFetchCookieSync {
  controller: webView.WebviewController = new webView.WebviewController();
  controllerTwo: webView.WebviewController = new webView.WebviewController();
  @State console: string = ''
  @State str: string = ''
  @State isComplete: number = -1;
  @State isReceive: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 136750,
      priority: events_emitter.EventPriority.LOW,
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(136750)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 0;
        if (this.controller) {
          this.controller.loadUrl('resource://rawfile/index.html');
        }
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button('WebCookieManagerFetchCookieSync click').key('WebCookieManagerFetchCookieSyncTestButton')
          .onClick(async () => {
            await waitForExist(() => this.isComplete, this.str, 0);
            await waitForExist(() => this.isReceive, this.str, 0);
            this.isReceive = -1;

            this.controller.clearHistory();
            console.info('key==>' + this.str)
            switch (this.str) {
              case 'testFetchCookieSync001': {
                try {
                  webView.WebCookieManager.setCookie(URL, 'a=b');
                  let value = webView.WebCookieManager.fetchCookieSync(URL);
                  console.log('fetchCookieSync cookie = ' + value);
                  Utils.emitEvent(value, 136760)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'testFetchCookieSync002': {
                try {
                  webView.WebCookieManager.configCookieSync(URL, 'a=c');
                  let value = webView.WebCookieManager.fetchCookieSync(URL);
                  console.log('fetchCookieSync cookie = ' + value);
                  Utils.emitEvent(value, 136770)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'testFetchCookieSync003': {
                try {
                  webView.WebCookieManager.configCookie(URL, 'a=d', (error) => {
                    if (error) {
                      console.log('error: ' + JSON.stringify(error));
                    }
                    let value = webView.WebCookieManager.fetchCookieSync(URL);
                    console.log('fetchCookieSync cookie = ' + value);
                    Utils.emitEvent(value, 136780)
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'testFetchCookieSync004': {
                try {
                  webView.WebCookieManager.configCookie(URL, 'a=e')
                    .then(() => {
                      console.log('configCookie success!');
                      let value = webView.WebCookieManager.fetchCookieSync(URL);
                      console.log('fetchCookieSync cookie = ' + value);
                      Utils.emitEvent(value, 136790)
                    })
                    .catch((error: business_error.BusinessError) => {
                      console.log('error: ' + JSON.stringify(error));
                    })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'testFetchCookieSync005': {
                try {
                  webView.WebCookieManager.setCookie(URL, 'a=b');
                  webView.WebCookieManager.clearAllCookiesSync();
                  let value = webView.WebCookieManager.fetchCookieSync(URL);
                  console.log('fetchCookieSync cookie = ' + value);
                  Utils.emitEvent(value ? false : true, 136800)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'testFetchCookieSync006': {
                try {
                  webView.WebCookieManager.setCookie(URL, 'a=b');
                  webView.WebCookieManager.clearAllCookies((error) => {
                    if (error) {
                      console.log('error: ' + error);
                    }
                    let value = webView.WebCookieManager.fetchCookieSync(URL);
                    console.log('fetchCookieSync cookie = ' + value);
                    Utils.emitEvent(value ? false : true, 136810)
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'testFetchCookieSync007': {
                try {
                  webView.WebCookieManager.setCookie(URL, 'a=b');
                  webView.WebCookieManager.clearAllCookies()
                    .then(() => {
                      console.log('clearAllCookies success!');
                      let value = webView.WebCookieManager.fetchCookieSync(URL);
                      console.log('fetchCookieSync cookie = ' + value);
                      Utils.emitEvent(value ? false : true, 136820)
                    })
                    .catch((error: business_error.BusinessError) => {
                      console.error('error: ' + error);
                    });
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'testFetchCookieSync008': {
                try {
                  webView.WebCookieManager.setCookie(URL, 'a=b');
                  webView.WebCookieManager.clearSessionCookieSync();
                  let value = webView.WebCookieManager.fetchCookieSync(URL);
                  console.log('fetchCookieSync cookie = ' + value);
                  Utils.emitEvent(value ? false : true, 136830)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'testFetchCookieSync009': {
                try {
                  webView.WebCookieManager.setCookie(URL, 'a=b');
                  webView.WebCookieManager.clearSessionCookie((error) => {
                    if (error) {
                      console.log('error: ' + error);
                    }
                    let value = webView.WebCookieManager.fetchCookieSync(URL);
                    console.log('fetchCookieSync cookie = ' + value);
                    Utils.emitEvent(value ? false : true, 136840)
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'testFetchCookieSync010': {
                try {
                  webView.WebCookieManager.setCookie(URL, 'a=b');
                  webView.WebCookieManager.clearSessionCookie()
                    .then(() => {
                      console.log('clearSessionCookie success!');
                      let value = webView.WebCookieManager.fetchCookieSync(URL);
                      console.log('fetchCookieSync cookie = ' + value);
                      Utils.emitEvent(value ? false : true, 136850)
                    })
                    .catch((error: business_error.BusinessError) => {
                      console.error('error: ' + error);
                    });
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'testFetchCookieSync011': {
                try {
                  webView.WebCookieManager.setCookie(URL, 'a=b');
                  webView.WebCookieManager.deleteEntireCookie()
                  let value = webView.WebCookieManager.fetchCookieSync(URL);
                  console.log('fetchCookieSync cookie = ' + value);
                  Utils.emitEvent(value ? false : true, 136860)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'testFetchCookieSync012': {
                try {
                  webView.WebCookieManager.configCookieSync(URL, 'a=b');
                  webView.WebCookieManager.clearAllCookiesSync();
                  let value = webView.WebCookieManager.fetchCookieSync(URL);
                  console.log('fetchCookieSync cookie = ' + value);
                  Utils.emitEvent(value ? false : true, 136870)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'testFetchCookieSync013': {
                try {
                  webView.WebCookieManager.configCookieSync(URL, 'a=b');
                  webView.WebCookieManager.clearAllCookies((error) => {
                    if (error) {
                      console.log('error: ' + error);
                    }
                    let value = webView.WebCookieManager.fetchCookieSync(URL);
                    console.log('fetchCookieSync cookie = ' + value);
                    Utils.emitEvent(value ? false : true, 136880)
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'testFetchCookieSync014': {
                try {
                  webView.WebCookieManager.configCookieSync(URL, 'a=b');
                  webView.WebCookieManager.clearAllCookies()
                    .then(() => {
                      console.log('clearAllCookies success!');
                      let value = webView.WebCookieManager.fetchCookieSync(URL);
                      console.log('fetchCookieSync cookie = ' + value);
                      Utils.emitEvent(value ? false : true, 136890)
                    })
                    .catch((error: business_error.BusinessError) => {
                      console.error('error: ' + error);
                    });
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'testFetchCookieSync015': {
                try {
                  webView.WebCookieManager.configCookieSync(URL, 'a=b');
                  webView.WebCookieManager.clearSessionCookieSync();
                  let value = webView.WebCookieManager.fetchCookieSync(URL);
                  console.log('fetchCookieSync cookie = ' + value);
                  Utils.emitEvent(value ? false : true, 136900)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'testFetchCookieSync016': {
                try {
                  webView.WebCookieManager.configCookieSync(URL, 'a=b');
                  webView.WebCookieManager.clearSessionCookie((error) => {
                    if (error) {
                      console.log('error: ' + error);
                    }
                    let value = webView.WebCookieManager.fetchCookieSync(URL);
                    console.log('fetchCookieSync cookie = ' + value);
                    Utils.emitEvent(value ? false : true, 136910)
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'testFetchCookieSync017': {
                try {
                  webView.WebCookieManager.configCookieSync(URL, 'a=b');
                  webView.WebCookieManager.clearSessionCookie()
                    .then(() => {
                      console.log('clearSessionCookie success!');
                      let value = webView.WebCookieManager.fetchCookieSync(URL);
                      console.log('fetchCookieSync cookie = ' + value);
                      Utils.emitEvent(value ? false : true, 136920)
                    })
                    .catch((error: business_error.BusinessError) => {
                      console.error('error: ' + error);
                    });
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'testFetchCookieSync018': {
                try {
                  webView.WebCookieManager.configCookieSync(URL, 'a=b');
                  webView.WebCookieManager.deleteEntireCookie()
                  let value = webView.WebCookieManager.fetchCookieSync(URL);
                  console.log('fetchCookieSync cookie = ' + value);
                  Utils.emitEvent(value ? false : true, 136930)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'testFetchCookieSync019': {
                try {
                  webView.WebCookieManager.configCookie(URL, 'a=b', (error) => {
                    if (error) {
                      console.log('error: ' + JSON.stringify(error));
                    }
                    webView.WebCookieManager.clearAllCookiesSync();
                    let value = webView.WebCookieManager.fetchCookieSync(URL);
                    console.log('fetchCookieSync cookie = ' + value);
                    Utils.emitEvent(value ? false : true, 136940)
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'testFetchCookieSync020': {
                try {
                  webView.WebCookieManager.configCookie(URL, 'a=b', (error) => {
                    if (error) {
                      console.log('error: ' + JSON.stringify(error));
                    }
                    webView.WebCookieManager.clearAllCookies((error) => {
                      if (error) {
                        console.log('error: ' + error);
                      }
                      let value = webView.WebCookieManager.fetchCookieSync(URL);
                      console.log('fetchCookieSync cookie = ' + value);
                      Utils.emitEvent(value ? false : true, 136950)
                    })
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'testFetchCookieSync021': {
                try {
                  webView.WebCookieManager.configCookie(URL, 'a=b', (error) => {
                    if (error) {
                      console.log('error: ' + JSON.stringify(error));
                    }
                    webView.WebCookieManager.clearAllCookies()
                      .then(() => {
                        console.log('clearAllCookies success!');
                        let value = webView.WebCookieManager.fetchCookieSync(URL);
                        console.log('fetchCookieSync cookie = ' + value);
                        Utils.emitEvent(value ? false : true, 136960)
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

              case 'testFetchCookieSync022': {
                try {
                  webView.WebCookieManager.configCookie(URL, 'a=b', (error) => {
                    if (error) {
                      console.log('error: ' + JSON.stringify(error));
                    }
                    webView.WebCookieManager.clearSessionCookieSync();
                    let value = webView.WebCookieManager.fetchCookieSync(URL);
                    console.log('fetchCookieSync cookie = ' + value);
                    Utils.emitEvent(value ? false : true, 136970)
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'testFetchCookieSync023': {
                try {
                  webView.WebCookieManager.configCookie(URL, 'a=b', (error) => {
                    if (error) {
                      console.log('error: ' + JSON.stringify(error));
                    }
                    webView.WebCookieManager.clearSessionCookie((error) => {
                      if (error) {
                        console.log('error: ' + error);
                      }
                      let value = webView.WebCookieManager.fetchCookieSync(URL);
                      console.log('fetchCookieSync cookie = ' + value);
                      Utils.emitEvent(value ? false : true, 136980)
                    })
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'testFetchCookieSync024': {
                try {
                  webView.WebCookieManager.configCookie(URL, 'a=b', (error) => {
                    if (error) {
                      console.log('error: ' + JSON.stringify(error));
                    }
                    webView.WebCookieManager.clearSessionCookie()
                      .then(() => {
                        console.log('clearSessionCookie success!');
                        let value = webView.WebCookieManager.fetchCookieSync(URL);
                        console.log('fetchCookieSync cookie = ' + value);
                        Utils.emitEvent(value ? false : true, 136990)
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

              case 'testFetchCookieSync025': {
                try {
                  webView.WebCookieManager.configCookie(URL, 'a=b', (error) => {
                    if (error) {
                      console.log('error: ' + JSON.stringify(error));
                    }
                    webView.WebCookieManager.deleteEntireCookie()
                    let value = webView.WebCookieManager.fetchCookieSync(URL);
                    console.log('fetchCookieSync cookie = ' + value);
                    Utils.emitEvent(value ? false : true, 137000)
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'testFetchCookieSync026': {
                try {
                  webView.WebCookieManager.configCookie(URL, 'a=b')
                    .then(() => {
                      console.log('configCookie success!');
                      webView.WebCookieManager.clearAllCookiesSync();
                      let value = webView.WebCookieManager.fetchCookieSync(URL);
                      console.log('fetchCookieSync cookie = ' + value);
                      Utils.emitEvent(value ? false : true, 137010)
                    })
                    .catch((error: business_error.BusinessError) => {
                      console.log('error: ' + JSON.stringify(error));
                    })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'testFetchCookieSync027': {
                try {
                  webView.WebCookieManager.configCookie(URL, 'a=b')
                    .then(() => {
                      console.log('configCookie success!');
                      webView.WebCookieManager.clearAllCookies((error) => {
                        if (error) {
                          console.log('error: ' + error);
                        }
                        let value = webView.WebCookieManager.fetchCookieSync(URL);
                        console.log('fetchCookieSync cookie = ' + value);
                        Utils.emitEvent(value ? false : true, 137020)
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

              case 'testFetchCookieSync028': {
                try {
                  webView.WebCookieManager.configCookie(URL, 'a=b')
                    .then(() => {
                      console.log('configCookie success!');
                      webView.WebCookieManager.clearAllCookies()
                        .then(() => {
                          console.log('clearAllCookies success!');
                          let value = webView.WebCookieManager.fetchCookieSync(URL);
                          console.log('fetchCookieSync cookie = ' + value);
                          Utils.emitEvent(value ? false : true, 137030)
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

              case 'testFetchCookieSync029': {
                try {
                  webView.WebCookieManager.configCookie(URL, 'a=b')
                    .then(() => {
                      console.log('configCookie success!');
                      webView.WebCookieManager.clearSessionCookieSync();
                      let value = webView.WebCookieManager.fetchCookieSync(URL);
                      console.log('fetchCookieSync cookie = ' + value);
                      Utils.emitEvent(value ? false : true, 137040)
                    })
                    .catch((error: business_error.BusinessError) => {
                      console.log('error: ' + JSON.stringify(error));
                    })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'testFetchCookieSync030': {
                try {
                  webView.WebCookieManager.configCookie(URL, 'a=b')
                    .then(() => {
                      console.log('configCookie success!');
                      webView.WebCookieManager.clearSessionCookie((error) => {
                        if (error) {
                          console.log('error: ' + error);
                        }
                        let value = webView.WebCookieManager.fetchCookieSync(URL);
                        console.log('fetchCookieSync cookie = ' + value);
                        Utils.emitEvent(value ? false : true, 137050)
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
          })
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
