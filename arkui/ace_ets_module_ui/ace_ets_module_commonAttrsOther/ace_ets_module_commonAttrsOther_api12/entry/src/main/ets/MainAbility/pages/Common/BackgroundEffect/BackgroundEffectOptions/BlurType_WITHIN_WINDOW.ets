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
struct BlurType_WITHIN_WINDOW {
  @State message: string = 'Hello World';
  @State mBlurType: BlurType = BlurType.WITHIN_WINDOW

  build() {
    Row() {
      Column() {
        Text(this.message)
          .id('WITHIN_WINDOW')
          .fontSize(30)
          .width(100)
          .height(100)
          .backgroundColor(Color.Green)
          .fontWeight(FontWeight.Bold)
          .backgroundEffect({ radius: 20, brightness: 10, color: Color.Red, type: this.mBlurType })
      }
      .width('100%')
    }
    .height('100%')
  }
}