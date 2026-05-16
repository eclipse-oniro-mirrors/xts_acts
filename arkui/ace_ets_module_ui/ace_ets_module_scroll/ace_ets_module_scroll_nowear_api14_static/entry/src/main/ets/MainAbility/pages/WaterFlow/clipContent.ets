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
import { WaterFlowDataSource } from './WaterFlowDataSource';
import {
  Entry,
  Component,
  Scroller,
  ScrollState,
  ScrollSource,
  ContentClipMode,
  Column,
  ColumnOptions,
  Text,
  Button,
  WaterFlow,
  LazyForEach,
  WaterFlow,
  FlowItem,
  Padding,
  ClickEvent,
  EdgeEffect,
  BarState,
  WaterFlowOptions,
  Edges,
  Padding
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct clipContentWaterFlowDemo {
  minSize: number = 80
  maxSize: number = 180
  fontSize: number = 24
  colors: int[] = [0xFFC0CB, 0xDA70D6, 0x6B8E23, 0x6A5ACD, 0x00FFFF, 0x00FF7F] as int[]
  scroller: Scroller = new Scroller()
  dataSource: WaterFlowDataSource = new WaterFlowDataSource()
  dataCount: int = this.dataSource.totalCount()
  private itemHeightArray: number[] = new Array<number>()
  //裁剪效果
  @State clipContent1: ContentClipMode = ContentClipMode.CONTENT_ONLY
  @State text1: string = 'CONTENT_ONLY'

  // 计算FlowItem高度
  getSize() {
    let ret = Math.floor(Math.random() * this.maxSize)
    return (ret > this.minSize ? ret : this.minSize)
  }

  // 设置FlowItem的高度数组
  setItemSizeArray() {
    for (let i = 0; i < 100; i++) {
      this.itemHeightArray.push(this.getSize())
    }
  }

  aboutToAppear() {
    this.setItemSizeArray()
  }

  build() {
    Column({ space: 2 } as ColumnOptions) {
      Text('ContentClipMode: ' + this.text1)
      Button('BOUNDARY')
        .id('clipContent_water_boundary')
        .margin(5)
        .onClick((e: ClickEvent) => {
          this.text1 = 'BOUNDARY'
          this.clipContent1 = ContentClipMode.BOUNDARY
        })
      Button('SAFE_AREA')
        .id('clipContent_water_safearea')
        .margin(5)
        .onClick((e: ClickEvent) => {
          this.text1 = 'SAFE_AREA'
          this.clipContent1 = ContentClipMode.SAFE_AREA
        })

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
      .id('common_clipContent_water')
      .width('90%')
      .height('50%')
      .cachedCount(4, true)
      .clip(false)
      .offset({right:10,left:10} as Edges)
      .padding({
        right: 20,
        top: 30,
        left: 10,
        bottom: 30
      } as Padding)
      .safeAreaPadding({left:30,top:30,right:30,bottom:30} as Padding)
      .clipContent(this.clipContent1)
      .columnsTemplate('1fr 1fr')
      .columnsGap(10)
      .rowsGap(5)
      .backgroundColor(0xFAEEE0)
      .edgeEffect(EdgeEffect.Spring)
      .scrollBar(BarState.On)
      .border({ width: 1 })
      .layoutWeight(1)
      .onReachStart(() => {
        console.info('HHH onReachStart')
      })
      .onReachEnd(() => {
        console.info('HHH onReachEnd')
      })
      .onScrollStop(() => {
        console.info('HHH onScrollStop')
      })
      .onScrollStart(() => {
        console.info('HHH onScrollStart')
      })
      .onWillScroll((yOffset: number, scrollState: ScrollState, scrollSource: ScrollSource) => {
        console.info('onWillScroll:' + yOffset + '；ScrollState: ' + scrollState + '；ScrollSource:' + scrollSource)
      })
      .onDidScroll((yOffset: number, scrollState: ScrollState) => {
        console.info('onDidScroll:' + yOffset + ' ；ScrollState:' + scrollState)
      })
      .onScrollFrameBegin((offset: number, state: ScrollState) => {
        console.info('HHH scrollFrameBegin offset: ' + offset + ' state: ' + state.toString())
        return { offsetRemain: offset }
      })
      .onScrollIndex((first: Int, last: Int) => {
        console.info('HHH-' + 'first:' + first + '、last:' + last)
      })

    }
    .width('100%')
    .height('100%')
  }
}