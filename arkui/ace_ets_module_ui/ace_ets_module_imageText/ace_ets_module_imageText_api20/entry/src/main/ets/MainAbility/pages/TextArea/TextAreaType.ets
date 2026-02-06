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

class TextAreaModifier implements AttributeModifier<TextAreaAttribute> {

  applyNormalAttribute(instance: TextAreaAttribute): void {
    instance.type(TextAreaType.ONE_TIME_CODE)
  }
}

@Entry
@Component
struct TextAreaTypeExample {
  @State textAreaModifier: TextAreaModifier = new TextAreaModifier()

  build() {
    Column({ space: 5 }) {
      TextArea({
        text: 'TextAreaType.ONE_TIME_CODE',
        placeholder: 'input your word...',
      })
        .fontSize(16)
        .id('TextAreaType_ONE_TIME_CODE')
        .backgroundColor('#FFFFFF')
        .type(TextAreaType.ONE_TIME_CODE)
        .height('5%')

      TextArea({
        text: 'TextAreaType: default',
        placeholder: 'input your word...',
      })
        .fontSize(16)
        .id('TextAreaType_default')
        .backgroundColor('#FFFFFF')
        .height('5%')

      TextArea({
        text: 'TextAreaType: undefined',
        placeholder: 'input your word...',
      })
        .fontSize(16)
        .backgroundColor('#FFFFFF')
        .id('TextAreaType_undefined')
        .type(undefined)
        .height('5%')

      TextArea({
        text:'TextAreaModifier',
        placeholder: 'TextArea组件, 请输入...' 
      })
        .attributeModifier(this.textAreaModifier)
        .id('TextAreaType_Modifier')
        .height('5%')
        .margin(1)
        .borderWidth(1)
    }.height('100%')
  }
}