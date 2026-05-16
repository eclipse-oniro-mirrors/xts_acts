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
struct RowAlignItemsJustifyContentReverseNullUndefinedTest {
  build() {
    Column() {
      // ========== alignItems tests ==========
      Row() {
        // Not set alignItems (对照)
        Row() {
          Text('A').width('40%').height('80%').backgroundColor(0xAFEEEE).id('row_alignitems_valid_text1')
          Text('B').width('40%').height('80%').backgroundColor(0x00FFFF).id('row_alignitems_valid_text2')
        }
        .width('30%')
        .height(80)
        .backgroundColor(0xF0F0F0)
        .id('row_alignitems_valid')

        // alignItems with null
        Row() {
          Text('A').width('40%').height('80%').backgroundColor(0xAFEEEE)
          Text('B').width('40%').height('80%').backgroundColor(0x00FFFF)
        }
        .width('30%')
        .height(80)
        .backgroundColor(0xF0F0F0)
        .alignItems(null)
        .id('row_alignitems_null')

        // alignItems with undefined
        Row() {
          Text('A').width('40%').height('80%').backgroundColor(0xAFEEEE)
          Text('B').width('40%').height('80%').backgroundColor(0x00FFFF)
        }
        .width('30%')
        .height(80)
        .backgroundColor(0xF0F0F0)
        .alignItems(undefined)
        .id('row_alignitems_undefined')
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceEvenly)

      // ========== justifyContent tests ==========
      Row() {
        // Not set justifyContent (对照)
        Row() {
          Text('A').width('40%').height('80%').backgroundColor(0xAFEEEE)
          Text('B').width('40%').height('80%').backgroundColor(0x00FFFF)
        }
        .width('30%')
        .height(80)
        .backgroundColor(0xF0F0F0)
        .id('row_justifycontent_valid')

        // justifyContent with null
        Row() {
          Text('A').width('40%').height('80%').backgroundColor(0xAFEEEE)
          Text('B').width('40%').height('80%').backgroundColor(0x00FFFF)
        }
        .width('30%')
        .height(80)
        .backgroundColor(0xF0F0F0)
        .justifyContent(null)
        .id('row_justifycontent_null')

        // justifyContent with undefined
        Row() {
          Text('A').width('40%').height('80%').backgroundColor(0xAFEEEE)
          Text('B').width('40%').height('80%').backgroundColor(0x00FFFF)
        }
        .width('30%')
        .height(80)
        .backgroundColor(0xF0F0F0)
        .justifyContent(undefined)
        .id('row_justifycontent_undefined')
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceEvenly)

      // ========== reverse tests ==========
      Row() {
        // Not set reverse (对照) - 正序: 1, 2
        Row() {
          Text('1').width('40%').height('80%').backgroundColor(0xAFEEEE).id('row_reverse_valid_text1')
          Text('2').width('40%').height('80%').backgroundColor(0x00FFFF).id('row_reverse_valid_text2')
        }
        .width('30%')
        .height(80)
        .backgroundColor(0xF0F0F0)
        .id('row_reverse_valid')

        // reverse with null - 反转: 2, 1
        Row() {
          Text('1').width('40%').height('80%').backgroundColor(0xAFEEEE).id('row_reverse_null_text1')
          Text('2').width('40%').height('80%').backgroundColor(0x00FFFF).id('row_reverse_null_text2')
        }
        .width('30%')
        .height(80)
        .backgroundColor(0xF0F0F0)
        .reverse(null)
        .id('row_reverse_null')

        // reverse with undefined - 反转: 2, 1
        Row() {
          Text('1').width('40%').height('80%').backgroundColor(0xAFEEEE).id('row_reverse_undefined_text1')
          Text('2').width('40%').height('80%').backgroundColor(0x00FFFF).id('row_reverse_undefined_text2')
        }
        .width('30%')
        .height(80)
        .backgroundColor(0xF0F0F0)
        .reverse(undefined)
        .id('row_reverse_undefined')
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceEvenly)
    }
    .width('100%')
    .height('100%')
    .padding(2)
  }
}
