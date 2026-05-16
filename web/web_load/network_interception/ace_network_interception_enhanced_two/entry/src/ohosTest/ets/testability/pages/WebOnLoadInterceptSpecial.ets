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
struct webOnLoadInterceptSpecial {
  controller: webView.WebviewController = new webView.WebviewController();
  @State str: string = '';
  @State isReceive: number = -1;
  @State isPageEnd:number = -1;
  @State isOnLoadIntercept: number = -1;
  @State url: string = '';

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 156,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(156)
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
        Button('onLoadIntercept_null_undefined')
          .key('WebOnLoadInterceptSpecialButton')
          .onClick(async () => {
            await Utils.waitForExist(()=>this.isReceive, this.str, 0, 1000);
            console.info('key==>' + this.str)
            this.isReceive = -1;
            this.url = '';
            this.isOnLoadIntercept = -1;
            switch (this.str) {
              case 'emitWebOnLoadInterceptSetNull': {
                try {
                  this.isPageEnd = -1;
                  this.isOnLoadIntercept = 1;
                  await Utils.waitForExist(()=>this.isPageEnd, this.str, 0, 1000);
                  let check = (v1: string, v2: boolean): boolean => {
                    return v1.includes('baidu.com');
                  }
                  await waitForAssert(()=>this.url, check, true, 25112617, this.str);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'emitWebOnLoadInterceptSetUndefined': {
                try {
                  this.isPageEnd = -1;
                  this.isOnLoadIntercept = 2;
                  await Utils.waitForExist(()=>this.isPageEnd, this.str, 0, 1000);
                  let check = (v1: string, v2: boolean): boolean => {
                    return v1.includes('baidu.com');
                  }
                  await waitForAssert(()=>this.url, check, true, 25112618, this.str);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

            }
          })
        if (this.isOnLoadIntercept == 1) {
          Web({ src: URL_BAIDU, controller: this.controller })
            .width('100%')
            .onLoadIntercept((event) => {
              if (event) {
                console.log('null onLoadIntercept url:' + event.data.getRequestUrl());
              }
              return null
            })
            .onPageEnd((event) => {
              this.isPageEnd = 0;
              console.log('null onPageEnd url==>' + event.url);
              this.url = event.url;
            })
        }
        if (this.isOnLoadIntercept == 2) {
          Web({ src: URL_BAIDU, controller: this.controller })
            .width('100%')
            .onLoadIntercept((event) => {
              if (event) {
                console.log('undefined onLoadIntercept url:' + event.data.getRequestUrl());
              }
              return undefined
            })
            .onPageEnd((event) => {
              this.isPageEnd = 0;
              console.log('undefined onPageEnd url==>' + event.url);
              this.url = event.url;
            })
        }

      }
      .width('100%')
    }

    .height('100%')
  }
}