'use static'
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { Entry, Text, Column, ColumnOptions, Component, Button, ClickEvent, Row, Color, Alignment, AttributeModifier,
  Scroll, $r, Stack, Image, ImageAttribute, ImageError, ImageRotateOrientation, ColorMetrics, TextClock,
  TextClockAttribute, TextTimer, TextTimerAttribute, Badge, BadgeParamWithNumber, BadgeParamWithString, BadgeStyle,
  BadgePosition, QRCode, DatePicker, DatePickerDialogOptions, DatePickerAttribute, Resource, TextPicker,
  TextPickerAttribute, TextOverflow, PickerTextStyle, TextPickerTextStyle, FontWeight, PickerBackgroundStyle,
  BorderRadiuses, ShadowStyle, BlurStyle, ThemeColorMode, AdaptiveColor, BackgroundBlurStyleOptions,
  BackgroundEffectOptions, DialogAlignment, ButtonType, ButtonStyleMode, ButtonRole, FontStyle, PickerDialogButtonStyle,
  HoverModeAreaType, TextPickerResult, TextPickerDialogOptions,
  TextPickerDialogOptionsExt ,LengthMetrics} from '@ohos.arkui.component'
import { State, Link, Observed } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'
import promptAction from '@ohos.promptAction'
import { LevelOrder, LevelMode } from '@ohos.promptAction'
import { UIContext } from '@ohos.arkui.UIContext'
import { LengthUnit } from 'arkui.Graphics';
@Entry
@Component
struct Index101 {
  private fruit: Resource = $r('app.strarray.range')
  @State select: Int | Int[] = 1;
  @State v: string = 'CCCC';
  build() {
    Column() {
      Stack({ alignContent: Alignment.Center }) {
        Column({ space: 5 } as ColumnOptions) {
          Button('#FFE3F8F9 10,10,10,10')
            .onClick((event: ClickEvent) => {
              this.getUIContext().showTextPickerDialog({
                range: this.fruit,
                selected: this.select,
                defaultPickerItemHeight: 60,
                selectedBackgroundStyle: {
                  color: '#FFE3F8F9',
                  borderRadius: {
                    topLeft: 10,
                    topRight: 10,
                    bottomLeft: 10,
                    bottomRight: 10,
                  }
                } as PickerBackgroundStyle,
              } as TextPickerDialogOptionsExt);
            })
            .id('selectedBackgroundStyle1')
          Button('Color.Pink 30,0,30,0')
            .onClick((event: ClickEvent) => {
              this.getUIContext().showTextPickerDialog({
                range: this.fruit,
                selected: this.select,
                defaultPickerItemHeight: 60,
                selectedBackgroundStyle: {
                  color: Color.Pink,
                  borderRadius: {
                    topLeft: 30,
                    topRight: 0,
                    bottomLeft: 30,
                    bottomRight: 0,
                  }
                } as PickerBackgroundStyle,
              } as TextPickerDialogOptionsExt);
            })
            .id('selectedBackgroundStyle2')
          Button('Color.Grey -30,-10,30,10')
            .onClick((event: ClickEvent) => {
              this.getUIContext().showTextPickerDialog({
                range: this.fruit,
                selected: this.select,
                defaultPickerItemHeight: 60,
                selectedBackgroundStyle: {
                  color: Color.Grey,
                  borderRadius: {
                    topLeft: -30,
                    topRight: -10,
                    bottomLeft: 30,
                    bottomRight: 10,
                  }
                } as PickerBackgroundStyle,
              } as TextPickerDialogOptionsExt);
            })
            .id('selectedBackgroundStyle3')
          Button('Color.Grey undefined')
            .onClick((event: ClickEvent) => {
              this.getUIContext().showTextPickerDialog({
                range: this.fruit,
                selected: this.select,
                defaultPickerItemHeight: 60,
                selectedBackgroundStyle: {
                  color: Color.Grey,
                  borderRadius: undefined
                } as PickerBackgroundStyle,
              } as TextPickerDialogOptionsExt);
            })
            .id('selectedBackgroundStyle4')
          Button('{ } as PickerBackgroundStyle')
            .onClick((event: ClickEvent) => {
              this.getUIContext().showTextPickerDialog({
                range: this.fruit,
                selected: this.select,
                defaultPickerItemHeight: 60,
                selectedBackgroundStyle: { } as PickerBackgroundStyle,
              } as TextPickerDialogOptionsExt);
            })
            .id('selectedBackgroundStyle5')
          Button('undefined')
            .onClick((event: ClickEvent) => {
              this.getUIContext().showTextPickerDialog({
                range: this.fruit,
                selected: this.select,
                defaultPickerItemHeight: 60,
                selectedBackgroundStyle: undefined,
              } as TextPickerDialogOptionsExt);
            })
            .id('selectedBackgroundStyle6')
        }.width('100%')
      }
    }.width('100%').height('100%')
  }
}