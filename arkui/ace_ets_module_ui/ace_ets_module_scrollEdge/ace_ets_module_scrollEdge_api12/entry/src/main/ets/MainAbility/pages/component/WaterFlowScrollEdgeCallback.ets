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
import events_emitter from '@ohos.events.emitter'
import { WaterFlowDataSource } from './WaterFlowDataSource'

@Entry
@Component
struct WaterFlowScrollEdgeCallback {
  @State minSize: number = 80
  @State maxSize: number = 180
  @State clickFlag: number = 0
  @State colors: number[] = [0xFFC0CB, 0xDA70D6, 0x6B8E23, 0x6A5ACD, 0x00FFFF, 0x00FF7F]
  dataSource: WaterFlowDataSource = new WaterFlowDataSource()
  private itemWidthArray: number[] = []
  private itemHeightArray: number[] = []
  @State numbers: String[] = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']
  scroller: Scroller = new Scroller()
  @State text1:string = ''

  // 计算FlowItem宽/高
  getSize(){
    let ret = Math.floor(Math.random() * this.maxSize)
    return (ret > this.minSize ? ret : this.minSize)
  }

  // 设置FlowItem宽/高数组
  setItemSizeArray(){
    for (let i = 0; i < 100; i++) {
      this.itemWidthArray.push(this.getSize())
      this.itemHeightArray.push(this.getSize())
    }
  }

  aboutToAppear(){
    this.setItemSizeArray()
  }

  build(){
    Scroll() {
      Column({ space: 2 }) {
        Text('Scroller组件绑定至平铺的WaterFlow容器组件').fontColor(0x000000)
          .fontSize(16).width('90%')
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
        .columnsTemplate('1fr')
        .columnsGap(10)
        .rowsGap(5)
        .padding({ left: 5 })
        .backgroundColor(0xFAEEE0)
        .width('100%')
        .height(600)
         Text(this.text1).id('WaterFlowTextByScrollEdge01')
        Button('点我滚动')
          .id('WaterFlowScrollEdgeCallback01')
          .onClick(() => { // 这里
            this.scroller.scrollEdge(Edge.Bottom, { velocity: 0 })
            this.text1 = 'ScrollEdgeSuccess'
          })
          .width('100%')
      }
      .width('100%')
      .backgroundColor(0xDCDCDC)
      .padding({ top: 5 })
    }
    .edgeEffect(EdgeEffect.Spring)
    .friction(0.6)
    .backgroundColor('#DCDCDC')
    .scrollBar(BarState.On)
    .width('100%')
    .height('100%')
  }
}
