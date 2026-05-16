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

@Entry
@Component
struct AlphabetIndexerAttributeNullUndefined {
  private value: string[] = ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G']
  build() {
    Column({space: 5}) {
      Row() {
        AlphabetIndexer({ arrayValue: this.value, selected: 0 })
          .key('alphabet_1')
          .autoCollapse(false)
          .selectedColor(0xFFFFFF)
          .popupColor(0xFFFAF0)
          .selectedBackgroundColor(0xCCCCCC)
          .popupBackground(null)
          .usingPopup(true)
          .selectedFont(null)
          .popupFont(null)
          .itemSize(28)
          .alignStyle(IndexerAlign.Left)
          .popupSelectedColor(null)
          .popupUnselectedColor(0x0000FF)
          .popupItemFont(null)
          .popupItemBackgroundColor(null)
          .font(null)
          .selected(null)
          .popupPosition(null)
          .popupItemBorderRadius(null)
          .itemBorderRadius(null)
          .popupBackgroundBlurStyle(null)
          .onSelect((index: number) => {
            console.info(this.value[index] + ' Selected!')
          })
      }
      .width('100%')
      .height('30%')

      Row() {
        AlphabetIndexer({ arrayValue: this.value, selected: 0 })
          .key('alphabet_2')
          .autoCollapse(false)
          .selectedColor(0xFFFFFF)
          .popupColor(0xFFFAF0)
          .selectedBackgroundColor(0xCCCCCC)
          .popupBackground(undefined)
          .usingPopup(true)
          .selectedFont(undefined)
          .popupFont(undefined)
          .itemSize(28)
          .alignStyle(IndexerAlign.Left)
          .popupSelectedColor(undefined)
          .popupUnselectedColor(0x0000FF)
          .popupItemFont(undefined)
          .popupItemBackgroundColor(undefined)
          .font(undefined)
          .selected(undefined)
          .popupPosition(undefined)
          .popupItemBorderRadius(undefined)
          .itemBorderRadius(undefined)
          .popupBackgroundBlurStyle(undefined)
          .onSelect((index: number) => {
            console.info(this.value[index] + ' Selected!')
          })
      }
      .width('100%')
      .height('30%')

      Row() {
        AlphabetIndexer({ arrayValue: this.value, selected: 0 })
          .key('alphabet_3')
          .autoCollapse(false)
          .selectedColor(0xFFFFFF)
          .popupColor(0xFFFAF0)
          .selectedBackgroundColor(0xCCCCCC)
          .usingPopup(true)
          .itemSize(28)
          .alignStyle(IndexerAlign.Left)
          .popupUnselectedColor(0x0000FF)
          .onSelect((index: number) => {
            console.info(this.value[index] + ' Selected!')
          })
      }
      .width('100%')
      .height('30%')
    }
  }
}