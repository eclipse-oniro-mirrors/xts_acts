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
struct StackNullUndefinedTest {
  build() {
    Column() {
      // ========== alignContent tests ==========
      // Valid parameters (对照)
      Stack() {
        Text('A')
          .width('50%')
          .height('50%')
          .backgroundColor(0xAFEEEE)
      }
      .width('80%')
      .height('30%')
      .backgroundColor(0xF0F0F0)
      .alignContent(Alignment.TopStart)
      .id('Stack_aligncontent_valid')

      // alignContent with null
      Stack() {
        Text('A')
          .width('50%')
          .height('50%')
          .backgroundColor(0xAFEEEE)
      }
      .width('80%')
      .height('30%')
      .backgroundColor(0xF0F0F0)
      .alignContent(null)
      .id('Stack_aligncontent_null')

      // alignContent with undefined
      Stack() {
        Text('A')
          .width('50%')
          .height('50%')
          .backgroundColor(0xAFEEEE)
      }
      .width('80%')
      .height('30%')
      .backgroundColor(0xF0F0F0)
      .alignContent(undefined)
      .id('Stack_aligncontent_undefined')
    }
    .width('100%')
    .height('100%')
    .padding(2)
  }
}
