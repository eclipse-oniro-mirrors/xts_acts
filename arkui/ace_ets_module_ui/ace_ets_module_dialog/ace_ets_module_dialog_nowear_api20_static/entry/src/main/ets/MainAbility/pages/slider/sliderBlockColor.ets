'use static'
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

import {
  Entry,
  Text,
  Column,
  Component,
  Color,
  Slider,
  Builder,
  Row,
  ColumnOptions,
  SliderStyle,
  wrapBuilder,
  UIContext,
  LinearGradient,
  Color
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Entry
@Component
struct SliderExample {
  build() {
    Column({ space: 8 } as ColumnOptions) {
      Text(`#ff0a0a0a #FFFF0000`)
        .fontSize(16)
        .width('100%')
      Row() {
        Slider({
          value: 50,
          min: 0,
          max: 100,
          style: SliderStyle.OutSet
        })
          .id('slider001')
          .blockColor(new LinearGradient([{ color: '#ff0a0a0a', offset: 0 }, { color: '#FFFF0000', offset: 1 }]))
      }
      .width('80%')
      Text(`Color.Pink`)
        .fontSize(16)
        .width('100%')
      Row() {
        Slider({
          value: 50,
          min: 0,
          max: 100,
          style: SliderStyle.OutSet
        })
          .id('slider002')
          .blockColor(Color.Pink)
      }
      .width('80%')
      Text(`undefined`)
        .fontSize(16)
        .width('100%')
      Row() {
        Slider({
          value: 50,
          min: 0,
          max: 100,
          style: SliderStyle.OutSet
        })
          .id('slider003')
          .blockColor(undefined)
      }
      .width('80%')
    }.width('100%')
  }
}