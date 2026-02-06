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
import {
  Entry,
  Column,
  Component,
  Button,
  Text,
  Row,
  Color,
  $r,
  Margin,
  ColumnOptions,
  Flex,
  Scroll,
  Padding,
  Position,
  Builder,
  Image,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  Alignment,
  TextAlign,
  TextOverflow,
  NodeContainer,
  DragPreviewMode
} from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { ClickEvent } from '@ohos.arkui.component';
import { UIContext } from '@ohos.arkui.UIContext';
import { RenderNode, FrameNode, NodeController } from "@ohos.arkui.node"
import { UIContext } from '@ohos.arkui.UIContext';

let renderNode = new RenderNode();
renderNode.size = { width: 300, height: 300 };
renderNode.backgroundColor = 0XFF00FF00.toInt()
renderNode.position = { x: 10, y: 10 }
let x = renderNode.position.x
let y = renderNode.position.y

class MyNodeController extends NodeController {
  private rootNode: FrameNode | null = null;

  makeNode(uiContext: UIContext): FrameNode | null {
    this.rootNode = new FrameNode(uiContext);
    const rootRenderNode = this.rootNode?.getRenderNode();
    if (rootRenderNode !== null) {
      rootRenderNode!.appendChild(renderNode);
    }
    return this.rootNode;
  }
}

@Entry
@Component
struct setPosition {
  @State MyNodeController: MyNodeController = new MyNodeController();
  @State getX: number = x
  @State getY: number = y

  build() {
    Row() {
      Column() {
        NodeContainer(this.MyNodeController).height('30%')
        Text('setPositionXStatus:' + this.getX).margin(10).height('5%')
          .key('x_status')
        Text('setPositionYStatus:' + this.getY).margin(10).height('5%')
          .key('y_status')
        Button('click to set').height('5%')
          .onClick((e: ClickEvent) => {
            renderNode.position = { x: 100, y: 100 }
            renderNode.invalidate()
            this.getX = renderNode.position.x
            this.getY = renderNode.position.y
          })
          .id('setPosition')
      }.width('100%').height('100%')
    }.height('100%')
  }
}