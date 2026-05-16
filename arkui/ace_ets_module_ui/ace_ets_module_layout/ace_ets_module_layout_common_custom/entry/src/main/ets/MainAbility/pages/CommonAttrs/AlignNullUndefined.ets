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
struct AlignNullUndefinedTest {
  build() {
    Column() {
      Column({ space: 10 }) {
        // 元素内容<元素宽高，设置内容在与元素内的对齐方式
        Stack() {
          Text('BottomEnd')
        }.width('90%').height(50).margin({ top: 5 }).backgroundColor(0xFFE4C4)
        .align(Alignment.BottomEnd)
        .id('AlignNullUndefinedTest_1')

        Stack() {
          Text('null')
        }.width('90%').height(50).margin({ top: 5 }).backgroundColor(0xFFE4C4)
        .align(null)
        .id('AlignNullUndefinedTest_2')

        Stack() {
          Text('undefined')
        }.width('90%').height(50).margin({ top: 5 }).backgroundColor(0xFFE4C4)
        .align(undefined)
        .id('AlignNullUndefinedTest_3')
      }
    }
    .width('100%').margin({ top: 5 })
  }
}