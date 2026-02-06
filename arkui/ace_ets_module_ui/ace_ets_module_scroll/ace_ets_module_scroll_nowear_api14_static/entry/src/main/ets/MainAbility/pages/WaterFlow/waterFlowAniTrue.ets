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
import hilog from '@ohos.hilog'
import { WaterFlowDataSource } from './WaterFlowDataSource';
import {
  Entry,
  Component,
  Scroller,
  ScrollState,
  Column,
  ColumnOptions,
  Text,
  Button,
  WaterFlow,
  Margin,
  LazyForEach,
  FlowItem,
  ClickEvent,
  WaterFlowOptions,
  OnScrollFrameBeginHandlerResult,
  OnScrollFrameBeginCallback,
  Optional,
  OnWillScrollCallback,
  OnScrollCallback,
  ScrollSource,
  ScrollResult
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct waterFlowNextAnimationExample {
  @State minSize: number = 50
  @State maxSize: number = 100
  @State padding1: number = 0
  scroller: Scroller = new Scroller()
  @State colors: int[] = [0xFFC0CB, 0xDA70D6, 0x6B8E23, 0x6A5ACD, 0x00FFFF, 0x00FF7F] as int[]
  dataSource: WaterFlowDataSource = new WaterFlowDataSource()
  @State onText: string = 'WaterFlow: '
  @State nextBln: boolean = false
  private itemWidthArray: number[] = new Array<number>()
  private itemHeightArray: number[] = new Array<number>()

  // 计算FlowItem宽/高
  getSize() {
    let ret = Math.floor(Math.random() * this.maxSize)
    return (ret > this.minSize ? ret : this.minSize)
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
    Column({ space: 5 } as ColumnOptions) {
      Text('' + this.onText)
        .id('waterFlow_true_onText')
        .width('90%')

      Button('next page true')
        .id('waterFlow_animation_true')
        .onClick((e: ClickEvent) => { // 点击后滑到下一页
          this.nextBln = true
          this.scroller.scrollPage({ next: this.nextBln, animation: true })
        })
      Column() {
        WaterFlow({ scroller: this.scroller } as WaterFlowOptions) {
          LazyForEach(this.dataSource, (item: number) => {
            FlowItem() {
              Column() {
                Text('N' + item).fontSize(12).height('16')
              }
            }
            .width('100%')
            .height(this.itemHeightArray[item.toInt() % 100])
            .backgroundColor(this.colors[item.toInt() % 5])
          }, (item: Double) => 'item')
        }
        .width('100%')
        .columnsTemplate('1fr 1fr')
        .columnsGap(10)
        .rowsGap(5)
        .backgroundColor(0xFAEEE0)
        .layoutWeight(1)
        .borderWidth(2)
        .onScrollIndex((first: Int, last: Int) => {
          console.info('onScrollIndex first:' + first.toString() + ' last:' + last.toString())
        })
        // .onWillScroll((scrollOffset: number, scrollState: ScrollState, scrollSource: ScrollSource) => {
        //   console.info(`onWillScroll scrollState = ${scrollState[scrollState]}, offset = ${scrollOffset}`)
        // })
        .onDidScroll((scrollOffset: number, scrollState: ScrollState) => {
          console.info(`onDidScroll scrollState = ${scrollState[scrollState]}, offset = ${scrollOffset}`)
          if (scrollState == ScrollState.Idle) {
            this.onText += 'onDidScroll-'
            console.info('ScrollState.Idle: ' + scrollState)
          }
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
        .onScrollFrameBegin((offset: number, state: ScrollState) => {
          this.onText += 'onScrollFrameBegin-'
          console.info('waterFlow scrollFrameBegin offset: ' + offset + ' state: ' + state.toString())
          return { offsetRemain: offset }
        })
      }
      .width('90%')
      .height('50%')

    }.width('100%')
    .height('100%')
    .margin({ top: 5 } as Margin)
  }
}