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
struct FlexNullUndefinedTest {
  build() {
    Column({ space: 2 }) {
      Flex() {
        Text('flexBasis()')
          .flexBasis('')
          .height(50)
          .backgroundColor(0xF5DEB3)
          .textAlign(TextAlign.Center)
          .id('FlexNullUndefinedTest_flexBasis_1')
        Text(`flexBasis('null')`)
          .flexBasis(null)
          .width('30%')
          .height(50)
          .backgroundColor(0xD2B48C)
          .textAlign(TextAlign.Center)
          .id('FlexNullUndefinedTest_flexBasis_2')
        Text(`flexBasis('undefined')`)
          .flexBasis(undefined)
          .width('30%')
          .height(50)
          .backgroundColor(0xF5DEB3)
          .textAlign(TextAlign.Center)
          .id('FlexNullUndefinedTest_flexBasis_3')
      }.width('90%').height(60).backgroundColor(0xAFEEEE)

      Flex() {
        Text('flexGrow(null)')
          .flexGrow(null)
          .height(50)
          .backgroundColor(0xF5DEB3)
          .textAlign(TextAlign.Center)
          .id('FlexNullUndefinedTest_flexGrow_1')
        Text('flexGrow(undefined)')
          .flexGrow(undefined)
          .height(50)
          .backgroundColor(0xD2B48C)
          .textAlign(TextAlign.Center)
          .id('FlexNullUndefinedTest_flexGrow_2')
      }.width('90%').height(60).backgroundColor(0xAFEEEE)

      Flex({ direction: FlexDirection.Row }) {
        Text('flexShrink(null)')
          .flexShrink(null)
          .width('50%')
          .height(50)
          .backgroundColor(0xF5DEB3)
          .textAlign(TextAlign.Center)
          .id('FlexNullUndefinedTest_flexShrink_1')
        Text('flexShrink(undefined)')
          .flexShrink(undefined)
          .width('40%')
          .height(50)
          .backgroundColor(0xD2B48C)
          .textAlign(TextAlign.Center)
          .id('FlexNullUndefinedTest_flexShrink_2')
      }.width('90%').height(60).backgroundColor(0xAFEEEE)

      Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center }) {
        Text('alignSelf(null)')
          .alignSelf(null)
          .width('50%')
          .height(50)
          .backgroundColor(0xD2B48C)
          .textAlign(TextAlign.Center)
          .id('FlexNullUndefinedTest_alignSelf_1')
        Text('alignSelf(undefined)')
          .alignSelf(undefined)
          .width('50%')
          .height(50)
          .backgroundColor(0xF5DEB3)
          .textAlign(TextAlign.Center)
          .id('FlexNullUndefinedTest_alignSelf_2')
      }.width('90%').height(60).backgroundColor(0xAFEEEE)
    }.width('100%')
  }
}