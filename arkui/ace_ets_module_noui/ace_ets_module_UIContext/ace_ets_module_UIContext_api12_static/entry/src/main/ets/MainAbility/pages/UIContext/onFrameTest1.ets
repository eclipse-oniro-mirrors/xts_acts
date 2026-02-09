'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import {FrameCallback, UIContext } from '@ohos.arkui.UIContext';

import {
  Entry, Component,
  Column, ColumnOptions, Row, RowOptions, Color,
  Text, Button, FontWeight, ClickEvent, Margin, 
} from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext } from '@ohos.arkui.UIContext';

class MyFrameCallback extends FrameCallback {
  private tag: string;

  constructor(tag: string) {
    super()
    this.tag = tag;
  }

  onFrame(frameTimeNanos: number) {
    console.info('MyFrameCallback ' + this.tag + ' ' + frameTimeNanos.toString());
    AppStorage.setOrCreate('onFrameTest1Mes', 'onFrame')
  }
}

@Entry
@Component
struct onFrameTest1 {
  build() {
    Row() {
      Column() {
        Button('点击触发postFrameCallback')
          .id('onFrameTest1_btn1')
          .onClick((e:ClickEvent) => {
            this.getUIContext().postFrameCallback(new MyFrameCallback("normTask"));
          })
        Button('点击触发postDelayedFrameCallback')
          .onClick((e:ClickEvent) => {
            this.getUIContext().postDelayedFrameCallback(new MyFrameCallback("delayTask"), 5);
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}