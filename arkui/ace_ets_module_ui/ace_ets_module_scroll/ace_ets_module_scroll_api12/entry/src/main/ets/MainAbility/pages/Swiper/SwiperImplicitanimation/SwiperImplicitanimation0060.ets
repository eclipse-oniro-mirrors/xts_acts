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
struct SwiperImplicitanimation0060 {
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
          .width('100%')
          .height('100%')
          .backgroundColor(0xAFEEEE)
          .textAlign(TextAlign.Center)

        Text('2')
          .width('100%')
          .height('100%')
          .backgroundColor(0xAFEEEE)
          .textAlign(TextAlign.Center)

        Text('3')
          .width('100%')
          .height('100%')
          .backgroundColor(0xAFEEEE)
          .textAlign(TextAlign.Center)
      }
      .width('80%')
      .height('50%')
      .loop(false)
      .effectMode(EdgeEffect.Spring)
      .id('implicitanimation_0060')
      .autoPlay(false)
      .onAnimationStart((index: number, targetIndex: number, extraInfo: SwiperAnimationEvent) => {
        this.indexstring = index.toString()
        this.targetIndexs = targetIndex.toString()
        this.currentOffset = extraInfo.currentOffset.toString()
        this.targetOffset = extraInfo.targetOffset.toString()
        this.velocity = extraInfo.velocity.toString()
      })

      Row(){
        Button('切换下')
          .height('5%').onClick((event: ClickEvent) => {
          this.swiperController.showNext()

        }).id('btn_implicitanimation_0060_1')

        Button('切换上')
          .height('5%').onClick((event: ClickEvent) => {
          this.swiperController.showPrevious()

        }).id('btn_implicitanimation_0060_2')
      }

      Button('切换')
          .height('5%').onClick((event: ClickEvent) => {
        this.swiperController.changeIndex(2)

      }).id('btn_implicitanimation_0060')
      Row(){
        Text(this.indexstring).key('implicitanimation_0060_1').margin({right:5})
        Text(this.targetIndexs).key('implicitanimation_0060_2')
      }
      Text(this.currentOffset).key('implicitanimation_0060_3')
      Text(this.targetOffset).key('implicitanimation_0060_4')
      Text(this.velocity).key('implicitanimation_0060_5')
    }.width('100%')
    .margin({ top: 5 })
  }
}