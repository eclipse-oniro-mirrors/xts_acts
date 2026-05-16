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
import webView from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';
import { waitForExist } from '../../test/WaitTest.test';

@Entry
@Component
struct webUserAgentMetadataPlatform {
  controller: webView.WebviewController = new webView.WebviewController();
  @State emitKey: string = '';
  @State isPageEnd: number = -1;
  @State isReceive: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 174850,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(174850)
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
        Button('webUserAgentMetadata click')
          .key('WebUserAgentMetadataPlatformButton')
          .onClick(async () => {
            await waitForExist(()=>this.isReceive, this.emitKey, 0, 1000);
            await waitForExist(()=>this.isPageEnd, this.emitKey, 0, 1000);
            console.info('key==>' + this.emitKey);
            this.isReceive = -1;
            switch (this.emitKey) {
              case 'emitGetPlatformAfterSet': {
                try {
                  let userAgent = webView.WebviewController.getDefaultUserAgent();
                  let metaData = new webView.UserAgentMetadata();
                  metaData.setPlatform('OpenHarmony');

                  this.controller.setUserAgentMetadata(userAgent, metaData);
                  let result = this.controller.getUserAgentMetadata(userAgent);
                  let platform = result.getPlatform();
                  Utils.emitEvent(platform, 174860);
                } catch (error) {
                  console.error(`catch ErrorCode: ${error.code},  Message: ${error.message}`);
                  if (Number(error.code) == 401) {
                    Utils.emitEvent('401', 174860);
                  } else {
                    Utils.emitEvent(String(error.code), 174860);
                  }
                }
                break;
              }
              case 'emitGetPlatformEmpty': {
                try {
                  let userAgent = webView.WebviewController.getDefaultUserAgent();
                  let metaData = new webView.UserAgentMetadata();
                  metaData.setPlatform('');
                  this.controller.setUserAgentMetadata(userAgent, metaData);
                  let result = this.controller.getUserAgentMetadata(userAgent);
                  let platform = result.getPlatform();
                  if (platform != '') {
                    Utils.emitEvent(true, 174870);
                  } else {
                    Utils.emitEvent(false, 174870);
                  }
                } catch (error) {
                  console.error(`catch ErrorCode: ${error.code},  Message: ${error.message}`);
                  if (Number(error.code) == 401) {
                    Utils.emitEvent('401', 174870);
                  } else {
                    Utils.emitEvent(String(error.code), 174870);
                  }
                }
                break;
              }
              case 'emitSetPlatformNull': {
                try {
                  let metaData = new webView.UserAgentMetadata();
                  metaData.setPlatform(null);
                  Utils.emitEvent('no_error', 174880);
                } catch (error) {
                  console.error(`catch ErrorCode: ${error.code},  Message: ${error.message}`);
                  if (Number(error.code) == 401) {
                    Utils.emitEvent('401', 174880);
                  } else {
                    Utils.emitEvent(String(error.code), 174880);
                  }
                }
                break;
              }
              case 'emitSetPlatformUndefined': {
                try {
                  let metaData = new webView.UserAgentMetadata();
                  metaData.setPlatform(undefined);
                  Utils.emitEvent('no_error', 174890);
                } catch (error) {
                  console.error(`catch ErrorCode: ${error.code},  Message: ${error.message}`);
                  if (Number(error.code) == 401) {
                    Utils.emitEvent('401', 174890);
                  } else {
                    Utils.emitEvent(String(error.code), 174890);
                  }
                }
                break;
              }
              case 'emitSetPlatformEmpty': {
                try {
                  let metaData = new webView.UserAgentMetadata();
                  metaData.setPlatform('');
                  Utils.emitEvent('no_error', 26032509);
                } catch (error) {
                  console.error(`catch ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(error.code, 26032509);
                }
                break;
              }
              case 'emitGetPlatformWindows': {
                try {
                  let userAgent = webView.WebviewController.getDefaultUserAgent();
                  let metaData = new webView.UserAgentMetadata();
                  metaData.setPlatform('Windows');
                  this.controller.setUserAgentMetadata(userAgent, metaData);
                  let result = this.controller.getUserAgentMetadata(userAgent);
                  let platform = result.getPlatform();
                  Utils.emitEvent(platform, 174900);
                } catch (error) {
                  console.error(`catch ErrorCode: ${error.code},  Message: ${error.message}`);
                  if (Number(error.code) == 401) {
                    Utils.emitEvent('401', 174900);
                  } else {
                    Utils.emitEvent(String(error.code), 174900);
                  }
                }
                break;
              }
              case 'emitGetPlatformLinux': {
                try {
                  let userAgent = webView.WebviewController.getDefaultUserAgent();
                  let metaData = new webView.UserAgentMetadata();
                  metaData.setPlatform('Linux');
                  this.controller.setUserAgentMetadata(userAgent, metaData);
                  let result = this.controller.getUserAgentMetadata(userAgent);
                  let platform = result.getPlatform();
                  Utils.emitEvent(platform, 174910);
                } catch (error) {
                  console.error(`catch ErrorCode: ${error.code},  Message: ${error.message}`);
                  if (Number(error.code) == 401) {
                    Utils.emitEvent('401', 174910);
                  } else {
                    Utils.emitEvent(String(error.code), 174910);
                  }
                }
                break;
              }

            }
          })
      }
      Web({ src: $rawfile('userAgent.html'), controller: this.controller })
        .key('webUserAgentMetadataWComponent')
        .javaScriptAccess(true)
        .domStorageAccess(true)
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
