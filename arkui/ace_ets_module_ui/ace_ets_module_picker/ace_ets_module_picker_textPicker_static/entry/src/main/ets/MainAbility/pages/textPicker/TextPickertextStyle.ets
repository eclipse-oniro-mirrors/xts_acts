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
import { Entry, Text, Column, Component, Button, ClickEvent, Row, Color, Alignment, AttributeModifier,
  Scroll, $r, Stack, Image, ImageAttribute, ImageError, ImageRotateOrientation, ColorMetrics, TextClock,
  TextClockAttribute, TextTimer, TextTimerAttribute, Badge, BadgeParamWithNumber, BadgeParamWithString, BadgeStyle,
  BadgePosition, QRCode, DatePicker, DatePickerDialogOptions, DatePickerAttribute, Resource, TextPicker,
  TextPickerAttribute, TextOverflow, PickerTextStyle, TextPickerTextStyle, FontWeight, PickerBackgroundStyle,
  BorderRadiuses, ShadowStyle, BlurStyle, ThemeColorMode, AdaptiveColor, BackgroundBlurStyleOptions,
  BackgroundEffectOptions, DialogAlignment, ButtonType, ButtonStyleMode, ButtonRole, FontStyle, PickerDialogButtonStyle,
  HoverModeAreaType, TextPickerResult, TextPickerDialogOptions,
  TextPickerDialogOptionsExt,Flex,FlexWrap } from '@ohos.arkui.component'
import { State, Link, Observed } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'
import promptAction from '@ohos.promptAction'
import { LevelOrder, LevelMode } from '@ohos.promptAction'
import { UIContext } from '@ohos.arkui.UIContext'

@Entry
@Component
struct TextPickerFontToggle {
  @State select: Int = 2
  private fruits: string[] = ['apple1', 'orange2', 'peach3', 'grape4', 'banana5']
  private styles: TextPickerTextStyle[] = [
    { minFontSize: 18, maxFontSize: 28, overflow: TextOverflow.None },
    { minFontSize: '18', maxFontSize: '28', overflow: TextOverflow.Clip },
    { minFontSize:$r('app.float.TextPicker_fontSize') , maxFontSize: $r('app.float.TextPicker_fontSize'), overflow: TextOverflow.Ellipsis },
    { minFontSize: -1, maxFontSize: -1, overflow: TextOverflow.MARQUEE },
    { minFontSize: undefined, maxFontSize: undefined, overflow: undefined }
  ]
  @State idx: Int = 0 

  build() {
    Column() {
      Row(){
        Button('1')
          .onClick(() => {
            this.idx = 1
          })
          .id('btn1')
        Button('2')
          .onClick(() => {
            this.idx = 2
          })
          .id('btn2')
        Button('3')
          .onClick(() => {
            this.idx = 3
          })
          .id('btn3')
        Button('4')
          .onClick(() => {
            this.idx = 4
          })
          .id('btn4')
        Button('5')
          .onClick(() => {
            this.idx = 0
          })
          .id('btn5')
      }

      TextPicker({ range: this.fruits, selected: this.select })
        .selectedTextStyle(this.styles[this.idx])
        .textStyle(this.styles[this.idx])
        .disappearTextStyle(this.styles[this.idx])
        .key('textPicker')
    }
    .width('100%')
    .padding(20)
  }
}