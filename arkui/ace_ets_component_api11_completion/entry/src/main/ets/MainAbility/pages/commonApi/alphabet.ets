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
@Entry
@Component
struct AlphabetIndexerSample {
  private arrayA: string[] = ['安'];
  private arrayB: string[] = ['卜', '白', '包', '毕', '丙'];
  private arrayC: string[] = ['曹', '成', '陈', '催'];
  private arrayL: string[] = ['刘', '李', '楼', '梁', '雷', '吕', '柳', '卢'];
  private value: string[] = ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G',
    'H', 'I', 'J', 'K', 'L', 'M', 'N',
    'O', 'P', 'Q', 'R', 'S', 'T', 'U',
    'V', 'W', 'X', 'Y', 'Z'];

  build() {
    Stack({ alignContent: Alignment.Start }) {
      Row() {
        AlphabetIndexer({ arrayValue: this.value, selected: 0 })
          .key('alphabet_1')
          .autoCollapse(false)
          .selectedColor(0xFFFFFF)
          .popupColor(0xFFFAF0)
          .selectedBackgroundColor(0xCCCCCC)
          .popupBackground(0xD2B48C)
          .usingPopup(true)
          .selectedFont({ size: 16, weight: FontWeight.Bolder })
          .popupFont({ size: 30, weight: FontWeight.Bolder })
          .itemSize(28)
          .alignStyle(IndexerAlign.Left)
          .popupSelectedColor(0x00FF00)
          .popupUnselectedColor(0x0000FF)
          .popupItemFont({ size: 30, style: FontStyle.Normal })
          .popupItemBackgroundColor(0xCCCCCC)
          .onSelect((index: number) => {
            console.info(this.value[index] + ' Selected!')
          })
      }
      .width('100%')
      .height('100%')
    }
  }
}