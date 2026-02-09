import { JSON } from '@kit.ArkTS'

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
struct DatePickerDialogCanLoop {
  showDialog(canloop: boolean | null | undefined) {
    this.getUIContext().showDatePickerDialog({
      start: new Date("2024-1-1"),
      end: new Date("2025-12-31"),
      selected: new Date("2024-1-1"),
      canLoop: canloop,
      lunar:true
    })
  }
  build() {
    Flex({wrap: FlexWrap.Wrap}) {
      Button('true')
        .onClick(() => {
          this.showDialog(true)
        })
        .id('trueID')

      Button('false')
        .onClick(() => {
          this.showDialog(false)
        })
        .id('falseID')

      Button('null')
        .onClick(() => {
          this.showDialog(null)
        })
        .id('nullID')

      Button('undefined')
        .onClick(() => {
          this.showDialog(undefined)
        })
        .id('undefinedID')

    }.width('100%')
  }
}