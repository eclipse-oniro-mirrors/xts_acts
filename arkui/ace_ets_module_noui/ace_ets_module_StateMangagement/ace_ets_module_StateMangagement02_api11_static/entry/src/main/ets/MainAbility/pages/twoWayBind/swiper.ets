'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
  Column,
  Component,
  Button,
  ClickEvent,
  ForEach,LazyForEach,Curve,TextAlign,
  Text,ContentCoverOptions,IDataSource,Swiper,DotIndicator,SwiperAnimationEvent,
  Row,Color,Builder,FlexAlign,$$,DataChangeListener,SwiperController,ArrowStyle
} from '@ohos.arkui.component'
import {
  State,
  Watch,PropRef,ObjectLink,
  Link,LocalStoragePropRef,LocalStorageLink,Consume,Provide,
  StorageLink,Observed,Track,LocalStorage
} from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';

class MyDataSource implements IDataSource<number> {
  private list: number[] = []

  constructor(list: number[]) {
    this.list = list
  }

  totalCount(): int {
    return this.list.length
  }

  getData(index: int): number {
    return this.list[index]
  }

  registerDataChangeListener(listener: DataChangeListener): void {
  }

  unregisterDataChangeListener(listener: DataChangeListener): void {
  }
}

@Entry
@Component
struct SwiperExample {
  private swiperController: SwiperController = new SwiperController()
  private data: MyDataSource = new MyDataSource([])
  @State index: int = 1

  aboutToAppear(): void {
    let list: number[] = []
    for (let i = 1; i <= 10; i++) {
      list.push(i);
    }
    this.data = new MyDataSource(list)
  }

  build() {
    Column() {
      Text(`index: ${this.index}`).id('swiperText').height('5%')
      Swiper(this.swiperController) {
        LazyForEach(this.data, (item: number) => {
          Text(item.toString())
            .width('90%')
            .height('5%')
            .backgroundColor(0xAFEEEE)
            .textAlign(TextAlign.Center)
            .fontSize(9)
        }, (item: number) => item.toString())
      }
      .cachedCount(2)
      .index(this.index)
      .autoPlay(false, undefined)
      .interval(4000)
      .loop(true)
      .indicatorInteractive(true)
      .duration(1000)
      .itemSpace(0)
      .indicator( // 设置圆点导航点样式
        new DotIndicator()
          .itemWidth(15)
          .itemHeight(15)
          .selectedItemWidth(15)
          .selectedItemHeight(15)
          .color(Color.Gray)
          .selectedColor(Color.Blue))
      .displayArrow({ // 设置导航点箭头样式
        showBackground: true,
        isSidebarMiddle: true,
        backgroundSize: 24,
        backgroundColor: Color.White,
        arrowSize: 18,
        arrowColor: Color.Blue
      } as ArrowStyle, false)
      .curve(Curve.Linear)
      .onChange((index: int) => {
        console.info(index.toString())
      })
      .onGestureSwipe((index: int, extraInfo: SwiperAnimationEvent) => {
        console.info('index: ' + index)
        console.info('current offset: ' + extraInfo.currentOffset)
      })
      .onAnimationStart((index: int, targetIndex: int, extraInfo: SwiperAnimationEvent) => {
        console.info('index: ' + index)
        console.info('targetIndex: ' + targetIndex)
        console.info('current offset: ' + extraInfo.currentOffset)
        console.info('target offset: ' + extraInfo.targetOffset)
        console.info('velocity: ' + extraInfo.velocity)
      })
      .onAnimationEnd((index: int, extraInfo: SwiperAnimationEvent) => {
        console.info('index: ' + index)
        console.info('current offset: ' + extraInfo.currentOffset)
      })

      Row() {
        Button('showNext')
          .height('5%')
          .width('50%')
          .onClick(():void => {
            this.swiperController.showNext()
          }).id('swiperButton')
        Button('showPrevious')
          .height('5%')
          .width('50%')
          .onClick(():void => {
            this.swiperController.showPrevious()
          }).id('swiperButton1')
      }
    }.width('100%')

  }
}