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

 class TextModifier1 implements AttributeModifier<TextAttribute> {

  applyNormalAttribute(instance: TextAttribute): void {
    instance.enableAutoSpacing(true)
  }
}

class TextModifier2 implements AttributeModifier<TextAttribute> {

  applyNormalAttribute(instance: TextAttribute): void {
    instance.enableAutoSpacing(false)
  }
}

class TextModifier3 implements AttributeModifier<TextAttribute> {

  applyNormalAttribute(instance: TextAttribute): void {
    instance.enableAutoSpacing(undefined)
  }
}

@Entry
@Component
struct TextEnableAutoSpacing {
  @State TextModifier1: TextModifier1 = new TextModifier1()
  @State TextModifier2: TextModifier2 = new TextModifier2()
  @State TextModifier3: TextModifier3 = new TextModifier3()

  build() {
    Column({ space: 1 }) {
      Text('Text：enableAutoSpacing(true)')
        .id('Text_enableAutoSpacing_true')
        .enableAutoSpacing(true)
        .height('5%')

      Text('Text：enableAutoSpacing(false)')
        .id('Text_enableAutoSpacing_false')
        .enableAutoSpacing(false)
        .height('5%')

      Text('Text：enableAutoSpacing(default)')
        .id('Text_enableAutoSpacing_default')
        .height('5%')

      Text('Text：enableAutoSpacing(undefined)')
        .id('Text_enableAutoSpacing_undefined')
        .enableAutoSpacing(undefined)
        .height('5%')

      Text('TextModifier: true')
        .attributeModifier(this.TextModifier1)
        .id('TextModifier_enableAutoSpacing_true')
        .height('5%')
        .borderWidth(1)

      Text('TextModifier: false')
        .attributeModifier(this.TextModifier2)
        .id('TextModifier_enableAutoSpacing_false')
        .height('5%')
        .borderWidth(1)

      Text('TextModifier: undefined')
        .attributeModifier(this.TextModifier3)
        .id('TextModifier_enableAutoSpacing_undefined')
        .height('5%')
        .borderWidth(1)
    }.height('100%')
  }
}