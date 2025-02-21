/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
struct SwiperMargin {
  private swiperController: SwiperController = new SwiperController()
  private swiperController2: SwiperController = new SwiperController()
  private swiperController3: SwiperController = new SwiperController()
  private swiperController4: SwiperController = new SwiperController()
  private arr: number[] = Array.apply(this, {length: 6}).map((item, i) => (i+1))

  build() {
    Scroll() {
      Column() {
        Swiper(this.swiperController) {
          ForEach(this.arr, (item: number) => {
            Text('' + item)
              .width('100%')
              .height(50)
              .backgroundColor(item % 2 == 0 ? 0xAFEEEE : Color.Green)
              .textAlign(TextAlign.Center)
              .fontSize(25)
          })
        }
        .cachedCount(2)
        .index(0)
        .autoPlay(true)
        .interval(1000)
        .indicator(true)
        .loop(true)
        .duration(500)
        .prevMargin(-10)
        .nextMargin(-10)
        .vertical(false)
        .displayCount(1)
        .itemSpace(10)
        .curve(Curve.Linear)
        .key('SwiperMargin_Swiper1')

        Swiper(this.swiperController2) {
          ForEach(this.arr, (item: number) => {
            Text('' + item)
              .width('100%')
              .height(50)
              .backgroundColor(item % 2 == 0 ? 0xAFEEEE : Color.Green)
              .textAlign(TextAlign.Center)
              .fontSize(30)
          })
        }
        .cachedCount(2)
        .index(0)
        .autoPlay(true)
        .interval(1000)
        .indicator(true)
        .loop(false)
        .duration(500)
        .prevMargin(10)
        .nextMargin(10)
        .vertical(false)
        .displayCount(1)
        .itemSpace(10)
        .curve(Curve.Linear)
        .key('SwiperMargin_Swiper2')

        Swiper(this.swiperController3) {
          ForEach(this.arr, (item: number) => {
            Text('' + item)
              .width('100%')
              .height(50)
              .backgroundColor(item % 2 == 0 ? 0xAFEEEE : Color.Green)
              .textAlign(TextAlign.Center)
              .fontSize(30)
          })
        }
        .cachedCount(2)
        .index(0)
        .autoPlay(false)
        .interval(1000)
        .indicator(true)
        .loop(false)
        .duration(500)
        .prevMargin('11')
        .nextMargin('11')
        .vertical(false)
        .displayCount(1)
        .itemSpace(10)
        .curve(Curve.Linear)
        .key('SwiperMargin_Swiper3')

        Swiper(this.swiperController4) {
          ForEach(this.arr, (item: number) => {
            Text('' + item)
              .width('100%')
              .height(50)
              .backgroundColor(item % 2 == 0 ? 0xAFEEEE : Color.Green)
              .textAlign(TextAlign.Center)
              .fontSize(30)
          })
        }
        .cachedCount(2)
        .index(0)
        .autoPlay(false)
        .interval(1000)
        .indicator(true)
        .loop(true)
        .duration(500)
        .prevMargin($r('app.string.swiper_margin'))
        .nextMargin($r('app.string.swiper_margin'))
        .vertical(false)
        .displayCount(1)
        .itemSpace(10)
        .curve(Curve.Linear)
        .key('SwiperMargin_Swiper4')

      }
    }
  }
}