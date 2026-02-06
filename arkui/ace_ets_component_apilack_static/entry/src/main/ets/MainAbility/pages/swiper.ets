'use static';
/*
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
  $rawfile,
  Alignment,
  AutoPlayOptions,
  Button,
  ClickEvent,
  Column,
  ColumnOptions,
  Component,
  Curve,
  DataChangeListener,
  Entry,
  Flex,
  FlexAlign,
  FlexDirection,
  FontWeight,
  IDataSource,
  Image,
  ItemAlign,
  LazyForEach,
  Margin,
  Path,
  Search,
  SearchController,
  Stack,
  Swiper,
  SwiperController,
  Text,
  TextAlign,
  TextOverflow
} from '@ohos.arkui.component';
import Log from '../common/Log';
import { State } from '@ohos.arkui.stateManagement';

class MyDataSource implements IDataSource<number> {
  private list: number[] = []
  private listener: DataChangeListener | undefined = undefined

  constructor(list: number[]) {
    this.list = list
  }

  totalCount(): int {
    return this.list.length
  }

  getData(index: int): number {
    let RealIndex: Int = index.toInt()
    return this.list[RealIndex]
  }

  registerDataChangeListener(listener: DataChangeListener): void {
    this.listener = listener
  }

  unregisterDataChangeListener(listener: DataChangeListener): void {
  }
}


const TAG = 'ets_apiLack_add';

@Entry
@Component
struct SwiperCurve {
  @State isTrue: boolean = true
  private swiperController: SwiperController = new SwiperController()
  private data: MyDataSource = new MyDataSource([])

  aboutToAppear(): void {
    Log.showInfo(TAG, `aboutToAppear SwiperCurve start`)
    let list: number[] = []
    for (let i: number = 1; i <= 10; i++) {
      list.push(i);
    }
    this.data = new MyDataSource(list)
  }

  aboutToDisappear() {
    Log.showInfo(TAG, `aboutToDisAppear SwiperCurve end`)
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {

      Column({ space: 5 } as ColumnOptions) {
        Swiper(this.swiperController) {
          LazyForEach(this.data, (item: number) => {
            Text(item.toString())
              .width('90%')
              .height(160)
              .backgroundColor(0xAFEEEE)
              .textAlign(TextAlign.Center)
              .fontSize(20)
          }, (item: number) => item!.toString())
        }
        .key("swiper")
        .cachedCount(2)
        .index(1)
        .autoPlay(this.isTrue, { stopWhenTouched: true } as AutoPlayOptions)
        .interval(4000)
        .indicator(true) // 默认开启指示点
        .loop(false) // 默认开启循环播放
        .duration(1000)
        .vertical(false) // 默认横向切换
        .itemSpace("0px")
        .curve(Curve.Linear) // 动画曲线
        .onChange((index: int) => {
          console.info(index.toString())
        })
        .onAnimationStart((index: int) => {
          console.info(index.toString())
        })
        .onAnimationEnd((index: int) => {
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
        }
      }.margin({ top: 5 } as Margin)


      Text("swiper-Curve")
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
        .key("curveText")

    }.width("100%").height("100%")

  }
}

