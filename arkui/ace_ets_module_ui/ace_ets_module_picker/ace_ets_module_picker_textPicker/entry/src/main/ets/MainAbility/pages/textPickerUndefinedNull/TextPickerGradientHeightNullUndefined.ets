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

/**
 * TextPicker GradientHeight Test Page
 * 测试TextPicker组件的gradientHeight属性
 */
@Entry
@Component
struct TextPickerGradientHeightNullUndefined {
  build() {
    Row() {
      Column() {
        Text('TextPicker GradientHeight Test')
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 20, bottom: 20 })

        // Test 1: normal value - percentage (50%)
        Text('Test 1: gradientHeight = 50% (half height)')
          .fontSize(16)
          .margin({ top: 10 })
        TextPicker({
          range: [['A', 'B'], ['D', 'E', 'F']]
        })
          .id('textPicker_gradientHeight_50_percent')
          .gradientHeight('50%')
          .height('8%')
          .margin({ top: 5, bottom: 5 })

        // Test 2: normal value - number (36)
        Text('Test 2: gradientHeight = 36 (custom height)')
          .fontSize(16)
          .margin({ top: 10 })
        TextPicker({
          range: [['A', 'B'], ['D', 'E', 'F']]
        })
          .id('textPicker_gradientHeight_36_vp')
          .gradientHeight(36)
          .height('8%')
          .margin({ top: 5, bottom: 5 })

        // Test 3: default value (no gradientHeight set)
        Text('Test 3: default value (default gradient effect)')
          .fontSize(16)
          .margin({ top: 10 })
        TextPicker({
          range: [['A', 'B'], ['D', 'E', 'F']]
        })
          .id('textPicker_gradientHeight_default')
          .height('8%')
          .margin({ top: 5, bottom: 5 })

        // Test 4: null parameter
        Text('Test 4: null parameter (should restore to default)')
          .fontSize(16)
          .margin({ top: 10 })
        TextPicker({
          range: [['A', 'B'], ['D', 'E', 'F']]
        })
          .id('textPicker_gradientHeight_null')
          .gradientHeight(null)
          .height('8%')
          .margin({ top: 5, bottom: 5 })

        // Test 5: undefined parameter
        Text('Test 5: undefined parameter (should restore to default)')
          .fontSize(16)
          .margin({ top: 10 })
        TextPicker({
          range: [['A', 'B'], ['D', 'E', 'F']]
        })
          .id('textPicker_gradientHeight_undefined')
          .gradientHeight(undefined)
          .height('8%')
          .margin({ top: 5, bottom: 5 })

        // Test 6: normal value - 0 (no gradient effect)
        Text('Test 6: gradientHeight = 0 (no gradient effect)')
          .fontSize(16)
          .margin({ top: 10 })
        TextPicker({
          range: [['A', 'B'], ['D', 'E', 'F']]
        })
          .id('textPicker_gradientHeight_0')
          .gradientHeight(0)
          .height('8%')
          .margin({ top: 5, bottom: 5 })

        // Test 7: normal value - negative number
        Text('Test 7: gradientHeight = -10 (invalid, should use default)')
          .fontSize(16)
          .margin({ top: 10 })
        TextPicker({
          range: [['A', 'B'], ['D', 'E', 'F']]
        })
          .id('textPicker_gradientHeight_negative')
          .gradientHeight(-10)
          .height('8%')
          .margin({ top: 5, bottom: 5 })
      }
      .width('100%')
    }
    .height('100%')
  }
}
