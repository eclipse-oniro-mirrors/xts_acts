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
struct ShapeNullUndefinedTest {
  build() {
    Column() {
      // ========== fill tests ==========
      Row() {
        // Valid parameters (对照)
        Shape() {
          Rect().width(80).height(80)
        }
        .width(50)
        .height(50)
        .viewPort({ x: 0, y: 0, width: 80, height: 80 })
        .fill(Color.Red)
        .id('shape_fill_valid')

        // fill with null
        Shape() {
          Rect().width(80).height(80)
        }
        .width(50)
        .height(50)
        .viewPort({ x: 0, y: 0, width: 80, height: 80 })
        .fill(null)
        .id('shape_fill_null')

        // fill with undefined
        Shape() {
          Rect().width(80).height(80)
        }
        .width(50)
        .height(50)
        .viewPort({ x: 0, y: 0, width: 80, height: 80 })
        .fill(undefined)
        .id('shape_fill_undefined')

        // fill with empty string
        Shape() {
          Rect().width(80).height(80)
        }
        .width(50)
        .height(50)
        .viewPort({ x: 0, y: 0, width: 80, height: 80 })
        .fill('')
        .id('shape_fill_empty')
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceEvenly)

      // ========== stroke tests ==========
      Row() {
        // Valid parameters (对照)
        Shape() {
          Rect().width(80).height(80)
        }
        .width(50)
        .height(50)
        .viewPort({ x: 0, y: 0, width: 80, height: 80 })
        .stroke(Color.Blue)
        .strokeWidth(5)
        .fill(Color.Red)
        .id('shape_stroke_valid')

        // stroke with null
        Shape() {
          Rect().width(80).height(80)
        }
        .width(50)
        .height(50)
        .viewPort({ x: 0, y: 0, width: 80, height: 80 })
        .stroke(null)
        .strokeWidth(5)
        .fill(Color.Red)
        .id('shape_stroke_null')

        // stroke with undefined
        Shape() {
          Rect().width(80).height(80)
        }
        .width(50)
        .height(50)
        .viewPort({ x: 0, y: 0, width: 80, height: 80 })
        .stroke(undefined)
        .strokeWidth(5)
        .fill(Color.Red)
        .id('shape_stroke_undefined')

        // stroke with empty string
        Shape() {
          Rect().width(80).height(80)
        }
        .width(50)
        .height(50)
        .viewPort({ x: 0, y: 0, width: 80, height: 80 })
        .stroke('')
        .strokeWidth(5)
        .fill(Color.Red)
        .id('shape_stroke_empty')
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceEvenly)

      // ========== strokeLineCap tests ==========
      Row() {
        // Valid parameters (对照)
        Shape() {
          Path().width(80).height(40).commands('M0 20 L80 20')
        }
        .width(50)
        .height(40)
        .viewPort({ x: 0, y: 0, width: 80, height: 40 })
        .stroke(Color.Green)
        .strokeWidth(4)
        .strokeLineCap(LineCapStyle.Round)
        .id('shape_strokeLineCap_valid')

        // strokeLineCap with null
        Shape() {
          Path().width(80).height(40).commands('M0 20 L80 20')
        }
        .width(50)
        .height(40)
        .viewPort({ x: 0, y: 0, width: 80, height: 40 })
        .stroke(Color.Green)
        .strokeWidth(4)
        .strokeLineCap(null)
        .id('shape_strokeLineCap_null')

        // strokeLineCap with undefined
        Shape() {
          Path().width(80).height(40).commands('M0 20 L80 20')
        }
        .width(50)
        .height(40)
        .viewPort({ x: 0, y: 0, width: 80, height: 40 })
        .stroke(Color.Green)
        .strokeWidth(4)
        .strokeLineCap(undefined)
        .id('shape_strokeLineCap_undefined')
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceEvenly)
    }
    .width('100%')
    .height('100%')
    .padding(2)
  }
}
