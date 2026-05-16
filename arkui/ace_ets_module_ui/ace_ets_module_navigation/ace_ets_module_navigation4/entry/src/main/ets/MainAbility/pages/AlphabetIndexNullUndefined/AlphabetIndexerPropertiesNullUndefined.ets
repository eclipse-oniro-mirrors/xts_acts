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
struct AlphabetIndexerPropertiesNullUndefinedTest {
  private value: string[] = ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G',
    'H', 'I', 'J', 'K', 'L', 'M', 'N',
    'O', 'P', 'Q', 'R', 'S', 'T', 'U',
    'V', 'W', 'X', 'Y', 'Z'];

  build() {

    Column() {
      Scroll(){
        Column(){
          Text('AlphabetIndexer color Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            AlphabetIndexer({ arrayValue: this.value, selected: 0 })
              .width('30%')
              .height('20%')
              .id('AlphabetIndexer_color_default')

            AlphabetIndexer({ arrayValue: this.value, selected: 0 })
              .width('30%')
              .height('20%')
              .id('AlphabetIndexer_color_null')
              .color(null)

            AlphabetIndexer({ arrayValue: this.value, selected: 0 })
              .width('30%')
              .height('20%')
              .id('AlphabetIndexer_color_undefined')
              .color(undefined)
          }
          .width('100%')

          Text('AlphabetIndexer selectedColor Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            AlphabetIndexer({ arrayValue: this.value, selected: 0 })
              .width('30%')
              .height('20%')
              .id('AlphabetIndexer_selectedColor_default')

            AlphabetIndexer({ arrayValue: this.value, selected: 0 })
              .width('30%')
              .height('20%')
              .id('AlphabetIndexer_selectedColor_null')
              .selectedColor(null)

            AlphabetIndexer({ arrayValue: this.value, selected: 0 })
              .width('30%')
              .height('20%')
              .id('AlphabetIndexer_selectedColor_undefined')
              .selectedColor(undefined)
          }
          .width('100%')

          Text('AlphabetIndexer popupColor Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            AlphabetIndexer({ arrayValue: this.value, selected: 0 })
              .width('30%')
              .height('20%')
              .id('AlphabetIndexer_popupColor_default')

            AlphabetIndexer({ arrayValue: this.value, selected: 0 })
              .width('30%')
              .height('20%')
              .id('AlphabetIndexer_popupColor_null')
              .popupColor(null)

            AlphabetIndexer({ arrayValue: this.value, selected: 0 })
              .width('30%')
              .height('20%')
              .id('AlphabetIndexer_popupColor_undefined')
              .popupColor(undefined)
          }
          .width('100%')

          Text('AlphabetIndexer selectedBackgroundColor Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            AlphabetIndexer({ arrayValue: this.value, selected: 0 })
              .width('30%')
              .height('20%')
              .id('AlphabetIndexer_selectedBackgroundColor_default')

            AlphabetIndexer({ arrayValue: this.value, selected: 0 })
              .width('30%')
              .height('20%')
              .id('AlphabetIndexer_selectedBackgroundColor_null')
              .selectedBackgroundColor(null)

            AlphabetIndexer({ arrayValue: this.value, selected: 0 })
              .width('30%')
              .height('20%')
              .id('AlphabetIndexer_selectedBackgroundColor_undefined')
              .selectedBackgroundColor(undefined)
          }
          .width('100%')

          Text('AlphabetIndexer popupBackground Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            AlphabetIndexer({ arrayValue: this.value, selected: 0 })
              .width('30%')
              .height('20%')
              .id('AlphabetIndexer_popupBackground_default')

            AlphabetIndexer({ arrayValue: this.value, selected: 0 })
              .width('30%')
              .height('20%')
              .id('AlphabetIndexer_popupBackground_null')
              .popupBackground(null)

            AlphabetIndexer({ arrayValue: this.value, selected: 0 })
              .width('30%')
              .height('20%')
              .id('AlphabetIndexer_popupBackground_undefined')
              .popupBackground(undefined)
          }
          .width('100%')

          Text('AlphabetIndexer usingPopup Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            AlphabetIndexer({ arrayValue: this.value, selected: 0 })
              .width('30%')
              .height('20%')
              .id('AlphabetIndexer_usingPopup_default')

            AlphabetIndexer({ arrayValue: this.value, selected: 0 })
              .width('30%')
              .height('20%')
              .id('AlphabetIndexer_usingPopup_null')
              .usingPopup(null)

            AlphabetIndexer({ arrayValue: this.value, selected: 0 })
              .width('30%')
              .height('20%')
              .id('AlphabetIndexer_usingPopup_undefined')
              .usingPopup(undefined)
          }
          .width('100%')

          Text('AlphabetIndexer selectedFont Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            AlphabetIndexer({ arrayValue: this.value, selected: 0 })
              .width('30%')
              .height('20%')
              .id('AlphabetIndexer_selectedFont_default')

            AlphabetIndexer({ arrayValue: this.value, selected: 0 })
              .width('30%')
              .height('20%')
              .id('AlphabetIndexer_selectedFont_null')
              .selectedFont(null)

            AlphabetIndexer({ arrayValue: this.value, selected: 0 })
              .width('30%')
              .height('20%')
              .id('AlphabetIndexer_selectedFont_undefined')
              .selectedFont(undefined)
          }
          .width('100%')

          Text('AlphabetIndexer popupFont Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            AlphabetIndexer({ arrayValue: this.value, selected: 0 })
              .width('30%')
              .height('20%')
              .id('AlphabetIndexer_popupFont_default')

            AlphabetIndexer({ arrayValue: this.value, selected: 0 })
              .width('30%')
              .height('20%')
              .id('AlphabetIndexer_popupFont_null')
              .popupFont(null)

            AlphabetIndexer({ arrayValue: this.value, selected: 0 })
              .width('30%')
              .height('20%')
              .id('AlphabetIndexer_popupFont_undefined')
              .popupFont(undefined)
          }
          .width('100%')

          Text('AlphabetIndexer font Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            AlphabetIndexer({ arrayValue: this.value, selected: 0 })
              .width('30%')
              .height('20%')
              .id('AlphabetIndexer_font_default')

            AlphabetIndexer({ arrayValue: this.value, selected: 0 })
              .width('30%')
              .height('20%')
              .id('AlphabetIndexer_font_null')
              .font(null)

            AlphabetIndexer({ arrayValue: this.value, selected: 0 })
              .width('30%')
              .height('20%')
              .id('AlphabetIndexer_font_undefined')
              .font(undefined)
          }
          .width('100%')

          Text('AlphabetIndexer itemSize Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            AlphabetIndexer({ arrayValue: this.value, selected: 0 })
              .width('25%')
              .height('20%')
              .id('AlphabetIndexer_itemSize_default')

            AlphabetIndexer({ arrayValue: this.value, selected: 0 })
              .width('25%')
              .height('20%')
              .id('AlphabetIndexer_itemSize_null')
              .itemSize(null)

            AlphabetIndexer({ arrayValue: this.value, selected: 0 })
              .width('25%')
              .height('20%')
              .id('AlphabetIndexer_itemSize_undefined')
              .itemSize(undefined)

            AlphabetIndexer({ arrayValue: this.value, selected: 0 })
              .width('25%')
              .height('20%')
              .id('AlphabetIndexer_itemSize_empty')
              .itemSize('')
          }
          .width('100%')

          Text('AlphabetIndexer alignStyle Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            AlphabetIndexer({ arrayValue: this.value, selected: 0 })
              .width('20%')
              .height('20%')
              .id('AlphabetIndexer_alignStyle_default')

            AlphabetIndexer({ arrayValue: this.value, selected: 0 })
              .width('20%')
              .height('20%')
              .id('AlphabetIndexer_alignStyle_null')
              .alignStyle(null)

            AlphabetIndexer({ arrayValue: this.value, selected: 0 })
              .width('20%')
              .height('20%')
              .id('AlphabetIndexer_alignStyle_undefined')
              .alignStyle(undefined)

            AlphabetIndexer({ arrayValue: this.value, selected: 0 })
              .width('20%')
              .height('20%')
              .id('AlphabetIndexer_alignStyle_START')
              .alignStyle(IndexerAlign.START)
          }
          .width('100%')

          Row() {
            AlphabetIndexer({ arrayValue: this.value, selected: 0 })
              .width('33%')
              .height('20%')
              .id('AlphabetIndexer_alignStyle_offset_null')
              .alignStyle(IndexerAlign.END, null)

            AlphabetIndexer({ arrayValue: this.value, selected: 0 })
              .width('33%')
              .height('20%')
              .id('AlphabetIndexer_alignStyle_offset_undefined')
              .alignStyle(IndexerAlign.END, undefined)
          }
          .width('100%')

          Text('AlphabetIndexer selected Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            AlphabetIndexer({ arrayValue: this.value, selected: 0 })
              .width('30%')
              .height('20%')
              .id('AlphabetIndexer_selected_default')

            AlphabetIndexer({ arrayValue: this.value, selected: 0 })
              .width('30%')
              .height('20%')
              .id('AlphabetIndexer_selected_null')
              .selected(null)

            AlphabetIndexer({ arrayValue: this.value, selected: 0 })
              .width('30%')
              .height('20%')
              .id('AlphabetIndexer_selected_undefined')
              .selected(undefined)
          }
          .width('100%')

          Text('AlphabetIndexer popupPosition Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            AlphabetIndexer({ arrayValue: this.value, selected: 0 })
              .width('30%')
              .height('20%')
              .id('AlphabetIndexer_popupPosition_default')

            AlphabetIndexer({ arrayValue: this.value, selected: 0 })
              .width('30%')
              .height('20%')
              .id('AlphabetIndexer_popupPosition_null')
              .popupPosition(null)

            AlphabetIndexer({ arrayValue: this.value, selected: 0 })
              .width('30%')
              .height('20%')
              .id('AlphabetIndexer_popupPosition_undefined')
              .popupPosition(undefined)
          }
          .width('100%')

          Text('AlphabetIndexer popupSelectedColor Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            AlphabetIndexer({ arrayValue: this.value, selected: 0 })
              .width('30%')
              .height('20%')
              .id('AlphabetIndexer_popupSelectedColor_default')

            AlphabetIndexer({ arrayValue: this.value, selected: 0 })
              .width('30%')
              .height('20%')
              .id('AlphabetIndexer_popupSelectedColor_null')
              .popupSelectedColor(null)

            AlphabetIndexer({ arrayValue: this.value, selected: 0 })
              .width('30%')
              .height('20%')
              .id('AlphabetIndexer_popupSelectedColor_undefined')
              .popupSelectedColor(undefined)
          }
          .width('100%')

          Text('AlphabetIndexer popupUnselectedColor Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            AlphabetIndexer({ arrayValue: this.value, selected: 0 })
              .width('30%')
              .height('20%')
              .id('AlphabetIndexer_popupUnselectedColor_default')

            AlphabetIndexer({ arrayValue: this.value, selected: 0 })
              .width('30%')
              .height('20%')
              .id('AlphabetIndexer_popupUnselectedColor_null')
              .popupUnselectedColor(null)

            AlphabetIndexer({ arrayValue: this.value, selected: 0 })
              .width('30%')
              .height('20%')
              .id('AlphabetIndexer_popupUnselectedColor_undefined')
              .popupUnselectedColor(undefined)
          }
          .width('100%')

          Text('AlphabetIndexer popupItemFont Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            AlphabetIndexer({ arrayValue: this.value, selected: 0 })
              .width('30%')
              .height('20%')
              .id('AlphabetIndexer_popupItemFont_default')

            AlphabetIndexer({ arrayValue: this.value, selected: 0 })
              .width('30%')
              .height('20%')
              .id('AlphabetIndexer_popupItemFont_null')
              .popupItemFont(null)

            AlphabetIndexer({ arrayValue: this.value, selected: 0 })
              .width('30%')
              .height('20%')
              .id('AlphabetIndexer_popupItemFont_undefined')
              .popupItemFont(undefined)
          }
          .width('100%')

          Text('AlphabetIndexer popupItemBackgroundColor Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            AlphabetIndexer({ arrayValue: this.value, selected: 0 })
              .width('30%')
              .height('20%')
              .id('AlphabetIndexer_popupItemBackgroundColor_default')

            AlphabetIndexer({ arrayValue: this.value, selected: 0 })
              .width('30%')
              .height('20%')
              .id('AlphabetIndexer_popupItemBackgroundColor_null')
              .popupItemBackgroundColor(null)

            AlphabetIndexer({ arrayValue: this.value, selected: 0 })
              .width('30%')
              .height('20%')
              .id('AlphabetIndexer_popupItemBackgroundColor_undefined')
              .popupItemBackgroundColor(undefined)
          }
          .width('100%')

          Text('AlphabetIndexer autoCollapse Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            AlphabetIndexer({ arrayValue: this.value, selected: 0 })
              .width('30%')
              .height('20%')
              .id('AlphabetIndexer_autoCollapse_default')

            AlphabetIndexer({ arrayValue: this.value, selected: 0 })
              .width('30%')
              .height('20%')
              .id('AlphabetIndexer_autoCollapse_null')
              .autoCollapse(null)

            AlphabetIndexer({ arrayValue: this.value, selected: 0 })
              .width('30%')
              .height('20%')
              .id('AlphabetIndexer_autoCollapse_undefined')
              .autoCollapse(undefined)
          }
          .width('100%')

          Text('AlphabetIndexer popupItemBorderRadius Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            AlphabetIndexer({ arrayValue: this.value, selected: 0 })
              .width('30%')
              .height('20%')
              .id('AlphabetIndexer_popupItemBorderRadius_default')

            AlphabetIndexer({ arrayValue: this.value, selected: 0 })
              .width('30%')
              .height('20%')
              .id('AlphabetIndexer_popupItemBorderRadius_null')
              .popupItemBorderRadius(null)

            AlphabetIndexer({ arrayValue: this.value, selected: 0 })
              .width('30%')
              .height('20%')
              .id('AlphabetIndexer_popupItemBorderRadius_undefined')
              .popupItemBorderRadius(undefined)
          }
          .width('100%')

          Text('AlphabetIndexer itemBorderRadius Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            AlphabetIndexer({ arrayValue: this.value, selected: 0 })
              .width('30%')
              .height('20%')
              .id('AlphabetIndexer_itemBorderRadius_default')

            AlphabetIndexer({ arrayValue: this.value, selected: 0 })
              .width('30%')
              .height('20%')
              .id('AlphabetIndexer_itemBorderRadius_null')
              .itemBorderRadius(null)

            AlphabetIndexer({ arrayValue: this.value, selected: 0 })
              .width('30%')
              .height('20%')
              .id('AlphabetIndexer_itemBorderRadius_undefined')
              .itemBorderRadius(undefined)
          }
          .width('100%')

          Text('AlphabetIndexer popupBackgroundBlurStyle Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            AlphabetIndexer({ arrayValue: this.value, selected: 0 })
              .width('30%')
              .height('20%')
              .id('AlphabetIndexer_popupBackgroundBlurStyle_default')

            AlphabetIndexer({ arrayValue: this.value, selected: 0 })
              .width('30%')
              .height('20%')
              .id('AlphabetIndexer_popupBackgroundBlurStyle_null')
              .popupBackgroundBlurStyle(null)

            AlphabetIndexer({ arrayValue: this.value, selected: 0 })
              .width('30%')
              .height('20%')
              .id('AlphabetIndexer_popupBackgroundBlurStyle_undefined')
              .popupBackgroundBlurStyle(undefined)
          }
          .width('100%')

          Text('AlphabetIndexer popupTitleBackground Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            AlphabetIndexer({ arrayValue: this.value, selected: 0 })
              .width('30%')
              .height('20%')
              .id('AlphabetIndexer_popupTitleBackground_default')

            AlphabetIndexer({ arrayValue: this.value, selected: 0 })
              .width('30%')
              .height('20%')
              .id('AlphabetIndexer_popupTitleBackground_null')
              .popupTitleBackground(null)

            AlphabetIndexer({ arrayValue: this.value, selected: 0 })
              .width('30%')
              .height('20%')
              .id('AlphabetIndexer_popupTitleBackground_undefined')
              .popupTitleBackground(undefined)
          }
          .width('100%')

          Text('AlphabetIndexer enableHapticFeedback Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            AlphabetIndexer({ arrayValue: this.value, selected: 0 })
              .width('25%')
              .height('20%')
              .id('AlphabetIndexer_enableHapticFeedback_default')

            AlphabetIndexer({ arrayValue: this.value, selected: 0 })
              .width('25%')
              .height('20%')
              .id('AlphabetIndexer_enableHapticFeedback_null')
              .enableHapticFeedback(null)

            AlphabetIndexer({ arrayValue: this.value, selected: 0 })
              .width('25%')
              .height('20%')
              .id('AlphabetIndexer_enableHapticFeedback_undefined')
              .enableHapticFeedback(undefined)

            AlphabetIndexer({ arrayValue: this.value, selected: 0 })
              .width('25%')
              .height('20%')
              .id('AlphabetIndexer_enableHapticFeedback_false')
              .enableHapticFeedback(false)
          }
          .width('100%')

        }
      }

      }
      .width('100%')
      .height('100%')
  }
}
