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
import { MyDataSource } from '../../../MainAbility/pages/data/BasicDataSource'

@Entry
@Component
struct SwiperDemo1 {
  private swiperController: SwiperController = new SwiperController()
  private data: MyDataSource = new MyDataSource();
  @State onChange: number = 0;
  private currentIndex: number = 0
  @State text1: string = '连续'
  @State PageFlipMode1: PageFlipMode = PageFlipMode.CONTINUOUS

  aboutToAppear(): void {
    for (let i = 0; i <= 10; i++) {
      this.data.pushData(i.toString());
    }
  }

  build() {
    Column({ space: 5 }) {
      Text('PageFlipMode: ' + this.text1).height('5%')
      Button('单次翻页')
        .id('swiper_PageMode_single')
        .onClick(()=>{
          this.text1 = 'SINGLE'
          this.PageFlipMode1 == PageFlipMode.SINGLE
        }).height('5%')
      Button('连续翻页')
        .id('swiper_PageMode_continuous')
        .onClick(()=>{
          this.text1 = 'CONTINUOUS'
          this.PageFlipMode1 == PageFlipMode.CONTINUOUS
        }).height('5%')

      Text('' + this.onChange)
        .id('swiper_PageMode_onChange')
        .onClick(()=>{
          this.currentIndex = 0
        }).height('5%')

      Swiper(this.swiperController) {
        LazyForEach(this.data, (item: string) => {
          Text(item.toString())
            .width('90%')
            .backgroundColor(0xAFEEEE)
            .textAlign(TextAlign.Center)
            .fontSize(30)
        }, (item: string) => item)
      }
      .id('swiper_pageFlipMode')
      .width('80%')
      .height('50%')
      .index(this.currentIndex)
      .pageFlipMode(this.PageFlipMode1)
      .cachedCount(2)
      .autoPlay(false)
      .loop(false)
      .indicatorInteractive(true)
      .itemSpace(0)
      .indicator( // 设置圆点导航点样式
        new DotIndicator()
          .itemWidth(15)
          .itemHeight(15)
          .selectedItemWidth(15)
          .selectedItemHeight(15)
          .color(Color.Gray)
          .selectedColor(Color.Blue))
      .displayArrow({
        // 设置导航点箭头样式
        showBackground: true,
        isSidebarMiddle: true,
        backgroundSize: 24,
        backgroundColor: Color.White,
        arrowSize: 18,
        arrowColor: Color.Blue
      }, false)
      .curve(Curve.Linear)
      .onChange((index: number) => {
        this.onChange = index
      })
      .onAnimationStart((index: number, targetIndex: number, extraInfo: SwiperAnimationEvent) => {
        console.info('index: ' + index)
        console.info('targetIndex: ' + targetIndex)
        console.info('current offset: ' + extraInfo.currentOffset)
        console.info('target offset: ' + extraInfo.targetOffset)
        console.info('velocity: ' + extraInfo.velocity)
      })
      .onAnimationEnd((index: number, extraInfo: SwiperAnimationEvent) => {
        console.info('index: ' + index)
        console.info('current offset: ' + extraInfo.currentOffset)
      })

    }.width('100%')
    .margin({ top: 5 })
  }
}