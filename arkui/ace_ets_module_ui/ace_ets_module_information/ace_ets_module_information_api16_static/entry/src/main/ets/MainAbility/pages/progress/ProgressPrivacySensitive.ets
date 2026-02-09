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
import { Builder, DataPanelConfiguration, Column, ForEach, Line, Row, Text, Alignment, Margin, ContentModifier, WrappedBuilder, Color,
  ProgressType, Progress, ProgressConfiguration, FontStyle,Entry, Component, DataPanel, DataPanelType, Padding, RelativeContainer, Rect,
  ColumnOptions, RowOptions, Button, ClickEvent, Gauge, TextOverflow, FontWeight, FlexAlign, Path, ScanEffectOptions, CapsuleStyleOptions,
  LinearStyleOptions, RingStyleOptions, ProgressStyleOptions,
} from '@ohos.arkui.component'
import {
  State,
  AppStorage
} from '@ohos.arkui.stateManagement'

@Entry
@Component
struct ProgressPrivacySensitive {
  @State isSensitive: boolean | undefined = true
  build() {
    Row() {
      Column({ space: 15 } as ColumnOptions) {
        Progress({ value: 33, total: 100, type: ProgressType.Capsule }).width(300).height(50)
          .color(Color.Blue)
          .style({
            borderWidth: 5,
            font: { size: 13, style: FontStyle.Normal },
            enableScanEffect: false,
            showDefaultPercentage: true
          } as CapsuleStyleOptions)
          .privacySensitive(this.isSensitive)
        Progress({ value: 33, total: 100, type: ProgressType.Capsule }).width(300).height(50)
          .color(Color.Blue)
          .style({
            borderWidth: 5,
            font: { size: 13, style: FontStyle.Normal },
            enableScanEffect: false,
          } as CapsuleStyleOptions)
          .privacySensitive(this.isSensitive)
          .id('progress')

        Row() {
          Button('TRUE').id('trueFlag').width('20%').fontSize(8).onClick((e: ClickEvent) => {
            this.isSensitive = true
          })
          Button('FALSE').id('falseFlag').width('20%').fontSize(8).onClick((e: ClickEvent) => {
            this.isSensitive = false
          })
          Button('UNDEFINED').id('undefinedFlag').width('20%').fontSize(8).onClick((e: ClickEvent) => {
            this.isSensitive = undefined
          })
          Button('NULL').id('nullFlag').width('20%').fontSize(8).onClick((e: ClickEvent) => {
            this.isSensitive = undefined
          })
        }
      }
    }
  }
}