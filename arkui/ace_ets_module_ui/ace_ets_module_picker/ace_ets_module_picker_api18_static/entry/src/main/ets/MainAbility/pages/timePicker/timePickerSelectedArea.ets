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
  Row, ClickEvent, Margin, ButtonType, AttributeModifier, DatePickerAttribute, DatePicker, TimePickerResult,
  TimePicker,HorizontalAlign, TextAlign} from '@ohos.arkui.component'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { State } from '@ohos.arkui.stateManagement'
@Entry
@Component
struct TimePickerSelectedAreaExample {
  @State isMilitaryTime: boolean = false
  private selectedTime: Date = new Date('2022-07-22T08:00:00')
  @State textFlag: string = ''
  build() {
    Column() {
      Text(this.textFlag).id('textFlag').height('5%').width('90%').margin({ top: 10, bottom: 10 } as Margin).textAlign(TextAlign.Center)
      TimePicker({
        selected: this.selectedTime
      }).id('timePicker')
        .width('90%')
        .height('80%')
        .useMilitaryTime(this.isMilitaryTime)
        .onChange((value: TimePickerResult) => {
          if (value.hour >= 0) {
            this.selectedTime.setHours(value.hour, value.minute)
            console.info('select current time is: ' + JSON.stringify(value))
          }
        })
        .onEnterSelectedArea((value: TimePickerResult) => {
          this.textFlag = 'enter'
          console.info('item enter selected area, time is: ' + JSON.stringify(value))
        })
    }.alignItems(HorizontalAlign.Center).width('100%').height('90%')
  }
}