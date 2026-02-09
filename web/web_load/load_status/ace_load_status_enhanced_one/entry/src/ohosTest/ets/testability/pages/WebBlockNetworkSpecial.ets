/*
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

import webView from '@ohos.web.webview';
import Utils from '../../test/Utils';
import events_emitter from '@ohos.events.emitter';
import {waitForAssert, waitForExist} from '../../test/WaitTest.test';
import { URL,URL_BAIDU } from '../../test/Config.test';

@Entry
@Component
struct WebBlockNetworkSpecial {
  controller: webView.WebviewController = new webView.WebviewController();
  @State str: string = '';
  @State isReceive:number = -1;
  @State searchTotalNumber: number = -1;
  @State isPageEnd: number = -1;
  @State isBlockNetwork: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 152,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(152)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 0;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button('blockNetwork_null_undefined')
          .key('WebBlockNetworkSpecialButton')
          .onClick(async () => {
            await waitForExist(()=>this.isReceive, this.str, 0, 1000);
            console.info('key==>' + this.str);
            this.isReceive = -1;
            this.isBlockNetwork = -1;
            this.searchTotalNumber = -1;
            switch (this.str) {
              case 'emitWebBlockNetworkSetNull': {
                try {
                  this.isPageEnd = -1;
                  this.isBlockNetwork = 1;
                  await waitForExist(()=>this.isPageEnd, this.str, 0, 1000);
                  this.controller.searchAllAsync('百度');
                  let check = (v1: number, v2: boolean): boolean => {
                    return v1 > 0;
                  }
                  await waitForAssert(()=>this.searchTotalNumber, check, true, 25112609, this.str);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'emitWebBlockNetworkSetUndefined': {
                try {
                  this.isPageEnd = -1;
                  this.isBlockNetwork = 2;
                  await waitForExist(()=>this.isPageEnd, this.str, 0, 1000);
                  this.controller.searchAllAsync('百度');
                  let check = (v1: number, v2: boolean): boolean => {
                    return v1 > 0;
                  }
                  await waitForAssert(()=>this.searchTotalNumber, check, true, 25112610, this.str);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

            }
          })
      }
      .width('100%')
      if (this.isBlockNetwork == 1) {
        Web({ src: URL_BAIDU, controller: this.controller })
          .width('100%')
          .blockNetwork(null)
          .onPageEnd((event) => {
            if (event) {
              this.isPageEnd = 0;
              console.log('onPageEnd url==>' + event.url);
            }
          })
          .onSearchResultReceive(ret => {
            if (ret) {
              console.log('onSearchResultReceive nul numberOfMatches==>' + ret.numberOfMatches);
              this.searchTotalNumber = ret.numberOfMatches;
            }
          })
      }
      if (this.isBlockNetwork == 2) {
        Web({ src: URL_BAIDU, controller: this.controller })
          .width('100%')
          .blockNetwork(undefined)
          .onPageEnd((event) => {
            if (event) {
              this.isPageEnd = 0;
              console.log('onPageEnd url==>' + event.url);
            }
          })
          .onSearchResultReceive(ret => {
            if (ret) {
              console.log('onSearchResultReceive nul numberOfMatches==>' + ret.numberOfMatches);
              this.searchTotalNumber = ret.numberOfMatches;
            }
          })
      }
    }
  }
}