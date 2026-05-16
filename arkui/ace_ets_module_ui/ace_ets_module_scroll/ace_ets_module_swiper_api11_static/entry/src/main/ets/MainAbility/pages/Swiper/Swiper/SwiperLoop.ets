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
  Text,
  LazyForEach,
  Margin,
  IDataSource,
  DataChangeListener,
  DotIndicator,
  ColumnOptions,
  Swiper,
  TextAlign,
  Color,
  EdgeEffect,
  ClickEvent,
  Row,
  Button
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';

class MyDataSourceSwiper implements IDataSource<number> {
  private list: number[] = []

  constructor(list: number[]) {
    this.list = list
  }

  totalCount(): int {
    return this.list.length
  }

  getData(index: int): number {
    return this.list[index as int]
  }

  registerDataChangeListener(listener: DataChangeListener): void {
  }

  unregisterDataChangeListener(listener: DataChangeListener) {
  }
}

@Entry
@Component
struct SwiperLoopTest {
  private swiperController: SwiperController = new SwiperController()
  private data: MyDataSourceSwiper = new MyDataSourceSwiper([])
  @State loop: boolean = false
  @State index: int = 0
  @State autoPlay: boolean = false
  @State swiperValue: string = ''

  aboutToAppear(): void {
    let list: number[] = []
    for (let i = 1; i <= 10; i++) {
      list.push(i);
    }
    this.data = new MyDataSourceSwiper(list)
  }

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Swiper(this.swiperController) {
        LazyForEach(this.data, (item: number, index: int) => {
          Text(item.toString())
            .width('90%')
            .height('60%')
            .backgroundColor(0xAFEEEE)
            .textAlign(TextAlign.Center)
            .fontSize(30)
            .key('SwiperLoopText' + item)
        }, (item: number) => item.toString())
      }
      .key('swiperLoop')
      .cachedCount(2)
      .index(this.index)
      .autoPlay(this.autoPlay, undefined)
      .interval(1000)
      .loop(this.loop)
      .duration(200)
      .itemSpace(0)
      .displayArrow(true, false)
      .onChange((index: int): void => {
        this.swiperValue = 'change'
      })

      Row() {
        Button('index:9')
          .height('5%')
          .onClick((event: ClickEvent) => {
            this.index = 9
          }).key('swiperLoopButton1')

        Button('index:0')
          .height('5%')
          .onClick((event: ClickEvent) => {
            this.index = 0
            this.loop = true
          }).key('swiperLoopButton2')
      }

      Row() {
        Button('index:4')
          .height('5%')
          .onClick((event: ClickEvent) => {
            this.loop = true
            this.index = 4
          }).key('swiperLoopButton3')
        Button('autoPlay: true')
          .height('5%')
          .onClick((event: ClickEvent) => {
            this.index = 8
            this.loop = false
            this.autoPlay = true
          }).key('swiperLoopButton4')
      }

      Button('autoPlay: true')
        .height('5%')
        .onClick((event: ClickEvent) => {
          this.index = 8
          this.loop = false
          this.autoPlay = true
        }).key('swiperLoopButton4')

    }.width('100%')
    .margin({ top: 5 } as Margin)
  }
}