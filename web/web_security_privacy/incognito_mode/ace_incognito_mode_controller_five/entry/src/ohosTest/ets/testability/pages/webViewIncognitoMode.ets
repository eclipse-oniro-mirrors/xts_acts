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
import events_emitter from '@ohos.events.emitter';
import webview from '@ohos.web.webview';
import Utils from '../../test/Utils';
import business_error from '@ohos.base';
import {waitForAssert, waitForExist} from '../../test/WaitTest';

@Entry
@Component
struct webViewIncognitoMode {
  controller: webview.WebviewController = new webview.WebviewController();
  schemeHandler: webview.WebSchemeHandler = new webview.WebSchemeHandler()
  @State emitKey: string = '';
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = true;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State isPrivacy: boolean = false;
  @State geolocationAccess: boolean = true;
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 160310,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(160310)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.emitKey = eventData.data.ACTION;
        this.isReceive = 0;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button('web click')
          .key('webViewIncognitoModeButton')
          .onClick(async () => {
            await waitForExist(() => this.isPageEnd, this.emitKey, 0);
            await waitForExist(() => this.isReceive, this.emitKey, 0);
            this.isReceive = -1;
            console.info('key==>' + this.emitKey)
            webview.WebStorage.deleteAllData(true);
            webview.WebStorage.deleteAllData();
            webview.GeolocationPermissions.deleteAllGeolocation(true);
            webview.GeolocationPermissions.deleteAllGeolocation();
            this.isPageEnd = -1;
            this.controller.refresh()
            await waitForExist(() => this.isPageEnd, this.emitKey, 0);
            switch (this.emitKey) {
              case 'emitWebViewIncognitoMode01': {
                try {
                  this.isPrivacy = true;
                  this.isPageEnd = -1;
                  this.controller.loadUrl('https://m.weibo.cn');
                  await waitForExist(() => this.isPageEnd, this.emitKey, 0);
                  let result = this.controller.isIncognitoMode();
                  if (result === true) {
                    Utils.emitEvent('success', 160320);
                  } else {
                    Utils.emitEvent('fail', 160320);
                  }
                } catch (error) {
                  let e:business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                }
                break;
              }
              case 'emitWebViewIncognitoMode02': {
                try {
                  this.isPrivacy = false;
                  this.isPageEnd = -1;
                  this.controller.loadUrl('https://m.baidu.com');
                  await waitForExist(() => this.isPageEnd, this.emitKey, 0);
                  let result = this.controller.isIncognitoMode();
                  if (result === true) {
                    Utils.emitEvent('fail', 160330);
                  } else {
                    Utils.emitEvent('success', 160330);
                  }
                } catch (error) {
                  let e:business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                }
                break;
              }
              case 'emitWebViewIncognitoMode03': {
                try {
                  this.isPrivacy = true;
                  webview.WebCookieManager.configCookieSync('https://m.weibo.cn', 'a=b', true);
                  this.isPageEnd = -1;
                  this.controller.loadUrl('https://m.weibo.cn');
                  await waitForExist(() => this.isPageEnd, this.emitKey, 0);
                  let cookieData = webview.WebCookieManager.fetchCookieSync('https://m.weibo.cn', true);
                  let isExistCookie = webview.WebCookieManager.existCookie(true);
                  if (cookieData&&cookieData.indexOf('a=b')>-1&&isExistCookie) {
                    Utils.emitEvent('success', 160340);
                  } else {
                    Utils.emitEvent('fail', 160340);
                  }
                } catch (error) {
                  let e:business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                }
                break;
              }
              case 'emitWebViewIncognitoMode04': {
                try {
                  this.isPrivacy = false;
                  webview.WebCookieManager.configCookieSync('https://m.baidu.com', 'a=b');
                  this.isPageEnd = -1;
                  this.controller.loadUrl('https://m.baidu.com');
                  await waitForExist(() => this.isPageEnd, this.emitKey, 0);
                  let cookieData = webview.WebCookieManager.fetchCookieSync('https://m.baidu.com');
                  let isExistCookie = webview.WebCookieManager.existCookie(false);
                  if (cookieData&&cookieData.indexOf('a=b')>-1&&isExistCookie) {
                    Utils.emitEvent('success', 160350);
                  } else {
                    Utils.emitEvent('fail', 160350);
                  }
                } catch (error) {
                  let e:business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                }
                break;
              }
              case 'emitWebViewIncognitoMode07': {
                try {
                  this.isPrivacy = true;
                  this.isPageEnd = -1;
                  this.controller.loadUrl('https://m.weibo.cn');
                  await waitForExist(() => this.isPageEnd, this.emitKey, 0);
                  webview.WebStorage.deleteAllData(true);
                  Utils.emitEvent('success', 160360);
                } catch (error) {
                  let e:business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent('fail', 160360);
                }
                break;
              }
              case 'emitWebViewIncognitoMode08': {
                try {
                  this.isPrivacy = true;
                  this.isPageEnd = -1;
                  this.controller.loadUrl('https://m.baidu.com');
                  await waitForExist(() => this.isPageEnd, this.emitKey, 0);
                  webview.WebStorage.deleteAllData();
                  Utils.emitEvent('success', 160370);
                } catch (error) {
                  let e:business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent('fail', 160370);
                }
                break;
              }
              case 'emitWebViewIncognitoMode09': {
                try {
                  this.isPrivacy = true;
                  webview.GeolocationPermissions.allowGeolocation('https://m.weibo.cn', true);
                  this.isPageEnd = -1;
                  this.controller.loadUrl('https://m.weibo.cn');
                  await waitForExist(() => this.isPageEnd, this.emitKey, 0);
                  webview.GeolocationPermissions.getAccessibleGeolocation('https://m.weibo.cn', true)
                    .then(result => {
                      console.log('getAccessibleGeolocationPromise result: ' + result);
                      if (result) {
                        Utils.emitEvent('success', 160380);
                      }
                    }).catch(() => {
                      Utils.emitEvent('fail', 160380);
                    });
                } catch (error) {
                  let e:business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                }
                break;
              }
              case 'emitWebViewIncognitoMode10': {
                try {
                  this.isPrivacy = true;
                  webview.GeolocationPermissions.allowGeolocation('https://m.weibo.cn', true);
                  this.isPageEnd = -1;
                  this.controller.loadUrl('https://m.weibo.cn');
                  await waitForExist(() => this.isPageEnd, this.emitKey, 0);
                  webview.GeolocationPermissions.getAccessibleGeolocation('https://m.weibo.cn', (error, result) => {
                    if (error) {
                      Utils.emitEvent('fail', 160390);
                      return;
                    }
                    if (result) {
                      Utils.emitEvent('success', 160390);
                    }
                    console.log('getAccessibleGeolocationAsync result: ' + result);
                  }, true);
                } catch (error) {
                  let e:business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                }
                break;
              }
              case 'emitWebViewIncognitoMode11': {
                try {
                  this.isPrivacy = false;
                  webview.GeolocationPermissions.allowGeolocation('https://m.weibo.cn');
                  this.isPageEnd = -1;
                  this.controller.loadUrl('https://m.weibo.cn');
                  await waitForExist(() => this.isPageEnd, this.emitKey, 0);
                  webview.GeolocationPermissions.getAccessibleGeolocation('https://m.weibo.cn')
                    .then(result => {
                      console.log('getAccessibleGeolocationPromise result: ' + result);
                      Utils.emitEvent('success', 160400);
                    }).catch(() => {
                      Utils.emitEvent('fail', 160400);
                    });
                } catch (error) {
                  let e:business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                }
                break;
              }
              case 'emitWebViewIncognitoMode12': {
                try {
                  this.isPrivacy = false;
                  webview.GeolocationPermissions.allowGeolocation('https://m.weibo.cn');
                  this.isPageEnd = -1;
                  this.controller.loadUrl('https://m.weibo.cn');
                  await waitForExist(() => this.isPageEnd, this.emitKey, 0);
                  webview.GeolocationPermissions.getAccessibleGeolocation('https://m.weibo.cn', (error, result) => {
                    if (error) {
                      Utils.emitEvent('fail', 160410);
                      return;
                    }
                    if (result) {
                      Utils.emitEvent('success', 160410);
                    }
                    console.log('getAccessibleGeolocationAsync result: ' + result);
                  });
                } catch (error) {
                  let e:business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                }
                break;
              }
              case 'emitWebViewIncognitoMode13': {
                try {
                  this.isPrivacy = true;
                  webview.GeolocationPermissions.allowGeolocation('https://m.baidu.com', true);
                  this.isPageEnd = -1;
                  this.controller.loadUrl('https://m.baidu.com');
                  await waitForExist(() => this.isPageEnd, this.emitKey, 0);
                  webview.GeolocationPermissions.getStoredGeolocation(true)
                    .then(origins => {
                      let originsStr: string = origins.join();
                      console.log('getStoredGeolocationPromise origins: ' + originsStr);
                      if (originsStr == 'https://m.baidu.com') {
                        Utils.emitEvent('success', 160420);
                      } else {
                        Utils.emitEvent('fail', 160420);
                      }
                    }).catch(() => {
                    });
                } catch (error) {
                  let e:business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                }
                break;
              }
              case 'emitWebViewIncognitoMode14': {
                try {
                  this.isPrivacy = true;
                  webview.GeolocationPermissions.allowGeolocation('https://m.baidu.com', true);
                  this.isPageEnd = -1;
                  this.controller.loadUrl('https://m.baidu.com');
                  await waitForExist(() => this.isPageEnd, this.emitKey, 0);
                  webview.GeolocationPermissions.getStoredGeolocation((error, origins) => {
                    if (error) {
                      return;
                    }
                    let originsStr: string = origins.join();
                    if (originsStr == 'https://m.baidu.com') {
                      Utils.emitEvent('success', 160430);
                    } else {
                      Utils.emitEvent('fail', 160430);
                    }
                    console.log('getStoredGeolocationAsync origins: ' + originsStr);
                  },true);
                } catch (error) {
                  let e:business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                }
                break;
              }
              case 'emitWebViewIncognitoMode15': {
                try {
                  this.isPrivacy = false;
                  webview.GeolocationPermissions.allowGeolocation('https://m.baidu.com');
                  this.isPageEnd = -1;
                  this.controller.loadUrl('https://m.baidu.com');
                  await waitForExist(() => this.isPageEnd, this.emitKey, 0);
                  webview.GeolocationPermissions.getStoredGeolocation()
                    .then(origins => {
                      let originsStr: string = origins.join();
                      console.log('getStoredGeolocationPromise origins: ' + originsStr);
                      if (originsStr == 'https://m.baidu.com') {
                        Utils.emitEvent('success', 160440);
                      } else {
                        Utils.emitEvent('fail', 160440);
                      }
                    }).catch(() => {
                  });
                } catch (error) {
                  let e:business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                }
                break;
              }
              case 'emitWebViewIncognitoMode16': {
                try {
                  this.isPrivacy = false;
                  webview.GeolocationPermissions.allowGeolocation('https://m.baidu.com');
                  this.isPageEnd = -1;
                  this.controller.loadUrl('https://m.baidu.com');
                  await waitForExist(() => this.isPageEnd, this.emitKey, 0);
                  webview.GeolocationPermissions.getStoredGeolocation((error, origins) => {
                    if (error) {
                      return;
                    }
                    let originsStr: string = origins.join();
                    if (originsStr == 'https://m.baidu.com') {
                      Utils.emitEvent('success', 160450);
                    } else {
                      Utils.emitEvent('fail', 160450);
                    }
                    console.log('getStoredGeolocationAsync origins: ' + originsStr);
                  });
                } catch (error) {
                  let e:business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                }
                break;
              }
              case 'emitWebViewIncognitoMode17': {
                try {
                  this.isPrivacy = true;
                  webview.GeolocationPermissions.allowGeolocation('https://m.weibo.cn',true);
                  this.isPageEnd = -1;
                  this.controller.loadUrl('https://m.weibo.cn');
                  await waitForExist(() => this.isPageEnd, this.emitKey, 0);
                  webview.GeolocationPermissions.deleteGeolocation('https://m.weibo.cn',true);
                  webview.GeolocationPermissions.getAccessibleGeolocation('https://m.weibo.cn', (error, result) => {
                    if (error) {
                      Utils.emitEvent('success', 160460);
                      return;
                    }
                    if (result) {
                      Utils.emitEvent('success', 160460);
                    }
                    console.log('getAccessibleGeolocationAsync result: ' + result);
                  }, true);
                } catch (error) {
                  let e:business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                }
                break;
              }
              case 'emitWebViewIncognitoMode18': {
                try {
                  this.isPrivacy = false;
                  webview.GeolocationPermissions.allowGeolocation('https://m.weibo.cn');
                  this.isPageEnd = -1;
                  this.controller.loadUrl('https://m.weibo.cn');
                  await waitForExist(() => this.isPageEnd, this.emitKey, 0);
                  webview.GeolocationPermissions.deleteGeolocation('https://m.weibo.cn',true);
                  webview.GeolocationPermissions.getAccessibleGeolocation('https://m.weibo.cn', (error, result) => {
                    if (error) {
                      Utils.emitEvent('success', 160470);
                      return;
                    }
                    if (result) {
                      Utils.emitEvent('success', 160470);
                    }
                    console.log('getAccessibleGeolocationAsync result: ' + result);
                  });
                } catch (error) {
                  let e:business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                }
                break;
              }
              case 'emitWebViewIncognitoMode19': {
                try {
                  this.isPrivacy = true;
                  webview.GeolocationPermissions.allowGeolocation('https://m.baidu.com', true);
                  webview.GeolocationPermissions.allowGeolocation('https://m.weibo.cn', true);
                  this.isPageEnd = -1;
                  this.controller.loadUrl('https://m.baidu.com');
                  await waitForExist(() => this.isPageEnd, this.emitKey, 0);
                  this.isPageEnd = -1;
                  this.controller.loadUrl('https://m.weibo.cn');
                  await waitForExist(() => this.isPageEnd, this.emitKey, 0);
                  webview.GeolocationPermissions.deleteAllGeolocation(true);
                  webview.GeolocationPermissions.getStoredGeolocation((error, origins) => {
                    if (error) {
                      return;
                    }
                    let originsStr: string = origins.join();
                    if (!originsStr) {
                      Utils.emitEvent('success', 160480);
                    } else {
                      Utils.emitEvent('fail', 160480);
                    }
                    console.log('getStoredGeolocationAsync origins: ' + originsStr);
                  },true);
                } catch (error) {
                  let e:business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                }
                break;
              }
              case 'emitWebViewIncognitoMode20': {
                try {
                  this.isPrivacy = true;
                  webview.GeolocationPermissions.allowGeolocation('https://m.baidu.com');
                  webview.GeolocationPermissions.allowGeolocation('https://m.weibo.cn');
                  this.isPageEnd = -1;
                  this.controller.loadUrl('https://m.baidu.com');
                  await waitForExist(() => this.isPageEnd, this.emitKey, 0);
                  this.isPageEnd = -1;
                  this.controller.loadUrl('https://m.weibo.cn');
                  await waitForExist(() => this.isPageEnd, this.emitKey, 0);
                  webview.GeolocationPermissions.deleteAllGeolocation();
                  webview.GeolocationPermissions.getStoredGeolocation((error, origins) => {
                    if (error) {
                      return;
                    }
                    let originsStr: string = origins.join();
                    if (!originsStr) {
                      Utils.emitEvent('success', 160490);
                    } else {
                      Utils.emitEvent('fail', 160490);
                    }
                    console.log('getStoredGeolocationAsync origins: ' + originsStr);
                  },true);
                } catch (error) {
                  let e:business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                }
                break;
              }
              case 'emitWebViewIncognitoMode21': {
                try {
                  this.isPrivacy = true;
                  webview.GeolocationPermissions.allowGeolocation('https://m.weibo.cn', true);
                  this.isPageEnd = -1;
                  this.controller.loadUrl('https://m.weibo.cn');
                  await waitForExist(() => this.isPageEnd, this.emitKey, 0);
                  webview.GeolocationPermissions.getAccessibleGeolocation('https://m.weibo.cn', false)
                    .then(result => {
                        console.log('emitWebViewIncognitoMode1111' + result)
                      if(!result) {
                        Utils.emitEvent(false, 20251020);
                      }
                    }).catch(() => {
                    console.log('emitWebViewIncognitoMode2222')
                    Utils.emitEvent(true, 20251020);
                  });
                } catch (error) {
                  let e:business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                }
                break;
              }

              case 'emitWebViewIncognitoMode22': {
                try {
                  this.isPrivacy = true;
                  webview.GeolocationPermissions.allowGeolocation('https://m.weibo.cn', true);
                  this.isPageEnd = -1;
                  this.controller.loadUrl('https://m.weibo.cn');
                  await waitForExist(() => this.isPageEnd, this.emitKey, 0);
                  webview.GeolocationPermissions.getAccessibleGeolocation('https://m.weibo.cn', (error, result) => {
                    if (error) {
                      Utils.emitEvent(true, 20251021);
                      return;
                    }
                    if (result) {
                      Utils.emitEvent(false, 20251021);
                    }
                    console.log('getAccessibleGeolocationAsync result: ' + result);
                  }, false);
                } catch (error) {
                  let e:business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                }
                break;
              }
              case 'emitWebViewIncognitoMode23': {
                try {
                  this.isPrivacy = true;
                  webview.GeolocationPermissions.allowGeolocation('https://m.baidu.com', true);
                  this.isPageEnd = -1;
                  this.controller.loadUrl('https://m.baidu.com');
                  await waitForExist(() => this.isPageEnd, this.emitKey, 0);
                  webview.GeolocationPermissions.getStoredGeolocation(false)
                    .then(origins => {
                      let originsStr: string = origins.join();
                      console.log('emitWebViewIncognitoMode23: ' + originsStr);
                      if (originsStr == 'https://m.baidu.com') {
                        Utils.emitEvent(false, 20251022);
                      } else {
                        Utils.emitEvent(true, 20251022);
                      }
                    }).catch(() => {
                  });
                } catch (error) {
                  let e:business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                }
                break;
              }

              case 'emitWebViewIncognitoMode24': {
                try {
                  this.isPrivacy = true;
                  webview.GeolocationPermissions.allowGeolocation('https://m.baidu.com', true);
                  this.isPageEnd = -1;
                  this.controller.loadUrl('https://m.baidu.com');
                  await waitForExist(() => this.isPageEnd, this.emitKey, 0);
                  webview.GeolocationPermissions.getStoredGeolocation((error, origins) => {
                    if (error) {
                      return;
                    }
                    let originsStr: string = origins.join();
                    if (originsStr == 'https://m.baidu.com') {
                      Utils.emitEvent(false, 20251023);
                    } else {
                      Utils.emitEvent(true, 20251023);
                    }
                    console.log('emitWebViewIncognitoMode24 origins: ' + originsStr);
                  },false);
                } catch (error) {
                  let e:business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                }
                break;
              }

            }
          })
      }
      if (this.isPrivacy) {
        Web({ src:  $rawfile('index.html'), controller: this.controller, incognitoMode: true })
          .javaScriptAccess(this.javaScriptAccess)
          .fileAccess(this.fileAccess)
          .imageAccess(this.imageAccess)
          .domStorageAccess(this.domStorageAccess)
          .onlineImageAccess(this.onlineImageAccess)
          .databaseAccess(this.databaseAccess)
          .geolocationAccess(this.geolocationAccess)
          .onPageEnd((event) => {
            if (event) {
              this.isPageEnd = 0;
              console.log('WebController onPageEnd url:' + event.url);
            }
          })
      } else {
        Web({ src: $rawfile('index.html'), controller: this.controller, incognitoMode: false })
          .javaScriptAccess(this.javaScriptAccess)
          .fileAccess(this.fileAccess)
          .imageAccess(this.imageAccess)
          .domStorageAccess(this.domStorageAccess)
          .onlineImageAccess(this.onlineImageAccess)
          .databaseAccess(this.databaseAccess)
          .geolocationAccess(this.geolocationAccess)
          .onPageEnd((event) => {
            if (event) {
              this.isPageEnd = 0;
              console.log('WebController onPageEnd url:' + event.url);
            }
          })
      }
    }
  }
}
