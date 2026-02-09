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
import { Entry, Component, Column, Scroller, SectionOptions, Text, Button, WaterFlow, LazyForEach, FlowItem, Reusable,
  WaterFlowSections, Margin, FlexDirection, ColumnOptions, ClickEvent, Row, Direction, BarState } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct WaterFlow3 {
  @State minSize: number = 80
  @State maxSize: number = 180
  @State num: number = 0
  scroller: Scroller = new Scroller()
  @State colors: int[] = [0xFFC0CB, 0xDA70D6, 0x6B8E23, 0x6A5ACD, 0x00FFFF, 0x00FF7F] as int[]
  dataSource: WaterFlowDataSource = new WaterFlowDataSource()
  @State layoutdir1: FlexDirection = FlexDirection.ColumnReverse
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
      Column(){
        Text('length: ' + this.num)
          .id('flow_length_3')
         
        Button('layoutDirection')
          .id('flow_layoutdir_3')
          .onClick((e: ClickEvent) => {
            this.layoutdir1 = FlexDirection.Column
          })
        Row(){
          Button('delete3')
            .id('flow_delete_3')
            .onClick((e: ClickEvent) => {
              this.dataSource.deleteItem(2)
              this.num = this.dataSource.totalCount()
            })
          Button('add')
            .id('flow_add_3')
            .onClick((e: ClickEvent) => {
              this.dataSource.addItem(2)
              this.num = this.dataSource.totalCount()
            })
        }

      }.height('20%')

      WaterFlow({scroller: this.scroller }) {
        LazyForEach(this.dataSource, (item: number) => {
          FlowItem() {
            Column() {
              Text("N" + item).fontSize(12).height('16')
            }
          }
          .width('100%')
          .height(this.itemHeightArray[(item as int) % 100])
          .backgroundColor(this.colors[(item as int) % 5])
        }, (item: number) => String(item))
      }
      .layoutDirection(this.layoutdir1)
      .direction(Direction.Rtl)
      .scrollBar(BarState.On)
      .scrollBarWidth(20)
      .backgroundColor(0xFAEEE0)
      .width('100%')
      .height('60%')
    }
  }
}