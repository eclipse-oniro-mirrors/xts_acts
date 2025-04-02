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

import { TextPickerModifier } from "@ohos.arkui.modifier";

class CustomModifier extends TextPickerModifier {
  applyNormalAttribute(instance: TextPickerAttribute): void {
    super.applyNormalAttribute?.(instance);
  }

  onChange1() {
    this.canLoop(true)
  }
}

@Entry
@Component
struct TextPickerExample {
  @State customModifier: TextPickerModifier = new CustomModifier()
    .canLoop(false)
    .disappearTextStyle({ color: "#FF000000", font: { size: 8, weight: FontWeight.Lighter } })
    .selectedTextStyle({ color: "#FF0000FF", font: { size: '20px', weight: FontWeight.Bold } })
    .textStyle({ color: '#FFFF0000', font: { size: '10px', weight: FontWeight.Normal } })
    .selectedIndex(2)
    .defaultPickerItemHeight('60px')

  build() {
    Column() {
      Button("change value").onClick(() => {
        (this.customModifier as CustomModifier).onChange1();
      }).key("changeButton")
      
      TextPicker({ range: ['peach1', 'peach2', 'peach3', 'peach4'] })
        .selectedIndex(3)
        .key('textPickerDefault1')

      TextPicker({ range: ['peach1', 'peach2', 'peach3', 'peach4'] })
        .attributeModifier(this.customModifier as CustomModifier)
        .key('textPicker')
    }
  }
}