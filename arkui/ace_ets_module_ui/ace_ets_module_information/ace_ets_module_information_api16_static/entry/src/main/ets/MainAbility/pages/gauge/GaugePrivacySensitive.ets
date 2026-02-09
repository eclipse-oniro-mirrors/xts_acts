'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { Builder, DataPanelConfiguration, Column, ForEach, Line, Row, Text, Alignment, Margin, ContentModifier, WrappedBuilder, Color, Scroll, TextAlign,
  Entry, Component, DataPanel, DataPanelType, Padding, RelativeContainer, Rect, ColumnOptions, Button, ClickEvent, Gauge, TextOverflow, FontWeight,
} from '@ohos.arkui.component'
import {
  State,
  AppStorage
} from '@ohos.arkui.stateManagement'

@Entry
@Component
struct GaugePrivacySensitive {
  @State isSensitive: boolean | undefined = true
  build() {
    Scroll() {
      Column({ space: 15 } as ColumnOptions) {
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
          })
        }
        Row() {
          Gauge({ value: 50, min: 1, max: 100 }) {
            Column() {
              Text('60')
                .maxFontSize('180sp')
                .minFontSize('160.0vp')
                .fontWeight(FontWeight.Medium)
                .fontColor('#ff182431')
                .width('40%')
                .height('30%')
                .textAlign(TextAlign.Center)
                .margin({ top: '22.2%' } as Margin)
                .textOverflow({ overflow: TextOverflow.Ellipsis })
                .maxLines(1)
            }.width('100%').height('100%')
          }
          .startAngle(225)
          .endAngle(135)
          .colors(Color.Red)
          .width('80%')
          .height('80%')
          .strokeWidth(18)
          .trackShadow({ radius: 7, offsetX: 7, offsetY: 7 })
          .padding(18)
          .privacySensitive(this.isSensitive)
          .id('gauge')
        }
      }
    }
  }
}