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
struct CircleNullUndefined2Test {
  build() {
    Column() {
      // ========== strokeLineJoin tests ==========
      Row() {
        // Valid parameters (对照)
        Circle()
          .width(50)
          .height(40)
          .stroke(Color.Orange)
          .strokeWidth(2)
          .strokeLineJoin(LineJoinStyle.Round)
          .id('Circle_strokeLineJoin_valid')

        // strokeLineJoin with null
        Circle()
          .width(50)
          .height(40)
          .stroke(Color.Orange)
          .strokeWidth(2)
          .strokeLineJoin(null)
          .id('Circle_strokeLineJoin_null')

        // strokeLineJoin with undefined
        Circle()
          .width(50)
          .height(40)
          .stroke(Color.Orange)
          .strokeWidth(2)
          .strokeLineJoin(undefined)
          .id('Circle_strokeLineJoin_undefined')
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceEvenly)

      // ========== strokeOpacity tests ==========
      Row() {
        // Valid parameters (对照)
        Circle()
          .width(50)
          .height(50)
          .fill(Color.Red)
          .stroke(Color.Blue)
          .strokeWidth(2)
          .strokeOpacity(0.5)
          .id('Circle_strokeOpacity_valid')

        // strokeOpacity with null
        Circle()
          .width(50)
          .height(50)
          .fill(Color.Red)
          .stroke(Color.Blue)
          .strokeWidth(2)
          .strokeOpacity(null)
          .id('Circle_strokeOpacity_null')

        // strokeOpacity with undefined
        Circle()
          .width(50)
          .height(50)
          .fill(Color.Red)
          .stroke(Color.Blue)
          .strokeWidth(2)
          .strokeOpacity(undefined)
          .id('Circle_strokeOpacity_undefined')
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceEvenly)

      // ========== fillOpacity tests ==========
      Row() {
        // Valid parameters (对照)
        Circle()
          .width(50)
          .height(50)
          .fill(Color.Red)
          .fillOpacity(0.5)
          .id('Circle_fillOpacity_valid')

        // fillOpacity with null
        Circle()
          .width(50)
          .height(50)
          .fill(Color.Red)
          .fillOpacity(null)
          .id('Circle_fillOpacity_null')

        // fillOpacity with undefined
        Circle()
          .width(50)
          .height(50)
          .fill(Color.Red)
          .fillOpacity(undefined)
          .id('Circle_fillOpacity_undefined')
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceEvenly)
    }
    .width('100%')
    .height('100%')
    .padding(2)
  }
}
