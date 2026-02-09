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
  $r,
  Column,TextAlign,Scroll,
  ColumnOptions,Scroller,SwiperAnimationMode,Row,RowOptions,Repeat,RepeatItem,
  Text,TabsController,Margin,ClickEvent,SwiperController,Swiper,ForEach,
  Color,Button,Tabs,TabContent,SubTabBarStyle,BarMode,Alignment,BarPosition,
} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef,
} from '@ohos.arkui.stateManagement';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';
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
  @State mode: (SwiperAnimationMode | boolean| null | undefined | number)[] = [SwiperAnimationMode.NO_ANIMATION,
    SwiperAnimationMode.DEFAULT_ANIMATION, SwiperAnimationMode.FAST_ANIMATION,
    true, false, undefined, null, -1, 3] as (SwiperAnimationMode | boolean| null | undefined | number)[]
  @State indexList: (number | null | undefined)[] = [ 2, 3, 79, -1, 80, 1000, 80,null, 85,undefined] as (number | null | undefined)[]
  @State index1: number = 0
  @State text1: string = ''
  @State text2: string = ''
  @State text3: string = ''
  @State text4: string = ''
  @State text5: string = ''
  @State arr: number[] = [1, 2, 3, 4, 5, 6, 7, 8] as number[]

  build() {
    Scroll(this.scroller) {
      Column({ space: 5 } as ColumnOptions) {
        Row({ space: 5 } as RowOptions) {
          Row({space:3} as RowOptions){
            Text(this.text1).key('text1')
            Text(this.text2).key('text2')
            Text(this.text3).key('text3')
            Text(this.text4).key('text4')
            Text(this.text5).key('text5')
          }
          Button('1')
            .id('btn1')
            .onClick((e: ClickEvent) => {
              this.swiperController.changeIndex(6, SwiperAnimationMode.FAST_ANIMATION )
            })
          Button('2')
            .id('btn2')
            .onClick((e: ClickEvent) => {
              this.swiperController2.changeIndex(-1, SwiperAnimationMode.DEFAULT_ANIMATION )
            })
          Button('3')
            .id('btn3')
            .onClick((e: ClickEvent) => {
              this.swiperController3.changeIndex(1000, SwiperAnimationMode.NO_ANIMATION )
            })
        }
        Row(){
          Button('4')
            .id('btn4')
            .onClick((e: ClickEvent) => {
              // this.swiperController4.changeIndex(null, SwiperAnimationMode.NO_ANIMATION )
            })
          Button('5')
            .id('btn5')
            .onClick((e: ClickEvent) => {
              this.swiperController5.changeIndex(undefined, SwiperAnimationMode.NO_ANIMATION )
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
        .onChange((currentIndex: int): void => {
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
        .onChange((currentIndex: int): void => {
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
        .onChange((currentIndex: int): void => {
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
        .onChange((currentIndex: int): void => {
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
        .onChange((currentIndex: int): void => {
          this.text5 = currentIndex +''
        })

      }.width('100%').height('100%')
    }
    .height('100%')
    .margin({ top: 5 } as Margin)
  }
}