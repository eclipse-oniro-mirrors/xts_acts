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
struct SwiperAdd0510 {
  private swiperController: SwiperController = new SwiperController()
  @State onAnimationStart: string = ''

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
      }
      .autoPlay(true)
      .loop(false)
      .onChange((index: number) => {
        this.onAnimationStart = ''+index
      })
      Text(this.onAnimationStart).key('swiper_add_0510')

    }
  }
}