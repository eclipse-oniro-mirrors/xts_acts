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
struct CircleNullUndefinedTest {
  build() {
    Column() {
      // ========== fill tests ==========
      Row() {
        // Valid parameters (对照)
        Circle()
          .width(50)
          .height(50)
          .fill(Color.Red)
          .id('Circle_fill_valid')

        // fill with null
        Circle()
        .width(50)
        .height(50)
        .fill(null)
        .id('Circle_fill_null')

        // fill with undefined
        Circle()
        .width(50)
        .height(50)
        .fill(undefined)
        .id('Circle_fill_undefined')

        // fill with empty string
        Circle()
        .width(50)
        .height(50)
        .fill('')
        .id('Circle_fill_empty')
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceEvenly)

      // ========== stroke tests ==========
      Row() {
        // Valid parameters (对照)
        Circle()
        .width(50)
        .height(50)
        .stroke(Color.Blue)
        .strokeWidth(5)
        .fill(Color.Red)
        .id('Circle_stroke_valid')

        // stroke with null
        Circle()
        .width(50)
        .height(50)
        .stroke(null)
        .strokeWidth(5)
        .fill(Color.Red)
        .id('Circle_stroke_null')

        // stroke with undefined
        Circle()
        .width(50)
        .height(50)
        .stroke(undefined)
        .strokeWidth(5)
        .fill(Color.Red)
        .id('Circle_stroke_undefined')

        // stroke with empty string
        Circle()
        .width(50)
        .height(50)
        .stroke('')
        .strokeWidth(5)
        .fill(Color.Red)
        .id('Circle_stroke_empty')
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceEvenly)

      // ========== strokeLineCap tests ==========
      Row() {
        // Valid parameters (对照)
        Circle()
        .width(50)
        .height(40)
        .stroke(Color.Green)
        .strokeWidth(4)
        .strokeLineCap(LineCapStyle.Round)
        .id('Circle_strokeLineCap_valid')

        // strokeLineCap with null
        Circle()
        .width(50)
        .height(40)
        .stroke(Color.Green)
        .strokeWidth(4)
        .strokeLineCap(null)
        .id('Circle_strokeLineCap_null')

        // strokeLineCap with undefined
        Circle()
          .width(50)
        .height(40)
        .stroke(Color.Green)
        .strokeWidth(4)
        .strokeLineCap(undefined)
        .id('Circle_strokeLineCap_undefined')
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceEvenly)
    }
    .width('100%')
    .height('100%')
    .padding(2)
  }
}
