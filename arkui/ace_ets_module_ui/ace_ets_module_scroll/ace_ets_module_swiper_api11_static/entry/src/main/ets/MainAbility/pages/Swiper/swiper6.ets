'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
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
  $r,
  Alignment,
  TextOverflow
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import Log from '../../common/Log';

const TAG = 'ets_apiLack_add';

@Entry
@Component
struct SwiperMask {
  private swiperController: SwiperController = new SwiperController()
  private data: MyDataSource = new MyDataSource([])

  aboutToAppear() {
    Log.showInfo(TAG, `aboutToAppear SwiperMask start`)
    let list: number[] = []
    for (let i = 1; i <= 5; i++) {
      list.push(i);
    }
    this.data = new MyDataSource(list)
  }

  aboutToDisappear() {
    Log.showInfo(TAG, `aboutToDisAppear SwiperMask end`)
  }

  build() {
    Row() {
      Column({ space: 10 } as ColumnOptions) {
        Text("swiper-Mask")
          .width(100)
          .height(70)
          .fontSize(20)
          .opacity(1)
          .align(Alignment.TopStart)
          .fontColor(0xCCCCCC)
          .lineHeight(25)
          .border({ width: 1 })
          .padding(10)
          .textAlign(TextAlign.Center)
          .textOverflow({ overflow: TextOverflow.None })
          .key("maskText")

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
        .cachedCount(2)
        .index(1)
        .autoPlay(true, undefined)
        .interval(4000)
        .indicator(true) // 默认开启指示点
        .loop(false) // 默认开启循环播放
        .duration(1000)
        .vertical(false) // 默认横向切换
        .itemSpace(0)
        .curve(Curve.Linear) // 动画曲线
        .key("maskSwiper")
        // .indicatorStyle({
        //   mask: false
        // })
      }
      .width('100%')
    }
    .height('100%')
  }
}

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