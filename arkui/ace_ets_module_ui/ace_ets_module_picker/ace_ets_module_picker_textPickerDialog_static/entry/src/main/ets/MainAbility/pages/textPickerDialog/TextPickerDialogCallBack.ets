'use static'
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { Entry, Text, Column, ColumnOptions, Component, Button, ClickEvent, Row, Color, Alignment, AttributeModifier,
  Scroll, $r, Stack, Image, ImageAttribute, ImageError, ImageRotateOrientation, ColorMetrics, TextClock,
  TextClockAttribute, TextTimer, TextTimerAttribute, Badge, BadgeParamWithNumber, BadgeParamWithString, BadgeStyle,
  BadgePosition, QRCode, DatePicker, DatePickerDialogOptions, DatePickerAttribute, Resource, TextPicker,
  TextPickerAttribute, TextOverflow, PickerTextStyle, TextPickerTextStyle, FontWeight, PickerBackgroundStyle,
  BorderRadiuses, ShadowStyle, BlurStyle, ThemeColorMode, AdaptiveColor, BackgroundBlurStyleOptions,
  BackgroundEffectOptions, DialogAlignment, ButtonType, ButtonStyleMode, ButtonRole, FontStyle, PickerDialogButtonStyle,
  HoverModeAreaType, TextPickerResult, TextPickerDialogOptions,
  TextPickerDialogOptionsExt } from '@ohos.arkui.component'
import { State, Link, Observed } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'
import promptAction from '@ohos.promptAction'
import { LevelOrder, LevelMode } from '@ohos.promptAction'
import { UIContext } from '@ohos.arkui.UIContext'

@Entry
@Component
struct TextPickerDialogAppearTextPage {
  private select: Int | Int[] = 0
  private fruits: string[] = ['apple1', 'orange2', 'peach3', 'grape4', 'banana5']
  @State v: string = '';
  @State appearText: string = ''

  build() {
    Row() {
      Column() {
        Button('close').id('closedialog')
        Text(this.appearText)
          .fontSize(20)
          .margin(10)
          .id('AppearText')
        Button('TextPickerDialog:' + this.v)
          .id('textPickerDialogAppearText')
          .margin(20)
          .onClick(() => {
            this.getUIContext().showTextPickerDialog({
              alignment: DialogAlignment.Bottom,
              range: this.fruits,
              selected: this.select,
              onAccept: (value: TextPickerResult) => {
                this.select = value.index
                console.log(this.select + '')
                this.v = value.value as string
                console.info('TextPickerDialog:onCancel()' + JSON.stringify(value))
              },
              onCancel: () => {
                console.info('TextPickerDialog:onCancel()')
              },
              onChange: (value: TextPickerResult) => {
                console.info('TextPickerDialog:onChange()' + JSON.stringify(value))
              },
              onDidAppear: () => {
                this.appearText = this.appearText + 'onDidAppear_'
              },
              onDidDisappear: () => {
                this.appearText = this.appearText + 'onDidDisappear'
              },
              onWillAppear: () => {
                this.appearText = this.appearText + 'onWillAppear_'
              },
              onWillDisappear: () => {
                this.appearText = this.appearText + 'onWillDisappear_'
              }
            }as TextPickerDialogOptionsExt)
          })
      }.width('100%')
    }.height('100%')
  }
}