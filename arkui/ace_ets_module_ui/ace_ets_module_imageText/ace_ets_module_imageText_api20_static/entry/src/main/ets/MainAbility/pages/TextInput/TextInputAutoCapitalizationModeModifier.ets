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
  TextInput,
  ClickEvent,
  ColumnOptions,
  AutoCapitalizationMode,
  AttributeModifier,
  TextInputAttribute,
} from '@ohos.arkui.component';
import {
  State,
} from '@ohos.arkui.stateManagement'

class TextInputModifier1 implements AttributeModifier<TextInputAttribute> {

  applyNormalAttribute(instance: TextInputAttribute): void {
    instance.autoCapitalizationMode(AutoCapitalizationMode.NONE)
  }
}

class TextInputModifier2 implements AttributeModifier<TextInputAttribute> {

  applyNormalAttribute(instance: TextInputAttribute): void {
    instance.autoCapitalizationMode(AutoCapitalizationMode.WORDS)
  }
}

class TextInputModifier3 implements AttributeModifier<TextInputAttribute> {

  applyNormalAttribute(instance: TextInputAttribute): void {
    instance.autoCapitalizationMode(AutoCapitalizationMode.SENTENCES)
  }
}

class TextInputModifier4 implements AttributeModifier<TextInputAttribute> {

  applyNormalAttribute(instance: TextInputAttribute): void {
    instance.autoCapitalizationMode(AutoCapitalizationMode.ALL_CHARACTERS)
  }
}

class TextInputModifier5 implements AttributeModifier<TextInputAttribute> {

  applyNormalAttribute(instance: TextInputAttribute): void {
    instance.autoCapitalizationMode(undefined)
  }
}

class TextInputModifier6 implements AttributeModifier<TextInputAttribute> {

  applyNormalAttribute(instance: TextInputAttribute): void {
    // instance.autoCapitalizationMode(0)
  }
}

@Entry
@Component
struct TextInputAutoCapitalizationModeModifier {
  @State TextInputModifier1: TextInputModifier1 = new TextInputModifier1()
  @State TextInputModifier2: TextInputModifier2 = new TextInputModifier2()
  @State TextInputModifier3: TextInputModifier3 = new TextInputModifier3()
  @State TextInputModifier4: TextInputModifier4 = new TextInputModifier4()
  @State TextInputModifier5: TextInputModifier5 = new TextInputModifier5()
  @State TextInputModifier6: TextInputModifier6 = new TextInputModifier6()

  build() {
    Column({ space: 1 } as ColumnOptions) {
      TextInput({
        text: 'AutoCapitalizationMode.NONE',
      })
        .fontSize(16)
        .id('TextInput_AutoCapitalizationModeModifier_NONE')
        .attributeModifier(this.TextInputModifier1)
        .height('5%')

      TextInput({
        text: 'AutoCapitalizationMode.WORDS',
      })
        .fontSize(16)
        .id('TextInput_AutoCapitalizationModeModifier_WORDS')
        .attributeModifier(this.TextInputModifier2)
        .height('5%')

      TextInput({
        text: 'AutoCapitalizationMode.SENTENCES',
      })
        .fontSize(16)
        .id('TextInput_AutoCapitalizationModeModifier_SENTENCES')
        .attributeModifier(this.TextInputModifier3)
        .height('5%')

      TextInput({
        text: 'AutoCapitalizationMode.ALL_CHARACTERS',
      })
        .fontSize(16)
        .id('TextInput_AutoCapitalizationModeModifier_ALL_CHARACTERS')
        .attributeModifier(this.TextInputModifier4)
        .height('5%')

      TextInput({
        text: 'AutoCapitalizationMode: undefined',
      })
        .fontSize(16)
        .id('TextInput_AutoCapitalizationModeModifier_undefined')
        .attributeModifier(this.TextInputModifier5)
        .height('5%')

      TextInput({
        text:'AutoCapitalizationMode: 0',
      })
        .id('TextInput_AutoCapitalizationModeModifier_0')
        .height('5%')
        .attributeModifier(this.TextInputModifier6)
    }.height('100%')
  }
}