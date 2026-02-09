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
import { WaterFlowDataSource } from './WaterFlowDataSource'
import { Entry, Component, Scroller, Column, ColumnOptions, ScrollState, ClickEvent, WaterFlow, Text, Button,
  LazyForEach, FlowItem, OnScrollFrameBeginHandlerResult } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct WaterFlowFling2 {
  minSize: number = 80
  maxSize: number = 180
  fontSize: number = 24
  colors: int[] = [0xFFC0CB, 0xDA70D6, 0x6B8E23, 0x6A5ACD, 0x00FFFF, 0x00FF7F] as int[]
  scroller: Scroller = new Scroller()
  dataSource: WaterFlowDataSource = new WaterFlowDataSource()
  private itemWidthArray: number[] = new Array<number>()
  private itemHeightArray: number[] = new Array<number>()
  @State onText:string = ''

  // 计算FlowItem高度
  getSize() {
    let ret = Math.floor(Math.random() * this.maxSize)
    return 50
  }

  // 设置FlowItem的高度数组
  setItemSizeArray() {
    for (let i = 0; i < 100; i++) {
      this.itemWidthArray.push(this.getSize())
      this.itemHeightArray.push(this.getSize())
    }
  }

  aboutToAppear() {
    this.setItemSizeArray()
  }

  build() {
    Column({ space: 2 } as ColumnOptions) {
      WaterFlow({ scroller: this.scroller }) {
        LazyForEach(this.dataSource, (item: number) => {
          FlowItem() {
            Column() {
              Text('N' + item)
                .fontSize(12)
                .height('16')
            }
          }
          .width('100%')
          .height(this.itemHeightArray[(item as int) % 100])
          .backgroundColor(this.colors[(item as int) % 5])
        }, (item: number) => String(item))
      }
      .columnsTemplate('1fr 1fr')
      .columnsGap(10)
      .rowsGap(5)
      .backgroundColor(0xFAEEE0)
      .width('100%')
      .height('40%')
      .layoutWeight(1)
      .onScrollIndex((first: int, last: int) => {
        this.onText += 'onScrollIndex-'
        console.info('onScrollIndex first:' + first.toString() + ' last:' + last.toString())
      })
      .onReachStart(() => {
        this.onText += 'onReachStart-'
        console.info('waterFlow reach start')
      })
      .onReachEnd(() => {
        this.onText += 'onReachEnd-'
        console.info('waterFlow reach end')
      })
      .onScrollStart(() => {
        this.onText += 'onScrollStart-'
        console.info('waterFlow scroll start')
      })
      .onScrollStop(() => {
        this.onText += 'onScrollStop'
        console.info('waterFlow scroll stop')
      })
      .onScrollFrameBegin((offset: number, state: ScrollState): OnScrollFrameBeginHandlerResult => {
        this.onText += 'onScrollFrameBegin-'
        console.info('waterFlow scrollFrameBegin offset: ' + offset + ' state: ' + state.toString())
        return { offsetRemain: offset } as OnScrollFrameBeginHandlerResult
      })

      Text('fling: '+ this.onText)
        .id('water_fling_2')
        .width('90%')
        .height('20%')
      Button('scroll fling')
        .id('fling_scroll_2')
        .onClick((event: ClickEvent) => {
          this.scroller.fling(2000)
        })
    }
  }
}