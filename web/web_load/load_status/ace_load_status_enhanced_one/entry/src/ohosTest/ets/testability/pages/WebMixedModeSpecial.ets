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
import { URL,URL_MIXED } from '../../test/Config.test';

@Entry
@Component
struct WebMixedModeSpecial {
  controller: webView.WebviewController = new webView.WebviewController();
  @State str: string = '';
  @State isReceive:number = -1;
  @State consoleLevel: number = -1;
  @State isPageEnd: number = -1;
  @State isMixedMode: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 153,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(153)
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
        Button('mixedMode_null_undefined')
          .key('WebMixedModeSpecialButton')
          .onClick(async () => {
            await waitForExist(()=>this.isReceive, this.str, 0, 1000);
            console.info('key==>' + this.str);
            this.isReceive = -1;
            this.isMixedMode = -1;
            this.consoleLevel = -1;
            switch (this.str) {
              case 'emitWebMixedModeSetNull': {
                try {
                  this.isPageEnd = -1;
                  this.isMixedMode = 1;
                  await waitForExist(()=>this.isPageEnd, this.str, 0, 1000);
                  let check = (v1: number, v2: number): boolean => {
                    return v1 === v2 ? true : false;
                  }
                  await waitForAssert(()=>this.consoleLevel, check, 3, 25112611, this.str);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'emitWebMixedModeSetUndefined': {
                try {
                  this.isPageEnd = -1;
                  this.isMixedMode = 2;
                  await waitForExist(()=>this.isPageEnd, this.str, 0, 1000);
                  let check = (v1: number, v2: number): boolean => {
                    return v1 === v2 ? true : false;
                  }
                  await waitForAssert(()=>this.consoleLevel, check, 3, 25112612, this.str);
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

            }
          })
      }
      .width('100%')
      if (this.isMixedMode == 1) {
        Web({ src: URL_MIXED, controller: this.controller })
          .width('100%')
          .mixedMode(null)
          .onPageEnd((event) => {
            if (event) {
              this.isPageEnd = 0;
              console.log('undefined onPageEnd url==>' + event.url);
            }
          })
          .onConsole((event) => {
            if (event) {
              console.log('onConsole null getMessage:' + event.message.getMessage());
              console.log('onConsole null getMessageLevel:' + event.message.getMessageLevel());
              this.consoleLevel = event.message.getMessageLevel();
            }
            return false;
          })
      }
      if (this.isMixedMode == 2) {
        Web({ src: URL_MIXED, controller: this.controller })
          .width('100%')
          .mixedMode(undefined)
          .onPageEnd((event) => {
            if (event) {
              this.isPageEnd = 0;
              console.log('null onPageEnd url==>' + event.url);
            }
          })
          .onConsole((event) => {
            if (event) {
              console.log('onConsole undefined getMessage:' + event.message.getMessage());
              console.log('onConsole undefined getMessageLevel:' + event.message.getMessageLevel());
              this.consoleLevel = event.message.getMessageLevel();
            }
            return false;
          })
      }
    }
  }
}