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
import { LengthUnit, TextModifier, SearchModifier, TextInputModifier, TextAreaModifier } from '@kit.ArkUI';

class MyTextInputModifier implements AttributeModifier<TextInputModifier> {
  status: boolean | undefined | null  = false; //所有可能的状态
  statusList: (boolean | undefined | null)[] = [false, true];
  statusListIndex: number = 0

  applyNormalAttribute(instance: TextInputModifier): void {
    instance.compressLeadingPunctuation(this.status)
  }
}

@Entry
@Component
struct textInputModifier {
  @State text: string = '【HarmonyOS】【\n'
  @State textInputModifier: MyTextInputModifier = new MyTextInputModifier()

  build() {
    Column(){
      Text('textInputModifier')
      TextInput({
        text: this.text,
        placeholder: 'This is TextArea',
      })
        .id('textInputCompressLeadingPunctuationModifier')
        .style(TextInputStyle.Inline)
        .fontSize(12)
        .borderWidth(1)
        .attributeModifier(this.textInputModifier)//新接口，控制行首标点符号是否缩进
      Button('行首符号缩进属性：'+ this.textInputModifier.status)
        .id('textInputCompressLeadingPunctuationModifierButton')
        .onClick(() => {
          this.textInputModifier.statusListIndex = 
          (this.textInputModifier.statusListIndex + 1) % this.textInputModifier.statusList.length
          this.textInputModifier.status = this.textInputModifier.statusList[this.textInputModifier.statusListIndex]
          }).margin(1)
    }
    .height('100%')
    .width('100%')
  }
}