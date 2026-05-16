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
      eventId: 174980,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(174980)
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
          .key('WebUserAgentMetadataWow64Button')
          .onClick(async () => {
            await waitForExist(()=>this.isReceive, this.emitKey, 0, 1000);
            await waitForExist(()=>this.isPageEnd, this.emitKey, 0, 1000);
            console.info('key==>' + this.emitKey);
            this.isReceive = -1;
            switch (this.emitKey) {
              case 'emitGetWow64AfterSet': {
                try {
                  let userAgent = webView.WebviewController.getDefaultUserAgent();
                  let metaData = new webView.UserAgentMetadata();
                  metaData.setWow64(true);
                  this.controller.setUserAgentMetadata(userAgent, metaData);
                  let result = this.controller.getUserAgentMetadata(userAgent);
                  let wow64 = result.getWow64();
                  Utils.emitEvent(wow64, 174990);
                } catch (error) {
                  console.error(`catch ErrorCode: ${error.code},  Message: ${error.message}`);
                  if (Number(error.code) == 401) {
                    Utils.emitEvent('401', 174990);
                  } else {
                    Utils.emitEvent(String(error.code), 174990);
                  }
                }
                break;
              }
              case 'emitGetWow64False': {
                try {
                  let userAgent = webView.WebviewController.getDefaultUserAgent();
                  let metaData = new webView.UserAgentMetadata();
                  metaData.setWow64(false);
                  this.controller.setUserAgentMetadata(userAgent, metaData);
                  let result = this.controller.getUserAgentMetadata(userAgent);
                  let wow64 = result.getWow64();
                  Utils.emitEvent(wow64, 175000);
                } catch (error) {
                  console.error(`catch ErrorCode: ${error.code},  Message: ${error.message}`);
                  if (Number(error.code) == 401) {
                    Utils.emitEvent('401', 175000);
                  } else {
                    Utils.emitEvent(String(error.code), 175000);
                  }
                }
                break;
              }
              case 'emitSetWow64Null': {
                try {
                  let metaData = new webView.UserAgentMetadata();
                  metaData.setWow64(null);
                  Utils.emitEvent('no_error', 175010);
                } catch (error) {
                  console.error(`catch ErrorCode: ${error.code},  Message: ${error.message}`);
                  if (Number(error.code) == 401) {
                    Utils.emitEvent('401', 175010);
                  } else {
                    Utils.emitEvent(String(error.code), 175010);
                  }
                }
                break;
              }
              case 'emitSetWow64Undefined': {
                try {
                  let metaData = new webView.UserAgentMetadata();
                  metaData.setWow64(undefined);
                  Utils.emitEvent('no_error', 175020);
                } catch (error) {
                  console.error(`catch ErrorCode: ${error.code},  Message: ${error.message}`);
                  if (Number(error.code) == 401) {
                    Utils.emitEvent('401', 175020);
                  } else {
                    Utils.emitEvent(String(error.code), 175020);
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
