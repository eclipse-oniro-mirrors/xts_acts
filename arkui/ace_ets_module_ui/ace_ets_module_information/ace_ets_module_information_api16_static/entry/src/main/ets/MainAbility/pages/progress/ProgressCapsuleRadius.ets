'use static';
/**
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
import { LengthMetrics } from '@ohos.arkui.node';
import { Builder, DataPanelConfiguration, Column, ForEach, Line, Row, Text, Alignment, Margin, ContentModifier, WrappedBuilder, Color,
  ProgressType, Progress, ProgressOptions,Entry, Component, DataPanel, DataPanelType, Padding, RelativeContainer, Rect, ColumnOptions,
  RowOptions, Button, ClickEvent,Gauge, TextOverflow, FontWeight, CapsuleStyleOptions,
} from '@ohos.arkui.component'
import {
  State,
  AppStorage
} from '@ohos.arkui.stateManagement'

@Entry
@Component
struct ProgressCapsuleRadius {
  build() {
    Column({ space: 15 } as ColumnOptions) {
      Text('Capsule Progress').fontSize(9).width('90%')
      Row({ space: 15 } as RowOptions) {
        Progress({ value: 50, total: 100, type: ProgressType.Capsule } as ProgressOptions)
          .style({
            // content: 'ProgressCapsuleRadius',
            borderWidth: 2,
            borderRadius: LengthMetrics.px(10)
          } as CapsuleStyleOptions)
          .width(100)
          .height(40)
          .key('ProgressCapsuleRadius')

        Progress({ value: 50, total: 100, type: ProgressType.Capsule } as ProgressOptions)
          .style({
            // content: 'ProgressCapsuleRadius',
            borderWidth: 2,
            borderRadius: LengthMetrics.px(-0.1)
          } as CapsuleStyleOptions)
          .width(100)
          .height('40px')
          .key('ProgressCapsuleRadius_negative')

        Progress({ value: 50, total: 100, type: ProgressType.Capsule } as ProgressOptions)
          .style({
            // content: 'ProgressCapsuleRadius',
            borderWidth: 2,
            borderRadius: LengthMetrics.px(40)
          } as CapsuleStyleOptions)
          .width(100)
          .onClick((e: ClickEvent)=>{
          })
          .height('40px')
          .key('ProgressCapsuleRadius_big')
      }

    }
    .width('100%')
    .margin({ top: 30 } as Margin)
  }
}
