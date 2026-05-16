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
struct ProgressPropertiesNullUndefinedTest {
  build() {
    Column() {
      Scroll() {
        Column() {
          // ========== value tests ==========
          Text('value Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            Progress({ value: 0, total: 100 })
              .width('30%')
              .height('5%')
              .id('Progress_value_default')

            // Null
            Progress({ value: 0, total: 100 })
              .width('30%')
              .height('5%')
              .id('Progress_value_null')
              .value(null)

            // Undefined
            Progress({ value: 0, total: 100 })
              .width('30%')
              .height('5%')
              .id('Progress_value_undefined')
              .value(undefined)
          }
          .width('100%')

          // ========== color tests ==========
          Text('color Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            Progress({ value: 50, total: 100 })
              .width('30%')
              .height('5%')
              .id('Progress_color_default')

            // Null
            Progress({ value: 50, total: 100 })
              .width('30%')
              .height('5%')
              .id('Progress_color_null')
              .color(null)

            // Undefined
            Progress({ value: 50, total: 100 })
              .width('30%')
              .height('5%')
              .id('Progress_color_undefined')
              .color(undefined)
          }
          .width('100%')

          // ========== style tests ==========
          Text('style Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            Progress({ value: 50, total: 100 })
              .width('30%')
              .height('5%')
              .id('Progress_style_default')

            // Null
            Progress({ value: 50, total: 100 })
              .width('30%')
              .height('5%')
              .id('Progress_style_null')
              .style(null)

            // Undefined
            Progress({ value: 50, total: 100 })
              .width('30%')
              .height('5%')
              .id('Progress_style_undefined')
              .style(undefined)
          }
          .width('100%')

          // ========== contentModifier tests ==========
          Text('contentModifier Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            Progress({ value: 50, total: 100 })
              .width('30%')
              .height('5%')
              .id('Progress_contentModifier_default')

            // Null
            Progress({ value: 50, total: 100 })
              .width('30%')
              .height('5%')
              .id('Progress_contentModifier_null')
              .contentModifier(null)

            // Undefined
            Progress({ value: 50, total: 100 })
              .width('30%')
              .height('5%')
              .id('Progress_contentModifier_undefined')
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
