'use static';

/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {
  Entry, Component, NodeContainer,
  Column, ColumnOptions,
  Flex, FlexDirection, ItemAlign, FlexAlign,
  Text, Button, FontWeight, ClickEvent, Margin, Color, Row,
} from '@ohos.arkui.component'
import { UIContext } from '@ohos.arkui.UIContext';
import { RenderNode, FrameNode, NodeController } from '@ohos.arkui.node';

// shadowColor test
const renderNode1 = new RenderNode();
renderNode1.frame = { x: 0, y: 0, width: 20, height: 20 };
renderNode1.shadowElevation = 10;
renderNode1.shadowColor = 0XFF00FF00.toInt();
const shadowColor = renderNode1.shadowColor;

// shadowOffset test
const renderNode2 = new RenderNode();
renderNode2.frame = { x: 0, y: 0, width: 20, height: 20 };
renderNode2.shadowElevation = 10;
renderNode2.shadowColor = 0XFF00FF00.toInt();
renderNode2.shadowOffset = { x: 10, y: 10 };
const shadowOffset = renderNode2.shadowOffset;

// shadowAlpha test
const renderNode3 = new RenderNode();
renderNode3.frame = { x: 0, y: 0, width: 20, height: 20 };
renderNode3.shadowElevation = 10;
renderNode3.shadowColor = 0XFF00FF00.toInt();
renderNode3.shadowOffset = { x: 10, y: 10 };
renderNode3.shadowAlpha = 0.1;
const shadowAlpha = renderNode3.shadowAlpha;

// shadowElevation test
const renderNode4 = new RenderNode();
renderNode4.frame = { x: 0, y: 0, width: 20, height: 20 };
renderNode4.shadowElevation = 10;
const shadowElevation = renderNode4.shadowElevation;

// shadowRadius test
const renderNode5 = new RenderNode();
renderNode5.frame = { x: 0, y: 0, width: 20, height: 20 };
renderNode5.shadowElevation = 10;
renderNode5.shadowColor = 0XFF00FF00.toInt();
renderNode5.shadowRadius = 5;
const shadowRadius = renderNode5.shadowRadius;

export class MyNodeController extends NodeController {
  private rootNode: FrameNode | null = null;

  makeNode(uiContext: UIContext): FrameNode | null {
    this.rootNode = new FrameNode(uiContext);
    const rootRenderNode = this.rootNode!.getRenderNode();
    if (rootRenderNode !== null) {
      rootRenderNode!.appendChild(renderNode1);
      rootRenderNode!.appendChild(renderNode2);
      rootRenderNode!.appendChild(renderNode3);
      rootRenderNode!.appendChild(renderNode4);
      rootRenderNode!.appendChild(renderNode5);
    }
    return this.rootNode;
  }
}

@Entry
@Component
struct RenderNodeShadowAttribute {
  private myNodeController: MyNodeController = new MyNodeController();

  build() {
    Column() {
      NodeContainer(this.myNodeController)

      // shadowColor display
      Row(){
        Text(`shadowColor: ${shadowColor}`).key('RenderNodeShadowAttribute_shadowColor')
          .fontSize(8).width('100%')
      }
      .height('10%')
      .width('100%')

      // shadowOffset display
      Row(){
        Text(`shadowOffset x: ${shadowOffset.x}`).key('RenderNodeShadowAttribute_shadowOffset_x')
          .fontSize(8).width('50%')
        Text(`shadowOffset y: ${shadowOffset.y}`).key('RenderNodeShadowAttribute_shadowOffset_y')
          .fontSize(8).width('50%')
      }
      .height('10%')
      .width('100%')

      // shadowAlpha display
      Row(){
        Text(`shadowAlpha: ${shadowAlpha}`).key('RenderNodeShadowAttribute_shadowAlpha')
          .fontSize(8).width('100%')
      }
      .height('10%')
      .width('100%')

      // shadowElevation display
      Row(){
        Text(`shadowElevation: ${shadowElevation}`).key('RenderNodeShadowAttribute_shadowElevation')
          .fontSize(8).width('100%')
      }
      .height('10%')
      .width('100%')

      // shadowRadius display
      Row(){
        Text(`shadowRadius: ${shadowRadius}`).key('RenderNodeShadowAttribute_shadowRadius')
          .fontSize(8).width('100%')
      }
      .height('10%')
      .width('100%')
    }
    .width('100%')
    .height('100%')
  }
}