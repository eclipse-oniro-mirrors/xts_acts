/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { WaterFlowDataSource } from '../WaterFlowDataSource'
@Entry
@Component
struct onScrollIndexFlow3 {
  @State minSize: number = 80
  @State maxSize: number = 180
  @State temp: number = 0;
  scroller: Scroller = new Scroller()
  @State colors: number[] = [0xFFC0CB, 0xDA70D6, 0x6B8E23, 0x6A5ACD, 0x00FFFF, 0x00FF7F]
  dataSource: WaterFlowDataSource = new WaterFlowDataSource()
  @State layoutMode1: WaterFlowLayoutMode = WaterFlowLayoutMode.ALWAYS_TOP_DOWN
  private itemWidthArray: number[] = []
  private itemHeightArray: number[] = []
  @State onScrollIndex:string = ''

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
    Column({ space: 5 }) {
      Column(){
        Text(this.onScrollIndex)
          .id('onScrollIndex_flow')
        Button('scroll 200')
          .id('onScrollIndex_scroller')
          .onClick(() => { // 通过控制器滑动FlowItem
            const yOffset: number = this.scroller.currentOffset().yOffset;
            this.scroller.scrollTo({ xOffset: 0, yOffset: yOffset + vp2px(200) })
          })
      }.height('20%')

      WaterFlow({ scroller: this.scroller }) {
        LazyForEach(this.dataSource, (item: number) => {
          FlowItem() {
            Column() {
              Text('N' + item).fontSize(12).height('16')
            }
          }
          .width('100%')
          .height(this.itemHeightArray[item % 100])
          .backgroundColor(this.colors[item % 5])
        }, (item: string) => item)
      }
      .rowsTemplate('1fr 1fr 1fr')
      .direction(Direction.Rtl)
      .columnsGap(10)
      .rowsGap(5)
      .scrollBar(BarState.On)
      .scrollBarWidth(20)
      .backgroundColor(0xFAEEE0)
      .width('100%')
      .height('60%')
      .onScrollIndex((first: number, last: number) => {
        if (first !== 0) {
          this.temp = 5
        }
        this.onScrollIndex = 'onScrollIndex:succ'+this.temp
        console.info('onScrollIndex first:' + first.toString() + ' last:' + last.toString())
      })

    }
  }
}