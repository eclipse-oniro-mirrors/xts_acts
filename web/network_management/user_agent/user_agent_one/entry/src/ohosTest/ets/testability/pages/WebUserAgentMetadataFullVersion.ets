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
  responseWeb: WebResourceResponse = new WebResourceResponse();
  @State emitKey: string = '';
  @State isPageEnd: number = -1;
  @State isReceive: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 174680,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(174680)
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
          .key('WebUserAgentMetadataFullVersionButton')
          .onClick(async () => {
            await waitForExist(()=>this.isReceive, this.emitKey, 0, 1000);
            await waitForExist(()=>this.isPageEnd, this.emitKey, 0, 1000);
            console.info('key==>' + this.emitKey);
            this.isReceive = -1;
            switch (this.emitKey) {
              case 'emitGetFullVersionAfterSet': {
                try {
                  let userAgent = webView.WebviewController.getDefaultUserAgent();
                  let metaData = new webView.UserAgentMetadata();
                  metaData.setFullVersion('1.0.0.0');
                  this.controller.setUserAgentMetadata(userAgent, metaData);
                  let result = this.controller.getUserAgentMetadata(userAgent);
                  let fullVersion = result.getFullVersion();
                  Utils.emitEvent(fullVersion, 174690);
                } catch (error) {
                  console.error(`catch ErrorCode: ${error.code},  Message: ${error.message}`);
                  if (Number(error.code) == 401) {
                    Utils.emitEvent('401', 174690);
                  } else {
                    Utils.emitEvent(String(error.code), 174690);
                  }
                }
                break;
              }
              case 'emitGetFullVersionEmpty': {
                try {
                  let userAgent = webView.WebviewController.getDefaultUserAgent();
                  let metaData = new webView.UserAgentMetadata();
                  metaData.setFullVersion('');
                  this.controller.setUserAgentMetadata(userAgent, metaData);
                  let result = this.controller.getUserAgentMetadata(userAgent);
                  let fullVersion = result.getFullVersion();
                  Utils.emitEvent(fullVersion, 174700);
                } catch (error) {
                  console.error(`catch ErrorCode: ${error.code},  Message: ${error.message}`);
                  if (Number(error.code) == 401) {
                    Utils.emitEvent('401', 174700);
                  } else {
                    Utils.emitEvent(String(error.code), 174700);
                  }
                }
                break;
              }
              case 'emitSetFullVersionNull': {
                try {
                  let metaData = new webView.UserAgentMetadata();
                  metaData.setFullVersion(null);
                  Utils.emitEvent('no_error', 174710);
                } catch (error) {
                  console.error(`catch ErrorCode: ${error.code},  Message: ${error.message}`);
                  if (Number(error.code) == 401) {
                    Utils.emitEvent('401', 174710);
                  } else {
                    Utils.emitEvent(String(error.code), 174710);
                  }
                }
                break;
              }
              case 'emitSetFullVersionUndefined': {
                try {
                  let metaData = new webView.UserAgentMetadata();
                  metaData.setFullVersion(undefined);
                  Utils.emitEvent('no_error', 174720);
                } catch (error) {
                  console.error(`catch ErrorCode: ${error.code},  Message: ${error.message}`);
                  if (Number(error.code) == 401) {
                    Utils.emitEvent('401', 174720);
                  } else {
                    Utils.emitEvent(String(error.code), 174720);
                  }
                }
                break;
              }
              case 'emitGetFullVersionLong': {
                try {
                  let userAgent = webView.WebviewController.getDefaultUserAgent();
                  let metaData = new webView.UserAgentMetadata();
                  metaData.setFullVersion('99.99.99.99');
                  this.controller.setUserAgentMetadata(userAgent, metaData);
                  let result = this.controller.getUserAgentMetadata(userAgent);
                  let fullVersion = result.getFullVersion();
                  Utils.emitEvent(fullVersion, 174730);
                } catch (error) {
                  console.error(`catch ErrorCode: ${error.code},  Message: ${error.message}`);
                  if (Number(error.code) == 401) {
                    Utils.emitEvent('401', 174730);
                  } else {
                    Utils.emitEvent(String(error.code), 174730);
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
