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

 class TextAreaModifier21 implements AttributeModifier<TextAreaAttribute> {

  applyNormalAttribute(instance: TextAreaAttribute): void {
    instance.enableAutoSpacing(true)
  }
}

class TextAreaModifier22 implements AttributeModifier<TextAreaAttribute> {

  applyNormalAttribute(instance: TextAreaAttribute): void {
    instance.enableAutoSpacing(false)
  }
}

class TextAreaModifier23 implements AttributeModifier<TextAreaAttribute> {

  applyNormalAttribute(instance: TextAreaAttribute): void {
    instance.enableAutoSpacing(undefined)
  }
}

@Entry
@Component
struct TextAreaEnableAutoSpacing {
  @State TextAreaModifier21: TextAreaModifier21 = new TextAreaModifier21()
  @State TextAreaModifier22: TextAreaModifier22 = new TextAreaModifier22()
  @State TextAreaModifier23: TextAreaModifier23 = new TextAreaModifier23()

  build() {
    Column({ space: 1 }) {
      TextArea({
        text:'TextArea：enableAutoSpacing(true)',
      })
        .id('TextArea_enableAutoSpacing_true')
        .enableAutoSpacing(true)
        .height('5%')

      TextArea({
        text:'TextArea：enableAutoSpacing(false)',
      })
        .id('TextArea_enableAutoSpacing_false')
        .enableAutoSpacing(false)
        .height('5%')

      TextArea({
        text:'TextArea：enableAutoSpacing(default)',
      })
        .id('TextArea_enableAutoSpacing_default')
        .height('5%')

      TextArea({
        text:'TextArea：enableAutoSpacing(undefined)',
      })
        .id('TextArea_enableAutoSpacing_undefined')
        .enableAutoSpacing(undefined)
        .height('5%')

      TextArea({
        text:'TextAreaModifier: true',
      })
        .attributeModifier(this.TextAreaModifier21)
        .id('TextAreaModifier_enableAutoSpacing_true')
        .height('5%')
        .borderWidth(1)

      TextArea({
        text:'TextAreaModifier: false',
      })
        .attributeModifier(this.TextAreaModifier22)
        .id('TextAreaModifier_enableAutoSpacing_false')
        .height('5%')
        .borderWidth(1)

      TextArea({
        text:'TextAreaModifier: undefined',
      })
        .attributeModifier(this.TextAreaModifier23)
        .id('TextAreaModifier_enableAutoSpacing_undefined')
        .height('5%')
        .borderWidth(1)
    }.height('100%')
  }
}