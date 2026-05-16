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
struct DirectionNullUndefinedTest {
  build() {
    Column({space: 5}) {
      Row() {
        Text('1').height(50).width('25%').fontSize(16).backgroundColor(0xF5DEB3)
        Text('2').height(50).width('25%').fontSize(16).backgroundColor(0xD2B48C)
        Text('3').height(50).width('25%').fontSize(16).backgroundColor(0xF5DEB3)
        Text('4').height(50).width('25%').fontSize(16).backgroundColor(0xD2B48C)
      }
      .width('90%')
      .direction(Direction.Ltr)
      .id('DirectionNullUndefinedTest_1')

      Row() {
        Text('1').height(50).width('25%').fontSize(16).backgroundColor(0xF5DEB3)
        Text('2').height(50).width('25%').fontSize(16).backgroundColor(0xD2B48C)
        Text('3').height(50).width('25%').fontSize(16).backgroundColor(0xF5DEB3)
        Text('4').height(50).width('25%').fontSize(16).backgroundColor(0xD2B48C)
      }
      .width('90%')
      .direction(null)
      .id('DirectionNullUndefinedTest_2')

      Row() {
        Text('1').height(50).width('25%').fontSize(16).backgroundColor(0xF5DEB3)
        Text('2').height(50).width('25%').fontSize(16).backgroundColor(0xD2B48C)
        Text('3').height(50).width('25%').fontSize(16).backgroundColor(0xF5DEB3)
        Text('4').height(50).width('25%').fontSize(16).backgroundColor(0xD2B48C)
      }
      .width('90%')
      .direction(undefined)
      .id('DirectionNullUndefinedTest_3')
    }
    .width('100%').margin({ top: 5 })
  }
}