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
struct UseSizeTypeNullUndefinedTest {
  build() {
    Column() {
      GridContainer() {
        Row() {
          Row() {
            Text('1').fontSize(25)
          }
          .useSizeType({
            xs: { span: 1, offset: 0 }, sm: { span: 1, offset: 0 },
            md: { span: 1, offset: 0 }, lg: { span: 2, offset: 0 }
          })
          .height('100%')
          .backgroundColor(0x66bbb2cb)
          .id('UseSizeTypeNullUndefinedTest_1')

          Row() {
            Text('2').fontSize(25)
          }
          .useSizeType(null)
          .height('100%')
          .backgroundColor(0x66b6c5d1)
          .id('UseSizeTypeNullUndefinedTest_2')

          Row() {
            Text('3').fontSize(25)
          }
          .useSizeType(undefined)
          .height('100%')
          .backgroundColor(0x66bbb2cb)
          .id('UseSizeTypeNullUndefinedTest_3')
        }
        .height(200)
      }
      .backgroundColor(0xf1f3f5)
      .margin({ top: 10 })
    }
  }
}