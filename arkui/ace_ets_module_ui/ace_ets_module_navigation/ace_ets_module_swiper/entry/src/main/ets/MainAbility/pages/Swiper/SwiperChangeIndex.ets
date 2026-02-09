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
import common from '@ohos.app.ability.common';
import window from '@ohos.window';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct SwiperExample {
  scroller: Scroller = new Scroller()
  private swiperController: SwiperController = new SwiperController()
  private swiperController2: SwiperController = new SwiperController()
  private swiperController3: SwiperController = new SwiperController()
  private swiperController4: SwiperController = new SwiperController()
  private swiperController5: SwiperController = new SwiperController()
  @State currentIndex: number = 0
  @State modeIndex: number = 0
  @State mode: (SwiperAnimationMode | boolean| null | undefined)[] = [SwiperAnimationMode.NO_ANIMATION,
    SwiperAnimationMode.DEFAULT_ANIMATION, SwiperAnimationMode.FAST_ANIMATION,
    true, false, undefined, null, -1, 3]
  @State indexList: (number | null | undefined)[] = [ 2, 3, 79, -1, 80, 1000, 80,null, 85,undefined]
  @State index1: number = 0
  @State text1: string = ''
  @State text2: string = ''
  @State text3: string = ''
  @State text4: string = ''
  @State text5: string = ''
  @State arr: number[] = [1, 2, 3, 4, 5, 6, 7, 8]

  build() {
    Scroll(this.scroller) {
      Column({ space: 5 }) {
        Row({ space: 5 }) {
          Row({space:3}){
            Text(this.text1).key('text1')
            Text(this.text2).key('text2')
            Text(this.text3).key('text3')
            Text(this.text4).key('text4')
            Text(this.text5).key('text5')
          }
          Button('1')
            .id('btn1')
            .onClick(() => {
              this.swiperController.changeIndex(6, 2 )
            })
          Button('2')
            .id('btn2')
            .onClick(() => {
              this.swiperController2.changeIndex(-1, 1 )
            })
          Button('3')
            .id('btn3')
            .onClick(() => {
              this.swiperController3.changeIndex(1000, 0 )
            })
        }
        Row(){
          Button('4')
            .id('btn4')
            .onClick(() => {
              this.swiperController4.changeIndex(null, 0 )
            })
          Button('5')
            .id('btn5')
            .onClick(() => {
              this.swiperController5.changeIndex(undefined, 0 )
            })
        }
        Swiper(this.swiperController) {
          Repeat<number>(this.arr)
            .each((obj: RepeatItem<number>) => {
              Text('' + obj.item)
                .textAlign(TextAlign.Center)
                .backgroundColor(Color.Orange)
                .width('50%')
                .height('10%')
            })
        }
        .height('10%')
        .index(2)
        .id('swiper1')
        .onChange((currentIndex: number) => {
          this.text1 = currentIndex +''
        })
        Swiper(this.swiperController2) {
          Repeat<number>(this.arr)
            .each((obj: RepeatItem<number>) => {
              Text('' + obj.item)
                .textAlign(TextAlign.Center)
                .backgroundColor(Color.Orange)
                .width(400)
                .height(160)
            })
        }
        .height(50)
        .index(2)
        .id('swiper2')
        .onChange((currentIndex: number) => {
          this.text2 = currentIndex +''
        })
        Swiper(this.swiperController3) {
          Repeat<number>(this.arr)
            .each((obj: RepeatItem<number>) => {
              Text('' + obj.item)
                .textAlign(TextAlign.Center)
                .backgroundColor(Color.Orange)
                .width('50%')
                .height('10%')
            })
        }
        .height('10%')
        .index(2)
        .id('swiper3')
        .onChange((currentIndex: number) => {
          this.text3 = currentIndex +''
        })
        Swiper(this.swiperController4) {
          Repeat<number>(this.arr)
            .each((obj: RepeatItem<number>) => {
              Text('' + obj.item)
                .textAlign(TextAlign.Center)
                .backgroundColor(Color.Orange)
                .width('50%')
                .height('10%')
            })
        }
        .height('10%')
        .index(2)
        .id('swiper4')
        .onChange((currentIndex: number) => {
          this.text4 = currentIndex +''
        })
        Swiper(this.swiperController5) {
          Repeat<number>(this.arr)
            .each((obj: RepeatItem<number>) => {
              Text('' + obj.item)
                .textAlign(TextAlign.Center)
                .backgroundColor(Color.Orange)
                .width('50%')
                .height('10%')
            })
        }
        .height('10%')
        .index(2)
        .id('swiper5')
        .onChange((currentIndex: number) => {
          this.text5 = currentIndex +''
        })

      }.width('100%').height('100%')
    }
    .height('100%')
    .margin({ top: 5 })
  }
}