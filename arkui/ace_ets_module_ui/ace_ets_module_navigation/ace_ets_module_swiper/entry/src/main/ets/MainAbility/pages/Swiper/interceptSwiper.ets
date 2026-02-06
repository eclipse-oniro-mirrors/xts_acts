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
@Entry
@Component
struct interceptSwiperExample {
  private swiperController: SwiperController = new SwiperController()
  @State data: number[] = [0, 1, 2, 3, 4]
  private currentIndex: number = 2

  build() {
    Column({ space: 5 }) {
      Swiper(this.swiperController) {
        ForEach(this.data, (item: string) => {
          Text(item.toString())
            .id('swiper_intercept_text')
            .width('90%')
            .height('100%')
            .textAlign(TextAlign.Center)
            .fontSize(20)
            .backgroundColor(0xAFEEEE)
            .focusable(true)
            .borderWidth(1)
        }, (item: string) => item)
      }
      .id('swiper_intercept')
      .index(this.currentIndex)
      .loop(false)
      .height('60%')
      .onChange((index: number) => {
        this.currentIndex = index
      })
      .onContentWillScroll((result: SwiperContentWillScrollResult) => {
        console.error('currentIndex:' + result.currentIndex)
        console.error('comingIndex:' + result.comingIndex)
        console.error('offset:' + result.offset)

        if (result.comingIndex > this.currentIndex) {
          return false;
        }
        return true;
      })
    }
    .width('100%')
    .margin({ top: 5 })
  }
}