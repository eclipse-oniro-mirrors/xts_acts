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
struct LayoutWeightNullUndefinedTest {
  build() {
    Column() {
      Row() {
        Text('lw(1)')
          .size({ width: '25%', height: 110 }).backgroundColor(0xFFEFD5).textAlign(TextAlign.Center)
          .layoutWeight(1)
          .id('LayoutWeightNullUndefinedTest_1')

        Text('lw(null)')
          .size({ width: '25%', height: 110 }).backgroundColor(0xF5DEB3).textAlign(TextAlign.Center)
          .layoutWeight(null)
          .id('LayoutWeightNullUndefinedTest_2')

        Text('lw(undefined)')
          .size({ width: '25%', height: 110 }).backgroundColor(0xD2B48C).textAlign(TextAlign.Center)
          .layoutWeight(undefined)
          .id('LayoutWeightNullUndefinedTest_3')

        Text('lw()')
          .size({ width: '25%', height: 110 }).backgroundColor(0xFFEFD5).textAlign(TextAlign.Center)
          .layoutWeight('')
          .id('LayoutWeightNullUndefinedTest_4')
      }
      .size({ width: '90%', height: 140 })
      .backgroundColor(0xAFEEEE)
    }
    .width('100%')
    .height('100%')
  }
}
