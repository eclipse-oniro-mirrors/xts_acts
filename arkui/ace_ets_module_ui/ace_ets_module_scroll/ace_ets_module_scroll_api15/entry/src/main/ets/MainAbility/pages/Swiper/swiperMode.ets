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
import { MyBasicSource } from '../../../MainAbility/pages/data/MyBasicSource'
@Entry
@Component
struct SwiperAnimationModeExample {
  scroller: Scroller = new Scroller()
  private swiperController: SwiperController = new SwiperController()
  private data: MyBasicSource = new MyBasicSource([])
  private list: number[] = []
  @State currentIndex: number = 0
  @State index: number = 0
  @State text1: string = '0'
  @State autoPlay: boolean = false
  @State isLoop: boolean = false
  @State swipeByGroup: boolean = false
  @State count: number = 1

  aboutToAppear(): void {
    for (let i = 0; i < 10; i++) {
      this.list.push(i);
    }
    this.data = new MyBasicSource(this.list)
  }

  build() {
    Scroll(this.scroller) {
      Column({ space: 5 }) {
        Text('changeMode: ' + this.text1)
          .id('swiper_mode_text')
        Button('DEFAULT_ANIMATION')
          .id('swiper_mode_no')
          .onClick(()=>{
            console.log('change Index 2');
            this.text1 = 'NO_ANIMATION'
            this.swiperController.changeIndex(2, SwiperAnimationMode.NO_ANIMATION)
          })
        Button('DEFAULT_ANIMATION')
          .id('swiper_mode_default')
          .onClick(()=>{
            console.log('change Index 6');
            this.text1 = 'DEFAULT_ANIMATION'
            this.swiperController.changeIndex(6, SwiperAnimationMode.DEFAULT_ANIMATION)
          })
        Button('FAST_ANIMATION')
          .id('swiper_mode_fast')
          .onClick(()=>{
            console.log('change Index 9');
            this.text1 = 'FAST_ANIMATION'
            this.swiperController.changeIndex(9, SwiperAnimationMode.FAST_ANIMATION)
          })

        Text('changeIndex: ' + this.index)
          .id('swiper_aniMode_text')
        Swiper(this.swiperController) {
          LazyForEach(this.data, (item: string) => {
            Text(item.toString())
              .onAppear(()=>{
                console.info('onAppear ' + item.toString())
              })
              .onDisAppear(()=>{
                console.info('onDisAppear ' + item.toString())
              })
              .width('90%')
              .height('40%')
              .backgroundColor(0xAFEEEE)
              .textAlign(TextAlign.Center)
              .fontSize(20)

          }, (item: string) => item)
        }
        .onChange((currentIndex: number) => {
          console.log('change: ' + currentIndex)
          this.index = currentIndex
        })
        .displayCount(this.count, this.swipeByGroup)
        .prevMargin(10)
        .nextMargin(10)
        .autoPlay(this.autoPlay)
        .indicator(
          new DotIndicator()
            .itemWidth(8)
            .itemHeight(8)
            .selectedItemWidth(12)
            .selectedItemHeight(8)
            .color(Color.Green)
            .selectedColor(Color.Pink)
            .mask(true)
            .maxDisplayCount(9)
        )
        .itemSpace(10)
        .displayArrow(true, false)
        .onContentDidScroll((selectedIndex: number, index: number, position: number, mainAxisLength: number) => {
          // 监听Swiper页面滑动事件，在该回调中可以实现自定义导航点切换动画等
          console.info('onContentDidScroll selectedIndex: ' + selectedIndex + ', index: ' + index + ', position: ' +
            position + ', mainAxisLength: ' + mainAxisLength)
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

      }.width('90%')
    }
    .height('80%')
    .margin({ top: 5 })
  }
}