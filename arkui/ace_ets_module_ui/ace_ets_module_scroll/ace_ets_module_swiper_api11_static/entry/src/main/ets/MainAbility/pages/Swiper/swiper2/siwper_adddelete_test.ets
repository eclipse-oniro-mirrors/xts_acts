'use static';
/*
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
  Visibility,
  ClickEvent,
  SwiperDisplayMode,
  SwiperAnimationEvent,
  Row,
  RowOptions,
  Button,
  Curve,
  ForEach,
  SwiperAnimationEvent
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';

class MyDataSourceT5 implements IDataSource<number> {
  private list: number[] = []
  private count:number  = 0
  private listeners: DataChangeListener[] = [];
  constructor(list: number[]) {
    this.list = list
  }

  totalCount(): int {
    return this.list.length
  }

  getData(index: int): number {
    return this.list[index]
  }

  add() {

    this.list.push(this.totalCount() + 1)
    this.notifyDataAdd(this.totalCount() - 1)
  }

  delete() {
    this.list.pop();
    this.notifyDataAdd(this.totalCount())
  }

  registerDataChangeListener(listener: DataChangeListener): void {
    if (this.listeners.indexOf(listener) < 0) {
      console.info('add listener');
      this.listeners.push(listener);
    }
  }

  unregisterDataChangeListener(listener: DataChangeListener) {
    const pos = this.listeners.indexOf(listener);
    if (pos >= 0) {
      console.info('remove listener');
      this.listeners.splice(pos, 1);
    }
  }

  notifyDataAdd(index: int): void {
    this.listeners.forEach(listener => {
      listener.onDataAdd(index);
    })
  }
  notifyDataDelete(index: int): void {
    this.listeners.forEach(listener => {
      listener.onDataDelete(index);
    })
  }
}

@Entry
@Component
struct SwiperExampleT5 {
  private swiperController: SwiperController = new SwiperController()
  @State data: MyDataSourceT5 = new MyDataSourceT5([])

  aboutToAppear(): void {
    let list: number[] = []
    for (let i = 1; i <= 10; i++) {
      list.push(i);
    }
    this.data = new MyDataSourceT5(list)
  }

  build() {
    Column() {
      Row() {
        Button('showNext')
          .onClick((e: ClickEvent) => {
            this.swiperController.showNext()
          }).key("showNextTT")
        Button('showPrevious')
          .onClick((e: ClickEvent) => {
            this.swiperController.showPrevious()
          }).key("showPreviousTT")
      }

      Button('changeIndex').id('change_8')
        .onClick((e: ClickEvent) => {
          this.swiperController.changeIndex(7)
          console.log('change Index 8')
        })

      Row() {
        Button('add')
          .onClick((e: ClickEvent) => {
            this.data.add();
          }).key("addTT")
        Button('delete')
          .onClick((e: ClickEvent) => {
            this.data.delete()
          }).key("deleteTT")
      }

      Swiper(this.swiperController) {
        LazyForEach(this.data, (item: number) => {
          Text(item.toString())
            .width('90%')
            .height(160)
            .key('item2S' + item.toString())
            .backgroundColor('0xAFEEEE')
            .textAlign(TextAlign.Center)
            .fontSize(30)
        }, (item: number) => item.toString())
      }
      .cachedCount(2)
      .index(0)
      .autoPlay(false, undefined)
      .interval(4000)
      .key('swiperTestWidth5')
      .loop(true)
      .indicator(
        new DotIndicator()
          .itemWidth(15)
          .itemHeight(15)
          .selectedItemWidth(15)
          .selectedItemHeight(15)
          .color(Color.Gray)
          .selectedColor(Color.Blue))
      .duration(1000)
      .itemSpace(0)
      .displayMode(SwiperDisplayMode.STRETCH)
      .curve(Curve.Linear)
      .onChange((index: int): void => {
        console.info(index.toString())
      })
      //导致app died 无逻辑 暂时注释
      // .onGestureSwipe((index: int, extraInfo: SwiperAnimationEvent): void => {
      //   console.info("index: " + index)
      //   console.info("current offset: " + extraInfo.currentOffset)
      // })
      // .onAnimationStart((index: int, targetIndex: int, extraInfo: SwiperAnimationEvent): void => {
      //   console.info("index: " + index)
      //   console.info("targetIndex: " + targetIndex)
      //   console.info("current offset: " + extraInfo.currentOffset)
      //   console.info("target offset: " + extraInfo.targetOffset)
      //   console.info("velocity: " + extraInfo.velocity)
      // })
      // .onAnimationEnd((index: int, extraInfo: SwiperAnimationEvent): void => {
      //   console.info("index: " + index)
      //   console.info("current offset: " + extraInfo.currentOffset)
      // })

    }.width('100%')
    .margin({ top: 10 } as Margin).backgroundColor(Color.Brown)
  }
}