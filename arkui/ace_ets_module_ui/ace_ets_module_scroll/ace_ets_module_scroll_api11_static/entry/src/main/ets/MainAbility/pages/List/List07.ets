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
  Column,
  Flex,
  Row,
  Text,
  Color,
  ListScroller,
  Builder,
  Margin,
  List,
  VisibleListContentInfo,
  ScrollState,
  Button,
  ClickEvent,
  Scroller,
  IDataSource,
  DataChangeListener,
  ForEach,
  Axis,
  EdgeEffect,
  LengthConstrain,
  ListItem,
  TextAlign,
  ListOptions
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

class MyDataSourceList07 implements IDataSource<number> {
  private list: number[] = []
  private listener?: DataChangeListener = undefined

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
    this.listener = listener
  }

  unregisterDataChangeListener(listener: DataChangeListener): void {
  }
}

@Entry
@Component
struct List07 {
  private data: MyDataSourceList07 = new MyDataSourceList07([])
  @State mywidth: number = 400
  @State myheight: number = 400
  private arr: number[] = [
    0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10,
    11, 12, 13, 14, 15, 16, 17, 18, 19, 20,
    21, 22, 23, 24, 25, 26, 27, 28, 29, 30
  ] as number[]

  aboutToAppear(): void {
    let list: number[] = []
    for (let i = 1; i <= 10; i++) {
      list.push(i);
    }
    this.data = new MyDataSourceList07(list)
  }

  build() {
    Column() {
      List({ space: 20, initialIndex: 0 }) {
        ForEach(this.arr, (item: number, index: int) => {
          ListItem() {
            Text('' + item)
              .width('100%')
              .height(50)
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .borderRadius(10)
              .backgroundColor(0xFFFFFF)
          }
          .border({ color: 0xAAAAAA, width: 2 })
        }, (item: number) => item.toString())
      }
      .padding(10)
      .border({ color: 0xAAAAAA, width: 2 })
      .listDirection(Axis.Vertical) // 排列方向
      .divider({
        strokeWidth: 2,
        color: 0xFFFFFF,
        startMargin: 2,
        endMargin: 2
      }) // 每行之间的分界线
      .edgeEffect(EdgeEffect.Spring) // 滑动到边缘无效果
      .onScrollIndex((firstIndex: int, lastIndex: int, center: int) => {
        console.info('first' + firstIndex)
        console.info('last' + lastIndex)
      })
      .key("ArkUX_Grid_List_Swiper_0250")
      .lanes({ minLength: 100, maxLength: 150 } as LengthConstrain, 20)
      .width('100%')

      List({ space: 20, initialIndex: 0 }) {
        ForEach(this.arr, (item: number, index: int) => {
          ListItem() {
            Text('' + item)
              .width('100%')
              .height(50)
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .borderRadius(10)
              .backgroundColor(0xFFFFFF)
          }
          .border({ color: 0xAAAAAA, width: 2 })
        }, (item: number) => item.toString())
      }
      .padding(10)
      .border({ color: 0xAAAAAA, width: 2 })
      .listDirection(Axis.Vertical)
      .divider({
        strokeWidth: 2,
        color: 0xFFFFFF,
        startMargin: 2,
        endMargin: 2
      })
      .edgeEffect(EdgeEffect.Spring)
      .onScrollIndex((firstIndex: int, lastIndex: int, center: int) => {
        console.info('first' + firstIndex)
        console.info('last' + lastIndex)
      })
      .key("ArkUX_Grid_List_Swiper_0260")
      .lanes({ minLength: 100, maxLength: 150 } as LengthConstrain, 100)
      .width('100%')

      List({ space: 20, initialIndex: 0 } as ListOptions) {
        ForEach(this.arr, (item: number, index: int) => {
          ListItem() {
            Text('' + item)
              .width('100%')
              .height(50)
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .borderRadius(10)
              .backgroundColor(0xFFFFFF)
          }
          .border({ color: 0xAAAAAA, width: 2 })
        }, (item: number) => item.toString())
      }
      .padding(10)
      .border({ color: 0xAAAAAA, width: 2 })
      .listDirection(Axis.Vertical)
      .divider({
        strokeWidth: 2,
        color: 0xFFFFFF,
        startMargin: 2,
        endMargin: 2
      })
      .edgeEffect(EdgeEffect.Spring)
      .onScrollIndex((firstIndex: int, lastIndex: int, center: int) => {
        console.info('first' + firstIndex)
        console.info('last' + lastIndex)
      })
      .key("ArkUX_Grid_List_Swiper_0270")
      .lanes(undefined)
      .width('100%')

      List({ space: 20, initialIndex: 0 }) {
        ForEach(this.arr, (item: number, index: int) => {
          ListItem() {
            Text('' + item)
              .width('100%')
              .height(50)
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .borderRadius(10)
              .backgroundColor(0xFFFFFF)
          }
          .border({ color: 0xAAAAAA, width: 2 })
        }, (item: number) => item.toString())
      }
      .padding(10)
      .border({ color: 0xAAAAAA, width: 2 })
      .listDirection(Axis.Vertical)
      .divider({
        strokeWidth: 2,
        color: 0xFFFFFF,
        startMargin: 2,
        endMargin: 2
      })
      .edgeEffect(EdgeEffect.Spring)
      .onScrollIndex((firstIndex: int, lastIndex: int, center: int) => {
        console.info('first' + firstIndex)
        console.info('last' + lastIndex)
      })
      .key("ArkUX_Grid_List_Swiper_0280")
      .lanes({ minLength: 100, maxLength: 150 } as LengthConstrain, 500)
      .width('100%')

      List({ space: 20, initialIndex: 0 }) {
        ForEach(this.arr, (item: number, index: int) => {
          ListItem() {
            Text('' + item)
              .width('100%')
              .height(50)
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .borderRadius(10)
              .backgroundColor(0xFFFFFF)
          }
          .border({ color: 0xAAAAAA, width: 2 })
        }, (item: number) => item.toString())
      }
      .padding(10)
      .border({ color: 0xAAAAAA, width: 2 })
      .listDirection(Axis.Vertical)
      .divider({
        strokeWidth: 2,
        color: 0xFFFFFF,
        startMargin: 2,
        endMargin: 2
      })
      .edgeEffect(EdgeEffect.Spring)
      .onScrollIndex((firstIndex: int, lastIndex: int, center: int) => {
        console.info('first' + firstIndex)
        console.info('last' + lastIndex)
      })
      .key("ArkUX_Grid_List_Swiper_0290")
      .lanes({ minLength: 100, maxLength: 150 } as LengthConstrain, 250)
      .width('100%')
    }
    .width(this.mywidth)
    .backgroundColor(0xEEEEEE)
    .margin({ top: 5 } as Margin)
    .height(this.myheight)

  }
}