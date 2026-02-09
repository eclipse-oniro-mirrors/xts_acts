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
import {FrameCallback } from '@ohos.arkui.UIContext';

import { BusinessError } from '@ohos.base';
import { Entry, Row, Column, Component, Text, Button, ClickEvent } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

class MyFrameCallback extends FrameCallback {
  private tag: string;
  public ret: string = '0';

  constructor(tag: string) {
    super()
    this.tag = tag;
  }

  onFrame(frameTimeNanos: number) {
    console.info('MyFrameCallback ' + this.tag + ' ' + frameTimeNanos.toString());
    this.ret = this.tag + '';
  }
}

@Entry
@Component
struct PostFrameCallbackIndex {
  private myFrameCallback1: MyFrameCallback = new MyFrameCallback('normTask');
  private myFrameCallback2: MyFrameCallback = new MyFrameCallback('delayTask');
  private myFrameCallback3: MyFrameCallback = new MyFrameCallback('delayTask');
  @State result1: string = '5'
  @State result2: string = '1'
  @State result3: string = '9'

  build() {
    Row() {
      Column() {
        Text(this.result1).height('5%').id('result1_id')
        Text(this.result2).height('5%').id('result2_id')
        Text(this.result3).height('5%').id('result3_id')
        Button('点击触发postFrameCallback')
          .height('5%')
          .id('postFrameCallback_id')
          .onClick((e:ClickEvent) => {
            this.getUIContext().postFrameCallback(this.myFrameCallback1);
          })
        Button('点击触发postDelayedFrameCallback')
          .height('5%')
          .id('postDelayedFrameCallback_id')
          .onClick((e:ClickEvent) => {
            this.getUIContext().postDelayedFrameCallback(this.myFrameCallback2, 1);
          })
        Button('点击触发postDelayedFrameCallback null')
          .height('5%')
          .id('postDelayedFrameCallback_null_id')
          .onClick((e:ClickEvent) => {
            this.getUIContext().postDelayedFrameCallback(this.myFrameCallback3, 0);
          })

        Button('postFrameCallback结果')
          .height('5%')
          .id('postFrameCallback_value_id')
          .onClick((e:ClickEvent) => {
            this.result1 = this.myFrameCallback1.ret;  // onFrame的方法未执行
          })
        Button('postDelayedFrameCallback结果')
          .height('5%')
          .id('postDelayedFrameCallback_value_id')
          .onClick((e:ClickEvent) => {
            this.result2 = this.myFrameCallback2.ret;  // onFrame的方法未执行
          })
        Button('postDelayedFrameCallback null结果')
          .height('5%')
          .id('postDelayedFrameCallback_null_value_id')
          .onClick((e:ClickEvent) => {
            this.result3 = this.myFrameCallback2.ret;  // onFrame的方法未执行
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}