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
import { typeNode, FrameNode, NodeController } from '@ohos.arkui.node';
import { WaterFlowDataSource } from './WaterFlowDataSource'

class MyNodeController extends NodeController {
  minSize: number = 80
  maxSize: number = 180
  colors: number[] = [0xFFC0CB, 0xDA70D6, 0x6B8E23, 0x6A5ACD, 0x00FFFF, 0x00FF7F]
  scroller: Scroller = new Scroller()
  dataSource: WaterFlowDataSource = new WaterFlowDataSource()
  dataCount: number = this.dataSource.totalCount()
  private itemWidthArray: number[] = []
  private itemHeightArray: number[] = []

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

  makeNode(uiContext: UIContext): FrameNode | null {
    this.setItemSizeArray()
    console.log('WaterFlow makeNode')

    let node = new FrameNode(uiContext);
    node.commonAttribute
      .width('80%')
      .height('70%')
    let col = typeNode.createNode(uiContext, 'Column')
    col.initialize()
      .width('100%')
      .height('100%')
      .borderWidth(1)
    node.appendChild(col)

    let title = typeNode.createNode(uiContext, 'Text')
    title.initialize('typeNode WaterFlow')
      .width(100).height(30)
      .fontSize(20).textAlign(TextAlign.Center)
    col.appendChild(title)

    let scrollButton = typeNode.createNode(uiContext, 'Button')
    scrollButton.initialize('scroller')
      .width(100)
      .height(30)
      .backgroundColor('#FFFF0000')
      .onClick(() => { // 点击后滑到下边缘，速度值是700vp/s
        this.scroller.scrollEdge(Edge.Bottom, { velocity: 700 })
      })
    col.appendChild(scrollButton)

    let waterFlow = typeNode.createNode(uiContext, 'WaterFlow')
    waterFlow.initialize({ scroller: this.scroller, layoutMode: WaterFlowLayoutMode.ALWAYS_TOP_DOWN })
      .id('waterFlow_node')
      .columnsTemplate('1fr 1fr')
      .columnsGap(10)
      .rowsGap(5)
      .backgroundColor(0xFAEEE0)
      .width('100%')
      .height('70%')
      .layoutWeight(1)

    for (let i = 0; i < this.dataSource.totalCount(); i++) {
      let text = typeNode.createNode(uiContext, 'Text')
      text.initialize('N'+this.dataSource.getData(i))
        .height(16).fontSize(13)

      let flowItem = typeNode.createNode(uiContext, 'FlowItem')
      flowItem.initialize().id('flowItem_node')
        .width('100%')
        .height(this.itemHeightArray[i % 100])
        .backgroundColor(this.colors[i % 5])

      flowItem.appendChild(text)
      waterFlow.appendChild(flowItem)
    }

    col.appendChild(waterFlow)
    return node;
  }
}

@Entry
@Component
struct nodeWaterFlow {
  private nodeController: MyNodeController = new MyNodeController();

  build() {
    Column() {
      NodeContainer(this.nodeController)
    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xDCDCDC)
    .padding({ top: 5 })
  }
}