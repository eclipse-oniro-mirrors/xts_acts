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

class TextPickerModifier1 implements AttributeModifier<TextPickerAttribute> {
  disappearTextStyle: PickerTextStyle = { color: Color.Black, font: { size: 8, weight: FontWeight.Lighter } }
  textStyle: PickerTextStyle = { color: Color.Red, font: { size: '10px', weight: FontWeight.Normal } }
  selectedTextStyle: PickerTextStyle = { color: Color.Blue, font: { size: '20px', weight: FontWeight.Bold } }

  applyNormalAttribute(instance: TextPickerAttribute): void {
    instance.disappearTextStyle(this.disappearTextStyle)
      .textStyle(this.textStyle)
      .selectedTextStyle(this.selectedTextStyle)
      .canLoop(false)
      .selectedIndex(2)
      .defaultPickerItemHeight('60px')
  }
}

@Entry
@Component
struct TextPickerExample {
  @State modifier1: TextPickerModifier1 = new TextPickerModifier1()

  build() {
    Column() {
      TextPicker({ range: ['peach1', 'peach2', 'peach3', 'peach4'] })
        .attributeModifier(this.modifier1)
        .key('textPickerDefault')

        TextPicker({ range: ['peach1', 'peach2', 'peach3', 'peach4'] })
        .selectedIndex(2)
        .key('textPickerDefault1')
    }
  }
}