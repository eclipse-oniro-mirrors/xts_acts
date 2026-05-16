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
struct TextTimerPropertiesNullUndefinedTest {
  build() {

    Column() {
      Scroll(){
        Column(){
          // ========== format tests ==========
          Text('format Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            TextTimer()
              .width('30%')
              .height('5%')
              .id('TextTimer_format_default')

            // Null
            TextTimer()
              .width('30%')
              .height('5%')
              .id('TextTimer_format_null')
              .format(null)

            // Undefined
            TextTimer()
              .width('30%')
              .height('5%')
              .id('TextTimer_format_undefined')
              .format(undefined)

            // Empty String
            TextTimer()
              .width('30%')
              .height('5%')
              .id('TextTimer_format_empty')
              .format('')
          }
          .width('100%')

          // ========== fontColor tests ==========
          Text('fontColor Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            TextTimer()
              .width('30%')
              .height('5%')
              .id('TextTimer_fontColor_default')

            // Null
            TextTimer()
              .width('30%')
              .height('5%')
              .id('TextTimer_fontColor_null')
              .fontColor(null)

            // Undefined
            TextTimer()
              .width('30%')
              .height('5%')
              .id('TextTimer_fontColor_undefined')
              .fontColor(undefined)

            // Empty String
            TextTimer()
              .width('30%')
              .height('5%')
              .id('TextTimer_fontColor_empty')
              .fontColor('')
          }
          .width('100%')

          // ========== fontSize tests ==========
          Text('fontSize Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            TextTimer()
              .width('30%')
              .height('5%')
              .id('TextTimer_fontSize_default')

            // Null
            TextTimer()
              .width('30%')
              .height('5%')
              .id('TextTimer_fontSize_null')
              .fontSize(null)

            // Undefined
            TextTimer()
              .width('30%')
              .height('5%')
              .id('TextTimer_fontSize_undefined')
              .fontSize(undefined)

            // Empty String
            TextTimer()
              .width('30%')
              .height('5%')
              .id('TextTimer_fontSize_empty')
              .fontSize('')
          }
          .width('100%')

          // ========== fontStyle tests ==========
          Text('fontStyle Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            TextTimer()
              .width('30%')
              .height('5%')
              .id('TextTimer_fontStyle_default')

            // Null
            TextTimer()
              .width('30%')
              .height('5%')
              .id('TextTimer_fontStyle_null')
              .fontStyle(null)

            // Undefined
            TextTimer()
              .width('30%')
              .height('5%')
              .id('TextTimer_fontStyle_undefined')
              .fontStyle(undefined)
          }
          .width('100%')

          // ========== fontWeight tests ==========
          Text('fontWeight Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            TextTimer()
              .width('20%')
              .height('5%')
              .id('TextTimer_fontWeight_default')

            // Null
            TextTimer()
              .width('20%')
              .height('5%')
              .id('TextTimer_fontWeight_null')
              .fontWeight(null)

            // Undefined
            TextTimer()
              .width('20%')
              .height('5%')
              .id('TextTimer_fontWeight_undefined')
              .fontWeight(undefined)

            // Empty String
            TextTimer()
              .width('20%')
              .height('5%')
              .id('TextTimer_fontWeight_empty')
              .fontWeight('')
            // Number
            TextTimer()
              .width('20%')
              .height('5%')
              .id('TextTimer_fontWeight_number')
              .fontWeight(400)
          }
          .width('100%')

          // ========== fontFamily tests ==========
          Text('fontFamily Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            TextTimer()
              .width('30%')
              .height('5%')
              .id('TextTimer_fontFamily_default')

            // Null
            TextTimer()
              .width('30%')
              .height('5%')
              .id('TextTimer_fontFamily_null')
              .fontFamily(null)

            // Undefined
            TextTimer()
              .width('30%')
              .height('5%')
              .id('TextTimer_fontFamily_undefined')
              .fontFamily(undefined)

            // Empty String
            TextTimer()
              .width('30%')
              .height('5%')
              .id('TextTimer_fontFamily_empty')
              .fontFamily('')
          }
          .width('100%')

          // ========== textShadow tests ==========
          Text('textShadow Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            TextTimer()
              .width('30%')
              .height('5%')
              .id('TextTimer_textShadow_default')

            // Null
            TextTimer()
              .width('30%')
              .height('5%')
              .id('TextTimer_textShadow_null')
              .textShadow(null)

            // Undefined
            TextTimer()
              .width('30%')
              .height('5%')
              .id('TextTimer_textShadow_undefined')
              .textShadow(undefined)
          }
          .width('100%')

          // ========== contentModifier tests ==========
          Text('contentModifier Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            TextTimer()
              .width('30%')
              .height('5%')
              .id('TextTimer_contentModifier_default')

            // Null
            TextTimer()
              .width('30%')
              .height('5%')
              .id('TextTimer_contentModifier_null')
              .contentModifier(null)

            // Undefined
            TextTimer()
              .width('30%')
              .height('5%')
              .id('TextTimer_contentModifier_undefined')
              .contentModifier(undefined)
          }
          .width('100%')
        }
      }

    }
    .width('100%')
    .height('100%')
  }
}
