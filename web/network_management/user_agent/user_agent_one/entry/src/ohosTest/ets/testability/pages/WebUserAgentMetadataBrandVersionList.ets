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
struct webUserAgentMetadata {
  controller: webView.WebviewController = new webView.WebviewController();
  @State emitKey: string = '';
  @State isPageEnd: number = -1;
  @State isReceive: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 174330,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(174330)
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
          .key('WebUserAgentMetadataBrandVersionListButton')
          .onClick(async () => {
            await waitForExist(()=>this.isReceive, this.emitKey, 0, 1000);
            await waitForExist(()=>this.isPageEnd, this.emitKey, 0, 1000);
            console.info('key==>' + this.emitKey);
            this.isReceive = -1;
            switch (this.emitKey) {
              case 'emitGetBrandVersionListAfterSet': {
                try {
                  let userAgent = webView.WebviewController.getDefaultUserAgent();
                  let metaData = new webView.UserAgentMetadata();
                  let brandVersion1 = new webView.UserAgentBrandVersion();
                  brandVersion1.setBrand('TestBrand1');
                  brandVersion1.setMajorVersion('1.0');
                  brandVersion1.setFullVersion('1.0.0');
                  let brandVersion2 = new webView.UserAgentBrandVersion();
                  brandVersion2.setBrand('TestBrand2');
                  brandVersion2.setMajorVersion('2.0');
                  brandVersion2.setFullVersion('2.0.0');
                  let arrayVersions: webView.UserAgentBrandVersion[] = [brandVersion1, brandVersion2];
                  metaData.setBrandVersionList(arrayVersions);

                  this.controller.setUserAgentMetadata(userAgent, metaData);
                  let result =  this.controller.getUserAgentMetadata(userAgent);
                  let versionList = result.getBrandVersionList();
                  Utils.emitEvent(versionList.length, 174340);
                } catch (error) {
                  console.error(`catch ErrorCode: ${error.code},  Message: ${error.message}`);
                  if (Number(error.code) == 401) {
                    Utils.emitEvent('401', 174340);
                  } else {
                    Utils.emitEvent(String(error.code), 174340);
                  }
                }
                break;
              }
              case 'emitGetBrandVersionListEmpty': {
                try {
                  let userAgent = webView.WebviewController.getDefaultUserAgent();
                  let metaData = new webView.UserAgentMetadata();
                  let emptyArray: webView.UserAgentBrandVersion[] = [];
                  metaData.setBrandVersionList(emptyArray);
                  this.controller.setUserAgentMetadata(userAgent, metaData);
                  let result =  this.controller.getUserAgentMetadata(userAgent);
                  let versionList = result.getBrandVersionList();
                  for (let index = 0; index < versionList.length; index++) {
                    console.log('emitGetBrandVersionListEmpty ' + versionList[index].getBrand())
                  }
                  Utils.emitEvent(versionList.length, 174350);
                } catch (error) {
                  console.error(`catch ErrorCode: ${error.code},  Message: ${error.message}`);
                  if (Number(error.code) == 401) {
                    Utils.emitEvent('401', 174350);
                  } else {
                    Utils.emitEvent(String(error.code), 174350);
                  }
                }
                break;
              }
              case 'emitGetBrandVersionListNull': {
                try {
                  let metaData = new webView.UserAgentMetadata();
                  metaData.setBrandVersionList(null);
                  Utils.emitEvent('no_error', 174360);
                } catch (error) {
                  console.error(`catch ErrorCode: ${error.code},  Message: ${error.message}`);
                  if (Number(error.code) == 401) {
                    Utils.emitEvent('401', 174360);
                  } else {
                    Utils.emitEvent(String(error.code), 174360);
                  }
                }
                break;
              }
              case 'emitGetBrandVersionListUndefined': {
                try {
                  let metaData = new webView.UserAgentMetadata();
                  metaData.setBrandVersionList(undefined);
                  Utils.emitEvent('no_error', 174370);
                } catch (error) {
                  console.error(`catch ErrorCode: ${error.code},  Message: ${error.message}`);
                  if (Number(error.code) == 401) {
                    Utils.emitEvent('401', 174370);
                  } else {
                    Utils.emitEvent(String(error.code), 174370);
                  }
                }
                break;
              }
              case 'emitGetBrandVersionListMultiple': {
                try {
                  let userAgent = webView.WebviewController.getDefaultUserAgent();
                  let metaData = new webView.UserAgentMetadata();
                  let brandVersion1 = new webView.UserAgentBrandVersion();
                  brandVersion1.setBrand('BrandA');
                  brandVersion1.setMajorVersion('1.0');
                  brandVersion1.setFullVersion('1.0.0');
                  let brandVersion2 = new webView.UserAgentBrandVersion();
                  brandVersion2.setBrand('BrandB');
                  brandVersion2.setMajorVersion('2.0');
                  brandVersion2.setFullVersion('2.0.0');
                  let arrayVersions: webView.UserAgentBrandVersion[] = [brandVersion1, brandVersion2];
                  metaData.setBrandVersionList(arrayVersions);
                  this.controller.setUserAgentMetadata(userAgent, metaData);
                  let result =  this.controller.getUserAgentMetadata(userAgent);
                  let versionList = result.getBrandVersionList();
                  Utils.emitEvent(versionList.length, 174380);
                } catch (error) {
                  console.error(`catch ErrorCode: ${error.code},  Message: ${error.message}`);
                  if (Number(error.code) == 401) {
                    Utils.emitEvent('401', 174380);
                  } else {
                    Utils.emitEvent(String(error.code), 174380);
                  }
                }
                break;
              }
              case 'emitGetBrandVersionListWithEmptyBrand': {
                try {
                  let metaData = new webView.UserAgentMetadata();
                  let brandVersion = new webView.UserAgentBrandVersion();
                  brandVersion.setBrand('');
                  brandVersion.setMajorVersion('1.0');
                  brandVersion.setFullVersion('1.0.0');
                  let arrayVersions: webView.UserAgentBrandVersion[] = [brandVersion];
                  metaData.setBrandVersionList(arrayVersions);
                  Utils.emitEvent('no_error', 174390);
                } catch (error) {
                  console.error(`catch ErrorCode: ${error.code},  Message: ${error.message}`);
                  if (Number(error.code) == 401) {
                    Utils.emitEvent('401', 174390);
                  } else {
                    Utils.emitEvent(String(error.code), 174390);
                  }
                }
                break;
              }
              case 'emitGetBrandVersionListWithNullBrand': {
                try {
                  let userAgent = webView.WebviewController.getDefaultUserAgent();
                  let metaData = new webView.UserAgentMetadata();
                  let brandVersion = new webView.UserAgentBrandVersion();
                  brandVersion.setBrand(null);
                  brandVersion.setMajorVersion('1.0');
                  brandVersion.setFullVersion('1.0.0');
                  let arrayVersions: webView.UserAgentBrandVersion[] = [brandVersion];
                  metaData.setBrandVersionList(arrayVersions);
                  Utils.emitEvent('no_error', 174400);
                } catch (error) {
                  console.error(`catch ErrorCode: ${error.code},  Message: ${error.message}`);
                  if (Number(error.code) == 401) {
                    Utils.emitEvent('401', 174400);
                  } else {
                    Utils.emitEvent(String(error.code), 174400);
                  }
                }
                break;
              }
              case 'emitGetBrandVersionListWithUndefinedBrand': {
                try {
                  let metaData = new webView.UserAgentMetadata();
                  let brandVersion = new webView.UserAgentBrandVersion();
                  brandVersion.setBrand(undefined);
                  brandVersion.setMajorVersion('1.0');
                  brandVersion.setFullVersion('1.0.0');
                  let arrayVersions: webView.UserAgentBrandVersion[] = [brandVersion];
                  metaData.setBrandVersionList(arrayVersions);
                  Utils.emitEvent('no_error', 174410);
                } catch (error) {
                  console.error(`catch ErrorCode: ${error.code},  Message: ${error.message}`);
                  if (Number(error.code) == 401) {
                    Utils.emitEvent('401', 174410);
                  } else {
                    Utils.emitEvent(String(error.code), 174410);
                  }
                }
                break;
              }
              case 'emitGetBrandVersionListWithEmptyMajorVersion': {
                try {
                  let metaData = new webView.UserAgentMetadata();
                  let brandVersion = new webView.UserAgentBrandVersion();
                  brandVersion.setBrand('TestBrand');
                  brandVersion.setMajorVersion('');
                  brandVersion.setFullVersion('1.0.0');
                  let arrayVersions: webView.UserAgentBrandVersion[] = [brandVersion];
                  metaData.setBrandVersionList(arrayVersions);
                  Utils.emitEvent('no_error', 174420);
                } catch (error) {
                  console.error(`catch ErrorCode: ${error.code},  Message: ${error.message}`);
                  if (Number(error.code) == 401) {
                    Utils.emitEvent('401', 174420);
                  } else {
                    Utils.emitEvent(String(error.code), 174420);
                  }
                }
                break;
              }
              case 'emitGetBrandVersionListWithNullMajorVersion': {
                try {
                  let metaData = new webView.UserAgentMetadata();
                  let brandVersion = new webView.UserAgentBrandVersion();
                  brandVersion.setBrand('TestBrand');
                  brandVersion.setMajorVersion(null);
                  brandVersion.setFullVersion('1.0.0');
                  let arrayVersions: webView.UserAgentBrandVersion[] = [brandVersion];
                  metaData.setBrandVersionList(arrayVersions);
                  Utils.emitEvent('no_error', 174430);
                } catch (error) {
                  console.error(`catch ErrorCode: ${error.code},  Message: ${error.message}`);
                  if (Number(error.code) == 401) {
                    Utils.emitEvent('401', 174430);
                  } else {
                    Utils.emitEvent(String(error.code), 174430);
                  }
                }
                break;
              }
              case 'emitGetBrandVersionListWithUndefinedMajorVersion': {
                try {
                  let metaData = new webView.UserAgentMetadata();
                  let brandVersion = new webView.UserAgentBrandVersion();
                  brandVersion.setBrand('TestBrand');
                  brandVersion.setMajorVersion(undefined);
                  brandVersion.setFullVersion('1.0.0');
                  let arrayVersions: webView.UserAgentBrandVersion[] = [brandVersion];
                  metaData.setBrandVersionList(arrayVersions);
                  Utils.emitEvent('no_error', 174440);
                } catch (error) {
                  console.error(`catch ErrorCode: ${error.code},  Message: ${error.message}`);
                  if (Number(error.code) == 401) {
                    Utils.emitEvent('401', 174440);
                  } else {
                    Utils.emitEvent(String(error.code), 174440);
                  }
                }
                break;
              }
              case 'emitGetBrandVersionListWithEmptyFullVersion': {
                try {
                  let userAgent = webView.WebviewController.getDefaultUserAgent();
                  let metaData = new webView.UserAgentMetadata();
                  let brandVersion = new webView.UserAgentBrandVersion();
                  brandVersion.setBrand('TestBrand');
                  brandVersion.setMajorVersion('1.0');
                  brandVersion.setFullVersion('');
                  let arrayVersions: webView.UserAgentBrandVersion[] = [brandVersion];
                  metaData.setBrandVersionList(arrayVersions);
                  Utils.emitEvent('no_error', 174450);
                } catch (error) {
                  console.error(`catch ErrorCode: ${error.code},  Message: ${error.message}`);
                  if (Number(error.code) == 401) {
                    Utils.emitEvent('401', 174450);
                  } else {
                    Utils.emitEvent(String(error.code), 174450);
                  }
                }
                break;
              }
              case 'emitGetBrandVersionListWithNullFullVersion': {
                try {
                  let userAgent = webView.WebviewController.getDefaultUserAgent();
                  let metaData = new webView.UserAgentMetadata();
                  let brandVersion = new webView.UserAgentBrandVersion();
                  brandVersion.setBrand('TestBrand');
                  brandVersion.setMajorVersion('1.0');
                  brandVersion.setFullVersion(null);
                  let arrayVersions: webView.UserAgentBrandVersion[] = [brandVersion];
                  metaData.setBrandVersionList(arrayVersions);
                  Utils.emitEvent('no_error', 174460);
                } catch (error) {
                  console.error(`catch ErrorCode: ${error.code},  Message: ${error.message}`);
                  if (Number(error.code) == 401) {
                    Utils.emitEvent('401', 174460);
                  } else {
                    Utils.emitEvent(String(error.code), 174460);
                  }
                }
                break;
              }
              case 'emitGetBrandVersionListWithUndefinedFullVersion': {
                try {
                  let metaData = new webView.UserAgentMetadata();
                  let brandVersion = new webView.UserAgentBrandVersion();
                  brandVersion.setBrand('TestBrand');
                  brandVersion.setMajorVersion('1.0');
                  brandVersion.setFullVersion(undefined);
                  let arrayVersions: webView.UserAgentBrandVersion[] = [brandVersion];
                  metaData.setBrandVersionList(arrayVersions);
                  Utils.emitEvent('no_error', 174470);
                } catch (error) {
                  console.error(`catch ErrorCode: ${error.code},  Message: ${error.message}`);
                  if (Number(error.code) == 401) {
                    Utils.emitEvent('401', 174470);
                  } else {
                    Utils.emitEvent(String(error.code), 174470);
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
