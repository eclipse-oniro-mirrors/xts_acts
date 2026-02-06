'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import {
  Entry,
  Component,
  SwiperController,
  Column,
  ColumnOptions,
  Swiper,
  Text,
  Color,
  TextAlign,
  Curve
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';
import curves from '@ohos.curves'

@Entry
@Component
struct SwiperInterface03 {
  private swiperController: SwiperController = new SwiperController()
  private swiperController2: SwiperController = new SwiperController()
  private swiperController3: SwiperController = new SwiperController()
  private swiperController4: SwiperController = new SwiperController()

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Swiper(this.swiperController) {
        Text('1')
          .fontSize(80)
          .width(400)
          .height(160)
          .backgroundColor(Color.Orange)
          .textAlign(TextAlign.Center)
          .border({ width: 1 })

        Text('2')
          .fontSize(80)
          .width(300)
          .height(160)
          .backgroundColor(Color.Orange)
          .textAlign(TextAlign.Center)
          .border({ width: 1 })
      }
      .id('SWIPER_INTERFACE_0190')
      .loop(false)
      .autoPlay(true, undefined)
      .curve(Curve.Linear)

      Swiper(this.swiperController2) {
        Text('1')
          .fontSize(80)
          .width(400)
          .height(160)
          .backgroundColor(Color.Orange)
          .textAlign(TextAlign.Center)
          .border({ width: 1 })

        Text('2')
          .fontSize(80)
          .width(300)
          .height(160)
          .backgroundColor(Color.Orange)
          .textAlign(TextAlign.Center)
          .border({ width: 1 })
      }
      .id('SWIPER_INTERFACE_0200')
      .loop(false)
      .autoPlay(true, undefined)
      .curve(Curve.EaseIn)

      Swiper(this.swiperController3) {
        Text('1')
          .fontSize(80)
          .width(400)
          .height(160)
          .backgroundColor(Color.Orange)
          .textAlign(TextAlign.Center)
          .border({ width: 1 })

        Text('2')
          .fontSize(80)
          .width(300)
          .height(160)
          .backgroundColor(Color.Orange)
          .textAlign(TextAlign.Center)
          .border({ width: 1 })
      }
      .id('SWIPER_INTERFACE_0210')
      .loop(false)
      .autoPlay(true, undefined)
      .curve(Curve.EaseInOut)

      Swiper(this.swiperController4) {
        Text('1')
          .fontSize(80)
          .width(400)
          .height(160)
          .backgroundColor(Color.Orange)
          .textAlign(TextAlign.Center)
          .border({ width: 1 })

        Text('2')
          .fontSize(80)
          .width(300)
          .height(160)
          .backgroundColor(Color.Orange)
          .textAlign(TextAlign.Center)
          .border({ width: 1 })
      }
      .id('SWIPER_INTERFACE_0220')
      .loop(false)
      .autoPlay(true, undefined)
      .curve(Curve.EaseOut)
    }
  }
}