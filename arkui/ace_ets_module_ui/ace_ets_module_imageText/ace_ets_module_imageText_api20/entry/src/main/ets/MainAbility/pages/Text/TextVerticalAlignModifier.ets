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
class TextModifier31 implements AttributeModifier<TextAttribute> {

  applyNormalAttribute(instance: TextAttribute): void {
    instance.textVerticalAlign(TextVerticalAlign.BASELINE)
  }
}

class TextModifier32 implements AttributeModifier<TextAttribute> {

  applyNormalAttribute(instance: TextAttribute): void {
    instance.textVerticalAlign(TextVerticalAlign.BOTTOM)
  }
}

class TextModifier33 implements AttributeModifier<TextAttribute> {

  applyNormalAttribute(instance: TextAttribute): void {
    instance.textVerticalAlign(TextVerticalAlign.CENTER)
  }
}

class TextModifier34 implements AttributeModifier<TextAttribute> {

  applyNormalAttribute(instance: TextAttribute): void {
    instance.textVerticalAlign(TextVerticalAlign.TOP)
  }
}

class TextModifier35 implements AttributeModifier<TextAttribute> {

  applyNormalAttribute(instance: TextAttribute): void {
    instance.textVerticalAlign(undefined)
  }
}


@Entry
@Component
struct TextVerticalAlignModifier {
  @State TextModifier1: TextModifier31 = new TextModifier31()
  @State TextModifier2: TextModifier32 = new TextModifier32()
  @State TextModifier3: TextModifier33 = new TextModifier33()
  @State TextModifier4: TextModifier34 = new TextModifier34()
  @State TextModifier5: TextModifier35 = new TextModifier35()

  build() {
    Column({ space: 2 }) {
      Text('TextVerticalAlign.BASELINE')
        .height('5%')
        .id('Modifier_TextVerticalAlign_BASELINE')
        .attributeModifier(this.TextModifier1)
        .borderWidth(1)

      Text('TextVerticalAlign.BOTTOM')
        .height('5%')
        .id('Modifier_TextVerticalAlign_BOTTOM')
        .attributeModifier(this.TextModifier2)
        .borderWidth(1)

      Text('TextVerticalAlign.CENTER')
        .height('5%')
        .id('Modifier_TextVerticalAlign_CENTER')
        .attributeModifier(this.TextModifier3)
        .borderWidth(1)

      Text('TextVerticalAlign.TOP')
        .height('5%')
        .id('Modifier_TextVerticalAlign_TOP')
        .attributeModifier(this.TextModifier4)
        .borderWidth(1)

      Text('TextVerticalAlign: undefined')
        .height('5%')
        .attributeModifier(this.TextModifier5)
        .id('Modifier_TextVerticalAlign_undefined')
        .borderWidth(1)
    }
    .alignItems(HorizontalAlign.Center)
    .width('100%')
  }
}