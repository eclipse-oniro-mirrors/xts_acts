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
struct SwiperImplicitanimation0020 {
  private swiperController: SwiperController = new SwiperController()
  @State indexstring: string = ''
  @State targetIndexs: string = ''
  @State currentOffset: string = ''
  @State targetOffset: string = ''
  @State velocity: string = ''

  build() {
    Column({ space: 5 }) {
      Swiper(this.swiperController) {
        Text('1')
          .width('90%')
          .height(120)
          .backgroundColor(0xAFEEEE)
          .textAlign(TextAlign.Center)

        Text('2')
          .width('90%')
          .height(120)
          .backgroundColor(0xAFEEEE)
          .textAlign(TextAlign.Center)

        Text('3')
          .width('90%')
          .height(120)
          .backgroundColor(0xAFEEEE)
          .textAlign(TextAlign.Center)
      }
      .loop(false)
      .effectMode(EdgeEffect.Fade)
      .id('implicitanimation_0020')
      .autoPlay(false)
      .onAnimationStart((index: number, targetIndex: number, extraInfo: SwiperAnimationEvent) => {
        this.indexstring = index.toString()
        this.targetIndexs = targetIndex.toString()
        this.currentOffset = extraInfo.currentOffset.toString()
        this.targetOffset = extraInfo.targetOffset.toString()
        this.velocity = extraInfo.velocity.toString()
      })

      Button('切换2').onClick((event: ClickEvent) => {
        this.swiperController.showNext()

      }).id('btn_implicitanimation_0020_1')

      Button('切换').onClick((event: ClickEvent) => {
        this.swiperController.changeIndex(0)

      }).id('btn_implicitanimation_0020')
      Text(this.indexstring).key('implicitanimation_0020_1')
      Text(this.targetIndexs).key('implicitanimation_0020_2')
      Text(this.currentOffset).key('implicitanimation_0020_3')
      Text(this.targetOffset).key('implicitanimation_0020_4')
      Text(this.velocity).key('implicitanimation_0020_5')
    }.width('100%')
    .margin({ top: 5 })
  }
}