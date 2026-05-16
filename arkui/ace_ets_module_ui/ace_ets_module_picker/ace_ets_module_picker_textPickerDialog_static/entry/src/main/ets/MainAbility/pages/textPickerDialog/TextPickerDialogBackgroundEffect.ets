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
import { Entry, Text, Column, ColumnOptions, Component, Button, ClickEvent, Row, Color, Alignment,AttributeModifier,
  Scroll, $r, Stack, Image, ImageAttribute, ImageError, ImageRotateOrientation, ColorMetrics, TextClock,
  TextClockAttribute, TextTimer, TextTimerAttribute, Badge, BadgeParamWithNumber, BadgeParamWithString, BadgeStyle,
  BadgePosition, QRCode, DatePicker, DatePickerDialogOptions, DatePickerAttribute, Resource, TextPicker,
  TextPickerAttribute, TextOverflow, PickerTextStyle, TextPickerTextStyle, FontWeight, PickerBackgroundStyle,
  BlurStyleActivePolicy,
  BorderRadiuses, ShadowStyle, BlurStyle, ThemeColorMode, AdaptiveColor, BackgroundBlurStyleOptions,
  BackgroundEffectOptions, DialogAlignment, ButtonType, ButtonStyleMode, ButtonRole, FontStyle,
  PickerDialogButtonStyle,
  HoverModeAreaType, TextPickerResult, TextPickerDialogOptions,
  TextPickerDialogOptionsExt } from '@ohos.arkui.component'
import { State, Link, Observed } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'
import promptAction from '@ohos.promptAction'
import { LevelOrder, LevelMode } from '@ohos.promptAction'
import { UIContext } from '@ohos.arkui.UIContext'

@Entry
@Component
struct TextPickerDialogBackgroundEffect {
  private fruit: Resource = $r('app.strarray.range')
  @State select: Int | Int[] = 1;
  @State valueIndex: int= 0;
  build() {
    Column() {
      Stack({ alignContent: Alignment.Center }) {
        Column({ space: 5 } as ColumnOptions) {
          Button('DatePickerDialog_Effect001')
            .id('DatePickerDialog_Effect001')
            .onClick((event: ClickEvent) => {
              this.getUIContext().showTextPickerDialog({
                range: this.fruit,
                selected: this.select,
                backgroundEffect: {
                  radius: 40,
                  saturation: 25,
                  brightness: 2,
                  color: Color.Pink,
                  adaptiveColor: AdaptiveColor.DEFAULT,
                  policy: BlurStyleActivePolicy.ALWAYS_ACTIVE,
                  inactiveColor: Color.Blue,
                  blurOptions: { grayscale: [20, 20] }
                } as BackgroundEffectOptions,
              } as TextPickerDialogOptionsExt);
            })
          Button('DatePickerDialog_Effect002')
            .id('DatePickerDialog_Effect002')
            .onClick((event: ClickEvent) => {
              this.getUIContext().showTextPickerDialog({
                range: this.fruit,
                selected: this.select,
                backgroundEffect: {
                  radius: undefined,
                  saturation: undefined,
                  brightness: undefined,
                  color: undefined,
                  adaptiveColor: undefined,
                  policy: undefined,
                  inactiveColor: undefined,
                  blurOptions: undefined
                } as BackgroundEffectOptions,
              } as TextPickerDialogOptionsExt);
            })
        }.width('100%').height('100%')
      }
    }
  }
}