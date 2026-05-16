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
import events_emitter from '@ohos.events.emitter';
import webview from '@ohos.web.webview';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import testsuite from '../../test/List.test';
import Utils from '../../test/Utils';
import {waitForAssert, waitForExist} from '../../test/WaitTest.test';

@Entry
@Component
struct webTwo {
  controller: webview.WebviewController = new webview.WebviewController();
  @State str: string = '';
  @State isShow: boolean = true;
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;
  @State onPageBeginProgress: number = -1;
  @State onPageEndProgress: number = -1;
  @State onProgressChangeProgress: number = -1;
  @State onControllerAttachedProgress: number = -1;
  @State onPageVisibleProgress: number = -1;
  @State onDisAppearProgress: number = -1;



  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 140011,
      priority: events_emitter.EventPriority.LOW
    };
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack);
  }
  onPageHide() {
    events_emitter.off(140011)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info('webTwo page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data?.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 0;
      }
    }
  }


  build() {
    Column() {
      Row() {
        Button('webTwo click').key('webTwoButton').onClick(async () => {
          await waitForExist(()=>this.isReceive, this.str, 0);
          console.info('key==>' + this.str);
          this.isReceive = -1;
          switch (this.str) {
            case 'emitWebviewGetProgress001': {
              let check = (v1: number, v2: boolean): boolean => {
                return v1 >= 0;
              }
              await waitForAssert(()=>this.onPageBeginProgress, check, true, 140020, this.str);
              break;
            }
            case 'emitWebviewGetProgress002': {
              let check = (v1: number, v2: boolean): boolean => {
                return v1 >= 0;
              }
              await waitForAssert(()=>this.onPageEndProgress, check, true, 140030, this.str);
              break;
            }
            case 'emitWebviewGetProgress003': {
              let check = (v1: number, v2: boolean): boolean => {
                return v1 >= 0;
              }
              await waitForAssert(()=>this.onProgressChangeProgress, check, true, 140040, this.str);
              break;
            }
            case 'emitWebviewGetProgress004': {
              let check = (v1: number, v2: boolean): boolean => {
                return v1 >= 0;
              }
              await waitForAssert(()=>this.onControllerAttachedProgress, check, true, 140050, this.str);
              break;
            }
            case 'emitWebviewGetProgress005': {
              let check = (v1: number, v2: boolean): boolean => {
                return v1 >= 0;
              }
              await waitForAssert(()=>this.onPageVisibleProgress, check, true, 140060, this.str);
              break;
            }
            case 'emitWebviewGetProgress006': {
              this.isShow = false;
              let check = (v1: number, v2: boolean): boolean => {
                return v1 >= 0;
              }
              await waitForAssert(()=>this.onDisAppearProgress, check, true, 140070, this.str);
              break;
            }
            default:
              console.info('can not match case');
          }
        })
      }
      if (this.isShow) {
        Web({ src: $rawfile('index.html'), controller: this.controller })
          .key('webTwoComponent')
          .onPageBegin(() => {
            this.onPageBeginProgress = this.controller.getProgress();
            console.log('onPageBegin getProgress==>' + this.onPageBeginProgress);
          })
          .onPageEnd(() => {
            this.onPageEndProgress = this.controller.getProgress();
            console.log('onPageEnd getProgress==>' + this.onPageEndProgress);
          })
          .onProgressChange((event) => {
            this.onProgressChangeProgress = this.controller.getProgress();
            console.log('onProgressChange getProgress==>' + this.onProgressChangeProgress);
          })
          .onControllerAttached(() => {
            this.onControllerAttachedProgress = this.controller.getProgress();
            console.log('onControllerAttached getProgress==>' + this.onControllerAttachedProgress);
          })
          .onPageVisible(() => {
            this.onPageVisibleProgress = this.controller.getProgress();
            console.log('onPageVisible getProgress==>' + this.onPageVisibleProgress);
          })
          .onDisAppear(() => {
            this.onDisAppearProgress = this.controller.getProgress();
            console.log('onDisAppear getProgress==>' + this.onDisAppearProgress);
          })
      }
    }
  }
}
