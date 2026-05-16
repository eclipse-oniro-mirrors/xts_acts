'use static'
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import {
  Entry,
  Column,
  Component,
  Button,
  ClickEvent,
  RotateOptions
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct RotatePage {
  @State rotateAngle: number = 90;
  @State isState: boolean = false;

  build() {
    Column() {
      Button('Change rotate angle')
        .height('20%')
        .width('90%')
        .margin('5%')
        .onClick(() => {
          this.rotateAngle = (this.rotateAngle === 90 ? 0 : 90);
        })
        .id('rotateTest')
        .rotate(this.isState ? undefined : { angle: this.rotateAngle, y: 1 } as RotateOptions)
      Button('rotate: ' + this.isState)
        .id('rotate')
        .onClick((e: ClickEvent) => {
          this.isState = !this.isState
        })
    }.width(300)
    .height(300)
  }
}