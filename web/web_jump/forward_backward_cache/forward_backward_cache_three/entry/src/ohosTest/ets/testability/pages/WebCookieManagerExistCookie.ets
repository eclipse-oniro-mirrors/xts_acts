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
struct WebCookieManagerExistCookie {
  controller: webView.WebviewController = new webView.WebviewController();
  @State console: string = ''
  @State str: string = ''
  @State isComplete: number = -1;
  @State isReceive: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 135550,
      priority: events_emitter.EventPriority.LOW,
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(135550)
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
        Button('WebCookieManagerExistCookie click').key('WebCookieManagerExistCookieTestButton')
          .onClick(async () => {
            await waitForExist(() => this.isComplete, this.str, 0);
            await waitForExist(() => this.isReceive, this.str, 0);
            this.isReceive = -1;

            this.controller.clearHistory();

            console.info('key==>' + this.str)
            switch (this.str) {

              case 'testExistCookie002': {
                try {
                  webView.WebCookieManager.configCookieSync(URL, 'a=c');
                  let isCookie = webView.WebCookieManager.existCookie()
                  Utils.emitEvent(isCookie, 135560)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'testExistCookie003': {
                try {
                  webView.WebCookieManager.configCookie(URL, 'a=d', (error) => {
                    if (error) {
                      console.log('error: ' + JSON.stringify(error));
                    }
                    let isCookie = webView.WebCookieManager.existCookie()
                    Utils.emitEvent(isCookie, 135570)
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'testExistCookie004': {
                try {
                  webView.WebCookieManager.configCookie(URL, 'a=e')
                    .then(() => {
                      console.log('configCookie success!');
                      let isCookie = webView.WebCookieManager.existCookie()
                      Utils.emitEvent(isCookie, 135580)
                    })
                    .catch((error: business_error.BusinessError) => {
                      console.log('error: ' + JSON.stringify(error));
                    })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'testExistCookie005': {
                try {
                  webView.WebCookieManager.setCookie(URL, 'a=b');
                  webView.WebCookieManager.clearAllCookiesSync();
                  let isCookie = webView.WebCookieManager.existCookie()
                  Utils.emitEvent(isCookie, 135590)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'testExistCookie006': {
                try {
                  webView.WebCookieManager.setCookie(URL, 'a=b');
                  webView.WebCookieManager.clearAllCookies((error) => {
                    if (error) {
                      console.log('error: ' + error);
                    }
                    let isCookie = webView.WebCookieManager.existCookie()
                    Utils.emitEvent(isCookie, 135600)
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'testExistCookie007': {
                try {
                  webView.WebCookieManager.setCookie(URL, 'a=b');
                  webView.WebCookieManager.clearAllCookies()
                    .then(() => {
                      console.log('clearAllCookies success!');
                      let isCookie = webView.WebCookieManager.existCookie()
                      Utils.emitEvent(isCookie, 135610)
                    })
                    .catch((error: business_error.BusinessError) => {
                      console.error('error: ' + error);
                    });
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'testExistCookie008': {
                try {
                  webView.WebCookieManager.setCookie(URL, 'a=b');
                  webView.WebCookieManager.clearSessionCookieSync();
                  let isCookie = webView.WebCookieManager.existCookie()
                  Utils.emitEvent(isCookie, 135620)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'testExistCookie009': {
                try {
                  webView.WebCookieManager.setCookie(URL, 'a=b');
                  webView.WebCookieManager.clearSessionCookie((error) => {
                    if (error) {
                      console.log('error: ' + error);
                    }
                    let isCookie = webView.WebCookieManager.existCookie()
                    Utils.emitEvent(isCookie, 135630)
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'testExistCookie010': {
                try {
                  webView.WebCookieManager.setCookie(URL, 'a=b');
                  webView.WebCookieManager.clearSessionCookie()
                    .then(() => {
                      console.log('clearSessionCookie success!');
                      let isCookie = webView.WebCookieManager.existCookie()
                      Utils.emitEvent(isCookie, 135640)
                    })
                    .catch((error: business_error.BusinessError) => {
                      console.error('error: ' + error);
                    });
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'testExistCookie011': {
                try {
                  webView.WebCookieManager.configCookieSync(URL, 'a=b');
                  webView.WebCookieManager.clearAllCookiesSync();
                  let isCookie = webView.WebCookieManager.existCookie()
                  Utils.emitEvent(isCookie, 135650)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'testExistCookie012': {
                try {
                  webView.WebCookieManager.configCookieSync(URL, 'a=b');
                  webView.WebCookieManager.clearAllCookies((error) => {
                    if (error) {
                      console.log('error: ' + error);
                    }
                    let isCookie = webView.WebCookieManager.existCookie()
                    Utils.emitEvent(isCookie, 135660)
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'testExistCookie013': {
                try {
                  webView.WebCookieManager.configCookieSync(URL, 'a=b');
                  webView.WebCookieManager.clearAllCookies()
                    .then(() => {
                      console.log('clearAllCookies success!');
                      let isCookie = webView.WebCookieManager.existCookie()
                      Utils.emitEvent(isCookie, 135670)
                    })
                    .catch((error: business_error.BusinessError) => {
                      console.error('error: ' + error);
                    });
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'testExistCookie014': {
                try {
                  webView.WebCookieManager.configCookieSync(URL, 'a=b');
                  webView.WebCookieManager.clearSessionCookieSync();
                  let isCookie = webView.WebCookieManager.existCookie()
                  Utils.emitEvent(isCookie, 135680)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'testExistCookie015': {
                try {
                  webView.WebCookieManager.configCookieSync(URL, 'a=b');
                  webView.WebCookieManager.clearSessionCookie((error) => {
                    if (error) {
                      console.log('error: ' + error);
                    }
                    let isCookie = webView.WebCookieManager.existCookie()
                    Utils.emitEvent(isCookie, 135690)
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'testExistCookie016': {
                try {
                  webView.WebCookieManager.configCookieSync(URL, 'a=b');
                  webView.WebCookieManager.clearSessionCookie()
                    .then(() => {
                      console.log('clearSessionCookie success!');
                      let isCookie = webView.WebCookieManager.existCookie()
                      Utils.emitEvent(isCookie, 135700)
                    })
                    .catch((error: business_error.BusinessError) => {
                      console.error('error: ' + error);
                    });
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'testExistCookie017': {
                try {
                  webView.WebCookieManager.configCookieSync(URL, 'a=b');
                  webView.WebCookieManager.deleteEntireCookie()
                  let isCookie = webView.WebCookieManager.existCookie()
                  Utils.emitEvent(isCookie, 135710)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'testExistCookie018': {
                try {
                  webView.WebCookieManager.configCookie(URL, 'a=b', (error) => {
                    if (error) {
                      console.log('error: ' + JSON.stringify(error));
                    }
                    webView.WebCookieManager.clearAllCookiesSync();
                    let isCookie = webView.WebCookieManager.existCookie()
                    Utils.emitEvent(isCookie, 135720)
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'testExistCookie019': {
                try {
                  webView.WebCookieManager.configCookie(URL, 'a=b', (error) => {
                    if (error) {
                      console.log('error: ' + JSON.stringify(error));
                    }
                    webView.WebCookieManager.clearAllCookies((error) => {
                      if (error) {
                        console.log('error: ' + error);
                      }
                      let isCookie = webView.WebCookieManager.existCookie()
                      Utils.emitEvent(isCookie, 135730)
                    })
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'testExistCookie020': {
                try {
                  webView.WebCookieManager.configCookie(URL, 'a=b', (error) => {
                    if (error) {
                      console.log('error: ' + JSON.stringify(error));
                    }
                    webView.WebCookieManager.clearAllCookies()
                      .then(() => {
                        console.log('clearAllCookies success!');
                        let isCookie = webView.WebCookieManager.existCookie()
                        Utils.emitEvent(isCookie, 135740)
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

              case 'testExistCookie021': {
                try {
                  webView.WebCookieManager.configCookie(URL, 'a=b', (error) => {
                    if (error) {
                      console.log('error: ' + JSON.stringify(error));
                    }
                    webView.WebCookieManager.clearSessionCookieSync();
                    let isCookie = webView.WebCookieManager.existCookie()
                    Utils.emitEvent(isCookie, 135750)
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'testExistCookie022': {
                try {
                  webView.WebCookieManager.configCookie(URL, 'a=b', (error) => {
                    if (error) {
                      console.log('error: ' + JSON.stringify(error));
                    }
                    webView.WebCookieManager.clearSessionCookie((error) => {
                      if (error) {
                        console.log('error: ' + error);
                      }
                      let isCookie = webView.WebCookieManager.existCookie()

                      Utils.emitEvent(isCookie, 135760)
                    })
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'testExistCookie023': {
                try {
                  webView.WebCookieManager.configCookie(URL, 'a=b', (error) => {
                    if (error) {
                      console.log('error: ' + JSON.stringify(error));
                    }
                    webView.WebCookieManager.clearSessionCookie()
                      .then(() => {
                        console.log('clearSessionCookie success!');
                        let isCookie = webView.WebCookieManager.existCookie()

                        Utils.emitEvent(isCookie, 135770)
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

              case 'testExistCookie024': {
                try {
                  webView.WebCookieManager.configCookie(URL, 'a=b', (error) => {
                    if (error) {
                      console.log('error: ' + JSON.stringify(error));
                    }
                    webView.WebCookieManager.deleteEntireCookie()
                    let isCookie = webView.WebCookieManager.existCookie()
                    Utils.emitEvent(isCookie, 135780)
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'testExistCookie025': {
                try {
                  webView.WebCookieManager.configCookie(URL, 'a=b')
                    .then(() => {
                      console.log('configCookie success!');
                      webView.WebCookieManager.clearAllCookiesSync();
                      let isCookie = webView.WebCookieManager.existCookie()

                      Utils.emitEvent(isCookie, 135790)
                    })
                    .catch((error: business_error.BusinessError) => {
                      console.log('error: ' + JSON.stringify(error));
                    })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'testExistCookie026': {
                try {
                  webView.WebCookieManager.configCookie(URL, 'a=b')
                    .then(() => {
                      console.log('configCookie success!');
                      webView.WebCookieManager.clearAllCookies((error) => {
                        if (error) {
                          console.log('error: ' + error);
                        }
                        let isCookie = webView.WebCookieManager.existCookie()
                        Utils.emitEvent(isCookie, 135800)
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

              case 'testExistCookie027': {
                try {
                  webView.WebCookieManager.configCookie(URL, 'a=b')
                    .then(() => {
                      console.log('configCookie success!');
                      webView.WebCookieManager.clearAllCookies()
                        .then(() => {
                          console.log('clearAllCookies success!');
                          let isCookie = webView.WebCookieManager.existCookie()
                          Utils.emitEvent(isCookie, 135810)
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

              case 'testExistCookie028': {
                try {
                  webView.WebCookieManager.configCookie(URL, 'a=b')
                    .then(() => {
                      console.log('configCookie success!');
                      webView.WebCookieManager.clearSessionCookieSync();
                      let isCookie = webView.WebCookieManager.existCookie()
                      Utils.emitEvent(isCookie, 135820)
                    })
                    .catch((error: business_error.BusinessError) => {
                      console.log('error: ' + JSON.stringify(error));
                    })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'testExistCookie029': {
                try {
                  webView.WebCookieManager.configCookie(URL, 'a=b')
                    .then(() => {
                      console.log('configCookie success!');
                      webView.WebCookieManager.clearSessionCookie((error) => {
                        if (error) {
                          console.log('error: ' + error);
                        }
                        let isCookie = webView.WebCookieManager.existCookie()
                        Utils.emitEvent(isCookie, 135830)
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

              case 'testExistCookie030': {
                try {
                  webView.WebCookieManager.configCookieSync(URL, 'a=b');
                  webView.WebCookieManager.clearSessionCookie()
                    .then(() => {
                      console.log('clearSessionCookie success!');
                      let isCookie = webView.WebCookieManager.existCookie()
                      Utils.emitEvent(isCookie, 135840)
                    })
                    .catch((error: business_error.BusinessError) => {
                      console.error('error: ' + error);
                    });
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'testExistCookie031': {
                try {
                  webView.WebCookieManager.configCookie(URL, 'a=b')
                    .then(() => {
                      console.log('configCookie success!');
                      webView.WebCookieManager.deleteEntireCookie()
                      let isCookie = webView.WebCookieManager.existCookie()
                      Utils.emitEvent(isCookie, 135850)
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
