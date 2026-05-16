/*
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

import Utils from '../../test/Utils.test';
import webview from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';
import { waitForExist} from '../../test/WaitTest.test';

@Entry
@Component
struct WebUserAgentBrandVersion {
  controller: webview.WebviewController = new webview.WebviewController();
  @State emitKey: string = '';
  @State message: Array<string> = [];
  @State isPageEnd: number = -1;
  @State isReceive: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 174110,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(174110)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info('web page valueChangeCallBack');
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
        Button('setUserAgentBrandVersion click')
          .key('WebUserAgentBrandVersionButton')
          .onClick(async () => {
            await waitForExist(()=>this.isReceive, this.emitKey, 0, 1000);
            await waitForExist(()=>this.isPageEnd, this.emitKey, 0, 1000);
            console.info('key==>' + this.emitKey);
            this.isReceive = -1;
            switch (this.emitKey) {

              case 'emitSetBrand': {
                try {
                  let userAgentBrandVersion = new webview.UserAgentBrandVersion();
                  userAgentBrandVersion.setBrand('TestBrand');
                  let result = userAgentBrandVersion.getBrand();
                  Utils.emitEvent(result, 174120);
                } catch (error) {
                  console.error('catch ErrorCode: ' + error.code + ', Message: ' + error.message);
                  if (Number(error.code) == 401) {
                    Utils.emitEvent('401', 174120);
                  } else {
                    Utils.emitEvent(String(error.code), 174120);
                  }
                }
                break;
              }

              case 'emitSetBrandEmpty': {
                try {
                  let userAgentBrandVersion = new webview.UserAgentBrandVersion();
                  userAgentBrandVersion.setBrand('');
                  Utils.emitEvent('no_error', 174130);
                } catch (error) {
                  console.error('catch ErrorCode: ' + error.code + ', Message: ' + error.message);
                  if (Number(error.code) == 401) {
                    Utils.emitEvent('401', 174130);
                  } else {
                    Utils.emitEvent(String(error.code), 174130);
                  }
                }
                break;
              }

              case 'emitSetBrandNull': {
                try {
                  let userAgentBrandVersion = new webview.UserAgentBrandVersion();
                  userAgentBrandVersion.setBrand(null);
                  Utils.emitEvent('no_error', 174140);
                } catch (error) {
                  console.error('catch ErrorCode: ' + error.code + ', Message: ' + error.message);
                  if (Number(error.code) == 401) {
                    Utils.emitEvent('401', 174140);
                  } else {
                    Utils.emitEvent(String(error.code), 174140);
                  }
                }
                break;
              }

              case 'emitSetBrandUndefined': {
                try {
                  let userAgentBrandVersion = new webview.UserAgentBrandVersion();
                  userAgentBrandVersion.setBrand(undefined);
                  Utils.emitEvent('no_error', 174150);
                } catch (error) {
                  console.error('catch ErrorCode: ' + error.code + ', Message: ' + error.message);
                  if (Number(error.code) == 401) {
                    Utils.emitEvent('401', 174150);
                  } else {
                    Utils.emitEvent(String(error.code), 174150);
                  }
                }
                break;
              }

              case 'emitGetBrand': {
                try {
                  let userAgentBrandVersion = new webview.UserAgentBrandVersion();
                  userAgentBrandVersion.setBrand('TestBrand');
                  let result = userAgentBrandVersion.getBrand();
                  Utils.emitEvent(result, 174160);
                } catch (error) {
                  console.error('catch ErrorCode: ' + error.code + ', Message: ' + error.message);
                  if (Number(error.code) == 401) {
                    Utils.emitEvent('401', 174160);
                  } else {
                    Utils.emitEvent(String(error.code), 174160);
                  }
                }
                break;
              }

              case 'emitSetMajorVersion': {
                try {
                  let userAgentBrandVersion = new webview.UserAgentBrandVersion();
                  userAgentBrandVersion.setMajorVersion('1.0.0');
                  let result = userAgentBrandVersion.getMajorVersion();
                  Utils.emitEvent(result, 174170);
                } catch (error) {
                  console.error('catch ErrorCode: ' + error.code + ', Message: ' + error.message);
                  if (Number(error.code) == 401) {
                    Utils.emitEvent('401', 174170);
                  } else {
                    Utils.emitEvent(String(error.code), 174170);
                  }
                }
                break;
              }

              case 'emitSetMajorVersionEmpty': {
                try {
                  let userAgentBrandVersion = new webview.UserAgentBrandVersion();
                  userAgentBrandVersion.setMajorVersion('');
                  Utils.emitEvent('no_error', 174180);
                } catch (error) {
                  console.error('catch ErrorCode: ' + error.code + ', Message: ' + error.message);
                  if (Number(error.code) == 401) {
                    Utils.emitEvent('401', 174180);
                  } else {
                    Utils.emitEvent(String(error.code), 174180);
                  }
                }
                break;
              }

              case 'emitSetMajorVersionNull': {
                try {
                  let userAgentBrandVersion = new webview.UserAgentBrandVersion();
                  userAgentBrandVersion.setMajorVersion(null);
                  Utils.emitEvent('no_error', 174190);
                } catch (error) {
                  console.error('catch ErrorCode: ' + error.code + ', Message: ' + error.message);
                  if (Number(error.code) == 401) {
                    Utils.emitEvent('401', 174190);
                  } else {
                    Utils.emitEvent(String(error.code), 174190);
                  }
                }
                break;
              }

              case 'emitSetMajorVersionUndefined': {
                try {
                  let userAgentBrandVersion = new webview.UserAgentBrandVersion();
                  userAgentBrandVersion.setMajorVersion(undefined);
                  Utils.emitEvent('no_error', 174200);
                } catch (error) {
                  console.error('catch ErrorCode: ' + error.code + ', Message: ' + error.message);
                  if (Number(error.code) == 401) {
                    Utils.emitEvent('401', 174200);
                  } else {
                    Utils.emitEvent(String(error.code), 174200);
                  }
                }
                break;
              }

              case 'emitGetMajorVersion': {
                try {
                  let userAgentBrandVersion = new webview.UserAgentBrandVersion();
                  userAgentBrandVersion.setMajorVersion('1.0.0');
                  let result = userAgentBrandVersion.getMajorVersion();
                  Utils.emitEvent(result, 174210);
                } catch (error) {
                  console.error('catch ErrorCode: ' + error.code + ', Message: ' + error.message);
                  if (Number(error.code) == 401) {
                    Utils.emitEvent('401', 174210);
                  } else {
                    Utils.emitEvent(String(error.code), 174210);
                  }
                }
                break;
              }

              case 'emitSetFullVersion': {
                try {
                  let userAgentBrandVersion = new webview.UserAgentBrandVersion();
                  userAgentBrandVersion.setFullVersion('1.0.0.0');
                  let result = userAgentBrandVersion.getFullVersion();
                  Utils.emitEvent(result, 174220);
                } catch (error) {
                  console.error('catch ErrorCode: ' + error.code + ', Message: ' + error.message);
                  if (Number(error.code) == 401) {
                    Utils.emitEvent('401', 174220);
                  } else {
                    Utils.emitEvent(String(error.code), 174220);
                  }
                }
                break;
              }

              case 'emitSetFullVersionEmpty': {
                try {
                  let userAgentBrandVersion = new webview.UserAgentBrandVersion();
                  userAgentBrandVersion.setFullVersion('');
                  Utils.emitEvent('no_error', 174230);
                } catch (error) {
                  console.error('catch ErrorCode: ' + error.code + ', Message: ' + error.message);
                  if (Number(error.code) == 401) {
                    Utils.emitEvent('401', 174230);
                  } else {
                    Utils.emitEvent(String(error.code), 174230);
                  }
                }
                break;
              }

              case 'emitSetFullVersionNull': {
                try {
                  let userAgentBrandVersion = new webview.UserAgentBrandVersion();
                  userAgentBrandVersion.setFullVersion(null);
                  Utils.emitEvent('no_error', 174240);
                } catch (error) {
                  console.error('catch ErrorCode: ' + error.code + ', Message: ' + error.message);
                  if (Number(error.code) == 401) {
                    Utils.emitEvent('401', 174240);
                  } else {
                    Utils.emitEvent(String(error.code), 174240);
                  }
                }
                break;
              }

              case 'emitSetFullVersionUndefined': {
                try {
                  let userAgentBrandVersion = new webview.UserAgentBrandVersion();
                  userAgentBrandVersion.setFullVersion(undefined);
                  Utils.emitEvent('no_error', 174250);
                } catch (error) {
                  console.error('catch ErrorCode: ' + error.code + ', Message: ' + error.message);
                  if (Number(error.code) == 401) {
                    Utils.emitEvent('401', 174250);
                  } else {
                    Utils.emitEvent(String(error.code), 174250);
                  }
                }
                break;
              }

              case 'emitGetFullVersion': {
                try {
                  let userAgentBrandVersion = new webview.UserAgentBrandVersion();
                  userAgentBrandVersion.setFullVersion('1.0.0.0');
                  let result = userAgentBrandVersion.getFullVersion();
                  Utils.emitEvent(result, 174260);
                } catch (error) {
                  console.error('catch ErrorCode: ' + error.code + ', Message: ' + error.message);
                  if (Number(error.code) == 401) {
                    Utils.emitEvent('401', 174260);
                  } else {
                    Utils.emitEvent(String(error.code), 174260);
                  }
                }
                break;
              }

              default:
                break;
            }
          })

        Web({ src: $rawfile('userAgent.html'), controller: this.controller })
          .key('WebUserAgentBrandVersionComponent')
          .onPageEnd(() => {
            console.info('onPageEnd is invoked');
            this.isPageEnd = 0;
          })
          .onErrorReceive((event) => {
            console.info('onErrorReceive is invoked');
          })
      }
    }
  }
}
