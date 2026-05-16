/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { AlphabetIndexerModifier } from "@ohos.arkui.modifier";

class CustomModifier extends AlphabetIndexerModifier {
  applyNormalAttribute(instance: AlphabetIndexerAttribute): void {
    super.applyNormalAttribute?.(instance);
  }

  onChange1() {
    this.selected(2)
  }
}

@Entry
@Component
struct AlphabetIndexerTest {
  private value: string[] = ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G',
    'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R',
    'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z']
  popupSelectedColorNum: number = 0x00CED1
  popupUnselectedColorNum: number = 0xC0FF3E
  popupItemBackgroundNum: number = 0x8470FF
  popupItemFontSizeNum: number = 30
  popupItemFontWeightNum: number = FontWeight.Normal
  @State customModifier1: AlphabetIndexerModifier = new CustomModifier()
      .font({ size: 18, weight: FontWeight.Normal })
      .selectedFont({ size: 28, weight: FontWeight.Bold })
      .color(0x000000)
      .selectedColor(0xFF1493)
      .selectedBackgroundColor(0xBEBEBE)
      .itemSize(26)
      .usingPopup(true)
      .alignStyle(IndexerAlign.Left)
      .popupFont({ size: 28, weight: FontWeight.Bold })
      .popupColor(0xFFA500)
      .popupBackground(0x32CD32)
  @State customModifier2: AlphabetIndexerModifier = new CustomModifier()
      .selected(1)
      .popupPosition({ x: 90.0, y: 50.0 })
      .popupSelectedColor(this.popupSelectedColorNum)
      .popupUnselectedColor(this.popupUnselectedColorNum)
      .popupItemBackgroundColor(this.popupItemBackgroundNum)
      .popupItemFont({ size: this.popupItemFontSizeNum, weight: this.popupItemFontWeightNum })

  build() {
    Row() {
      Button("change value").onClick(() => {
        (this.customModifier2 as CustomModifier).onChange1();
      }).key("changeButton")
      AlphabetIndexer({ arrayValue: this.value, selected: 0 })
        .key('alphabetIndexerTest1')
        .attributeModifier(this.customModifier1 as CustomModifier)

      AlphabetIndexer({ arrayValue: this.value, selected: 0 })
        .key('alphabetIndexerTest2')
        .attributeModifier(this.customModifier2 as CustomModifier)
    }.backgroundColor(0x00FFFF).width('100%').height('100%')
  }
}