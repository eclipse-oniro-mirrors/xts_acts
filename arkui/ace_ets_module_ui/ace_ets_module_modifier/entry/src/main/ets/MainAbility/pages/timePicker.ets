/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { TimePickerModifier } from "@ohos.arkui.modifier";

class CustomModifier extends TimePickerModifier {
  applyNormalAttribute(instance: TimePickerAttribute): void {
    super.applyNormalAttribute?.(instance);
  }

  onChange1() {
    this.useMilitaryTime(false)
  }
}

  @Entry
  @Component
  struct TimePickerExample {
    private selectedTime: Date = new Date('2022-07-22T08:00:00')
    @State customModifier: TimePickerModifier = new CustomModifier()
      .textStyle({ color: Color.Red, font: { size: '10px', weight: FontWeight.Normal } })
      .selectedTextStyle({ color: Color.Blue, font: { size: '20px', weight: FontWeight.Bold } })
      .disappearTextStyle({ color: Color.Black, font: { size: 8, weight: FontWeight.Lighter } })
      .useMilitaryTime(true)

    build() {
      Column() {
        Button("change value").onClick(() => {
          (this.customModifier as CustomModifier).onChange1();
        }).key("changeButton")

        Column() {
          TimePicker({ selected: this.selectedTime })
            .key('timePickerDefault')
            .attributeModifier(this.customModifier as CustomModifier)
        }
      }
      .width('100%')
    }
  }