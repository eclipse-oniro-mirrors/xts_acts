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
struct DividerLineCapNullUndefinedTest {
  build() {
    Column() {
      // ========== lineCap tests ==========
      Row() {
        // Test lineCap default value (未设置 lineCap)
        Column() {
          Divider()
            .id('divider_linecap_default')
            .strokeWidth(20)
            .width('80%')
            .color(0xF1F3F5)
        }
        .width('30%')
        .height('80%')
        .backgroundColor(0xF0F0F0)
        .justifyContent(FlexAlign.Center)

        // Test lineCap with null parameter
        Column() {
          Divider()
            .id('divider_linecap_null')
            .strokeWidth(20)
            .width('80%')
            .color(0xF1F3F5)
            .lineCap(null)
        }
        .width('30%')
        .height('80%')
        .backgroundColor(0xF0F0F0)
        .justifyContent(FlexAlign.Center)

        // Test lineCap with undefined parameter
        Column() {
          Divider()
            .id('divider_linecap_undefined')
            .strokeWidth(20)
            .width('80%')
            .color(0xF1F3F5)
            .lineCap(undefined)
        }
        .width('30%')
        .height('80%')
        .backgroundColor(0xF0F0F0)
        .justifyContent(FlexAlign.Center)
      }
      .width('100%')
      .height('50%')
      .justifyContent(FlexAlign.SpaceEvenly)

      // ========== lineCap valid value tests ==========
      Row() {
        // Test lineCap with LineCapStyle.Butt (对照)
        Column() {
          Divider()
            .id('divider_linecap_butt')
            .strokeWidth(20)
            .width('80%')
            .color(0xF1F3F5)
            .lineCap(LineCapStyle.Butt)
        }
        .width('30%')
        .height('80%')
        .backgroundColor(0xF0F0F0)
        .justifyContent(FlexAlign.Center)

        // Test lineCap with LineCapStyle.Round
        Column() {
          Divider()
            .id('divider_linecap_round')
            .strokeWidth(20)
            .width('80%')
            .color(0xF1F3F5)
            .lineCap(LineCapStyle.Round)
        }
        .width('30%')
        .height('80%')
        .backgroundColor(0xF0F0F0)
        .justifyContent(FlexAlign.Center)

        // Test lineCap with LineCapStyle.Square
        Column() {
          Divider()
            .id('divider_linecap_square')
            .strokeWidth(20)
            .width('80%')
            .color(0xF1F3F5)
            .lineCap(LineCapStyle.Square)
        }
        .width('30%')
        .height('80%')
        .backgroundColor(0xF0F0F0)
        .justifyContent(FlexAlign.Center)
      }
      .width('100%')
      .height('50%')
      .justifyContent(FlexAlign.SpaceEvenly)
    }
    .width('100%')
    .height('100%')
    .padding(2)
  }
}
