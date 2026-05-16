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
struct ColumnNullUndefinedTest {
  build() {
    Column() {
      // ========== alignItems tests ==========
      Row() {
        // Test alignItems default value (未设置 alignItems)
        Column() {
          Text('Child1')
            .width('80%')
            .height('40%')
            .backgroundColor(0xAFEEEE)
          Text('Child2')
            .width('80%')
            .height('40%')
            .backgroundColor(0x00FFFF)
        }
        .width('23%')
        .height('80%')
        .id('column_alignItems_default')
        .backgroundColor(0xF0F0F0)

        // Test alignItems with null parameter
        Column() {
          Text('Child1')
            .width('80%')
            .height('40%')
            .backgroundColor(0xAFEEEE)
          Text('Child2')
            .width('80%')
            .height('40%')
            .backgroundColor(0x00FFFF)
        }
        .width('23%')
        .height('80%')
        .id('column_alignItems_null')
        .backgroundColor(0xF0F0F0)
        .alignItems(null)

        // Test alignItems with undefined parameter
        Column() {
          Text('Child1')
            .width('80%')
            .height('40%')
            .backgroundColor(0xAFEEEE)
          Text('Child2')
            .width('80%')
            .height('40%')
            .backgroundColor(0x00FFFF)
        }
        .width('23%')
        .height('80%')
        .id('column_alignItems_undefined')
        .backgroundColor(0xF0F0F0)
        .alignItems(undefined)
      }
      .width('100%')
      .height('30%')
      .justifyContent(FlexAlign.SpaceEvenly)

      // ========== justifyContent tests ==========
      Row() {
        // Test justifyContent default value (未设置 justifyContent)
        Column() {
          Text('Child1')
            .width('90%')
            .height('40%')
            .backgroundColor(0xAFEEEE)
          Text('Child2')
            .width('90%')
            .height('40%')
            .backgroundColor(0x00FFFF)
        }
        .width('23%')
        .height('80%')
        .id('column_justifyContent_default')
        .backgroundColor(0xF0F0F0)

        // Test justifyContent with null parameter
        Column() {
          Text('Child1')
            .width('90%')
            .height('40%')
            .backgroundColor(0xAFEEEE)
          Text('Child2')
            .width('90%')
            .height('40%')
            .backgroundColor(0x00FFFF)
        }
        .width('23%')
        .height('80%')
        .id('column_justifyContent_null')
        .backgroundColor(0xF0F0F0)
        .justifyContent(null)

        // Test justifyContent with undefined parameter
        Column() {
          Text('Child1')
            .width('90%')
            .height('40%')
            .backgroundColor(0xAFEEEE)
          Text('Child2')
            .width('90%')
            .height('40%')
            .backgroundColor(0x00FFFF)
        }
        .width('23%')
        .height('80%')
        .id('column_justifyContent_undefined')
        .backgroundColor(0xF0F0F0)
        .justifyContent(undefined)
      }
      .width('100%')
      .height('30%')
      .justifyContent(FlexAlign.SpaceEvenly)

      // ========== reverse tests ==========
      Row() {
        // Test reverse with true parameter (对照)
        Column() {
          Text('1')
            .id('column_reverse_true_child1')
            .width('80%')
            .height('40%')
            .backgroundColor(0xAFEEEE)
          Text('2')
            .id('column_reverse_true_child2')
            .width('80%')
            .height('40%')
            .backgroundColor(0x00FFFF)
        }
        .width('23%')
        .height('80%')
        .id('column_reverse_true')
        .backgroundColor(0xF0F0F0)
        .reverse(true)

        // Test reverse with null parameter
        Column() {
          Text('1')
            .id('column_reverse_null_child1')
            .width('80%')
            .height('40%')
            .backgroundColor(0xAFEEEE)
          Text('2')
            .id('column_reverse_null_child2')
            .width('80%')
            .height('40%')
            .backgroundColor(0x00FFFF)
        }
        .width('23%')
        .height('80%')
        .id('column_reverse_null')
        .backgroundColor(0xF0F0F0)
        .reverse(null)

        // Test reverse with undefined parameter
        Column() {
          Text('1')
            .id('column_reverse_undefined_child1')
            .width('80%')
            .height('40%')
            .backgroundColor(0xAFEEEE)
          Text('2')
            .id('column_reverse_undefined_child2')
            .width('80%')
            .height('40%')
            .backgroundColor(0x00FFFF)
        }
        .width('23%')
        .height('80%')
        .id('column_reverse_undefined')
        .backgroundColor(0xF0F0F0)
        .reverse(undefined)
      }
      .width('100%')
      .height('30%')
      .justifyContent(FlexAlign.SpaceEvenly)
    }
    .width('100%')
    .height('100%')
    .padding({ left: 5, right: 5, top: 5, bottom: 5 })
  }
}
