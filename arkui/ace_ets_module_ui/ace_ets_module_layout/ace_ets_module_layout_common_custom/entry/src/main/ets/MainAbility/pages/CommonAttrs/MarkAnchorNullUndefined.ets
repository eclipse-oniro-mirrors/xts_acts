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
struct MarkAnchorNullUndefinedTest {
  build() {
    Column({space: 5}) {
      Row() {
        Text('1')
          .size({ width: '25%', height: 50 })
          .backgroundColor(0xdeb887)
          .border({ width: 1 })
          .fontSize(16)
          .textAlign(TextAlign.Center)
          .id('MarkAnchorNullUndefinedTest_1')
        Text('2')
          .size({ width: '25%', height: 50 })
          .backgroundColor(0xbbb2cb)
          .border({ width: 1 })
          .fontSize(16)
          .textAlign(TextAlign.Center)
          .markAnchor({ x: 25, y: 25 })
          .id('MarkAnchorNullUndefinedTest_2')
        Text('3')
          .size({ width: '25%', height: 50 })
          .backgroundColor(0xdeb887)
          .border({ width: 1 })
          .fontSize(16)
          .textAlign(TextAlign.Center)
          .markAnchor(null)
          .id('MarkAnchorNullUndefinedTest_3')
        Text('4')
          .size({ width: '25%', height: 50 })
          .backgroundColor(0xbbb2cb)
          .border({ width: 1 })
          .fontSize(12)
          .textAlign(TextAlign.Center)
          .markAnchor(undefined)
          .id('MarkAnchorNullUndefinedTest_4')
      }.width('90%').height(150).border({ width: 1, style: BorderStyle.Dashed })
    }
    .width('100%').margin({ top: 5 })
  }
}