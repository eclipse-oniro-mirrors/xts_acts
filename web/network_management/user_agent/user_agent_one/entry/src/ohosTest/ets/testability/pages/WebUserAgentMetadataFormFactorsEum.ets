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
struct webUserAgentMetadataFormFactorsEum {
  controller: webView.WebviewController = new webView.WebviewController();
  @State emitKey: string = '';
  @State isPageEnd: number = -1;
  @State isReceive: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 175030,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(175030)
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
          .key('WebUserAgentMetadataFormFactorsEumButton')
          .onClick(async () => {
            await waitForExist(()=>this.isReceive, this.emitKey, 0, 1000);
            await waitForExist(()=>this.isPageEnd, this.emitKey, 0, 1000);
            console.info('key==>' + this.emitKey);
            this.isReceive = -1;
            switch (this.emitKey) {
              case 'emitSetFormFactorsAutomotive': {
                try {
                  let userAgent = webView.WebviewController.getDefaultUserAgent();
                  let metaData = new webView.UserAgentMetadata();
                  metaData.setFormFactors([webView.UserAgentFormFactor.AUTOMOTIVE]);
                  this.controller.setUserAgentMetadata(userAgent, metaData);
                  let result = this.controller.getUserAgentMetadata(userAgent);
                  let formFactors = result.getFormFactors();

                  for(let j = 0; j < formFactors.length; j++) {
                    console.info('emitSetFormFactorsAutomotive FormFactor:' + formFactors[j]);
                  }

                  if (formFactors[0] == webView.UserAgentFormFactor.AUTOMOTIVE) {
                    Utils.emitEvent(true, 175040);
                  } else {
                    Utils.emitEvent(false, 175040);
                  }

                } catch (error) {
                  console.error(`catch ErrorCode: ${error.code},  Message: ${error.message}`);
                  if (Number(error.code) == 401) {
                    Utils.emitEvent('401', 175040);
                  } else {
                    Utils.emitEvent(String(error.code), 175040);
                  }
                }
                break;
              }
              case 'emitSetFormFactorsDesktop': {
                try {
                  let userAgent = webView.WebviewController.getDefaultUserAgent();
                  let metaData = new webView.UserAgentMetadata();
                  metaData.setFormFactors([webView.UserAgentFormFactor.DESKTOP]);
                  this.controller.setUserAgentMetadata(userAgent, metaData);
                  let result = this.controller.getUserAgentMetadata(userAgent);
                  let formFactors = result.getFormFactors();

                  for(let j = 0; j < formFactors.length; j++) {
                    console.info('emitSetFormFactorsDesktop FormFactor:' + formFactors[j]);
                  }

                  if (formFactors[0] == webView.UserAgentFormFactor.DESKTOP) {
                    Utils.emitEvent(true, 175050);
                  } else {
                    Utils.emitEvent(false, 175050);
                  }

                } catch (error) {
                  console.error(`catch ErrorCode: ${error.code},  Message: ${error.message}`);
                  if (Number(error.code) == 401) {
                    Utils.emitEvent('401', 175050);
                  } else {
                    Utils.emitEvent(String(error.code), 175050);
                  }
                }
                break;
              }
              case 'emitSetFormFactorsMobile': {
                try {
                  let userAgent = webView.WebviewController.getDefaultUserAgent();
                  let metaData = new webView.UserAgentMetadata();
                  metaData.setFormFactors([webView.UserAgentFormFactor.MOBILE]);
                  this.controller.setUserAgentMetadata(userAgent, metaData);
                  let result = this.controller.getUserAgentMetadata(userAgent);
                  let formFactors = result.getFormFactors();

                  for(let j = 0; j < formFactors.length; j++) {
                    console.info('emitSetFormFactorsMobile FormFactor:' + formFactors[j]);
                  }

                  if (formFactors[0] == webView.UserAgentFormFactor.MOBILE) {
                    Utils.emitEvent(true, 175060);
                  } else {
                    Utils.emitEvent(false, 175060);
                  }

                } catch (error) {
                  console.error(`catch ErrorCode: ${error.code},  Message: ${error.message}`);
                  if (Number(error.code) == 401) {
                    Utils.emitEvent('401', 175060);
                  } else {
                    Utils.emitEvent(String(error.code), 175060);
                  }
                }
                break;
              }
              case 'emitSetFormFactorsEInk': {
                try {
                  let userAgent = webView.WebviewController.getDefaultUserAgent();
                  let metaData = new webView.UserAgentMetadata();
                  metaData.setFormFactors([webView.UserAgentFormFactor.EINK]);
                  this.controller.setUserAgentMetadata(userAgent, metaData);
                  let result = this.controller.getUserAgentMetadata(userAgent);
                  let formFactors = result.getFormFactors();

                  for(let j = 0; j < formFactors.length; j++) {
                    console.info('emitSetFormFactorsEInk FormFactor:' + formFactors[j]);
                  }

                  if (formFactors[0] == webView.UserAgentFormFactor.EINK) {
                    Utils.emitEvent(true, 175070);
                  } else {
                    Utils.emitEvent(false, 175070);
                  }

                } catch (error) {
                  console.error(`catch ErrorCode: ${error.code},  Message: ${error.message}`);
                  if (Number(error.code) == 401) {
                    Utils.emitEvent('401', 175070);
                  } else {
                    Utils.emitEvent(String(error.code), 175070);
                  }
                }
                break;
              }
              case 'emitSetFormFactorsTablet': {
                try {
                  let userAgent = webView.WebviewController.getDefaultUserAgent();
                  let metaData = new webView.UserAgentMetadata();
                  metaData.setFormFactors([webView.UserAgentFormFactor.TABLET]);
                  this.controller.setUserAgentMetadata(userAgent, metaData);
                  let result = this.controller.getUserAgentMetadata(userAgent);
                  let formFactors = result.getFormFactors();
                  for(let j = 0; j < formFactors.length; j++) {
                    console.info('emitSetFormFactorsTABLET FormFactor:' + formFactors[j]);
                  }

                  if (formFactors[0] == webView.UserAgentFormFactor.TABLET) {
                    Utils.emitEvent(true, 175080);
                  } else {
                    Utils.emitEvent(false, 175080);
                  }
                } catch (error) {
                  console.error(`catch ErrorCode: ${error.code},  Message: ${error.message}`);
                  if (Number(error.code) == 401) {
                    Utils.emitEvent('401', 175080);
                  } else {
                    Utils.emitEvent(String(error.code), 175080);
                  }
                }
                break;
              }
              case 'emitSetFormFactorsWatch': {
                try {
                  let userAgent = webView.WebviewController.getDefaultUserAgent();
                  let metaData = new webView.UserAgentMetadata();
                  metaData.setFormFactors([webView.UserAgentFormFactor.WATCH]);
                  this.controller.setUserAgentMetadata(userAgent, metaData);
                  let result = this.controller.getUserAgentMetadata(userAgent);
                  let formFactors = result.getFormFactors();
                  for(let j = 0; j < formFactors.length; j++) {
                    console.info('emitSetFormFactorsWATCH FormFactor:' + formFactors[j]);
                  }

                  if (formFactors[0] == webView.UserAgentFormFactor.WATCH) {
                    Utils.emitEvent(true, 175090);
                  } else {
                    Utils.emitEvent(false, 175090);
                  }
                } catch (error) {
                  console.error(`catch ErrorCode: ${error.code},  Message: ${error.message}`);
                  if (Number(error.code) == 401) {
                    Utils.emitEvent('401', 175090);
                  } else {
                    Utils.emitEvent(String(error.code), 175090);
                  }
                }
                break;
              }
              case 'emitSetFormFactorsXR': {
                try {
                  let userAgent = webView.WebviewController.getDefaultUserAgent();
                  let metaData = new webView.UserAgentMetadata();
                  metaData.setFormFactors([webView.UserAgentFormFactor.XR]);
                  this.controller.setUserAgentMetadata(userAgent, metaData);
                  let result = this.controller.getUserAgentMetadata(userAgent);
                  let formFactors = result.getFormFactors();
                  for(let j = 0; j < formFactors.length; j++) {
                    console.info('emitSetFormFactorsXR FormFactor:' + formFactors[j]);
                  }

                  if (formFactors[0] == webView.UserAgentFormFactor.XR) {
                    Utils.emitEvent(true, 175100);
                  } else {
                    Utils.emitEvent(false, 175100);
                  }
                } catch (error) {
                  console.error(`catch ErrorCode: ${error.code},  Message: ${error.message}`);
                  if (Number(error.code) == 401) {
                    Utils.emitEvent('401', 175100);
                  } else {
                    Utils.emitEvent(String(error.code), 175100);
                  }
                }
                break;
              }
              case 'emitSetFormFactorsMultiple': {
                try {
                  let userAgent = webView.WebviewController.getDefaultUserAgent();
                  let metaData = new webView.UserAgentMetadata();
                  metaData.setFormFactors([webView.UserAgentFormFactor.MOBILE, webView.UserAgentFormFactor.TABLET]);
                  this.controller.setUserAgentMetadata(userAgent, metaData);
                  let result = this.controller.getUserAgentMetadata(userAgent);
                  let formFactors = result.getFormFactors();
                  for(let j = 0; j < formFactors.length; j++) {
                    console.info('emitSetFormFactorsMultiple FormFactor:' +j + '' + formFactors[j]);
                  }
                  if (formFactors[0] == webView.UserAgentFormFactor.MOBILE && formFactors[1] ==
                  webView.UserAgentFormFactor.TABLET) {
                    Utils.emitEvent(true, 175110);
                  } else {
                    Utils.emitEvent(false, 175110);
                  }
                } catch (error) {
                  console.error(`catch ErrorCode: ${error.code},  Message: ${error.message}`);
                  if (Number(error.code) == 401) {
                    Utils.emitEvent('401', 175110);
                  } else {
                    Utils.emitEvent(String(error.code), 175110);
                  }
                }
                break;
              }
              case 'emitSetFormFactorsEmpty': {
                try {
                  let userAgent = webView.WebviewController.getDefaultUserAgent();
                  let metaData = new webView.UserAgentMetadata();
                  let emptyArray: webView.UserAgentFormFactor[] = [];
                  metaData.setFormFactors(emptyArray);
                  this.controller.setUserAgentMetadata(userAgent, metaData);
                  let result = this.controller.getUserAgentMetadata(userAgent);
                  let formFactors = result.getFormFactors();
                  for(let j = 0; j < formFactors.length; j++) {
                    console.info('emitSetFormFactorsEmpty FormFactor:' +j + '' + formFactors[j]);
                  }
                  Utils.emitEvent(formFactors.length, 175120);
                } catch (error) {
                  console.error(`catch ErrorCode: ${error.code},  Message: ${error.message}`);
                  if (Number(error.code) == 401) {
                    Utils.emitEvent('401', 175120);
                  } else {
                    Utils.emitEvent(String(error.code), 175120);
                  }
                }
                break;
              }
              case 'emitSetFormFactorsNull': {
                try {
                  let metaData = new webView.UserAgentMetadata();
                  metaData.setFormFactors(null);
                  Utils.emitEvent('no_error', 175130);
                } catch (error) {
                  console.error(`catch ErrorCode: ${error.code},  Message: ${error.message}`);
                  if (Number(error.code) == 401) {
                    Utils.emitEvent('401', 175130);
                  } else {
                    Utils.emitEvent(String(error.code), 175130);
                  }
                }
                break;
              }
              case 'emitSetFormFactorsUndefined': {
                try {
                  let metaData = new webView.UserAgentMetadata();
                  metaData.setFormFactors(undefined);
                  Utils.emitEvent('no_error', 175140);
                } catch (error) {
                  console.error(`catch ErrorCode: ${error.code},  Message: ${error.message}`);
                  if (Number(error.code) == 401) {
                    Utils.emitEvent('401', 175140);
                  } else {
                    Utils.emitEvent(String(error.code), 175140);
                  }
                  break;
                }
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
