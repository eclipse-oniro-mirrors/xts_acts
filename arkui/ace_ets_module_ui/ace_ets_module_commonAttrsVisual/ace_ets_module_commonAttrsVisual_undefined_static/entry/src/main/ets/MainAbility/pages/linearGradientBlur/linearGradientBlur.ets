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
  Component,
  Column,
  Button,
  ClickEvent,
  Image,
  $r,
  LinearGradientBlurOptions,
  GradientDirection
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct LinearGradientBlurPage {
  @State isState: boolean = false;

  build() {
    Column() {
      Image($r('app.media.startIcon'))
        .width(200)
        .height(200)
        .id('linearGradientBlurTest')
        .linearGradientBlur(this.isState ? 60.0 : undefined, this.isState ? {
          fractionStops: [[0, 0], [0, 0.33], [1, 0.66], [1, 1]],
          direction: GradientDirection.Bottom
        } as LinearGradientBlurOptions : {
          fractionStops: [[0, 4], [0, 0.8], [2, 0.66], [1, 5]],
          direction: GradientDirection.Bottom
        } as LinearGradientBlurOptions)
      Button('linearGradientBlur: ' + this.isState)
        .id('linearGradientBlur')
        .onClick((e: ClickEvent) => {
          this.isState = !this.isState
        })
    }
  }
}