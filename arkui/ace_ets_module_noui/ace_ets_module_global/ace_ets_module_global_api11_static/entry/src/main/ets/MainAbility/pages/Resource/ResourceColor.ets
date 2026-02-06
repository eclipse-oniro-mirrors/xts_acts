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
  Swiper,
  Row,
  Button,
  Margin,
  IDataSource,
  DataChangeListener,
  SwiperController,
  SwiperController,
  Column,
  ColumnOptions,
  ClickEvent,
  RowOptions,
  LazyForEach,
  Text,
  FlexAlign
} from '@ohos.arkui.component';
import inspector from '@ohos.arkui.inspector';

class MyDataColor implements IDataSource<number> {
  private list: Array<number> = new Array<number>()

  constructor(list: Array<number>) {
    this.list = list
  }

  totalCount(): int {
    return this.list.length
  }

  getData(index: int): Double {
    return this.list[index.toInt()]
  }

  registerDataChangeListener(listener: DataChangeListener): void {
  }

  unregisterDataChangeListener(listener: DataChangeListener): void {
  }
}

@Entry
@Component
struct ResourceColor1 {
  private swiperController: SwiperController = new SwiperController()
  private data: MyDataColor = new MyDataColor([])

  aboutToAppear(): void {
    let list: Array<number> = new Array<number>()
    for (let i = 0; i <= 4; i++) {
      list.push(i);
    }
    this.data = new MyDataColor(list)
    console.info("test error " + JSON.stringify(this.data));
  }

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Swiper(this.swiperController) {
        LazyForEach(this.data, (item: number, index: int) => {
            Column() {
              Column() {
                Text('color test').fontSize(20)
                Text('color').backgroundColor($r('app.color.color_' + String(item))).id('color')
              }.border({ width: 2 }).margin(30)
            }
            .justifyContent(FlexAlign.SpaceEvenly)
            .width(300)
            .height(300)

          },
          (item: number) => String(item))
      }
      .cachedCount(2)
      .index(1)
      .interval(4000)
      .loop(true)
      .duration(1000)
      .itemSpace(0)
      .height('90%')
      .width('100%')

      Row({ space: 12 } as RowOptions) {
        Button('showNext')
          .id('ResourceColor')
          .onClick((e: ClickEvent) => {
            console.log('+++++++++++++++++++++++++++2.1')
            this.swiperController.showNext()
          })
        Button('showPrevious')
          .onClick((e: ClickEvent) => {
            this.swiperController.showPrevious()
          })
      }.margin(5)
    }
    .height('100%')
    .width('100%')
    .margin({ top: 5 } as Margin)
  }
}