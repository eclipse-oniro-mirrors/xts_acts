'use static';
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
import { Entry, Column, Component, ShadowOptions, CalendarPickerDialog, Flex, FlexWrap, Button, Color, BlurStyle, ShadowStyle, ClickEvent, Margin } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct CalendarPickerDialogExample {
  build() {
    Column() {
      Button('Show CalendarPicker Dialog')
        .margin(20)
        .onClick((e: ClickEvent) => {
          CalendarPickerDialog.show({ start: new Date('2024-03-05'), end: new Date('2024-04-05') })
        }).id('CalendarPickerDialog01')
      Button('Show CalendarPicker Dialog')
        .margin(20)
        .onClick((e: ClickEvent) => {
          CalendarPickerDialog.show({ start: new Date('2024-05-05'), end: new Date('2024-04-05') })
        }).id('CalendarPickerDialog02')
      Button('Show CalendarPicker Dialog')
        .margin(20)
        .onClick((e: ClickEvent) => {
        }).id('CalendarPickerDialog03')
      Button('Show CalendarPicker Dialog')
        .margin(20)
        .onClick((e: ClickEvent) => {
          CalendarPickerDialog.show({ start: undefined, end: undefined })
        }).id('CalendarPickerDialog04')
      Button('Show CalendarPicker Dialog')
        .margin(20)
        .onClick((e: ClickEvent) => {
          CalendarPickerDialog.show({ start: new Date('2024-03-05'), end: new Date('2024-03-05') })
        }).id('CalendarPickerDialog05')
    }.width('100%').margin({ top: 50 } as Margin)
  }
}
