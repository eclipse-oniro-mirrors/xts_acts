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
struct ShapeNullUndefined3Test {
  build() {
    Column() {
      Text('Shape strokeWidth/strokeDashOffset/strokeMiterLimit/antiAlias Test Page')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      // ========== strokeWidth tests ==========
      Text('strokeWidth Tests')
        .fontSize(16)
        .margin({ top: 10, bottom: 5 })
      Row() {
        // Valid parameters (对照)
        Shape() {
          Rect().width(80).height(80)
        }
          .width(80)
          .height(80)
          .viewPort({ x: 0, y: 0, width: 80, height: 80 })
          .fill(Color.Red)
          .stroke(Color.Blue)
          .strokeWidth(4)
          .id('shape_strokeWidth_valid')

        // strokeWidth with null
        Shape() {
          Rect().width(80).height(80)
        }
          .width(80)
          .height(80)
          .viewPort({ x: 0, y: 0, width: 80, height: 80 })
          .fill(Color.Red)
          .stroke(Color.Blue)
          .strokeWidth(null)
          .id('shape_strokeWidth_null')

        // strokeWidth with undefined
        Shape() {
          Rect().width(80).height(80)
        }
          .width(80)
          .height(80)
          .viewPort({ x: 0, y: 0, width: 80, height: 80 })
          .fill(Color.Red)
          .stroke(Color.Blue)
          .strokeWidth(undefined)
          .id('shape_strokeWidth_undefined')
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceEvenly)

      // ========== strokeDashOffset tests ==========
      Text('strokeDashOffset Tests')
        .fontSize(16)
        .margin({ top: 10, bottom: 5 })
      Row() {
        // Valid parameters (对照)
        Shape() {
          Path().width(80).height(40).commands('M0 20 L80 20')
        }
          .width(80)
          .height(40)
          .viewPort({ x: 0, y: 0, width: 80, height: 40 })
          .stroke(Color.Blue)
          .strokeWidth(2)
          .strokeDashArray([10, 5])
          .strokeDashOffset(5)
          .id('shape_strokeDashOffset_valid')

        // strokeDashOffset with null
        Shape() {
          Path().width(80).height(40).commands('M0 20 L80 20')
        }
          .width(80)
          .height(40)
          .viewPort({ x: 0, y: 0, width: 80, height: 40 })
          .stroke(Color.Blue)
          .strokeWidth(2)
          .strokeDashArray([10, 5])
          .strokeDashOffset(null)
          .id('shape_strokeDashOffset_null')

        // strokeDashOffset with undefined
        Shape() {
          Path().width(80).height(40).commands('M0 20 L80 20')
        }
          .width(80)
          .height(40)
          .viewPort({ x: 0, y: 0, width: 80, height: 40 })
          .stroke(Color.Blue)
          .strokeWidth(2)
          .strokeDashArray([10, 5])
          .strokeDashOffset(undefined)
          .id('shape_strokeDashOffset_undefined')
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceEvenly)

      // ========== strokeMiterLimit tests ==========
      Text('strokeMiterLimit Tests')
        .fontSize(16)
        .margin({ top: 10, bottom: 5 })
      Row() {
        // Valid parameters (对照)
        Shape() {
          Path().width(80).height(40).commands('M0 40 L40 0 L80 40')
        }
          .width(80)
          .height(40)
          .viewPort({ x: 0, y: 0, width: 80, height: 40 })
          .stroke(Color.Orange)
          .strokeWidth(2)
          .strokeLineJoin(LineJoinStyle.Miter)
          .strokeMiterLimit(5)
          .id('shape_strokeMiterLimit_valid')

        // strokeMiterLimit with null
        Shape() {
          Path().width(80).height(40).commands('M0 40 L40 0 L80 40')
        }
          .width(80)
          .height(40)
          .viewPort({ x: 0, y: 0, width: 80, height: 40 })
          .stroke(Color.Orange)
          .strokeWidth(2)
          .strokeLineJoin(LineJoinStyle.Miter)
          .strokeMiterLimit(null)
          .id('shape_strokeMiterLimit_null')

        // strokeMiterLimit with undefined
        Shape() {
          Path().width(80).height(40).commands('M0 40 L40 0 L80 40')
        }
          .width(80)
          .height(40)
          .viewPort({ x: 0, y: 0, width: 80, height: 40 })
          .stroke(Color.Orange)
          .strokeWidth(2)
          .strokeLineJoin(LineJoinStyle.Miter)
          .strokeMiterLimit(undefined)
          .id('shape_strokeMiterLimit_undefined')
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceEvenly)

      // ========== antiAlias tests ==========
      Text('antiAlias Tests')
        .fontSize(16)
        .margin({ top: 10, bottom: 5 })
      Row() {
        // Valid parameters (对照) - true
        Shape() {
          Path().width(80).height(40).commands('M0 40 L40 0 L80 40')
        }
          .width(80)
          .height(40)
          .viewPort({ x: 0, y: 0, width: 80, height: 40 })
          .stroke(Color.Green)
          .strokeWidth(2)
          .strokeLineJoin(LineJoinStyle.Miter)
          .antiAlias(false)
          .id('shape_antiAlias_valid')

        // antiAlias with null
        Shape() {
          Path().width(80).height(40).commands('M0 40 L40 0 L80 40')
        }
          .width(80)
          .height(40)
          .viewPort({ x: 0, y: 0, width: 80, height: 40 })
          .stroke(Color.Green)
          .strokeWidth(2)
          .strokeLineJoin(LineJoinStyle.Miter)
          .antiAlias(null)
          .id('shape_antiAlias_null')

        // antiAlias with undefined
        Shape() {
          Path().width(80).height(40).commands('M0 40 L40 0 L80 40')
        }
          .width(80)
          .height(40)
          .viewPort({ x: 0, y: 0, width: 80, height: 40 })
          .stroke(Color.Green)
          .strokeWidth(2)
          .strokeLineJoin(LineJoinStyle.Miter)
          .antiAlias(undefined)
          .id('shape_antiAlias_undefined')
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceEvenly)
    }
    .width('100%')
    .height('100%')
    .padding({ left: 5, right: 5, top: 5, bottom: 5 })
  }
}
