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
struct TextAreaPropertiesNullUndefined03Test {
  build() {

    Column() {
      Scroll(){
        Column(){
          // ========== scrollBarColor tests ==========
          Text('scrollBarColor Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            TextArea({ placeholder: 'scrollBarColor default', text: 'Hello World\nHello World\nHello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_scrollBarColor_default')

            // Null
            TextArea({ placeholder: 'scrollBarColor null', text: 'Hello World\nHello World\nHello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_scrollBarColor_null')
              .scrollBarColor(null)

            // Undefined
            TextArea({ placeholder: 'scrollBarColor undefined', text: 'Hello World\nHello World\nHello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_scrollBarColor_undefined')
              .scrollBarColor(undefined)
          }
          .width('100%')

          // ========== minFontSize tests ==========
          Text('minFontSize Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            TextArea({ placeholder: 'minFontSize default', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_minFontSize_default')

            // Null
            TextArea({ placeholder: 'minFontSize null', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_minFontSize_null')
              .minFontSize(null)

            // Undefined
            TextArea({ placeholder: 'minFontSize undefined', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_minFontSize_undefined')
              .minFontSize(undefined)

            // Empty String
            TextArea({ placeholder: 'minFontSize empty string', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_minFontSize_empty')
              .minFontSize('')
          }
          .width('100%')

          // ========== maxFontSize tests ==========
          Text('maxFontSize Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            TextArea({ placeholder: 'maxFontSize default', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_maxFontSize_default')

            // Null
            TextArea({ placeholder: 'maxFontSize null', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_maxFontSize_null')
              .maxFontSize(null)

            // Undefined
            TextArea({ placeholder: 'maxFontSize undefined', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_maxFontSize_undefined')
              .maxFontSize(undefined)

            // Empty String
            TextArea({ placeholder: 'maxFontSize empty string', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_maxFontSize_empty')
              .maxFontSize('')
          }
          .width('100%')

          // ========== maxLines tests ==========
          Text('maxLines Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            TextArea({ placeholder: 'maxLines default', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_maxLines_default')

            // Null
            TextArea({ placeholder: 'maxLines null', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_maxLines_null')
              .maxLines(null,null)

            // Undefined
            TextArea({ placeholder: 'maxLines undefined', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_maxLines_undefined')
              .maxLines(undefined,undefined)
          }
          .width('100%')

          // ========== letterSpacing tests ==========
          Text('letterSpacing Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            TextArea({ placeholder: 'letterSpacing default', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_letterSpacing_default')

            // Null
            TextArea({ placeholder: 'letterSpacing null', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_letterSpacing_null')
              .letterSpacing(null)

            // Undefined
            TextArea({ placeholder: 'letterSpacing undefined', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_letterSpacing_undefined')
              .letterSpacing(undefined)

            // Empty String
            TextArea({ placeholder: 'letterSpacing empty string', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_letterSpacing_empty')
              .letterSpacing('')
          }
          .width('100%')

          // ========== lineHeight tests ==========
          Text('lineHeight Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            TextArea({ placeholder: 'lineHeight default', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_lineHeight_default')

            // Null
            TextArea({ placeholder: 'lineHeight null', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_lineHeight_null')
              .lineHeight(null)

            // Undefined
            TextArea({ placeholder: 'lineHeight undefined', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_lineHeight_undefined')
              .lineHeight(undefined)

            // Empty String
            TextArea({ placeholder: 'lineHeight empty string', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_lineHeight_empty')
              .lineHeight('')
          }
          .width('100%')

          // ========== selectedDragPreviewStyle tests ==========
          Text('selectedDragPreviewStyle Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            TextArea({ placeholder: 'selectedDragPreviewStyle default', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_selectedDragPreviewStyle_default')

            // Null
            TextArea({ placeholder: 'selectedDragPreviewStyle null', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_selectedDragPreviewStyle_null')
              .selectedDragPreviewStyle(null)

            // Undefined
            TextArea({ placeholder: 'selectedDragPreviewStyle undefined', text: 'Hello World' })
              .width('30%')
              .height('5%')
              .id('TextArea_selectedDragPreviewStyle_undefined')
              .selectedDragPreviewStyle(undefined)
          }
          .width('100%')

          // ========== enableAutoFill tests ==========
          Text('enableAutoFill Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            TextArea({ placeholder: 'enableAutoFill default', text: 'Hello World' })
              .width('22%')
              .height('5%')
              .id('TextArea_enableAutoFill_default')

            // Null
            TextArea({ placeholder: 'enableAutoFill null', text: 'Hello World' })
              .width('22%')
              .height('5%')
              .id('TextArea_enableAutoFill_null')
              .enableAutoFill(null)

            // Undefined
            TextArea({ placeholder: 'enableAutoFill undefined', text: 'Hello World' })
              .width('22%')
              .height('5%')
              .id('TextArea_enableAutoFill_undefined')
              .enableAutoFill(undefined)

            // True
            TextArea({ placeholder: 'enableAutoFill true', text: 'Hello World' })
              .width('22%')
              .height('5%')
              .id('TextArea_enableAutoFill_true')
              .enableAutoFill(true)

            // False
            TextArea({ placeholder: 'enableAutoFill false', text: 'Hello World' })
              .width('22%')
              .height('5%')
              .id('TextArea_enableAutoFill_false')
              .enableAutoFill(false)
          }
          .width('100%')

          // ========== enableHapticFeedback tests ==========
          Text('enableHapticFeedback Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            TextArea({ placeholder: 'enableHapticFeedback default', text: 'Hello World' })
              .width('22%')
              .height('5%')
              .id('TextArea_enableHapticFeedback_default')

            // Null
            TextArea({ placeholder: 'enableHapticFeedback null', text: 'Hello World' })
              .width('22%')
              .height('5%')
              .id('TextArea_enableHapticFeedback_null')
              .enableHapticFeedback(null)

            // Undefined
            TextArea({ placeholder: 'enableHapticFeedback undefined', text: 'Hello World' })
              .width('22%')
              .height('5%')
              .id('TextArea_enableHapticFeedback_undefined')
              .enableHapticFeedback(undefined)

            // True
            TextArea({ placeholder: 'enableHapticFeedback true', text: 'Hello World' })
              .width('22%')
              .height('5%')
              .id('TextArea_enableHapticFeedback_true')
              .enableHapticFeedback(true)

            // False
            TextArea({ placeholder: 'enableHapticFeedback false', text: 'Hello World' })
              .width('22%')
              .height('5%')
              .id('TextArea_enableHapticFeedback_false')
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
