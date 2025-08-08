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
struct UIComponentScrollSwiperDrag0280 {
  private swiperController: SwiperController = new SwiperController()
  private data: number[] = [1, 2, 3]
  @State index:string = '0'

  build() {
    Column() {
      Swiper(this.swiperController) {
        ForEach(this.data, (item: string) => {
          Column() {
            Text(item.toString()).fontSize(80)
          }
        }, (item: string) => item)
      }
      .width(250)
      .height(250)
      .curve(Curve.LinearOutSlowIn)
      .backgroundColor(Color.Gray)
      .onChange((index: number) => {
         this.index = index.toString()
      })
      .key('UIComponentScrollSwiperDrag0280_swiper')
      Button('NEXT').onClick(() => {
        this.swiperController.showNext()
      })
        .margin(20)
        .id('UIComponentScrollSwiperDrag0280_button')

      Text(this.index).fontColor(80).width(200).height(200).key('UIComponentScrollSwiperDrag0280_text')
    }
  }
}