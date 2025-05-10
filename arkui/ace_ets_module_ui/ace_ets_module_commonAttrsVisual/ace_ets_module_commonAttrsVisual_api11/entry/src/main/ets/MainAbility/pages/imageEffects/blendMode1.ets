/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
struct blendMode11 {
  build() {
    Column() {
      Column() {
        Text("BlendMode.DESTINATION_IN")
          .fontSize(144)
          .fontWeight(FontWeight.Bold)
          .fontColor('#ffff0101')
      }
      .id('blendMode11_DESTINATION_IN')
      //.blendMode(BlendMode.DESTINATION_IN)
      .height('100%')
      .width('100%')
      .backgroundColor('#ff08ff00')

      Column() {
        Text("BlendMode.SOURCE_IN")
          .fontSize(144)
          .fontWeight(FontWeight.Bold)
          .fontColor('#ffff0101')
      }
      .id('blendMode11_SOURCE_IN')
      //.blendMode(BlendMode.SOURCE_IN)
      .height('100%')
      .width('100%')
      .backgroundColor('#ff08ff00')

      Column() {
        Text("BlendMode.NORMAL")
          .fontSize(144)
          .fontWeight(FontWeight.Bold)
          .fontColor('#ffff0101')
      }
      .id('blendMode11_NORMAL')
      //.blendMode(BlendMode.NORMAL)
      .height('100%')
      .width('100%')
      .backgroundColor('#ff08ff00')
    }
  }
}