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

class TextInputModifier implements AttributeModifier<TextInputAttribute> {
  applyNormalAttribute(TextInputInstance: TextInputAttribute): void {
    TextInputInstance.fontSize(20);
  }
}

@Entry
@Component
struct TextInputModifier1 {
  @State value: string = 'init'
  @State modifier: TextInputModifier = new TextInputModifier();

  aboutToAppear(): void {
    this.value = typeof TextInputInstance
  }

  build() {
    Column({ space: 5 }) {
      TextInput({ text: 'TextInputModifier' })
        .attributeModifier(this.modifier)
        .id('TextInputModifier_get_fontSize')
        .height('20%')

      TextArea({ text: this.value })
        .id('TextInputModifier_get_type')
        .height('10%')
    }.width("90%")
  }
}