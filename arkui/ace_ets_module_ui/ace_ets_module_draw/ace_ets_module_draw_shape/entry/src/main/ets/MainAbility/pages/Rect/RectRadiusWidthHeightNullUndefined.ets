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
struct RectRadiusWidthHeightNullUndefinedTest {
  build() {
    Column() {
      Text('Rect radiusWidth/radiusHeight/radius Test Page')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      // ========== radiusWidth tests ==========
      Text('radiusWidth Tests')
        .fontSize(16)
        .margin({ top: 10, bottom: 5 })
      Row() {
        // Valid parameters (对照)
        Rect({ width: 80, height: 80 })
          .radiusWidth(20)
          .radiusHeight(20)
          .fill(Color.Pink)
          .id('rect_radiuswidth_valid')

        // radiusWidth with null
        Rect({ width: 80, height: 80 })
          .radiusWidth(null)
          .radiusHeight(20)
          .fill(Color.Pink)
          .id('rect_radiuswidth_null')

        // radiusWidth with undefined
        Rect({ width: 80, height: 80 })
          .radiusWidth(undefined)
          .radiusHeight(20)
          .fill(Color.Pink)
          .id('rect_radiuswidth_undefined')

        // radiusWidth with empty string
        Rect({ width: 80, height: 80 })
          .radiusWidth('')
          .radiusHeight(20)
          .fill(Color.Pink)
          .id('rect_radiuswidth_empty')
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceEvenly)

      // ========== radiusHeight tests ==========
      Text('radiusHeight Tests')
        .fontSize(16)
        .margin({ top: 10, bottom: 5 })
      Row() {
        // Valid parameters (对照)
        Rect({ width: 80, height: 80 })
          .radiusWidth(20)
          .radiusHeight(20)
          .fill(Color.Blue)
          .id('rect_radiusheight_valid')

        // radiusHeight with null
        Rect({ width: 80, height: 80 })
          .radiusWidth(20)
          .radiusHeight(null)
          .fill(Color.Blue)
          .id('rect_radiusheight_null')

        // radiusHeight with undefined
        Rect({ width: 80, height: 80 })
          .radiusWidth(20)
          .radiusHeight(undefined)
          .fill(Color.Blue)
          .id('rect_radiusheight_undefined')

        // radiusHeight with empty string
        Rect({ width: 80, height: 80 })
          .radiusWidth(20)
          .radiusHeight('')
          .fill(Color.Blue)
          .id('rect_radiusheight_empty')
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceEvenly)

      // ========== radius tests (Length type) ==========
      Text('radius Tests (Length)')
        .fontSize(16)
        .margin({ top: 10, bottom: 5 })
      Row() {
        // Valid parameters (对照)
        Rect({ width: 80, height: 80 })
          .radius(20)
          .fill(Color.Green)
          .id('rect_radius_valid')

        // radius with null
        Rect({ width: 80, height: 80 })
          .radius(null)
          .fill(Color.Green)
          .id('rect_radius_null')

        // radius with undefined
        Rect({ width: 80, height: 80 })
          .radius(undefined)
          .fill(Color.Green)
          .id('rect_radius_undefined')

        // radius with empty string
        Rect({ width: 80, height: 80 })
          .radius('')
          .fill(Color.Green)
          .id('rect_radius_empty')
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceEvenly)

      // ========== radius tests (Array type) ==========
      Text('radius Tests (Array)')
        .fontSize(16)
        .margin({ top: 10, bottom: 5 })
      Row() {
        // Valid parameters (对照)
        Rect({ width: 80, height: 80 })
          .radius([[20, 20], [10, 10], [20, 20], [10, 10]])
          .fill(Color.Orange)
          .id('rect_radius_array_valid')

        // radius with null array
        Rect({ width: 80, height: 80 })
          .radius([null, [10, 10], [20, 20], [10, 10]])
          .fill(Color.Orange)
          .id('rect_radius_array_null')

        // radius with undefined array
        Rect({ width: 80, height: 80 })
          .radius([undefined, [10, 10], [20, 20], [10, 10]])
          .fill(Color.Orange)
          .id('rect_radius_array_undefined')

        // radius with empty string in array
        Rect({ width: 80, height: 80 })
          .radius([['', ''], [10, 10], [20, 20], [10, 10]])
          .fill(Color.Orange)
          .id('rect_radius_array_empty')
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceEvenly)
    }
    .width('100%')
    .height('100%')
    .padding({ left: 5, right: 5, top: 5, bottom: 5 })
  }
}
