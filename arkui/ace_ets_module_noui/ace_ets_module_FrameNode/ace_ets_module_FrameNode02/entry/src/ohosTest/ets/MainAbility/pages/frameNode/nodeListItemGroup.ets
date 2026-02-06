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
  makeNode(uiContext: UIContext): FrameNode | null {
    let node = new FrameNode(uiContext);
    node.commonAttribute
      .width('80%')
      .height('70%')

    let col = typeNode.createNode(uiContext, 'Column')
    col.initialize()
      .width('100%')
      .height('100%')
      .backgroundColor(0xDCDCDC)
      .padding({ top: 5 })
    node.appendChild(col)

    let textA1 = typeNode.createNode(uiContext, 'Text')
    textA1.initialize('语文')
      .width('100%').height(100).fontSize(16)
      .textAlign(TextAlign.Center).borderRadius(10).backgroundColor('#FFFF00FF')
    let listItemA1 = typeNode.createNode(uiContext, 'ListItem')
    listItemA1.initialize()
    listItemA1.appendChild(textA1)

    let textA2 = typeNode.createNode(uiContext, 'Text')
    textA2.initialize('数学')
      .width('100%').height(100).fontSize(16)
      .textAlign(TextAlign.Center).borderRadius(10).backgroundColor('#FFFF00FF')
    let listItemA2 = typeNode.createNode(uiContext, 'ListItem')
    listItemA2.initialize()
    listItemA2.appendChild(textA2)

    let listItemGroup1 = typeNode.createNode(uiContext, 'ListItemGroup')
    listItemGroup1.initialize({ space: 20 })
      .id('listItemGroup_node')
      .divider({ strokeWidth: 1, color: Color.Blue })
    listItemGroup1.appendChild(listItemA1)
    listItemGroup1.appendChild(listItemA2)

    let textB1 = typeNode.createNode(uiContext, 'Text')
    textB1.initialize('语文')
      .width('100%').height(100).fontSize(16)
      .textAlign(TextAlign.Center).borderRadius(10).backgroundColor('#FFFF00FF')
    let listItemB1 = typeNode.createNode(uiContext, 'ListItem')
    listItemB1.initialize()
    listItemB1.appendChild(textB1)

    let textB2 = typeNode.createNode(uiContext, 'Text')
    textB2.initialize('数学')
      .width('100%').height(100).fontSize(16)
      .textAlign(TextAlign.Center).borderRadius(10).backgroundColor('#FFFF00FF')
    let listItemB2 = typeNode.createNode(uiContext, 'ListItem')
    listItemB2.initialize()
    listItemB2.appendChild(textB2)

    let listItemGroup2 = typeNode.createNode(uiContext, 'ListItemGroup')
    listItemGroup2.initialize({ space: '20', style:ListItemGroupStyle.CARD })
      .divider({ strokeWidth: 1, color: Color.Blue })
    listItemGroup2.appendChild(listItemB1)
    listItemGroup2.appendChild(listItemB2)

    let list = typeNode.createNode(uiContext, 'List')
    list.initialize({ space: 20 })
      .width('90%')
      .sticky(StickyStyle.Header | StickyStyle.Footer)
      .scrollBar(BarState.Off)
    list.appendChild(listItemGroup1)
    list.appendChild(listItemGroup2)

    let textTitle = typeNode.createNode(uiContext, 'Text')
    textTitle.initialize('typeNode ListItemGroup')
      .width(100).height(30)
      .fontSize(20).textAlign(TextAlign.Center)

    col.appendChild(textTitle)
    col.appendChild(list)

    return node;
  }
}

@Entry
@Component
struct nodeListItemGroup {
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