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

import { LengthMetrics } from '@ohos.arkui.node'
import {
  $r,
  ArrowStyle,
  Button,
  ClickEvent,
  Color,
  Column,
  ColumnOptions,
  Component,
  Curve,
  DataChangeListener,
  DotIndicator,
  EdgeEffect,
  Entry,
  FontWeight,
  ForEach,
  IDataSource,
  Indicator,
  Length,
  Margin,
  Row,
  RowOptions,
  Scroll,
  Swiper,
  SwiperAnimationEvent,
  SwiperController,
  SwiperDisplayMode,
  SwiperNestedScrollMode,
  Text,
  TextAlign,
} from '@ohos.arkui.component';
import { AppStorage, Link, PropRef, State, } from '@ohos.arkui.stateManagement';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';
import { BusinessError } from '@ohos.base';

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
  public isLandScape: boolean = false;
  @State autoPlay: boolean = false
  @State indexNumber: int = 1
  @State space: LengthMetrics | null | undefined = LengthMetrics.vp(8)
  @State maxDisplayCount: int = 9
  @State loop: boolean = true
  @State list1item: number = 10
  @State bottom: LengthMetrics | Length | null | undefined = LengthMetrics.vp(3)
  @State spacePool: (LengthMetrics | null | undefined)[] =
    [null, undefined, LengthMetrics.vp(3)] as (LengthMetrics | null | undefined)[]
  @State bottomPool: (LengthMetrics | Length | null | undefined)[] =
    [null, undefined, LengthMetrics.vp(3)] as (LengthMetrics | Length | null | undefined)[]
  @State spaceIndex: number = -1;
  @State bottomIndex: number = -1;
  @State ignoreSize: boolean | undefined = false;
  @State maskType: boolean = false;
  private swiperController1: SwiperController = new SwiperController()
  private swiperController2: SwiperController = new SwiperController()
  @State data1: MyDataSource = new MyDataSource([]) as MyDataSource
  @State data2: MyDataSource = new MyDataSource([]) as MyDataSource
  @State data3: MyDataSource = new MyDataSource([]) as MyDataSource
  @State list1: number[] = [] as number[];
  @State list2: number[] = [] as number[];
  @State list3: number[] = [] as number[];
  @State swiperItem: number = 20

  aboutToAppear(): void {
    this.updateData()
  }

  updateData(): void {
    this.list1 = [];
    for (let i = 1; i <= this.swiperItem; i++) {
      this.list1.push(i);
    }
    this.data1 = new MyDataSource(this.list1)
    this.list2 = [];
    for (let i = 1; i <= this.swiperItem; i++) {
      this.list2.push(i);
    }
    this.data2 = new MyDataSource(this.list2)
    this.list3 = [];
    for (let i = 1; i <= this.swiperItem; i++) {
      this.list3.push(i);
    }
    this.data3 = new MyDataSource(this.list3)
  }

  build() {
    Scroll() {
      Column({ space: 5 } as ColumnOptions) {
        // 第一个 Swiper
        Swiper(this.swiperController1) {
          ForEach(this.list1, (item: number) => {
            Text(String(item))
              .width('90%')
              .height('100%')
              .backgroundColor(0xAFEEEE)
              .textAlign(TextAlign.Center)
              .fontSize(30)
          }, (item: number) => String(item))
        }
        .height('20%')
        .width('80%')
        .nestedScroll(SwiperNestedScrollMode.SELF_ONLY)
        .displayMode(SwiperDisplayMode.STRETCH)
        .index(this.indexNumber)
        .autoPlay(this.autoPlay, undefined)
        .loop(this.loop)
        .duration(1000)
        .itemSpace(0)
        .key('Swiper_DotIndicator')
        .effectMode(EdgeEffect.Fade)
        .indicator(new DotIndicator()
          .maxDisplayCount(this.maxDisplayCount)
          .mask(this.maskType)
          .space(this.space!)
          // .bottom(this.bottom, this.ignoreSize)
          .itemWidth(15)
          .itemHeight(15)
          .selectedItemWidth(15)
          .selectedItemHeight(15)
          .color(Color.Gray)
          .selectedColor(Color.Blue))
        .displayArrow({
          showBackground: true,
          isSidebarMiddle: true,
          backgroundSize: 24,
          backgroundColor: Color.White,
          arrowSize: 18,
          arrowColor: Color.Blue
        } as ArrowStyle, false)
        .curve(Curve.Linear)
        .onChange((index: int): void => {
          console.info(index.toString())
        })

        // 第二个 Swiper
        Swiper(this.swiperController2) {
          ForEach(this.list2, (item: number) => {
            Text(String(item))
              .width('90%')
              .height('100%')
              .backgroundColor(0xCDE4FF)
              .textAlign(TextAlign.Center)
              .fontSize(30)
          }, (item: number) => String(item))
        }
        .height('20%')
        .width('80%')
        .nestedScroll(SwiperNestedScrollMode.SELF_FIRST)
        .index(1)
        .id('Swiper2')
        .key('Swiper_DigitIndicator')
        .autoPlay(this.autoPlay, undefined)
        .loop(this.loop)
        .duration(1000)
        .itemSpace(0)
        .effectMode(EdgeEffect.None)
        .indicator(Indicator.digit()
          // .bottom(this.bottom, this.ignoreSize)
          .fontColor(Color.Gray)
          .selectedFontColor(Color.Blue)
          .digitFont({ size: 20, weight: FontWeight.Bold })
          .selectedDigitFont({ size: 20, weight: FontWeight.Normal })
          )
        .displayArrow({ isSidebarMiddle: false } as ArrowStyle, false)
        .curve(Curve.Linear)
        .onChange((index: int): void => {
          console.info(index.toString())
        })

        // 按钮组
        Column() {
          Row({ space: 2 } as RowOptions) {
            Button('Space:' + this.spaceIndex).onClick((e: ClickEvent) => {
              this.spaceIndex = (this.spaceIndex + 1) % this.spacePool.length;
              this.space = this.spacePool[this.spaceIndex.toInt()];
            }).id('Space').width('25%').height('5%')
            Button('Bottom:' + this.bottomIndex).onClick((e: ClickEvent) => {
              this.bottomIndex = (this.bottomIndex + 1) % this.bottomPool.length;
              this.bottom = this.bottomPool[this.bottomIndex.toInt()];
            }).id('Bottom').width('25%').height('5%')
          }
        }

        Row({ space: 2 } as RowOptions) {
          Button('Ignore:' + this.ignoreSize)
            .onClick((e: ClickEvent) => {
              if (this.ignoreSize === true) {
                this.ignoreSize = false
              } else {
                this.ignoreSize = true
              }
            }).id('IgnoreSize').width('25%').height('5%')
          Button('Mask:' + this.maskType)
            .onClick((e: ClickEvent) => {
              if (this.maskType === true) {
                this.maskType = false
              } else {
                this.maskType = true
              }
            }).id('Mask').width('25%').height('5%')
        }
      }.margin(2)
    }.width('100%')
  }
}
