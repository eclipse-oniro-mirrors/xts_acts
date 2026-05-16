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
struct CircleNullUndefined3Test {
  build() {
    Column() {
      // ========== strokeWidth tests ==========
      Row() {
        // Valid parameters (对照)
        Circle()
          .width(80)
          .height(80)
          .fill(Color.Red)
          .stroke(Color.Blue)
          .strokeWidth(4)
          .id('Circle_strokeWidth_valid')

        // strokeWidth with null
        Circle()
          .width(80)
          .height(80)
          .fill(Color.Red)
          .stroke(Color.Blue)
          .strokeWidth(null)
          .id('Circle_strokeWidth_null')

        // strokeWidth with undefined
        Circle()
          .width(80)
          .height(80)
          .fill(Color.Red)
          .stroke(Color.Blue)
          .strokeWidth(undefined)
          .id('Circle_strokeWidth_undefined')
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceEvenly)

      // ========== strokeDashOffset tests ==========
      Row() {
        // Valid parameters (对照)
        Circle()
          .width(80)
          .height(40)
          .stroke(Color.Blue)
          .strokeWidth(2)
          .strokeDashArray([10, 5])
          .strokeDashOffset(5)
          .id('Circle_strokeDashOffset_valid')

        // strokeDashOffset with null
        Circle()
          .width(80)
          .height(40)
          .stroke(Color.Blue)
          .strokeWidth(2)
          .strokeDashArray([10, 5])
          .strokeDashOffset(null)
          .id('Circle_strokeDashOffset_null')

        // strokeDashOffset with undefined
        Circle()
          .width(80)
          .height(40)
          .stroke(Color.Blue)
          .strokeWidth(2)
          .strokeDashArray([10, 5])
          .strokeDashOffset(undefined)
          .id('Circle_strokeDashOffset_undefined')
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceEvenly)

      // ========== strokeDashArray tests ==========
      Row() {
        // Valid parameters (对照)
        Circle()
          .width(80)
          .height(40)
          .stroke(Color.Green)
          .strokeWidth(2)
          .strokeDashArray([10, 5])
          .id('Circle_strokeDashArray_valid')

        // strokeDashArray with null
        Circle()
          .width(80)
          .height(40)
          .stroke(Color.Green)
          .strokeWidth(2)
          .strokeDashArray(null)
          .id('Circle_strokeDashArray_null')

        // strokeDashArray with undefined
        Circle()
          .width(80)
          .height(40)
          .stroke(Color.Green)
          .strokeWidth(2)
          .strokeDashArray(undefined)
          .id('Circle_strokeDashArray_undefined')

        // strokeDashArray with empty array
        Circle()
          .width(80)
          .height(40)
          .stroke(Color.Green)
          .strokeWidth(2)
          .strokeDashArray([])
          .id('Circle_strokeDashArray_empty')
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceEvenly)

      Row() {
        // Valid parameters - true
        Circle()
          .width(60)
          .height(40)
          .stroke(Color.Green)
          .strokeWidth(2)
          .strokeLineJoin(LineJoinStyle.Miter)
          .antiAlias(true)
          .id('Circle_antiAlias_true')

        // Valid parameters - false
        Circle()
          .width(60)
          .height(40)
          .stroke(Color.Green)
          .strokeWidth(2)
          .strokeLineJoin(LineJoinStyle.Miter)
          .antiAlias(false)
          .id('Circle_antiAlias_false')

        // antiAlias with null
        Circle()
          .width(60)
          .height(40)
          .stroke(Color.Green)
          .strokeWidth(2)
          .strokeLineJoin(LineJoinStyle.Miter)
          .antiAlias(null)
          .id('Circle_antiAlias_null')

        // antiAlias with undefined
        Circle()
          .width(60)
          .height(40)
          .stroke(Color.Green)
          .strokeWidth(2)
          .strokeLineJoin(LineJoinStyle.Miter)
          .antiAlias(undefined)
          .id('Circle_antiAlias_undefined')
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceEvenly)
    }
    .width('100%')
    .height('100%')
    .padding({ left: 5, right: 5, top: 5, bottom: 5 })
  }
}
