/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { LengthMetrics } from '@kit.ArkUI';

class MyDataSource implements IDataSource {
  private list: number[] = [];

  constructor(list: number[]) {
    this.list = list;
  }

  totalCount(): number {
    return this.list.length;
  }

  getData(index: number): number {
    return this.list[index];
  }

  registerDataChangeListener(listener: DataChangeListener): void {
  }

  unregisterDataChangeListener() {
  }
}

@Entry
@Component
struct DotIndicatorNullUndefined {

  @State space: LengthMetrics = LengthMetrics.vp(0);
  @State spacePool: LengthMetrics[] = [LengthMetrics.vp(0), LengthMetrics.px(3), LengthMetrics.vp(10)];
  @State spaceIndex: number = 0;

  @State ignoreSize: boolean = false;
  @State ignoreSizePool: boolean[] = [false, true];
  @State ignoreSizeIndex: number = 0;

  private swiperController1: SwiperController = new SwiperController();
  private data1: MyDataSource = new MyDataSource([]);

  aboutToAppear(): void {
    let list1: number[] = [];
    for (let i = 1; i <= 10; i++) {
      list1.push(i);
    }
    this.data1 = new MyDataSource(list1);
  }

  build() {
    Scroll() {
      Column({ space: 5}) {
        Swiper(this.swiperController1) {
          LazyForEach(this.data1, (item: string) => {
            Text(item.toString())
              .width('90%')
              .height(120)
              .backgroundColor(0xAFEEEE)
              .textAlign(TextAlign.Center)
              .fontSize(30)
          }, (item: string) => item)
        }
        .indicator(new DotIndicator()
          .space(null) // 控制导航点之间的间距
          .bottom(LengthMetrics.vp(0), this.ignoreSize) // 控制导航点与Swiper底部的间距
          .itemWidth(null)
          .itemHeight(null)
          .selectedItemWidth(null)
          .selectedItemHeight(null)
          .color(null)
          .selectedColor(null)
          .maxDisplayCount(null)
          .left(null)
          .top(null)
          .right(null)
          .bottom(null)
          .bottom(null, true)
          .start(null)
          .end(null)
        )
        .id('swiperDot1')
        .height('30%')

        Swiper(this.swiperController1) {
          LazyForEach(this.data1, (item: string) => {
            Text(item.toString())
              .width('90%')
              .height(120)
              .backgroundColor(0xAFEEEE)
              .textAlign(TextAlign.Center)
              .fontSize(30)
          }, (item: string) => item)
        }
        .indicator(new DotIndicator()
          .space(undefined) // 控制导航点之间的间距
          .bottom(LengthMetrics.vp(0), this.ignoreSize) // 控制导航点与Swiper底部的间距
          .itemWidth(undefined)
          .itemHeight(undefined)
          .selectedItemWidth(undefined)
          .selectedItemHeight(undefined)
          .color(undefined)
          .selectedColor(undefined)
          .maxDisplayCount(undefined)
          .left(undefined)
          .top(undefined)
          .right(undefined)
          .bottom(undefined)
          .bottom(undefined, true)
          .start(undefined)
          .end(undefined)
        )
        .id('swiperDot2')
        .height('30%')

        Swiper(this.swiperController1) {
          LazyForEach(this.data1, (item: string) => {
            Text(item.toString())
              .width('90%')
              .height(120)
              .backgroundColor(0xAFEEEE)
              .textAlign(TextAlign.Center)
              .fontSize(30)
          }, (item: string) => item)
        }
        .indicator(new DotIndicator()
          .bottom(LengthMetrics.vp(0), this.ignoreSize) // 控制导航点与Swiper底部的间距
        )
        .id('swiperDot3')
        .height('30%')
      }
      .width('100%')
      .height('100%')
    }
  }
}