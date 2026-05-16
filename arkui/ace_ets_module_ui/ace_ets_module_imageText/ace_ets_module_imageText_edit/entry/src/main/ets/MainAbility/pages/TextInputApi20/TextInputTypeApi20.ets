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

class TextInputModifierApi20 implements AttributeModifier<TextInputAttribute> {

  applyNormalAttribute(instance: TextInputAttribute): void {
    instance.type(InputType.ONE_TIME_CODE)
  }
}

@Entry
@Component
struct TextInputTypeApi20 {
  @State textInputModifier: TextInputModifierApi20 = new TextInputModifierApi20()

  build() {
    Column({ space: 1 }) {
      Text('TextInput: InputType新增枚举类型').height('5%')
      TextInput({ placeholder: 'InputType.ONE_TIME_CODE' })
        .id('TextInputTypeApi20_ONE_TIME_CODE')
        .type(InputType.ONE_TIME_CODE)
        .height('10%')

      TextInput({ placeholder: 'TextInputType: default' })
        .id('TextInputTypeApi20_default')
        .height('10%')

      TextInput({ placeholder: 'TextInputType: undefined' })
        .id('TextInputTypeApi20_undefined')
        .type(undefined)
        .height('10%')

      TextInput({ placeholder: 'TextInputType: Modifier' })
        .id('TextInputTypeApi20_Modifier')
        .attributeModifier(this.textInputModifier)
        .height('10%')
        .margin(1)
        .borderWidth(1)
    }.width('100%')
  }
}