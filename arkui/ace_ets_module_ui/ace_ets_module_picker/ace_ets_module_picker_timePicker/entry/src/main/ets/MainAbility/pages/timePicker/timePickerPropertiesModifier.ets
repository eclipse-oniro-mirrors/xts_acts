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

class timePickerPropertiesModifier implements AttributeModifier<TimePickerAttribute> {
    applyNormalAttribute(instance: TimePickerAttribute): void {
      instance
        .textStyle({ color: Color.Red, font: { size: '10px', weight: FontWeight.Normal } })
        .selectedTextStyle({ color: Color.Blue, font: { size: '20px', weight: FontWeight.Bold } })
        .disappearTextStyle({ color: Color.Black, font: { size: 8, weight: FontWeight.Lighter } })
    }
  }
  
  @Entry
  @Component
  struct TimePickerPropertiesModifierPage {
    @State timePickerModifier: timePickerPropertiesModifier = new timePickerPropertiesModifier()
    private selectedTime: Date = new Date('2022-07-22T08:00:00')
    build() {
      Column() {
        TimePicker({ selected: this.selectedTime })
          .key('timePickerDefault')
          .attributeModifier(this.timePickerModifier)
      }
    }
  }