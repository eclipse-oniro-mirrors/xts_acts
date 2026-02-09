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
struct WaterFlowStart2 {
  @State minSize: number = 80
  @State maxSize: number = 180
  @State colors: number[] = [0xFFC0CB, 0xDA70D6, 0x6B8E23, 0x6A5ACD, 0x00FFFF, 0x00FF7F]
  dataSource: WaterFlowDataSource = new WaterFlowDataSource()
  scroller: Scroller = new Scroller()
  private itemWidthArray: number[] = []
  private itemHeightArray: number[] = []
  @State onScrollIndexText: string = 'onScrollIndex'
  @State onReachStartText: string = 'onReachStart'
  @State onReachEndText: string = 'onReachEnd'
  @State onScrollStartText: string = 'onScrollStart'
  @State onScrollStopText: string = 'onScrollStop'

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
    Column({ space: 2 }) {
      WaterFlow({ scroller:this.scroller }) {
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
      .id('waterFlowStart2')
      .columnsTemplate('repeat(auto-fill,80)')
      .columnsGap(10)
      .rowsGap(5)
      .height('70%')
      .onScrollIndex((first: number,last: number) => {
        this.onScrollIndexText = 'onScrollIndex:succ'
        console.info('onScrollIndex first:' + first.toString() + ' last:' + last.toString())
      })
      .onReachStart(() => {
        this.onReachStartText = 'onReachStart:succ'
        console.info('onReachStart !')
      })
      .onReachEnd(() => {
        this.onReachEndText = 'onReachEnd:succ'
        console.info('onReachEnd !')
      })
      .onScrollStart(() => {
        this.onScrollStartText = 'onScrollStart:succ'
        console.info('onScrollStart !')
      })
      .onScrollStop(() => {
        this.onScrollStopText = 'onScrollStop:succ'
        console.info('onScrollStop !')
      })

      Row(){
        Text(this.onReachStartText)
          .margin({right:10})
          .id('onReachStart_wText_2')
        Text(this.onReachEndText)
          .id('onReachEnd_wText_2')
      }
	  
      Row(){
        Text(this.onScrollStartText)
          .margin({right:10})
          .id('onScrollStart_wText_2')
        Text(this.onScrollStopText)
          .id('onScrollStop_wText_2')
      }
    }
  }
}