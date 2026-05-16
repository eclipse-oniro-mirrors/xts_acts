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
struct ColumnSplitDividerNullUndefinedTest {
  build() {
    Column() {
      // ========== divider tests ==========
      Row() {
        // Test divider default value (未设置 divider)
        ColumnSplit() {
          Text('1')
            .width('100%')
            .height(50)
            .backgroundColor(0xF5DEB3)
            .textAlign(TextAlign.Center)
          Text('2')
            .width('100%')
            .height(50)
            .backgroundColor(0xD2B48C)
            .textAlign(TextAlign.Center)
        }
        .id('columnsplit_divider_default')
        .width('30%')
        .height('80%')
        .backgroundColor(0xF0F0F0)

        // Test divider with null parameter
        ColumnSplit() {
          Text('1')
            .width('100%')
            .height(50)
            .backgroundColor(0xF5DEB3)
            .textAlign(TextAlign.Center)
          Text('2')
            .width('100%')
            .height(50)
            .backgroundColor(0xD2B48C)
            .textAlign(TextAlign.Center)
        }
        .id('columnsplit_divider_null')
        .width('30%')
        .height('80%')
        .backgroundColor(0xF0F0F0)
        .divider(null)

        // Test divider with undefined parameter
        ColumnSplit() {
          Text('1')
            .width('100%')
            .height(50)
            .backgroundColor(0xF5DEB3)
            .textAlign(TextAlign.Center)
          Text('2')
            .width('100%')
            .height(50)
            .backgroundColor(0xD2B48C)
            .textAlign(TextAlign.Center)
        }
        .id('columnsplit_divider_undefined')
        .width('30%')
        .height('80%')
        .backgroundColor(0xF0F0F0)
        .divider(undefined)
      }
      .width('100%')
      .height('50%')
      .justifyContent(FlexAlign.SpaceEvenly)

      // ========== divider valid value tests ==========
      Row() {
        // Test divider with valid value { startMargin: 5, endMargin: 5 }
        ColumnSplit() {
          Text('1')
            .width('100%')
            .height(50)
            .backgroundColor(0xF5DEB3)
            .textAlign(TextAlign.Center)
          Text('2')
            .width('100%')
            .height(50)
            .backgroundColor(0xD2B48C)
            .textAlign(TextAlign.Center)
        }
        .id('columnsplit_divider_valid')
        .width('30%')
        .height('80%')
        .backgroundColor(0xF0F0F0)
        .divider({ startMargin: 5, endMargin: 5 })

        // Test divider with { startMargin: 10, endMargin: 0 }
        ColumnSplit() {
          Text('1')
            .width('100%')
            .height(50)
            .backgroundColor(0xF5DEB3)
            .textAlign(TextAlign.Center)
          Text('2')
            .width('100%')
            .height(50)
            .backgroundColor(0xD2B48C)
            .textAlign(TextAlign.Center)
        }
        .id('columnsplit_divider_start')
        .width('30%')
        .height('80%')
        .backgroundColor(0xF0F0F0)
        .divider({ startMargin: 10, endMargin: 0 })

        // Test divider with { startMargin: 0, endMargin: 10 }
        ColumnSplit() {
          Text('1')
            .width('100%')
            .height(50)
            .backgroundColor(0xF5DEB3)
            .textAlign(TextAlign.Center)
          Text('2')
            .width('100%')
            .height(50)
            .backgroundColor(0xD2B48C)
            .textAlign(TextAlign.Center)
        }
        .id('columnsplit_divider_end')
        .width('30%')
        .height('80%')
        .backgroundColor(0xF0F0F0)
        .divider({ startMargin: 0, endMargin: 10 })
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
