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
struct TextExample_1 {
  @State strategyStatus: LineBreakStrategy = LineBreakStrategy.BALANCED
  @State LineBreakStrategy: string = ''
  @State message1: string = "They can be classified as built-in components–those directly provided by the ArkUI framework and custom components – those defined by developers" +
  "The built-in components include buttons radio buttonsprogress indicators and text You can set the rendering effectof thesecomponents in method chaining mode," +
  "page components are divided into independent UI units to implementindependent creation development and reuse of different units on pages making pages more engineering-oriented.";

  build() {
    Row() {
      Column({ space: 12 }) {
        Text(this.LineBreakStrategy)
          .id('LineBreakStrategy')
        Button('show strategyStatus')
          .id('btn')
          .onClick(() => {
            if (this.strategyStatus == LineBreakStrategy.BALANCED) {
              this.LineBreakStrategy = 'BALANCED'
            } else {
              this.LineBreakStrategy = 'NULL'
            }
          })
        Text(this.message1)
          .fontSize(12)
          .border({ width: 1 })
          .padding(10)
          .width('400')
          .height('400')
          .lineBreakStrategy(this.strategyStatus)
      }.width('100%')
    }.height('100%')
  }
}