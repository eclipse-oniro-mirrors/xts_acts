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
import { UIContext } from '@ohos.arkui.UIContext';
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
    NodeContainer
} from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { ClickEvent } from '@ohos.arkui.component';
import { UIContext } from '@ohos.arkui.UIContext';
import { RenderNode, FrameNode, NodeController } from "@ohos.arkui.node"

const renderNode = new RenderNode();
renderNode.size = { width: 150, height: 150 };

const renderNode2 = new RenderNode();
renderNode2.size = { width: 150, height: 150 };
renderNode2.position = { x: 150, y: 150 };


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
struct appendChild1 {
  private MyNodeController: MyNodeController = new MyNodeController()
  @State RenderNode: RenderNode = new RenderNode()
  @State width1: number = 100

  build() {
    Column({ space: 10 } as ColumnOptions) {
      NodeContainer(this.MyNodeController).height('20%')
      Text("width1: " + this.width1).key('appendChild_width1').height('5%')
      Button('appendChild').height('5%')
        .key('appendChild_1')
        .id('appendChild_1')
        .onClick((e: ClickEvent) => {
          const child = new RenderNode()
          child.size = { width: 50, height: 50 }
          renderNode.appendChild(child)
          this.width1 = Number(renderNode.getChild(0)?.size.width)
        })
      Button('在最后添加子节点').height('5%')
        .key('insertChildAfter_1')
        .id('insertChildAfter_1')
        .onClick((e: ClickEvent) => {
          const child1 = new RenderNode()
          const sibling = renderNode.getChild(0)
          if (sibling !== null) {
            sibling.size = { width: 40, height: 40 }
          }
          renderNode.insertChildAfter(child1, sibling)
          const sibling1 = renderNode.getChild(1)
          if (sibling1 != null) {
            this.width1 = sibling1.size.width
          } else {
            this.width1 = 60
          }
        })
      Button('removeChild').height('5%')
        .key('removeChild_1')
        .id('removeChild_1')
        .onClick((e: ClickEvent) => {
          const sibling = renderNode.getChild(0)
          renderNode.removeChild(sibling as RenderNode)
          if (sibling != null) {
            this.width1 = sibling.size.width
          } else {
            this.width1 = 120
          }
        })

      Button('删除所有').height('5%')
        .key('clearChild_1')
        .id('clearChild_1')
        .onClick((e: ClickEvent) => {
          const sibling = renderNode.getChild(0)
          renderNode.clearChildren()
          if (sibling != null) {
            this.width1 = sibling.size.width
          } else {
            this.width1 = 130
          }
        })
    }
    .width('100%')
    .height('100%')
  }
}