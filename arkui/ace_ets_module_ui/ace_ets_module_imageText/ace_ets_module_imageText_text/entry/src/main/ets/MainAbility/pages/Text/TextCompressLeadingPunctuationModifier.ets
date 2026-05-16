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

class MyTextModifier implements AttributeModifier<TextModifier> {
  status: boolean | undefined | null  = false; //所有可能的状态
  statusList: (boolean | undefined | null)[] = [false, true, undefined, null];
  statusListIndex: number = 0

  applyNormalAttribute(instance: TextModifier): void {
    instance.compressLeadingPunctuation(this.status)
  }
}

@Entry
@Component
struct TextCompressLeadingPunctuationModifier {
  @State textModifier: MyTextModifier = new MyTextModifier()
  @State text: string = '【HarmonyOS】【\n'

  build() {
    Column() {
      Text('textCompressLeadingPunctuationModifier')
      Row({ space: 5 }) {
        Text(this.text)
          .id('textCompressLeadingPunctuationModifier')
          .height('25%')
          .fontSize(12)
          .borderWidth(1)
          .attributeModifier(this.textModifier) //新接口，控制行首标点符号是否缩进
        Text() {
          Span(this.text).fontSize(12)
        }
        .id('textSpanModifier')
        .height('25%')
        .fontSize(12)
        .borderWidth(1)
        .attributeModifier(this.textModifier) //新接口，控制行首标点符号是否缩进
      }.margin(1)
      Button('行首符号缩进属性：' + this.textModifier.status)
        .id('textModifierButton')
        .onClick(() => {
          this.textModifier.statusListIndex =
            (this.textModifier.statusListIndex + 1) % this.textModifier.statusList.length
          this.textModifier.status = this.textModifier.statusList[this.textModifier.statusListIndex]
        }).margin(1)
    }.height('100%').width('100%')
  }
}

