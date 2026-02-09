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

@Observed
class DatePickerModifier1 implements AttributeModifier<DatePickerAttribute> {
  applyNormalAttribute(instance: DatePickerAttribute): void {
    instance.canLoop(true)
  }
}
@Observed
class DatePickerModifier2 implements AttributeModifier<DatePickerAttribute> {
  applyNormalAttribute(instance: DatePickerAttribute): void {
    instance.canLoop(false)
  }
}
@Observed
class DatePickerModifier3 implements AttributeModifier<DatePickerAttribute> {
  applyNormalAttribute(instance: DatePickerAttribute): void {
    instance.canLoop(undefined)
  }
}
@Entry
@Component
struct DataPickerCanLoopModifier {
  @State isLoop: boolean | undefined = true;
  @State datePickerModifier1 : DatePickerModifier1 = new DatePickerModifier1()
  @State datePickerModifier2 : DatePickerModifier2 = new DatePickerModifier2()
  @State datePickerModifier3 : DatePickerModifier3 = new DatePickerModifier3()
  build() {
    Column(undefined) {
      Row(){
        DatePicker({
          start: new Date('2024-1-1'),
          end: new Date('2025-12-31'),
          selected: new Date('2024-1-1'),
        })
          .attributeModifier(this.datePickerModifier1)
          .id('trueM')
          .width('15%')
        DatePicker({
          start: new Date('2024-1-1'),
          end: new Date('2025-12-31'),
          selected: new Date('2024-1-1'),
        })
          .attributeModifier(this.datePickerModifier2)
          .id('falseM')
          .width('15%')
        DatePicker({
          start: new Date('2024-1-1'),
          end: new Date('2025-12-31'),
          selected: new Date('2024-1-1'),
        })
          .attributeModifier(this.datePickerModifier3)
          .id('undefinedM')
          .width('15%')
      }.width('80%')
    }
  }
}