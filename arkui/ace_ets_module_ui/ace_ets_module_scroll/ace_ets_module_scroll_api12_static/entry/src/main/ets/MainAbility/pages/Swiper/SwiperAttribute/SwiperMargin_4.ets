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
  Swiper,
  Column,
  Text,
  SwiperDisplayMode,
  Margin,
  SwiperController,
  ColumnOptions,
  ClickEvent,
  Scroll,
  Row,
  Color,
  Curve,
  Button
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct Index {
  private swiperController: SwiperController = new SwiperController()
  @State curIndex: int = 2
  @State nextMargin: number = 0
  @State prevMargin: number = 0

  build() {
    Scroll() {
      Column({ space: 5 } as ColumnOptions) {
        Row() {
          Button('showNext')
            .id('showNext')
            .onClick((e: ClickEvent) => {
              this.swiperController.showNext()
            })
          Button('showPrevious')
            .id('showPrevious')
            .onClick((e: ClickEvent) => {
              this.swiperController.showPrevious()
            })
        }.margin({ top: 15 } as Margin)

        Row() {
          Button('后边距+')
            .id('nextMarginAdd')
            .onClick((e: ClickEvent) => {
              this.nextMargin = this.nextMargin + 5
            })
          Button('后边距-')
            .id('nextMarginDec')
            .onClick((e: ClickEvent) => {
              this.nextMargin = this.nextMargin - 5
            })
        }.margin({ top: 15 } as Margin)

        Row() {
          Button('前边距+')
            .id('prevMarginAdd')
            .onClick((e: ClickEvent) => {
              this.prevMargin = this.prevMargin + 5
            })
          Button('前边距-')
            .id('prevMarginDec')
            .onClick((e: ClickEvent) => {
              this.prevMargin = this.prevMargin - 5
            })
        }.margin({ top: 15 } as Margin)

        Swiper(this.swiperController) {
          Column() {
            Text('1').width('100%').height('100%').backgroundColor(Color.Green).id('swiperText_1')
          }
          .width(50)
          .height(50)
          .backgroundColor(0xF5DEB3)
          .id('swiperAttribute_801')
          .padding(20)

          Column() {
            Text('2').width('100%').height('100%').id('swiperText_2')
          }.width(50).height(50).backgroundColor(0xD2B48C).id('swiperAttribute_802')

          Column() {
            Text('3').width('100%').height('100%').id('swiperText_3')
          }.width(50).height(50).backgroundColor(0xF5DEB3).id('swiperAttribute_803')

          Column() {
            Text('4').width('100%').height('100%').id('swiperText_4')
          }.width(50).height(50).backgroundColor(0xD2B48C).id('swiperAttribute_804')

          Column() {
            Text('5').width('100%').height('100%').id('swiperText_5')
          }.width(50).height(50).backgroundColor(0xF5DEB3).id('swiperAttribute_805')

          Column() {
            Text('6').width('100%').height('100%').id('swiperText_6')
          }.width(50).height(50).backgroundColor(0xD2B48C).id('swiperAttribute_806')
        }
        .cachedCount(2)
        .id('swiper')
        .index(this.curIndex - 1)
        .autoPlay(false, undefined)
        .interval(2000)
        .indicator(true)
        .loop(true)
        .duration(1000)
        .itemSpace(0)
        .curve(Curve.Linear)
        .prevMargin(this.prevMargin)
        .nextMargin(this.nextMargin)
        .onChange((index: int): void => {
          this.curIndex = index + 1
        })
      }.margin({ top: 50 } as Margin).width('100%')
    }
  }
}