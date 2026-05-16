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
  SwiperAnimationEvent,
  HorizontalAlign,
  ArrowStyle,
  SwiperAutoFill,
  Padding,
  Indicator,
  FontWeight,
  Flex,
  FlexAlign,
  List,
  ListItem,
  $r
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';

class MyDataSource implements IDataSource<number> {
  private list: number[] = []
  private listener?: DataChangeListener = undefined

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
    this.listener = listener
  }

  unregisterDataChangeListener(listener: DataChangeListener) {
  }
}

@Entry
@Component
struct SwiperExample2 {
  private swiperController: SwiperController = new SwiperController()
  private data: MyDataSource = new MyDataSource([])

  aboutToAppear(): void {
    let list: number[] = []
    for (let i = 1; i <= 10; i++) {
      list.push(i);
    }
    this.data = new MyDataSource(list)
  }

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Swiper(this.swiperController) {
        LazyForEach(this.data, (item: number, index: int) => {
          Text(item.toString())
            .width('90%')
            .height(160)
            .backgroundColor(0xAFEEEE)
            .textAlign(TextAlign.Center)
            .fontSize(20)
        }, (item: number) => item.toString())
      }
      .key('swiper')
      .cachedCount(2)
      .index(1)
      .autoPlay(true, undefined)
      .interval(4000)
      .indicator(true)
      .loop(false)
      .duration(1000)
      .vertical(false)
      .disableSwipe(true)
      .itemSpace(0)
      .onChange((index: int): void => {
        console.info(index.toString())
      })

      Flex({ justifyContent: FlexAlign.SpaceAround }) {
        Button('next')
          .onClick((e: ClickEvent) => {
            this.swiperController.showNext()
          })
        Button('preview')
          .onClick((e: ClickEvent) => {
            this.swiperController.showPrevious()
          })
        Button('finishAnimation')
          .onClick((e: ClickEvent) => {
            this.swiperController.finishAnimation()
          })
      }
    }.margin({ top: 5 } as Margin)
  }
}