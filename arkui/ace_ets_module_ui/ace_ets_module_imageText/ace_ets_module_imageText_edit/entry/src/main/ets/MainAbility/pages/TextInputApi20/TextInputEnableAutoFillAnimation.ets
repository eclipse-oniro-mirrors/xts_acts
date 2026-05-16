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

 class TextInputModifier11 implements AttributeModifier<TextInputAttribute> {

  applyNormalAttribute(instance: TextInputAttribute): void {
    instance.enableAutoFillAnimation(true)
  }
}

class TextInputModifier12 implements AttributeModifier<TextInputAttribute> {

  applyNormalAttribute(instance: TextInputAttribute): void {
    instance.enableAutoFillAnimation(false)
  }
}

class TextInputModifier13 implements AttributeModifier<TextInputAttribute> {

  applyNormalAttribute(instance: TextInputAttribute): void {
    instance.enableAutoFillAnimation(undefined)
  }
}

@Entry
@Component
struct TextInputEnableAutoFillAnimation {
  @State TextInputModifier11: TextInputModifier11 = new TextInputModifier11()
  @State TextInputModifier12: TextInputModifier12 = new TextInputModifier12()
  @State TextInputModifier13: TextInputModifier13 = new TextInputModifier13()

  build() {
    Column({ space: 1 }) {
      TextInput({
        text:'TextInput: enableAutoFillAnimation(true)',
      })
        .id('TextInput_enableAutoFillAnimation_true')
        .enableAutoFillAnimation(true)
        .height('5%')

      TextInput({
        text:'TextInput: enableAutoFillAnimation(false)',
      })
        .id('TextInput_enableAutoFillAnimation_false')
        .enableAutoFillAnimation(false)
        .height('5%')

      TextInput({
        text:'TextInput: enableAutoFillAnimation(default)',
      })
        .id('TextInput_enableAutoFillAnimation_default')
        .height('5%')

      TextInput({
        text:'TextInput: enableAutoFillAnimation(undefined)',
      })
        .id('TextInput_enableAutoFillAnimation_undefined')
        .enableAutoFillAnimation(undefined)
        .height('5%')

      TextInput({
        text:'TextInputModifier: true',
      })
        .attributeModifier(this.TextInputModifier11)
        .id('TextInputModifier_enableAutoFillAnimation_true')
        .height('5%')
        .borderWidth(1)

      TextInput({
        text:'TextInputModifier: false',
      })
        .attributeModifier(this.TextInputModifier12)
        .id('TextInputModifier_enableAutoFillAnimation_false')
        .height('5%')
        .borderWidth(1)

      TextInput({
        text:'TextInputModifier: undefined',
      })
        .attributeModifier(this.TextInputModifier13)
        .id('TextInputModifier_enableAutoFillAnimation_undefined')
        .type(InputType.Password)
        .height('5%')
        .borderWidth(1)
    }.height('100%')
  }
}