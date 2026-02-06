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
import {waitForAssert, waitForExist} from '../../test/WaitTest.test';

@Entry
@Component
struct webGetProgressTest {
  controller: webView.WebviewController = new webView.WebviewController();
  @State emitKey: string = '';
  @State message: Array<string> = [];
  @State isReceive: number = -1;
  @State progress: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 118,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(118)
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
        Button('getProgress errorCode')
          .key('WebGetProgressButton')
          .onClick(async () => {
            await waitForExist(()=>this.isReceive, this.emitKey, 0);
            console.info('key==>' + this.emitKey);
            this.isReceive = -1;
            switch (this.emitKey) {
              case 'emitGetProgressErrorCode001': {
                try {
                  this.progress = this.controller.getProgress();
                } catch (error) {
                  this.progress = Number(error.code);
                }
                console.log('getProgress' + this.progress);
                let coreVersion = webView.WebviewController.getActiveWebEngineVersion();
                console.log('getActiveWebEngineVersion==>' + coreVersion);
                if (coreVersion > webView.ArkWebEngineVersion.M114) {
                  console.log('coreVersion > 114');
                  let check = (v1: number, v2: boolean): boolean => {
                    return v1 >= 0 && v1 <= 100;
                  }
                  await waitForAssert(() => this.progress, check, true, 2025090201, this.emitKey);
                } else {
                  console.log('coreVersion <= 114');
                  let check = (v1: number, v2: boolean): boolean => {
                    return v1 == 801;
                  }
                  await waitForAssert(() => this.progress, check, true, 2025090201, this.emitKey);
                }
                break;
              }
            }
         })
      }
      Web({ src: $rawfile('index.html'), controller: this.controller })
        .onPageBegin((event) => {
          if (event) {
            console.log('onPageBegin url:' + event.url);
          }
        })
        .width('100%')
        .height('100%')
    }
  }
}
