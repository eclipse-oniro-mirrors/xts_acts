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
import { waitForExist} from '../../test/WaitTest.test';

@Entry
@Component
struct webUserAgentMetadata {
  controller: webView.WebviewController = new webView.WebviewController();
  @State emitKey: string = '';
  @State isPageEnd: number = -1;
  @State isReceive: number = -1;


  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 174180,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(174180)
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
          .key('WebUserAgentMetadataButton')
          .onClick(async () => {
            await waitForExist(()=>this.isReceive, this.emitKey, 0, 1000);
            await waitForExist(()=>this.isPageEnd, this.emitKey, 0, 1000);
            console.info('key==>' + this.emitKey);
            this.isReceive = -1;
            switch (this.emitKey) {
              case 'emitSetUserAgentMetadata': {
                try {
                  let userAgent = webView.WebviewController.getDefaultUserAgent();
                  let arrayVersions: webView.UserAgentBrandVersion[] = [];
                  let brandVersion:webView.UserAgentBrandVersion = new webView.UserAgentBrandVersion();
                  brandVersion.setBrand('brand OpenHarmony');
                  brandVersion.setMajorVersion('major version 1.0');
                  brandVersion.setFullVersion('blank full version 1.0');
                  arrayVersions.push(brandVersion);

                  let metaData = new webView.UserAgentMetadata();
                  metaData.setBrandVersionList(arrayVersions);
                  this.controller.setUserAgentMetadata(userAgent, metaData);
                  Utils.emitEvent(true, 174190);
                } catch (error) {
                  console.error(`catch ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(false, 174190);
                }
                break;
              }
              case 'emitSetUserAgentMetadataFirstParamNull': {
                try {
                  let metaData = new webView.UserAgentMetadata();
                  this.controller.setUserAgentMetadata(null, metaData);
                  Utils.emitEvent(false, 174200);
                } catch (error) {
                  console.error(`catch ErrorCode: ${error.code},  Message: ${error.message}`);
                  if (Number(error.code) == 401) {
                    Utils.emitEvent('401', 174200);
                  } else {
                    Utils.emitEvent(String(error.code), 174200);
                  }
                }
                break;
              }
              case 'emitSetUserAgentMetadataFirstParamEmpty': {
                try {
                  let metaData = new webView.UserAgentMetadata();
                  this.controller.setUserAgentMetadata('', metaData);
                  Utils.emitEvent('no_error', 26032507);
                } catch (error) {
                  console.error(`catch ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(error.code, 26032507);
                }
                break;
              }
              case 'emitSetUserAgentMetadataFirstParamUndefined': {
                try {
                  let metaData = new webView.UserAgentMetadata();
                  this.controller.setUserAgentMetadata(undefined, metaData);
                  Utils.emitEvent(false, 174210);
                } catch (error) {
                  console.error(`catch ErrorCode: ${error.code},  Message: ${error.message}`);
                  if (Number(error.code) == 401) {
                    Utils.emitEvent('401', 174210);
                  } else {
                    Utils.emitEvent(String(error.code), 174210);
                  }
                }
                break;
              }
              case 'emitSetUserAgentMetadataSecondParamNull': {
                try {
                  let userAgent = webView.WebviewController.getDefaultUserAgent();
                  this.controller.setUserAgentMetadata(userAgent, null);
                  Utils.emitEvent('no_error', 174220);
                } catch (error) {
                  console.error(`catch ErrorCode: ${error.code},  Message: ${error.message}`);
                  if (Number(error.code) == 401) {
                    Utils.emitEvent('401', 174220);
                  } else {
                    Utils.emitEvent(String(error.code), 174220);
                  }
                }
                break;
              }
              case 'emitSetUserAgentMetadataSecondParamUndefined': {
                try {
                  let userAgent = webView.WebviewController.getDefaultUserAgent();
                  this.controller.setUserAgentMetadata(userAgent, undefined);
                  Utils.emitEvent('no_error', 174230);
                } catch (error) {
                  console.error(`catch ErrorCode: ${error.code},  Message: ${error.message}`);
                  if (Number(error.code) == 401) {
                    Utils.emitEvent('401', 174230);
                  } else {
                    Utils.emitEvent(String(error.code), 174230);
                  }
                }
                break;
              }
              case 'emitGetUserAgentMetadata': {
                try {
                  let userAgent = webView.WebviewController.getDefaultUserAgent();

                  let arrayVersions: webView.UserAgentBrandVersion[] =  [];
                  let brandVersion:webView.UserAgentBrandVersion = new webView.UserAgentBrandVersion();
                  brandVersion.setBrand('brand OpenHarmony');
                  brandVersion.setMajorVersion('major version 1.0');
                  brandVersion.setFullVersion('blank full version 1.0');
                  arrayVersions.push(brandVersion);

                  let metaData = new webView.UserAgentMetadata();
                  metaData.setBrandVersionList(arrayVersions);
                  this.controller.setUserAgentMetadata(userAgent, metaData);

                  let newMetaData  = this.controller.getUserAgentMetadata(userAgent);
                  let versionList = newMetaData.getBrandVersionList();
                  for(let i = 0; i < versionList.length; i++) {
                    console.info('Brand:' + versionList[i].getBrand());
                    console.info('MajorVersion ' + versionList[i].getMajorVersion());
                    console.info('FullVersion ' + versionList[i].getFullVersion());
                  }
                  Utils.emitEvent(true, 174240);
                } catch (error) {
                  console.error(`catch ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(false, 174240);
                }
                break;
              }
              case 'emitGetUserAgentMetadataParamNull': {
                try {
                  this.controller.getUserAgentMetadata(null);
                  Utils.emitEvent(false, 174250);
                } catch (error) {
                  console.error(`catch ErrorCode: ${error.code},  Message: ${error.message}`);
                  if (Number(error.code) == 401) {
                    Utils.emitEvent('401', 174250);
                  } else {
                    Utils.emitEvent(String(error.code), 174250);
                  }
                }
                break;
              }
              case 'emitGetUserAgentMetadataParamUndefined': {
                try {
                  this.controller.getUserAgentMetadata(undefined);
                  Utils.emitEvent(false, 174260);
                } catch (error) {
                  console.error(`catch ErrorCode: ${error.code},  Message: ${error.message}`);
                  if (Number(error.code) == 401) {
                    Utils.emitEvent('401', 174260);
                  } else {
                    Utils.emitEvent(String(error.code), 174260);
                  }
                }
                break;
              }
              case 'emitGetUserAgentMetadataParamEmpty': {
                try {
                  this.controller.getUserAgentMetadata('');
                  Utils.emitEvent('no_error', 26032508);
                } catch (error) {
                  console.error(`catch ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(error.code, 26032508);
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
