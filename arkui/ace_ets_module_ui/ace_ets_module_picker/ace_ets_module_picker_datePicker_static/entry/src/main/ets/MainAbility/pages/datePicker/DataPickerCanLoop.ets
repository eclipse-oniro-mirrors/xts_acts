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
import { Entry, Text, Column, Row, Component, Button, ClickEvent, DatePicker,
  DatePickerDialogOptions, DatePickerAttribute, AttributeModifier,
  DatePickerAttribute} from '@ohos.arkui.component'
import { State, Link, Observed } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'
import promptAction from '@ohos.promptAction'
import { LevelOrder, LevelMode } from '@ohos.promptAction'
import { UIContext } from '@ohos.arkui.UIContext'

@Entry
@Component
struct DataPickerCanLoopModifier {
  @State isLoop: boolean | undefined = true;
  build() {
    Column(undefined) {
      DatePicker({
        start: new Date('2024-1-1'),
        end: new Date('2025-12-31'),
        selected: new Date('2024-1-1'),
      })
        .id('datePicker')
        .height('50%')
        .width('80%')
        .canLoop(this.isLoop)
        .onDateChange((value: Date) => {
          console.info('DatePicker:onDateChange()' + value.toString());
        })
      Row(){
        Button('true')
          .onClick(() => {
            this.isLoop = true
          })
          .id('trueID')
          .width('15%')
        Button('false')
          .onClick(() => {
            this.isLoop = false
          })
          .id('falseID')
          .width('15%')
        Button('undefined')
          .onClick(() => {
            this.isLoop = undefined
          })
          .id('undefinedID')
          .width('15%')
      }.width('80%')
    }
  }
}