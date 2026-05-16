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
import { FrameNode, NodeController, typeNode } from '@ohos.arkui.node';
import { UIContext } from '@ohos.arkui.UIContext';
import {
  Button,
  ClickEvent,
  Column,
  Component,
  Entry,
  Flex,
  FlexDirection,
  ItemAlign,
  NodeContainer,
  Row,
  Text,
  TextAlign
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

class MyNodeController extends NodeController {
  public rootNode: FrameNode | null = null;

  makeNode(uiContext: UIContext): FrameNode | null {
    let node = new FrameNode(uiContext);
    node.commonAttribute
      .width('100%')
      .height('100%')
    let col = typeNode.createColumnNode(uiContext)
    col.initialize()
      .width('80%')
      .height('50%')
      .borderWidth(1)
    node.appendChild(col)

    let gridNode = typeNode.createGridNode(uiContext)
    gridNode.initialize()
      .id('grid_node')
      .columnsTemplate('1fr 1fr 1fr')
      .columnsGap(10)
      .rowsGap(10)
      .width('100%')
      .height('100%')
      .backgroundColor(0xFAEEE0)

    for (let i = 0; i < 20; i++) {
      let gridItem1 = typeNode.createGridItemNode(uiContext)
      gridItem1.initialize().id('gridItem_node')
      let text1 = typeNode.createTextNode(uiContext)
      text1.initialize('item'+i)
        .width(80).height(80).fontSize(16)
        .textAlign(TextAlign.Center).backgroundColor(0xF9CF93)
      gridItem1.appendChild(text1)
      gridNode.appendChild(gridItem1)
    }
    col.appendChild(gridNode)
    return node;
  }

  getNodeType() {
    let inspectorInfo = this.rootNode?.getFirstChild()?.getNodeType();
    console.info('inspectorInfo ' + JSON.stringify(inspectorInfo));
    return JSON.stringify(inspectorInfo)
  }
}

@Entry
@Component
struct nodeGridTypeIndex {
  private myNodeController: MyNodeController = new MyNodeController();
  @State node: FrameNode | null = null;
  @State uiContext: UIContext = this.getUIContext()
  @State type: string = 'getNodeType'

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center }) {
      Column() {
        Row() {
          NodeContainer(this.myNodeController);
        }

        Text(this.type).margin(30)
        Button('getInspectorInfo')
          .onClick((e: ClickEvent) => {
            this.type = this.myNodeController?.getNodeType()!
          })
      }
    }
  }
}