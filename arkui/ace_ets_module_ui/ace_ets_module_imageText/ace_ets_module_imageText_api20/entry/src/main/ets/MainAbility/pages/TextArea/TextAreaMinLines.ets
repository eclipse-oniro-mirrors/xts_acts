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

 class TextAreaModifier11 implements AttributeModifier<TextAreaAttribute> {

  applyNormalAttribute(instance: TextAreaAttribute): void {
    instance.minLines(2)
  }
}

class TextAreaModifier12 implements AttributeModifier<TextAreaAttribute> {

  applyNormalAttribute(instance: TextAreaAttribute): void {
    instance.minLines(0)
  }
}

class TextAreaModifier13 implements AttributeModifier<TextAreaAttribute> {

  applyNormalAttribute(instance: TextAreaAttribute): void {
    instance.minLines(undefined)
  }
}

class TextAreaModifier14 implements AttributeModifier<TextAreaAttribute> {

  applyNormalAttribute(instance: TextAreaAttribute): void {
    instance.minLines(-1)
  }
}

@Entry
@Component
struct TextAreaMinLines {
  @State TextAreaModifier11: TextAreaModifier11 = new TextAreaModifier11()
  @State TextAreaModifier12: TextAreaModifier12 = new TextAreaModifier12()
  @State TextAreaModifier13: TextAreaModifier13 = new TextAreaModifier13()
  @State TextAreaModifier14: TextAreaModifier14 = new TextAreaModifier14()

  build() {
    Column({ space: 1 }) {
      TextArea({
        text:'TextArea: minLines(2)',
      })
        .id('TextArea_minLines_2')
        .minLines(2)
        .height('5%')

      TextArea({
        text:'TextArea: minLines(-1)',
      })
        .id('TextArea_minLines_f1')
        .minLines(-1)
        .height('5%')

      TextArea({
        text:'TextArea: minLines(default)',
      })
        .id('TextArea_minLines_default')
        .height('5%')

      TextArea({
        text:'TextArea: minLines(undefined)',
      })
        .id('TextArea_minLines_undefined')
        .minLines(undefined)
        .height('5%')

      TextArea({
        text:'TextAreaModifier: minLines(2)',
      })
        .attributeModifier(this.TextAreaModifier11)
        .id('TextAreaModifier_minLines_2')
        .height('5%')
        .borderWidth(1)

      TextArea({
        text:'TextAreaModifier: minLines(0)',
      })
        .attributeModifier(this.TextAreaModifier12)
        .id('TextAreaModifier_minLines_0')
        .height('5%')
        .borderWidth(1)

      TextArea({
        text:'TextAreaModifier: minLines(undefined)',
      })
        .attributeModifier(this.TextAreaModifier13)
        .id('TextAreaModifier_minLines_undefined')
        .height('5%')
        .borderWidth(1)

      TextArea({
        text:'TextAreaModifier: minLines(-1)',
      })
        .attributeModifier(this.TextAreaModifier14)
        .id('TextAreaModifier_minLines_f1')
        .height('5%')
        .borderWidth(1)
    }.height('100%')
  }
}