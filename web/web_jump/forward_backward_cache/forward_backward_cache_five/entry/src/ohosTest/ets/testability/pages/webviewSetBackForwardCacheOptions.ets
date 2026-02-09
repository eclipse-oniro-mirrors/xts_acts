/**
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

import events_emitter from '@ohos.events.emitter';
import webview from '@ohos.web.webview';
import Utils from '../../test/Utils';
import JSON from '@ohos.util.json';
import { waitForExist } from '../../test/WaitTest.test';

interface PageBeginParam {
  url: string
}

@Entry
@Component
struct WebComponent {
  controller: WebviewController = new webview.WebviewController();
  @State showNativeMediaPlayer: boolean = false;
  @State nodeWidth: number = 300;
  @State nodeHeight: number = 150;
  @State isShouldOverlay: boolean = true;
  @State isCallback: boolean = true;
  @State isComplete: number = -1;
  @State isReceive: number = -1;
  area?: Area
  @State emitKey: string = '';

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 137600,
      priority: events_emitter.EventPriority.LOW,
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(137600)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
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
        Button('web click').key('webviewSetBackForwardCacheOptionsButton').onClick(async () => {
          await waitForExist(() => this.isComplete, this.emitKey, 0);
          await waitForExist(() => this.isReceive, this.emitKey, 0);
          this.isReceive = -1;
          console.info('key==>' + this.emitKey)
          this.isShouldOverlay = true
          this.isCallback = false

          switch (this.emitKey) {
            case 'emitWebviewSetBackForwardCacheOptions': {
              try {
                let options = new webview.BackForwardCacheOptions();
                options.size = 3;
                options.timeToLive = 10;
                this.controller.setBackForwardCacheOptions(options);
                Utils.emitEvent('success', 137610)
              } catch (error) {
                Utils.emitEvent('fail', 137610)
              }
              break;
            }
          }
        })
      }

      Stack() {
        Web({ src: 'www.example.com', controller: this.controller })
          .enableNativeMediaPlayer({ enable: true, shouldOverlay: this.isShouldOverlay })
          .onPageBegin(async (event: PageBeginParam) => {
            console.error('enter onPageBegin, url:' + event.url);

            console.error('exit onPageBegin');
          })
          .onPageEnd((event) => {
            console.log('web pageEnd==>' + event.url);
            this.isComplete = 0;
          })
          .width('100%')
          .height('100%')
          .onAreaChange((oldValue: Area, newValue: Area) => {
            oldValue;
            this.area = newValue;
          })
      }
    }
  }
}


