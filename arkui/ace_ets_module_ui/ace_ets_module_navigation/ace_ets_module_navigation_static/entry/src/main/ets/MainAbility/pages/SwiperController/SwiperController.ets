/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

'use static'

import {
  Entry,
  Component,
  Column,
  Text,
  Button,
  Swiper,
  SwiperController
} from '@ohos.arkui.component';
import { AppStorage, State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct SwiperControllerPage {
  private controller: SwiperController = new SwiperController();
  private readonly stateKey: string = 'SwiperControllerPageState';

  @State startFakeDragResult: string = 'not_called';
  @State fakeDragByResult: string = 'not_called';
  @State stopFakeDragResult: string = 'not_called';
  @State isFakeDraggingResult: string = 'not_called';

  aboutToAppear(): void {
    this.syncStateToStorage();
  }

  private syncStateToStorage(): void {
    const snapshot = `startFakeDragResult=${this.startFakeDragResult};fakeDragByResult=${this.fakeDragByResult};` +
      `stopFakeDragResult=${this.stopFakeDragResult};isFakeDraggingResult=${this.isFakeDraggingResult}`;
    AppStorage.setOrCreate<string>(this.stateKey, snapshot);
  }

  build() {
    Column() {
      Button('callStartFakeDrag')
        .id('callStartFakeDragBtn')
        .key('callStartFakeDragBtn')
        .onClick(() => {
          const result = this.controller.startFakeDrag();
          this.startFakeDragResult = `${result}`;
          this.syncStateToStorage();
        })
      Text(`swiper.startFakeDrag=${this.startFakeDragResult}`)
        .id('swiperStartFakeDragValue')
        .key('swiperStartFakeDragValue')

      Button('callFakeDragBy')
        .id('callFakeDragByBtn')
        .key('callFakeDragByBtn')
        .onClick(() => {
          const result = this.controller.fakeDragBy(20.0);
          this.fakeDragByResult = `${result}`;
          this.syncStateToStorage();
        })
      Text(`swiper.fakeDragBy=${this.fakeDragByResult}`)
        .id('swiperFakeDragByValue')
        .key('swiperFakeDragByValue')

      Button('callStopFakeDrag')
        .id('callStopFakeDragBtn')
        .key('callStopFakeDragBtn')
        .onClick(() => {
          const result = this.controller.stopFakeDrag();
          this.stopFakeDragResult = `${result}`;
          this.syncStateToStorage();
        })
      Text(`swiper.stopFakeDrag=${this.stopFakeDragResult}`)
        .id('swiperStopFakeDragValue')
        .key('swiperStopFakeDragValue')

      Button('callIsFakeDragging')
        .id('callIsFakeDraggingBtn')
        .key('callIsFakeDraggingBtn')
        .onClick(() => {
          const result = this.controller.isFakeDragging();
          this.isFakeDraggingResult = `${result}`;
          this.syncStateToStorage();
        })
      Text(`swiper.isFakeDragging=${this.isFakeDraggingResult}`)
        .id('swiperIsFakeDraggingValue')
        .key('swiperIsFakeDraggingValue')

      Swiper(this.controller)
      .id('swiperControllerCase')
      .key('swiperControllerCase')
      .height('30%')
      .width('100%')
    }.width('100%').height('100%')
  }
}
