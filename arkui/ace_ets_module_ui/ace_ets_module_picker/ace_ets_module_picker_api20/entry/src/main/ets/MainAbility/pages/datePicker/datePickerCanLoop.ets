/**
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

@Entry
@Component
struct DatePickerCanLoop {
  @State isLoop: boolean | null | undefined = true;
  
  build() {
    Column() {
      DatePicker({
        start: new Date('2024-1-1'),
        end: new Date('2025-12-31'),
        selected: new Date('2024-1-1'),
      })
        .id('datePicker')
        .height('50%')
        .canLoop(this.isLoop)
        .onDateChange((value: Date) => {
          console.info('DatePicker:onDateChange()' + value.toString());
        })

      Flex({ wrap: FlexWrap.Wrap, alignContent: FlexAlign.Center }) {
        Button('true')
          .onClick(() => {
            this.isLoop = true
          })
          .id('trueID')

        Button('false')
          .onClick(() => {
            this.isLoop = false
          })
          .id('falseID')

        Button('null')
          .onClick(() => {
            this.isLoop = null
          })
          .id('nullID')

        Button('undefined')
          .onClick(() => {
            this.isLoop = undefined
          })
          .id('undefinedID')

      }.width('100%').margin({ top: 30 })
    }.width('100%')
  }
}