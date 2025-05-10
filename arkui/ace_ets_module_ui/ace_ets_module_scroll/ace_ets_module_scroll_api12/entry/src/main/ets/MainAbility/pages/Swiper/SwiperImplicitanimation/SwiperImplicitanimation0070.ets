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
struct SwiperImplicitanimation0070 {
  private swiperController: SwiperController = new SwiperController()
  @State index: string = ''
  @State currentOffset: string = ''

  build() {
    Column({ space: 5 }) {
      Swiper(this.swiperController) {
        Text('1')
          .fontSize(20)
          .width('90%')
          .height(160)
          .backgroundColor(0xAFEEEE)
          .textAlign(TextAlign.Center)

        Text('2')
          .fontSize(20)
          .width('90%')
          .height(160)
          .backgroundColor(0xAFEEEE)
          .textAlign(TextAlign.Center)

        Text('3')
          .fontSize(20)
          .width('90%')
          .height(160)
          .backgroundColor(0xAFEEEE)
          .textAlign(TextAlign.Center)
      }
      .loop(false)
      .effectMode(EdgeEffect.Spring)
      .id('implicitanimation_0070')
      .onAnimationStart((index: number, targetIndex: number, extraInfo: SwiperAnimationEvent) => {
        this.index = index.toString()
        this.currentOffset = extraInfo.currentOffset.toFixed(0).toString()
      })

      Text(this.index).key('implicitanimation_0070_1')
      Text(this.currentOffset).key('implicitanimation_0070_2')
    }.width('100%')
    .margin({ top: 5 })
  }
}
