'use static'
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
  Column,
  Component,
  Button,
  ClickEvent,
  AlphabetIndexer,
  AttributeModifier,
  AlphabetIndexerAttribute,
  IndexerAlign,
  ColumnOptions
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

@Observed
export class MyAlphabetIndexerModifier implements AttributeModifier<AlphabetIndexerAttribute> {
  public isChange: boolean = true;

  applyNormalAttribute(instance: AlphabetIndexerAttribute): void {
    if (this.isChange) {
      instance.selectedColor('#FF33FF')
    } else {
      instance.selectedColor(undefined)
    }
  }
}

@Entry
@Component
struct AlphabetSelectedColorModifier {
  @State modifier: MyAlphabetIndexerModifier = new MyAlphabetIndexerModifier();
  public arrayA: string[] = ['安'];
  public arrayB: string[] = ['卜', '白', '包', '毕', '丙'];
  public arrayC: string[] = ['曹', '成', '陈', '催'];
  public arrayJ: string[] = ['嘉', '贾'];
  private value: string[] = ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G',
    'H', 'I', 'J', 'K', 'L', 'M', 'N',
    'O', 'P', 'Q', 'R', 'S', 'T', 'U',
    'V', 'W', 'X', 'Y', 'Z'];

  build() {
    Column({ space: 2 } as ColumnOptions) {
      AlphabetIndexer({ arrayValue: this.value, selected: 1 })
        .usingPopup(true)
        .alignStyle(IndexerAlign.Left)
        .onRequestPopupData(
          (index: Int) => {
            if (this.value[index as Int] == 'A') {
              return this.arrayA;
            } else if (this.value[index as Int] == 'B') {
              return this.arrayB;
            } else if (this.value[index as Int] == 'C') {
              return this.arrayC;
            } else if (this.value[index as Int] == 'J') {
              return this.arrayJ;
            } else {
              return [];
            }
          }
        )
        .id('AlphabetSelectedColorModifier')
        .attributeModifier(this.modifier)
        .height(100)
        .width(100)
      Button('change_selectedColor')
        .id('AlphabetIndexer_change')
        .onClick((event: ClickEvent) => {
          this.modifier.isChange = !this.modifier.isChange
        })

      AlphabetIndexer({ arrayValue: this.value, selected: 1 })
        .usingPopup(true)
        .alignStyle(IndexerAlign.Left)
        .onRequestPopupData(
          (index: Int) => {
            if (this.value[index as Int] == 'A') {
              return this.arrayA;
            } else if (this.value[index as Int] == 'B') {
              return this.arrayB;
            } else if (this.value[index as Int] == 'C') {
              return this.arrayC;
            } else if (this.value[index as Int] == 'J') {
              return this.arrayJ;
            } else {
              return [];
            }
          }
        )
        .id('AlphabetSelectedColorModifierUndefined')
        .height(100)
        .width(100)
    }.width(300)
    .height(300)
  }
}