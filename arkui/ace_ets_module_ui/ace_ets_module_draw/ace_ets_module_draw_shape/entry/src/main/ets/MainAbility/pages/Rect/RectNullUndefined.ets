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
struct RectNullUndefinedTest {
  build() {
    Column() {
      // ========== strokeMiterLimit tests ==========
      Row() {
        // Valid parameters (对照)
        Rect()
          .width(60)
          .height(40)
          .stroke(Color.Orange)
          .strokeWidth(2)
          .strokeLineJoin(LineJoinStyle.Miter)
          .strokeMiterLimit(5)
          .id('Rect_strokeMiterLimit_valid')

        // strokeMiterLimit with null
        Rect()
          .width(60)
          .height(40)
          .stroke(Color.Orange)
          .strokeWidth(2)
          .strokeLineJoin(LineJoinStyle.Miter)
          .strokeMiterLimit(null)
          .id('Rect_strokeMiterLimit_null')

        // strokeMiterLimit with undefined
        Rect()
          .width(60)
          .height(40)
          .stroke(Color.Orange)
          .strokeWidth(2)
          .strokeLineJoin(LineJoinStyle.Miter)
          .strokeMiterLimit(undefined)
          .id('Rect_strokeMiterLimit_undefined')

        // strokeMiterLimit with empty string
        Rect()
          .width(60)
          .height(40)
          .stroke(Color.Orange)
          .strokeWidth(2)
          .strokeLineJoin(LineJoinStyle.Miter)
          .strokeMiterLimit('')
          .id('Rect_strokeMiterLimit_empty_string')
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceEvenly)

      // ========== antiAlias tests ==========
      Row() {
        // Valid parameters (对照) - true
        Rect()
          .width(80)
          .height(40)
          .stroke(Color.Green)
          .strokeWidth(2)
          .strokeLineJoin(LineJoinStyle.Miter)
          .antiAlias(false)
          .id('Rect_antiAlias_valid')

        // antiAlias with null
        Rect()
          .width(80)
          .height(40)
          .stroke(Color.Green)
          .strokeWidth(2)
          .strokeLineJoin(LineJoinStyle.Miter)
          .antiAlias(null)
          .id('Rect_antiAlias_null')

        // antiAlias with undefined
        Rect()
          .width(80)
          .height(40)
          .stroke(Color.Green)
          .strokeWidth(2)
          .strokeLineJoin(LineJoinStyle.Miter)
          .antiAlias(undefined)
          .id('Rect_antiAlias_undefined')
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceEvenly)
    }
    .width('100%')
    .height('100%')
    .padding({ left: 5, right: 5, top: 5, bottom: 5 })
  }
}