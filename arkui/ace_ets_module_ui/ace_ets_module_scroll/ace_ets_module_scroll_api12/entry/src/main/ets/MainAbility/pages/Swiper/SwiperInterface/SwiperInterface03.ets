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

import { curves } from '@kit.ArkUI'

@Entry
@Component
struct SwiperInterface03 {
  private swiperController: SwiperController = new SwiperController()
  private swiperController2: SwiperController = new SwiperController()
  private swiperController3: SwiperController = new SwiperController()
  private swiperController4: SwiperController = new SwiperController()

  build() {
    Column({ space: 5 }) {
      Swiper(this.swiperController) {
        Text('1')
          .fontSize(80)
          .width('90%')
          .height('100%')
          .backgroundColor(Color.Orange)
          .textAlign(TextAlign.Center)
          .border({ width: 1 })

        Text('2')
          .fontSize(80)
          .width('90%')
          .height('100%')
          .backgroundColor(Color.Orange)
          .textAlign(TextAlign.Center)
          .border({ width: 1 })
      }
      .id('SWIPER_INTERFACE_0190')
      .loop(false)
      .autoPlay(true)
      .curve(Curve.Linear)
      .width('80%')
      .height('20%')

      Swiper(this.swiperController2) {
        Text('1')
          .fontSize(80)
          .width('90%')
          .height('100%')
          .backgroundColor(Color.Orange)
          .textAlign(TextAlign.Center)
          .border({ width: 1 })

        Text('2')
          .fontSize(80)
          .width('90%')
          .height('100%')
          .backgroundColor(Color.Orange)
          .textAlign(TextAlign.Center)
          .border({ width: 1 })
      }
      .id('SWIPER_INTERFACE_0200')
      .loop(false)
      .autoPlay(true)
      .curve(Curve.EaseIn)
      .width('80%')
      .height('20%')

      Swiper(this.swiperController3) {
        Text('1')
          .fontSize(80)
          .width('90%')
          .height('100%')
          .backgroundColor(Color.Orange)
          .textAlign(TextAlign.Center)
          .border({ width: 1 })

        Text('2')
          .fontSize(80)
          .width('90%')
          .height('100%')
          .backgroundColor(Color.Orange)
          .textAlign(TextAlign.Center)
          .border({ width: 1 })
      }
      .id('SWIPER_INTERFACE_0210')
      .loop(false)
      .autoPlay(true)
      .curve(Curve.EaseInOut)
      .width('80%')
      .height('20%')

      Swiper(this.swiperController4) {
        Text('1')
          .fontSize(80)
          .width('90%')
          .height('100%')
          .backgroundColor(Color.Orange)
          .textAlign(TextAlign.Center)
          .border({ width: 1 })

        Text('2')
          .fontSize(80)
          .width('90%')
          .height('100%')
          .backgroundColor(Color.Orange)
          .textAlign(TextAlign.Center)
          .border({ width: 1 })
      }
      .id('SWIPER_INTERFACE_0220')
      .loop(false)
      .autoPlay(true)
      .curve(Curve.EaseOut)
      .width('80%')
      .height('20%')
    }
  }
}