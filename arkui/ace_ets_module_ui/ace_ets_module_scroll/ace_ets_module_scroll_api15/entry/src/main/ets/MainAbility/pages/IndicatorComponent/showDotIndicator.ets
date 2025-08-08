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
struct showDotIndicatorDemo {
  private indicatorController: IndicatorComponentController = new IndicatorComponentController()
  private swiperController: SwiperController = new SwiperController()
  @State list: number[] = []
  aboutToAppear(): void {
    for (let i = 1; i <= 6; i++) {
      this.list.push(i);
    }
  }

  build() {
    Column() {
      Row() {
        Button('showNext')
          .id('indicator_showNext')
          .height('5%')
          .width('50%')
          .onClick(() => {
            this.indicatorController.showNext()
          })
        Button('showPrevious')
          .id('indicator_showPrevious')
          .height('5%')
          .width('50%')
          .onClick(() => {
            this.indicatorController.showPrevious()
          })
      }.margin(10)
      Button('changeIndex')
        .id('indicator_changeIndex')
        .height('5%')
        .onClick(()=>{
          this.indicatorController.changeIndex(3,false);
          console.log('change Index 3');
        })
      Swiper(this.swiperController) {
        ForEach(this.list, (item: string) => {
          Text(item.toString())
            .width('100%')
            .height(160)
            .backgroundColor(0xAFEEEE)
            .textAlign(TextAlign.Center)
            .fontSize(30)
        }, (item: string) => item)
      }
      .id('indicator_swiper')
      .cachedCount(2)
      .index(1)
      .autoPlay(false)
      .interval(2000)
      .indicator(this.indicatorController)
      .loop(true)
      .duration(1000)
      .itemSpace(0)
      .curve(Curve.Linear)
      .onChange((index: number) => {
        console.info(index.toString())
      })

      IndicatorComponent(this.indicatorController)
        .initialIndex(0)
        .style(
          new DotIndicator()
            .itemWidth(15)
            .itemHeight(15)
            .selectedItemWidth(15)
            .selectedItemHeight(15)
            .color(Color.Gray)
            .selectedColor(Color.Blue))
        .loop(true)
        .count(6)
        .vertical(true)
        .onChange((index: number) => {
          console.log('current index: ' + index )
        })
    }
  }
}