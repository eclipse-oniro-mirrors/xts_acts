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

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.emitKey = eventData.data.ACTION;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button('web click')
          .key('webViewIncognitoModeButton')
          .onClick(async () => {
            console.info('key==>' + this.emitKey)
            webview.WebStorage.deleteAllData(true);
            webview.WebStorage.deleteAllData();
            webview.GeolocationPermissions.deleteAllGeolocation(true);
            webview.GeolocationPermissions.deleteAllGeolocation();
            this.controller.refresh()
            await Utils.sleep(2000);
            switch (this.emitKey) {
              case 'emitWebViewIncognitoMode01': {
                try {
                  this.isPrivacy = true;
                  this.controller.loadUrl('https://m.weibo.cn');
                  await Utils.sleep(2000);
                  let result = this.controller.isIncognitoMode();
                  if (result === true) {
                    Utils.emitEvent('success', 8019);
                  } else {
                    Utils.emitEvent('fail', 8019);
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
                  this.controller.loadUrl('https://m.baidu.com');
                  await Utils.sleep(2000);
                  let result = this.controller.isIncognitoMode();
                  if (result === true) {
                    Utils.emitEvent('fail', 8020);
                  } else {
                    Utils.emitEvent('success', 8020);
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
                  await Utils.sleep(2000);
                  this.controller.loadUrl('https://m.weibo.cn');
                  await Utils.sleep(2000);
                  let cookieData = webview.WebCookieManager.fetchCookieSync('https://m.weibo.cn', true);
                  let isExistCookie = webview.WebCookieManager.existCookie(true);
                  if (cookieData&&cookieData.indexOf('a=b')>-1&&isExistCookie) {
                    Utils.emitEvent('success', 8021);
                  } else {
                    Utils.emitEvent('fail', 8021);
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
                  await Utils.sleep(2000);
                  this.controller.loadUrl('https://m.baidu.com');
                  await Utils.sleep(2000);
                  let cookieData = webview.WebCookieManager.fetchCookieSync('https://m.baidu.com');
                  let isExistCookie = webview.WebCookieManager.existCookie(true);
                  if (cookieData&&cookieData.indexOf('a=b')>-1&&isExistCookie) {
                    Utils.emitEvent('success', 8022);
                  } else {
                    Utils.emitEvent('fail', 8022);
                  }
                } catch (error) {
                  let e:business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                }
                break;
              }
              case 'emitWebViewIncognitoMode05': {
                try {
                  this.isPrivacy = true;
                  webview.WebCookieManager.configCookieSync('https://m.weibo.cn', 'testValue1232143', true);
                  await Utils.sleep(2000);
                  this.controller.loadUrl('https://m.weibo.cn');
                  await Utils.sleep(2000);
                  webview.WebCookieManager.clearAllCookiesSync(true);
                  await Utils.sleep(2000);
                  let isExistCookie = webview.WebCookieManager.existCookie(true);
                  console.log('emitWebViewIncognitoMode05 isExistCookie===>'+isExistCookie)
                  console.log('emitWebViewIncognitoMode05 fetchCookieSync===>'+webview.WebCookieManager.fetchCookieSync('https://m.weibo.cn',true))
                  if (isExistCookie) {
                    Utils.emitEvent('fail', 8023);
                  } else {
                    Utils.emitEvent('success', 8023);
                  }
                } catch (error) {
                  let e:business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                }
                break;
              }
              case 'emitWebViewIncognitoMode06': {
                try {
                  this.isPrivacy = false;
                  webview.WebCookieManager.configCookieSync('https://m.baidu.com', 'testValue1232143');
                  await Utils.sleep(2000);
                  this.controller.loadUrl('https://m.baidu.com');
                  await Utils.sleep(2000);
                  webview.WebCookieManager.clearAllCookiesSync();
                  await Utils.sleep(2000);
                  let isExistCookie = webview.WebCookieManager.existCookie();
                  console.log('emitWebViewIncognitoMode06 isExistCookie===>'+isExistCookie)
                  console.log('emitWebViewIncognitoMode06 fetchCookieSync===>'+webview.WebCookieManager.fetchCookieSync('https://m.baidu.com'))
                  if (isExistCookie) {
                    Utils.emitEvent('fail', 8024);
                  } else {
                    Utils.emitEvent('success', 8024);
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
                  this.controller.loadUrl('https://m.weibo.cn');
                  await Utils.sleep(2000);
                  webview.WebStorage.deleteAllData(true);
                  Utils.emitEvent('success', 8025);
                } catch (error) {
                  let e:business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent('fail', 8025);
                }
                break;
              }
              case 'emitWebViewIncognitoMode08': {
                try {
                  this.isPrivacy = true;
                  this.controller.loadUrl('https://m.baidu.com');
                  await Utils.sleep(2000);
                  webview.WebStorage.deleteAllData();
                  Utils.emitEvent('success', 8026);
                } catch (error) {
                  let e:business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  Utils.emitEvent('fail', 8026);
                }
                break;
              }
              case 'emitWebViewIncognitoMode09': {
                try {
                  this.isPrivacy = true;
                  webview.GeolocationPermissions.allowGeolocation('https://m.weibo.cn', true);
                  await Utils.sleep(1000);
                  this.controller.loadUrl('https://m.weibo.cn');
                  await Utils.sleep(2000);
                  webview.GeolocationPermissions.getAccessibleGeolocation('https://m.weibo.cn', true)
                    .then(result => {
                      console.log('getAccessibleGeolocationPromise result: ' + result);
                      if (result) {
                        Utils.emitEvent('success', 8027);
                      }
                    }).catch(() => {
                      Utils.emitEvent('fail', 8027);
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
                  await Utils.sleep(1000);
                  this.controller.loadUrl('https://m.weibo.cn');
                  await Utils.sleep(2000);
                  webview.GeolocationPermissions.getAccessibleGeolocation('https://m.weibo.cn', (error, result) => {
                    if (error) {
                      Utils.emitEvent('fail', 8028);
                      return;
                    }
                    if (result) {
                      Utils.emitEvent('success', 8028);
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
                  await Utils.sleep(1000);
                  this.controller.loadUrl('https://m.weibo.cn');
                  await Utils.sleep(2000);
                  webview.GeolocationPermissions.getAccessibleGeolocation('https://m.weibo.cn')
                    .then(result => {
                      console.log('getAccessibleGeolocationPromise result: ' + result);
                      Utils.emitEvent('success', 8029);
                    }).catch(() => {
                      Utils.emitEvent('fail', 8029);
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
                  await Utils.sleep(1000);
                  this.controller.loadUrl('https://m.weibo.cn');
                  await Utils.sleep(2000);
                  webview.GeolocationPermissions.getAccessibleGeolocation('https://m.weibo.cn', (error, result) => {
                    if (error) {
                      Utils.emitEvent('fail', 8030);
                      return;
                    }
                    if (result) {
                      Utils.emitEvent('success', 8030);
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
                  await Utils.sleep(1000);
                  this.controller.loadUrl('https://m.baidu.com');
                  await Utils.sleep(2000);
                  webview.GeolocationPermissions.getStoredGeolocation(true)
                    .then(origins => {
                      let originsStr: string = origins.join();
                      console.log('getStoredGeolocationPromise origins: ' + originsStr);
                      if (originsStr == 'https://m.baidu.com') {
                        Utils.emitEvent('success', 8031);
                      } else {
                        Utils.emitEvent('fail', 8031);
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
                  await Utils.sleep(1000);
                  this.controller.loadUrl('https://m.baidu.com');
                  await Utils.sleep(2000);
                  webview.GeolocationPermissions.getStoredGeolocation((error, origins) => {
                    if (error) {
                      return;
                    }
                    let originsStr: string = origins.join();
                    if (originsStr == 'https://m.baidu.com') {
                      Utils.emitEvent('success', 8032);
                    } else {
                      Utils.emitEvent('fail', 8032);
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
                  await Utils.sleep(1000);
                  this.controller.loadUrl('https://m.baidu.com');
                  await Utils.sleep(2000);
                  webview.GeolocationPermissions.getStoredGeolocation()
                    .then(origins => {
                      let originsStr: string = origins.join();
                      console.log('getStoredGeolocationPromise origins: ' + originsStr);
                      if (originsStr == 'https://m.baidu.com') {
                        Utils.emitEvent('success', 8033);
                      } else {
                        Utils.emitEvent('fail', 8033);
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
                  await Utils.sleep(1000);
                  this.controller.loadUrl('https://m.baidu.com');
                  await Utils.sleep(2000);
                  webview.GeolocationPermissions.getStoredGeolocation((error, origins) => {
                    if (error) {
                      return;
                    }
                    let originsStr: string = origins.join();
                    if (originsStr == 'https://m.baidu.com') {
                      Utils.emitEvent('success', 8034);
                    } else {
                      Utils.emitEvent('fail', 8034);
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
                  await Utils.sleep(1000);
                  this.controller.loadUrl('https://m.weibo.cn');
                  await Utils.sleep(2000);
                  webview.GeolocationPermissions.deleteGeolocation('https://m.weibo.cn',true);
                  await Utils.sleep(2000);
                  webview.GeolocationPermissions.getAccessibleGeolocation('https://m.weibo.cn', (error, result) => {
                    if (error) {
                      Utils.emitEvent('success', 8035);
                      return;
                    }
                    if (result) {
                      Utils.emitEvent('success', 8035);
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
                  await Utils.sleep(1000);
                  this.controller.loadUrl('https://m.weibo.cn');
                  await Utils.sleep(2000);
                  webview.GeolocationPermissions.deleteGeolocation('https://m.weibo.cn',true);
                  await Utils.sleep(2000);
                  webview.GeolocationPermissions.getAccessibleGeolocation('https://m.weibo.cn', (error, result) => {
                    if (error) {
                      Utils.emitEvent('success', 8036);
                      return;
                    }
                    if (result) {
                      Utils.emitEvent('success', 8036);
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
                  await Utils.sleep(1000);
                  this.controller.loadUrl('https://m.baidu.com');
                  await Utils.sleep(2500);
                  this.controller.loadUrl('https://m.weibo.cn');
                  await Utils.sleep(2500);
                  webview.GeolocationPermissions.deleteAllGeolocation(true);
                  await Utils.sleep(2000);
                  webview.GeolocationPermissions.getStoredGeolocation((error, origins) => {
                    if (error) {
                      return;
                    }
                    let originsStr: string = origins.join();
                    if (!originsStr) {
                      Utils.emitEvent('success', 8037);
                    } else {
                      Utils.emitEvent('fail', 8037);
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
                  await Utils.sleep(1000);
                  this.controller.loadUrl('https://m.baidu.com');
                  await Utils.sleep(2500);
                  this.controller.loadUrl('https://m.weibo.cn');
                  await Utils.sleep(2500);
                  webview.GeolocationPermissions.deleteAllGeolocation();
                  await Utils.sleep(2000);
                  webview.GeolocationPermissions.getStoredGeolocation((error, origins) => {
                    if (error) {
                      return;
                    }
                    let originsStr: string = origins.join();
                    if (!originsStr) {
                      Utils.emitEvent('success', 8038);
                    } else {
                      Utils.emitEvent('fail', 8038);
                    }
                    console.log('getStoredGeolocationAsync origins: ' + originsStr);
                  },true);
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
        Web({ src: '', controller: this.controller, incognitoMode: true })
          .javaScriptAccess(this.javaScriptAccess)
          .fileAccess(this.fileAccess)
          .imageAccess(this.imageAccess)
          .domStorageAccess(this.domStorageAccess)
          .onlineImageAccess(this.onlineImageAccess)
          .databaseAccess(this.databaseAccess)
          .geolocationAccess(this.geolocationAccess)
      } else {
        Web({ src: '', controller: this.controller, incognitoMode: false })
          .javaScriptAccess(this.javaScriptAccess)
          .fileAccess(this.fileAccess)
          .imageAccess(this.imageAccess)
          .domStorageAccess(this.domStorageAccess)
          .onlineImageAccess(this.onlineImageAccess)
          .databaseAccess(this.databaseAccess)
          .geolocationAccess(this.geolocationAccess)
      }
    }
  }
}
