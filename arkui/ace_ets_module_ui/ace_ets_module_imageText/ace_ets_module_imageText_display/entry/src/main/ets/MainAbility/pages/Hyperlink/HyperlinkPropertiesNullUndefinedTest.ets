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
struct HyperlinkPropertiesNullUndefinedTest {
  build() {
    Column() {
      Scroll() {
        Column() {
          // ========== color tests ==========
          Text('color Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            Hyperlink('https://example.com/', 'color default')
              .width('25%')
              .height('5%')
              .id('Hyperlink_color_default')

            // Null
            Hyperlink('https://example.com/', 'color null')
              .width('25%')
              .height('5%')
              .id('Hyperlink_color_null')
              .color(null)

            // Undefined
            Hyperlink('https://example.com/', 'color undefined')
              .width('25%')
              .height('5%')
              .id('Hyperlink_color_undefined')
              .color(undefined)

            // Empty string
            Hyperlink('https://example.com/', 'color ')
              .width('25%')
              .height('5%')
              .id('Hyperlink_color_empty')
              .color('')
          }
          .width('100%')
        }
      }
    }
    .width('100%')
    .height('100%')
  }
}
