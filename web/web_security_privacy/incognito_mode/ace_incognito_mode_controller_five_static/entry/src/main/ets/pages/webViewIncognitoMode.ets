/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { Entry, Component, Column, Row, Button, ClickEvent, Web } from '@ohos.arkui.component'
import Utils from '../../src/test/Util.test';
import webview from '@ohos.web.webview'
import emitter from '@ohos.events.emitter';
import { Callback, RecordData } from '@ohos.base'
import { State } from '@ohos.arkui.stateManagement'
import { BusinessError } from '@ohos.base'
import { Driver } from '@ohos.UiTest';
import hilog from '@ohos.hilog';

class StringFields {
  str: string = '';
}

@Entry
@Component
struct webViewIncognitoMode {
  stringObj: StringFields  = new StringFields ();
  controller: webview.WebviewController = new webview.WebviewController(undefined);
  @State str: string = ''
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = true;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State isPrivacy: boolean = false;
  @State geolocationAccess: boolean = true;
  @State incognito: boolean = false;

  aboutToAppear() {
    console.info('Entry aboutToAppear');
    let valueChangeEvent: emitter.InnerEvent = {
      eventId: 10,
      priority: emitter.EventPriority.LOW
    }
    emitter.on(valueChangeEvent, this.valueChangeCallBack)
    console.info('Finish aboutToAppear ' + this.valueChangeCallBack);
  }

