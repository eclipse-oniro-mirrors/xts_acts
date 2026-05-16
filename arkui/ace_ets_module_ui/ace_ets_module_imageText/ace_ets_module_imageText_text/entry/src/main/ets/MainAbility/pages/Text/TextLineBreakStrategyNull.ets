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
struct TextLineBreakStrategyNull {
  build() {
    Column({ space: 2 }) {
      Row() {
        Text('Text lineBreakStrategy Test')
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 20, bottom: 20 })
      }

      // Test 1: lineBreakStrategy with null parameter
      Text('lineBreakStrategy with null')
        .id('text_lineBreakStrategy_null')
        .lineBreakStrategy(null)
        .height('5%')

      // Test 2: lineBreakStrategy with undefined parameter
      Text('lineBreakStrategy with undefined')
        .id('text_lineBreakStrategy_undefined')
        .lineBreakStrategy(undefined)
        .height('5%')

      // Test 3: Default lineBreakStrategy for comparison
      Text('Default lineBreakStrategy (for comparison)')
        .id('text_lineBreakStrategy_default')
        .height('5%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}
