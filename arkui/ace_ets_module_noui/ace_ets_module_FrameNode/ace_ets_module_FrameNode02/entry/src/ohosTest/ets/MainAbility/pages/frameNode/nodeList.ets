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

class MyNodeController extends NodeController {
  public rootNode: FrameNode | null = null;

  makeNode(uiContext: UIContext): FrameNode | null {
    this.rootNode = new FrameNode(uiContext);
    let listNode = typeNode.createNode(uiContext, 'List')
    this.rootNode.appendChild(listNode)
    listNode.initialize({ space: 20, initialIndex: 0 })
      .id('list_node')
      .listDirection(Axis.Vertical) // 排列方向
      .scrollBar(BarState.Off)
      .friction(0.6)
      .divider({ strokeWidth: 2, color: 0xFFFFFF, startMargin: 20, endMargin: 20 })
      .edgeEffect(EdgeEffect.Spring) // 边缘效果设置为Spring
      .width('90%')

    for (let i = 0; i < 10; i++) {
      let listItem1 = typeNode.createNode(uiContext, 'ListItem')
      listItem1.initialize().id('listItem_node')
      listNode.appendChild(listItem1)
      let text1 = typeNode.createNode(uiContext, 'Text')
      text1.initialize('item'+i)
        .width('100%').height(100).fontSize(16)
        .textAlign(TextAlign.Center).borderRadius(10).backgroundColor(0xFFFFFF)
      listItem1.appendChild(text1)
    }
    return this.rootNode;
  }
}

@Entry
@Component
struct nodeListIndex {
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