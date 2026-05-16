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
struct AspectRatioNullUndefinedTest {
  build() {
    Column({space: 5}) {
      Row({ space: 10 }) {
        Text('1')
          .backgroundColor(0xbbb2cb)
          .fontSize(20)
          .aspectRatio(1.5)
          .width(80)
          .id('AspectRatioNullUndefinedTest_1')

        Text('2')
          .backgroundColor(0xbbb2cb)
          .fontSize(20)
          .aspectRatio(null)
          .width(80)
          .id('AspectRatioNullUndefinedTest_2')

        Text('3')
          .backgroundColor(0xbbb2cb)
          .fontSize(20)
          .aspectRatio(undefined)
          .width(80)
          .id('AspectRatioNullUndefinedTest_3')
      }
      .size({ width: '100%', height: 100 })
      .backgroundColor(0xd2cab3)
      .clip(true)
    }
    .width('100%').margin({ top: 5 })
  }
}