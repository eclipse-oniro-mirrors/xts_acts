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
  TextOverflow, TextPickerTextStyle, FontWeight, PickerBackgroundStyle, BorderRadiuses, ShadowStyle,
  BlurStyle, AdaptiveColor, BackgroundBlurStyleOptions, BackgroundEffectOptions, DialogAlignment,
  ButtonType, ButtonStyleMode, ButtonRole, FontStyle, PickerDialogButtonStyle, HoverModeAreaType, TextPickerResult,
  TextPickerDialogOptions, TextPickerDialogOptionsExt, ColumnOptions,Flex,FlexWrap } from '@ohos.arkui.component'
import { State, Link, Observed } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'
import promptAction from '@ohos.promptAction'
import { LevelOrder, LevelMode } from '@ohos.promptAction'
import { UIContext } from '@ohos.arkui.UIContext'

@Entry
@Component
struct DatePickerDialogCanLoop {
  build() {
    Flex({wrap: FlexWrap.Wrap}) {
        Button('canLoop false')
          .onClick((event: ClickEvent) => {
            this.getUIContext().showDatePickerDialog({
              start: new Date('2000-1-1'),
              end: new Date('2100-12-31'),
              selected: new Date('2010-1-1'),
              canLoop: false
            } as DatePickerDialogOptions);
          })
          .id('canLoop_false')

        Button('canLoop true')
          .onClick((event: ClickEvent) => {
            this.getUIContext().showDatePickerDialog({
              start: new Date('2000-1-1'),
              end: new Date('2100-12-31'),
              selected: new Date('2010-1-1'),
              canLoop: true
            } as DatePickerDialogOptions);
          })
          .id('canLoop_true')

        Button('canLoop undefined')
          .onClick((event: ClickEvent) => {
            this.getUIContext().showDatePickerDialog({
              start: new Date('2000-1-1'),
              end: new Date('2100-12-31'),
              selected: new Date('2010-1-1'),
              canLoop: undefined
            } as DatePickerDialogOptions);
          })
          .id('canLoop_undefined')
      }.width('100%').height('100%')
    }
}