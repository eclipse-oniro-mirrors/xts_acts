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
import { URL_BAIDU } from '../../test/Config.test';
import {waitForAssert} from '../../test/WaitTest.test';


@Entry
@Component
struct webOnInterceptRequestSpecial {
  controller: webView.WebviewController = new webView.WebviewController();
  @State str: string = '';
  @State isReceive: number = -1;
  @State isPageEnd:number = -1;
  @State isOnInterceptRequest: number = -1;
  @State searchTotalNumber: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 155,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(155)
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
    Row() {
      Column() {
        Button('onInterceptRequest_null_undefined')
          .key('WebOnInterceptRequestSpecialButton')
          .onClick(async () => {
            await Utils.waitForExist(()=>this.isReceive, this.str, 0, 1000);
            console.info('key==>' + this.str)
            this.isReceive = -1;
            this.searchTotalNumber = -1;
            this.isOnInterceptRequest = -1;
            switch (this.str) {
              case 'emitWebOnInterceptRequestSetNull': {
                try {
                  this.isPageEnd = -1;
                  this.isOnInterceptRequest = 1;
                  await Utils.waitForExist(()=>this.isPageEnd, this.str, 0, 1000);
                  this.controller.searchAllAsync('百度');
                  let check = (v1: number, v2: boolean): boolean => {
                    return v1 > 0;
                  }
                  await waitForAssert(()=>this.searchTotalNumber, check, true, 25112615, this.str);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'emitWebOnInterceptRequestSetUndefined': {
                try {
                  this.isPageEnd = -1;
                  this.isOnInterceptRequest = 2;
                  await Utils.waitForExist(()=>this.isPageEnd, this.str, 0, 1000);
                  this.controller.searchAllAsync('百度');
                  let check = (v1: number, v2: boolean): boolean => {
                    return v1 > 0;
                  }
                  await waitForAssert(()=>this.searchTotalNumber, check, true, 25112616, this.str);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

            }
          })
        if (this.isOnInterceptRequest == 1) {
          Web({ src: URL_BAIDU, controller: this.controller })
            .width('100%')
            .onInterceptRequest((event) => {
              if (event) {
                console.log('null onInterceptRequest url:' + event.request.getRequestUrl());
              }
              return null
            })
            .onPageEnd((event) => {
              this.isPageEnd = 0;
              console.log('null onPageEnd url==>' + event.url);
            })
            .onSearchResultReceive(ret => {
              if (ret) {
                console.log('onSearchResultReceive nul numberOfMatches==>' + ret.numberOfMatches);
                this.searchTotalNumber = ret.numberOfMatches;
              }
            })
        }
        if (this.isOnInterceptRequest == 2) {
          Web({ src: URL_BAIDU, controller: this.controller })
            .width('100%')
            .onInterceptRequest((event) => {
              if (event) {
                console.log('undefined onInterceptRequest url:' + event.request.getRequestUrl());
              }
              return undefined
            })
            .onPageEnd((event) => {
              this.isPageEnd = 0;
              console.log('undefined onPageEnd url==>' + event.url);
            })
            .onSearchResultReceive(ret => {
              if (ret) {
                console.log('onSearchResultReceive undefined numberOfMatches==>' + ret.numberOfMatches);
                this.searchTotalNumber = ret.numberOfMatches;
              }
            })
        }

      }
      .width('100%')
    }

    .height('100%')
  }
}