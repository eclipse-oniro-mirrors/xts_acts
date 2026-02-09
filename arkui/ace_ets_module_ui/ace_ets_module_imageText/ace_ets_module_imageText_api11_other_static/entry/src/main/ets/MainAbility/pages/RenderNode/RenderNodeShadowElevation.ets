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
import { RenderNode, FrameNode, NodeController } from "@ohos.arkui.node"
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

const renderNode = new RenderNode();
renderNode.frame = {
  x: 0,
  y: 0,
  width: 100,
  height: 100
};
renderNode.shadowOffset = { x: 10, y: 10 };
renderNode.shadowAlpha = 0.7;
renderNode.shadowElevation = 30;

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
struct getshadowElevationNull {
  @State getshadowElevationNull: number = renderNode.shadowElevation;
  @State numl: number = 0;
  private MyNodeController: MyNodeController = new MyNodeController();

  build() {
    Column() {
      Row() {
        NodeContainer(this.MyNodeController)
      }

      Row() {
        Button('click')
          .key('getshadowElevationNull')
          .id('getshadowElevationNull')
          .onClick((e: ClickEvent) => {
            this.numl = this.getshadowElevationNull
          })
      }

      Row() {
        Text('getshadowElevationNull:' + this.numl).key('ElevationNull')
      }
    }

  }
}