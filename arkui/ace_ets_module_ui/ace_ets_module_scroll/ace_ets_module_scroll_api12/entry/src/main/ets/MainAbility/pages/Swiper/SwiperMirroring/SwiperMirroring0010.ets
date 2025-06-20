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
struct SwiperMirroring0010 {
   private swiperController: SwiperController = new SwiperController()
  private swiperController2: SwiperController = new SwiperController()
  @State onAnimationStart: string = ''
  @State onAnimationStart2: string = ''

  build() {
    Column({ space: 5 }) {
      Swiper(this.swiperController) {
        Text('1')
          .fontSize(80)
          .width(400)
          .height(160)
          .backgroundColor(Color.Orange)
          .textAlign(TextAlign.Center).border({ width: 1 })

        Text('2')
          .fontSize(80)
          .width(300)
          .height(160)
          .backgroundColor(Color.Orange)
          .textAlign(TextAlign.Center).border({ width: 1 })
        Text('3')
          .fontSize(80)
          .width(300)
          .height(160)
          .backgroundColor(Color.Orange)
          .textAlign(TextAlign.Center).border({ width: 1 })
      }
      .id('swipermirroring0010')
      .autoPlay(true)
      .interval(1000)
      .direction(Direction.Ltr)
      .onChange((index: number) => {
        this.onAnimationStart = 'onChange'
      })
      Text(this.onAnimationStart).key('swiper_mirroring_0010')


      Swiper(this.swiperController2) {
        Text('1')
          .fontSize(80)
          .width(400)
          .height(160)
          .backgroundColor(Color.Orange)
          .textAlign(TextAlign.Center).border({ width: 1 })

        Text('2')
          .fontSize(80)
          .width(300)
          .height(160)
          .backgroundColor(Color.Orange)
          .textAlign(TextAlign.Center).border({ width: 1 })
        Text('3')
          .fontSize(80)
          .width(300)
          .height(160)
          .backgroundColor(Color.Orange)
          .textAlign(TextAlign.Center).border({ width: 1 })
      }
      .id('swipermirroring0310')
      .autoPlay(true)
      .interval(1000)
      .direction(Direction.Rtl)
      .onChange((index: number) => {
        this.onAnimationStart2 = 'onChange'
      })
      Text(this.onAnimationStart).key('swiper_mirroring_0310')


    }
  }
}