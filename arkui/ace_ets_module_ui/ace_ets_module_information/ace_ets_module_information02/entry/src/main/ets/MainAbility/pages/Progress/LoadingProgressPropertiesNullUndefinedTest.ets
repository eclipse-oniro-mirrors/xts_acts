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
struct LoadingProgressPropertiesNullUndefinedTest {
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
            LoadingProgress()
              .width('30%')
              .height('5%')
              .id('LoadingProgress_color_default')

            // Null
            LoadingProgress()
              .width('30%')
              .height('5%')
              .id('LoadingProgress_color_null')
              .color(null)

            // Undefined
            LoadingProgress()
              .width('30%')
              .height('5%')
              .id('LoadingProgress_color_undefined')
              .color(undefined)
          }
          .width('100%')

          // ========== contentModifier tests ==========
          Text('contentModifier Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            LoadingProgress()
              .width('30%')
              .height('5%')
              .id('LoadingProgress_contentModifier_default')

            // Null
            LoadingProgress()
              .width('30%')
              .height('5%')
              .id('LoadingProgress_contentModifier_null')
              .contentModifier(null)

            // Undefined
            LoadingProgress()
              .width('30%')
              .height('5%')
              .id('LoadingProgress_contentModifier_undefined')
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
