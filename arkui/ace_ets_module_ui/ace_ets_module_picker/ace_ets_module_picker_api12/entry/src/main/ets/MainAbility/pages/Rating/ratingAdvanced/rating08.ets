/**
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

@Entry
@Component
struct rating08 {
  @State rating: number = 1
  @State indicator:boolean = true
  @State stars: number = 5

  build() {
    Column() {
      Rating({ rating: this.rating, indicator: this.indicator })
        .stars(this.stars)
        .stepSize(1)
        .margin({ top: 24 })
        .onChange((value: number) => {
          this.rating = value
        })
        .id('rating08')

      Button('indicator control')
        .fontSize(24)
        .margin({ top: 20 })
        .onClick(() => {
          this.indicator = !this.indicator
        })
        .id('ratingButton08_1')

      Button('stars control -1')
        .fontSize(24)
        .margin({ top: 20 })
        .onClick(() => {
          this.stars = this.stars - 1
        })
        .id('ratingButton08_2')

      Button('stars control +1')
        .fontSize(24)
        .margin({ top: 20 })
        .onClick(() => {
          this.stars = this.stars + 1
        })
        .id('ratingButton08_3')
    }.width('100%')
    .height('100%')
  }
}