  private valueChangeCallBack: Callback<emitter.EventData> = (eventData: emitter.EventData): void => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      const data = eventData.data as Record<string, RecordData>;
      if (data && data['ACTION'] != null) {
        console.info('Received ACTION value: ' + data['ACTION']);
        let strValue: string = String(data['ACTION']);
        console.info('strValue has been updated to: ' + strValue);
        this.stringObj.str = strValue;
        console.info('this.str has been updated to: ' + this.stringObj.str);
      }
    }
  }
  build() {
    Column(undefined) {
      Row(undefined) {
        Button('web click')
          .key('webViewIncognitoModeButton').onClick((e: ClickEvent) => {
          console.info('key==>' + this.stringObj.str)
          switch (this.stringObj.str) {
            case 'emitWebViewIncognitoMode13': {
              try {
                this.isPrivacy = true;
                webview.GeolocationPermissions.allowGeolocation('https://m.baidu.com', true);
                this.controller.loadUrl('https://m.baidu.com');
                webview.GeolocationPermissions.getStoredGeolocation(true)
                  .then((origins: Array<string>) => {
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
                hilog.info(0X0000, 'testTag', `ErrorCode:` + error);
              }
              break;
            }

            case 'emitWebViewIncognitoMode14': {
              try {
                this.isPrivacy = true;
                webview.GeolocationPermissions.allowGeolocation('https://m.baidu.com', true);
                this.controller.loadUrl('https://m.baidu.com');
                webview.GeolocationPermissions.getStoredGeolocation((error, origins: Array<String> | undefined) => {
                  if (error?.code) {
                    return;
                  }
                  let originsStr: undefined | String = origins?.join();
                  if (originsStr == 'https://m.baidu.com') {
                    Utils.emitEvent('success', 8032);
                  } else {
                    Utils.emitEvent('fail', 8032);
                  }
                  console.log('getStoredGeolocationAsync origins: ' + originsStr);
                }, true);
              } catch (error) {
                hilog.info(0X0000, 'testTag', `ErrorCode:` + error);
              }
              break;
            }

            case 'emitWebViewIncognitoMode15': {
              try {
                this.isPrivacy = false;
                webview.GeolocationPermissions.allowGeolocation('https://m.baidu.com');
                this.controller.loadUrl('https://m.baidu.com');
                webview.GeolocationPermissions.getStoredGeolocation((error, origins: Array<String> | undefined) => {
                  if (error?.code) {
                    return;
                  }
                  let originsStr: undefined | String = origins?.join();
                  if (originsStr == 'https://m.baidu.com') {
                    Utils.emitEvent('success', 8033);
                  } else {
                    Utils.emitEvent('fail', 8033);
                  }
                  console.log('getStoredGeolocationAsync origins: ' + originsStr);
                }, true);
              } catch (error) {
                hilog.info(0X0000, 'testTag', `ErrorCode:` + error);
              }
              break;
            }

            case 'emitWebViewIncognitoMode16': {
              try {
                this.isPrivacy = false;
                webview.GeolocationPermissions.allowGeolocation('https://m.baidu.com');
                this.controller.loadUrl('https://m.baidu.com');
                webview.GeolocationPermissions.getStoredGeolocation((error, origins: Array<String> | undefined) => {
                  if (error?.code) {
                    return;
                  }
                  let originsStr: undefined | String = origins?.join();
                  if (originsStr == 'https://m.baidu.com') {
                    Utils.emitEvent('success', 8034);
                  } else {
                    Utils.emitEvent('fail', 8034);
                  }
                  console.log('getStoredGeolocationAsync origins: ' + originsStr);
                }, true);
              } catch (error) {
                hilog.info(0X0000, 'testTag', `ErrorCode:` + error);
              }
              break;
            }

            case 'emitWebViewIncognitoMode17': {
              try {
                this.isPrivacy = true;
                webview.GeolocationPermissions.allowGeolocation('https://m.weibo.cn', true);
                this.controller.loadUrl('https://m.weibo.cn');
                webview.GeolocationPermissions.deleteGeolocation('https://m.weibo.cn', true);
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
                hilog.info(0X0000, 'testTag', `ErrorCode:` + error);
              }
              break;
            }

            case 'emitWebViewIncognitoMode18': {
              try {
                this.isPrivacy = false;
                webview.GeolocationPermissions.allowGeolocation('https://m.weibo.cn');
                this.controller.loadUrl('https://m.weibo.cn');
                webview.GeolocationPermissions.deleteGeolocation('https://m.weibo.cn', true);
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
                hilog.info(0X0000, 'testTag', `ErrorCode:` + error);
              }
              break;
            }

            case 'emitWebViewIncognitoMode19': {
              try {
                this.isPrivacy = true;
                webview.GeolocationPermissions.allowGeolocation('https://m.baidu.com', true);
                webview.GeolocationPermissions.allowGeolocation('https://m.weibo.cn', true);
                this.controller.loadUrl('https://m.baidu.com');
                this.controller.loadUrl('https://m.weibo.cn');
                webview.GeolocationPermissions.deleteAllGeolocation(true);
                webview.GeolocationPermissions.getStoredGeolocation((error, origins) => {
                  let originsStr: undefined | String = origins?.join();
                  if (!originsStr) {
                    Utils.emitEvent('success', 8037);
                  } else {
                    Utils.emitEvent('fail', 8037);
                  }
                  console.log('getStoredGeolocationAsync origins: ' + originsStr);
                }, true);
              } catch (error) {
                hilog.info(0X0000, 'testTag', `ErrorCode:` + error);
              }
              break;
            }

            case 'emitWebViewIncognitoMode20': {
              try {
                this.isPrivacy = true;
                webview.GeolocationPermissions.allowGeolocation('https://m.baidu.com');
                webview.GeolocationPermissions.allowGeolocation('https://m.weibo.cn');
                this.controller.loadUrl('https://m.baidu.com');
                this.controller.loadUrl('https://m.weibo.cn');
                webview.GeolocationPermissions.deleteAllGeolocation();
                webview.GeolocationPermissions.getStoredGeolocation((error, origins) => {
                  let originsStr: undefined | String = origins?.join();
                  if (!originsStr) {
                    Utils.emitEvent('success', 8038);
                  } else {
                    Utils.emitEvent('fail', 8038);
                  }
                  console.log('getStoredGeolocationAsync origins: ' + originsStr);
                }, true);
              } catch (error) {
                hilog.info(0X0000, 'testTag', `ErrorCode:` + error);
              }
              break;
            }

            case 'emitWebViewIncognitoMode01': {
              try {
                this.controller.loadUrl('https://m.weibo.cn');
                setTimeout(() => {
                  let result = this.controller.isIncognitoMode();
                  if (result === true) {
                    Utils.emitEvent('success', 8019);
                  } else {
                    Utils.emitEvent('fail', 8019);
                  }
                }, 2000)

              } catch (error) {
                hilog.info(0X0000,"testTag",`ErrorCode: ` + error );
              }
              break;
            }

          }
        })
      }

      if (this.isPrivacy) {
        Web({ src: 'resource://rawfile/index.html', controller: this.controller, incognitoMode: true })
          .javaScriptAccess(this.javaScriptAccess)
          .fileAccess(this.fileAccess)
          .imageAccess(this.imageAccess)
          .domStorageAccess(this.domStorageAccess)
          .onlineImageAccess(this.onlineImageAccess)
          .databaseAccess(this.databaseAccess)
          .geolocationAccess(this.geolocationAccess)
      } else {
        Web({ src: 'resource://rawfile/index.html', controller: this.controller, incognitoMode: false })
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
