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
struct BlankColorNullUndefinedTest {
  build() {
    Column() {
      // ========== color tests ==========
      Row() {
        // Test color default value (未设置 color)
        Row() {
          Text('Left')
            .width('30%')
            .height('40%')
            .backgroundColor(0xAFEEEE)
          Blank()
            .id('blank_color_default')
          Text('Right')
            .width('30%')
            .height('40%')
            .backgroundColor(0x00FFFF)
        }
        .width('30%')
        .height('80%')
        .backgroundColor(0xF0F0F0)

        // Test color with null parameter
        Row() {
          Text('Left')
            .width('30%')
            .height('40%')
            .backgroundColor(0xAFEEEE)
          Blank()
            .id('blank_color_null')
            .color(null)
          Text('Right')
            .width('30%')
            .height('40%')
            .backgroundColor(0x00FFFF)
        }
        .width('30%')
        .height('80%')
        .backgroundColor(0xF0F0F0)

        // Test color with undefined parameter
        Row() {
          Text('Left')
            .width('30%')
            .height('40%')
            .backgroundColor(0xAFEEEE)
          Blank()
            .id('blank_color_undefined')
            .color(undefined)
          Text('Right')
            .width('30%')
            .height('40%')
            .backgroundColor(0x00FFFF)
        }
        .width('30%')
        .height('80%')
        .backgroundColor(0xF0F0F0)
      }
      .width('100%')
      .height('50%')
      .justifyContent(FlexAlign.SpaceEvenly)

      // ========== color empty string tests ==========
      Row() {
        // Test color with empty string parameter
        Row() {
          Text('Left')
            .width('30%')
            .height('40%')
            .backgroundColor(0xAFEEEE)
          Blank()
            .id('blank_color_empty')
            .color('')
          Text('Right')
            .width('30%')
            .height('40%')
            .backgroundColor(0x00FFFF)
        }
        .width('30%')
        .height('80%')
        .backgroundColor(0xF0F0F0)

        // Test color with valid value (对照)
        Row() {
          Text('Left')
            .width('30%')
            .height('40%')
            .backgroundColor(0xAFEEEE)
          Blank()
            .id('blank_color_valid')
            .color(Color.Yellow)
          Text('Right')
            .width('30%')
            .height('40%')
            .backgroundColor(0x00FFFF)
        }
        .width('30%')
        .height('80%')
        .backgroundColor(0xF0F0F0)
      }
      .width('100%')
      .height('50%')
      .justifyContent(FlexAlign.SpaceEvenly)
    }
    .width('100%')
    .height('100%')
    .padding({ left: 5, right: 5, top: 5, bottom: 5 })
  }
}
