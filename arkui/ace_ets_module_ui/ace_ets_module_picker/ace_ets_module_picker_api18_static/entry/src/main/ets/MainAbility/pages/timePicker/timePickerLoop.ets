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
import { Entry, Column, Component, Flex, FlexDirection, ItemAlign, FlexAlign, Text, Button, FontWeight,Color,
  Row, ClickEvent, Margin, ButtonType, AttributeModifier, DatePickerAttribute, DatePicker,TimePicker,
  TimePickerResult}
  from '@ohos.arkui.component'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { State } from '@ohos.arkui.stateManagement'
@Entry
@Component
struct TimePickerLoopExample {
  @State isLoop: boolean | undefined = true
  private selectedTime: Date = new Date('2022-07-22T12:00:00')

  build() {
    Column() {
      TimePicker({
        selected: this.selectedTime
      })
        .id('timePicker')
        .loop(this.isLoop)
        .onChange((value: TimePickerResult) => {
          if (value.hour >= 0) {
            this.selectedTime.setHours(value.hour, value.minute)
            console.info('select current date is: ' + JSON.stringify(value))
          }
        })

      Row() {
        Button('TRUE').id('trueFlag').width('20%').fontSize(8).onClick((e:ClickEvent) => {
          this.isLoop = true
        })
        Button('FALSE').id('falseFlag').width('20%').fontSize(8).onClick((e:ClickEvent) => {
          this.isLoop = false
        })
        Button('UNDEFINED').id('undefinedFlag').width('20%').fontSize(8).onClick((e:ClickEvent) => {
          this.isLoop = undefined
        })
      }
    }.width('100%')
  }
}