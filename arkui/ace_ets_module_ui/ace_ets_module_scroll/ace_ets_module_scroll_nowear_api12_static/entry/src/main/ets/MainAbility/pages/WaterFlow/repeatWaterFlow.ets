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
import { Entry, Component, Column, ComponentV2, Scroller, ClickEvent, ScrollState, ScrollSource, ColumnOptions, Text,
  Row, WaterFlow, Button, Repeat, FlexDirection, Edge, FlowItem } from '@ohos.arkui.component'
import { State, Trace, ObservedV2, Param, Local } from '@ohos.arkui.stateManagement';

@ObservedV2
class ArrayVehicle {
  @Trace public arr: Array<number> = [];

  constructor(count: number) {
    for (let i = 1; i <= count; ++i) {
      this.arr.push(i);
    }
  }
}


@ComponentV2
struct repeatChildItem {
  @Param item: number = 0;

  aboutToAppear(): void {
    console.info('item:' + this.item)
  }

  build() {
    Column(){
      Text('N' + this.item).fontSize(12).height('16')
    }

  }
}

@Entry
@ComponentV2
struct repeatWaterFlow {
  @Local arrayVehicle: ArrayVehicle = new ArrayVehicle(100)
  @Local totalCount: int = this.arrayVehicle.arr.length
  @Local minSize: number = 50
  @Local maxSize: number = 100
  scroller: Scroller = new Scroller()
  @Local colors: int[] = [0xFFC0CB, 0xDA70D6, 0x6B8E23, 0x6A5ACD, 0x00FFFF, 0x00FF7F] as int[]
  dataSource: WaterFlowDataSource = new WaterFlowDataSource()
  private itemWidthArray: number[] = new Array<number>()
  private itemHeightArray: number[] = new Array<number>()
  @Local index: number = 0;
  @Local onReachText:string = ''
  @Local onText1:string = ''
  @Local onText2:string = ''
  @Local onScrollFrameBeginText:string = ''
  @Local onScrollIndex:string = ''

  // 计算FlowItem宽/高
  getSize() {
    let ret = Math.floor(Math.random() * this.maxSize)
    return 50
  }

  // 设置FlowItem宽/高数组
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
      Text(`onReachStart${this.index}`).id('flowRepeat_onReachStart')
      Text('onReachEnd: '+ this.onReachText).id('flowRepeat_onReachText')
      Text('onWillScroll: '+ this.onText1).id('flowRepeat_onText_1')
      Text('onDidScroll: '+ this.onText2).id('flowRepeat_onText_2')
      Text('onScrollFrameBegin: '+ this.onScrollFrameBeginText).id('flowRepeat_onFrameBegin')
      Text('onScrollIndex: '+ this.onScrollIndex).id('flowRepeat_onScrollIndex')
      Row(){
        Button('scroll bottom').id('flowRepeat_scroll')
          .onClick((event: ClickEvent) => {
            this.scroller.scrollEdge(Edge.Bottom)
          })
      }.margin(5)

      WaterFlow({ scroller: this.scroller }) {
        Repeat<number>(this.arrayVehicle.arr)
          .virtualScroll({ totalCount: this.totalCount })
          .key((item, index) => `${index}:${item}`)
          .each((ri) => {
            FlowItem() {
              repeatChildItem({ item: ri.item })
            }
            .width('100%')
            .height(this.itemHeightArray[(ri.item as int) % 100])
            .backgroundColor(this.colors[(ri.item as int) % 5])
          })
      }
      .id('flowRepeat_event')
      .columnsTemplate('1fr 1fr 1fr')
      .columnsGap(10)
      .rowsGap(5)
      .width('100%')
      .height('60%')
      .backgroundColor(0xFAEEE0)
      .layoutWeight(FlexDirection.Column)
      .enableScrollInteraction(true)
      .onScrollIndex((first: int, last: int) => {
        this.onScrollIndex = 'success'
        console.info('onScrollIndex first:' + first.toString() + ' last:' + last.toString())
      })
      .onReachStart(() => {
        this.index++
        console.info('waterFlow reach start')
      })
      .onReachEnd(() => {
        this.onReachText = 'success'
        console.info('waterFlow reach end')
      })
      .onWillScroll((scrollOffset: number, scrollState: ScrollState, scrollSource: ScrollSource): undefined => {
        this.onText1 = 'success'
        console.info(`onWillScroll scrollState = ${scrollState[scrollState]}, offset = ${scrollOffset}`)
        return undefined
      })
      .onDidScroll((scrollOffset: number, scrollState: ScrollState) => {
        this.onText2 = 'success'
        console.info(`onWillScroll scrollState = ${scrollState[scrollState]}, offset = ${scrollOffset}`)
      })
      .onScrollFrameBegin((offset: number, state: ScrollState) => {
        this.onScrollFrameBeginText = 'success'
        console.info('waterFlow scrollFrameBegin offset: ' + offset + ' state: ' + state.toString())
        return { offsetRemain: offset }
      })

    }
  }
}