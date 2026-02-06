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
  Visibility,
  ClickEvent
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';

class MyDataSourceSwiperVisibility implements IDataSource<number> {
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
struct SwiperVisibilityTest {
  private swiperController: SwiperController = new SwiperController()
  private data: MyDataSourceSwiperVisibility = new MyDataSourceSwiperVisibility([])
  @State loop: boolean = false
  @State index: number = 0
  @State autoPlay: boolean = false
  @State swiperValue: string = ''
  @State text: string = ''

  aboutToAppear(): void {
    let list: number[] = []
    for (let i = 1; i <= 10; i++) {
      list.push(i);
    }
    this.data = new MyDataSourceSwiperVisibility(list)
  }

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Swiper(this.swiperController) {
        Text('1')
          .width('90%')
          .height(160)
          .backgroundColor(0xAFEEEE)
          .textAlign(TextAlign.Center)
          .fontSize(30)
          .key('SwiperVisibilityText1')
        Text('2')
          .width('90%')
          .height(160)
          .backgroundColor(0xAFEEEE)
          .textAlign(TextAlign.Center)
          .fontSize(30)
          .key('SwiperVisibilityText2')
        Text('3')
          .width('90%')
          .height(160)
          .backgroundColor(0xAFEEEE)
          .textAlign(TextAlign.Center)
          .fontSize(30)
          .key('SwiperVisibilityText3')
          .visibility(Visibility.Hidden)
      }
      .key('swiperVisibility')
      .cachedCount(2)
      .index(1)
      .autoPlay(this.autoPlay, undefined)
      .interval(1000)
      .loop(this.loop)
      .duration(100)
      .itemSpace(0)
      .displayArrow(true, false)
      .onChange((index: int): void => {
        this.swiperValue = index + ''
      })

      Text(this.swiperValue).key('SwiperVisibilityText')

    }.width('100%')
    .margin({ top: 5 } as Margin)
  }
}