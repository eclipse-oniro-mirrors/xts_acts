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
struct TimePickerDisappearTextStyleUndefinedAndNullTest {
  private selectedTime: Date = new Date('2022-07-22T08:00:00');

  build() {
    Column({ space: 10 }) {
      // 不设置属性-default value
      TimePicker({
        selected: this.selectedTime
      })
        .id('disappearTextStyleDefault')

      TimePicker({
        selected: this.selectedTime
      })
        .id('disappearTextStyleUndefined')
        .disappearTextStyle(undefined)

      TimePicker({
        selected: this.selectedTime
      })
        .id('disappearTextStyleNull')
        .disappearTextStyle(null)
    }.width('100%')
  }
}