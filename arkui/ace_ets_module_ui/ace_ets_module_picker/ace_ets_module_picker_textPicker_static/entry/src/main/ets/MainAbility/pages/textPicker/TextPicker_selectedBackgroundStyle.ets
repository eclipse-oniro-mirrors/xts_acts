'use static'
/*
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
import { Entry, Text, Column, Component, Button, ClickEvent, Row, Color, Alignment, AttributeModifier, Scroll, $r,
  Stack, Image, ImageAttribute, ImageError, ImageRotateOrientation, ColorMetrics, TextClock, TextClockAttribute,
  TextTimer, TextTimerAttribute, Badge, BadgeParamWithNumber, BadgeParamWithString, BadgeStyle, BadgePosition,
  QRCode, DatePicker, DatePickerDialogOptions, DatePickerAttribute, Resource, TextPicker, TextPickerAttribute,
  TextOverflow, PickerTextStyle, TextPickerTextStyle, FontWeight, PickerBackgroundStyle, BorderRadiuses, ShadowStyle,
  BlurStyle, ThemeColorMode, AdaptiveColor, BackgroundBlurStyleOptions, BackgroundEffectOptions, DialogAlignment,
  ButtonType, ButtonStyleMode, ButtonRole, FontStyle, PickerDialogButtonStyle, HoverModeAreaType, TextPickerResult,
  TextPickerDialogOptions, TextPickerDialogOptionsExt,LengthMetrics } from '@ohos.arkui.component'
import { State, Link, Observed } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'
import promptAction from '@ohos.promptAction'
import { LevelOrder, LevelMode } from '@ohos.promptAction'
import { UIContext } from '@ohos.arkui.UIContext'
import { LengthUnit } from 'arkui.Graphics';

@Entry
@Component
struct Index8 {
  private fruit: Resource = $r('app.strarray.range')

  build() {
    Scroll() {
      Column() {
        TextPicker({ range: this.fruit, selected: 2 })
          .id('textPicker1')
          .selectedBackgroundStyle({
            color: Color.White,
            borderRadius: {
              topLeft:15,
              topRight:15,
              bottomLeft:15,
              bottomRight:15,
            }
          } as PickerBackgroundStyle)

        TextPicker({ range: this.fruit, selected: 2 })
          .id('textPicker2')
          .selectedBackgroundStyle({
            color: '#FFFFFFFF',
            borderRadius: {
              topLeft:15,
              topRight:15,
              bottomLeft:15,
              bottomRight:15,
            }} as PickerBackgroundStyle)

        TextPicker({ range: this.fruit, selected: 2 })
          .id('textPicker3')
          .selectedBackgroundStyle({
            color: 0xffffff,
            borderRadius: {
              topLeft: '15',
              bottomLeft: '15',
              topRight: '15',
              bottomRight: '15',
            }} as PickerBackgroundStyle)

        TextPicker({ range: this.fruit, selected: 2 })
          .id('textPicker4')
          .selectedBackgroundStyle({
            color: $r('app.color.start_window_background'),
            borderRadius: {
              topLeft: $r('app.string.Radius'),
              bottomLeft: $r('app.string.Radius'),
              topRight: $r('app.string.Radius'),
              bottomRight: $r('app.string.Radius'),
            }} as PickerBackgroundStyle)
      }
    }.width('100%').height('100%')
  }
}