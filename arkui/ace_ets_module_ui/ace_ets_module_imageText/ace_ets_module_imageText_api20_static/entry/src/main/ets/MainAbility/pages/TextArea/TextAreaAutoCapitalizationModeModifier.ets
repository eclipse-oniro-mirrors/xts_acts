'use static';
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
import {
  Entry,
  Component,
  $r,
  Text,
  Row,
  Column,
  Color,
  TextArea,
  ClickEvent,
  ColumnOptions,
  AutoCapitalizationMode,
  AttributeModifier,
  TextAreaAttribute,
} from '@ohos.arkui.component';
import {
  State,
} from '@ohos.arkui.stateManagement'

class TextAreaModifier1 implements AttributeModifier<TextAreaAttribute> {

  applyNormalAttribute(instance: TextAreaAttribute): void {
    instance.autoCapitalizationMode(AutoCapitalizationMode.NONE)
  }
}

class TextAreaModifier2 implements AttributeModifier<TextAreaAttribute> {

  applyNormalAttribute(instance: TextAreaAttribute): void {
    instance.autoCapitalizationMode(AutoCapitalizationMode.WORDS)
  }
}

class TextAreaModifier3 implements AttributeModifier<TextAreaAttribute> {

  applyNormalAttribute(instance: TextAreaAttribute): void {
    instance.autoCapitalizationMode(AutoCapitalizationMode.SENTENCES)
  }
}

class TextAreaModifier4 implements AttributeModifier<TextAreaAttribute> {

  applyNormalAttribute(instance: TextAreaAttribute): void {
    instance.autoCapitalizationMode(AutoCapitalizationMode.ALL_CHARACTERS)
  }
}

class TextAreaModifier5 implements AttributeModifier<TextAreaAttribute> {

  applyNormalAttribute(instance: TextAreaAttribute): void {
    instance.autoCapitalizationMode(undefined)
  }
}

class TextAreaModifier6 implements AttributeModifier<TextAreaAttribute> {

  applyNormalAttribute(instance: TextAreaAttribute): void {
    // instance.autoCapitalizationMode(0)
  }
}

@Entry
@Component
struct TextAreaAutoCapitalizationModeModifier {
  @State textAreaModifier1: TextAreaModifier1 = new TextAreaModifier1()
  @State textAreaModifier2: TextAreaModifier2 = new TextAreaModifier2()
  @State textAreaModifier3: TextAreaModifier3 = new TextAreaModifier3()
  @State textAreaModifier4: TextAreaModifier4 = new TextAreaModifier4()
  @State textAreaModifier5: TextAreaModifier5 = new TextAreaModifier5()
  @State textAreaModifier6: TextAreaModifier6 = new TextAreaModifier6()

  build() {
    Column({ space: 1 } as ColumnOptions) {
      TextArea({
        text: 'AutoCapitalizationMode.NONE',
      })
        .fontSize(16)
        .id('TextArea_AutoCapitalizationModeModifier_NONE')
        .attributeModifier(this.textAreaModifier1)
        .height('5%')

      TextArea({
        text: 'AutoCapitalizationMode.WORDS',
      })
        .fontSize(16)
        .id('TextArea_AutoCapitalizationModeModifier_WORDS')
        .attributeModifier(this.textAreaModifier2)
        .height('5%')

      TextArea({
        text: 'AutoCapitalizationMode.SENTENCES',
      })
        .fontSize(16)
        .id('TextArea_AutoCapitalizationModeModifier_SENTENCES')
        .attributeModifier(this.textAreaModifier3)
        .height('5%')

      TextArea({
        text: 'AutoCapitalizationMode.ALL_CHARACTERS',
      })
        .fontSize(16)
        .id('TextArea_AutoCapitalizationModeModifier_ALL_CHARACTERS')
        .attributeModifier(this.textAreaModifier4)
        .height('5%')

      TextArea({
        text: 'AutoCapitalizationMode: undefined',
      })
        .fontSize(16)
        .id('TextArea_AutoCapitalizationModeModifier_undefined')
        .attributeModifier(this.textAreaModifier5)
        .height('5%')

      TextArea({
        text:'AutoCapitalizationMode: 0',
      })
        .id('TextArea_AutoCapitalizationModeModifier_0')
        .height('5%')
        .attributeModifier(this.textAreaModifier6)
    }.height('100%')
  }
}