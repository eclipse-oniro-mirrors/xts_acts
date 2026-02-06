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
import { DrawContext, RenderNode, FrameNode, NodeController } from "@ohos.arkui.node"
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

let width = 1

class MyRenderNode extends RenderNode {
  draw(context: DrawContext) {
    width = context.size.width as Int
  }
}

class MyNodeController extends NodeController {
  private rootNode: FrameNode | null = null;

  makeNode(uiContext: UIContext): FrameNode | null {
    this.rootNode = new FrameNode(uiContext);

    const rootRenderNode = this.rootNode?.getRenderNode();
    if (rootRenderNode !== null) {
      const renderNode = new MyRenderNode();
      renderNode.size = { width: 100, height: 100 }
      rootRenderNode!.appendChild(renderNode);
    }
    return this.rootNode;
  }
}

@Entry
@Component
struct DrawContextGetSize {
  private MyNodeController: MyNodeController = new MyNodeController()

  build() {
    Column({ space: 10 } as ColumnOptions) {
      NodeContainer(this.MyNodeController).height('30%')
      Text("width: " + width).key('DrawContext_get_Size_width').height('5%')
      Button('Graphics DrawContext get Size')
        .key('DrawContext_get_Size')
        .id('DrawContext_get_Size')
        .onClick((e: ClickEvent) => {
          const child = new MyRenderNode()
          width = child.size.width as Int
        })
        .margin({ top: 100 } as Margin)
        .width('100%')
        .height('5%')
    }.height('100%')
  }
}