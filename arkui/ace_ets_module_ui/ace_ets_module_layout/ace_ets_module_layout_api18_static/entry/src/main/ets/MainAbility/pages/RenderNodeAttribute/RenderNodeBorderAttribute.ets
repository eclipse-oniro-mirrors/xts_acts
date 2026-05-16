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
  Text, Button, FontWeight, ClickEvent, Margin, Color, Row, BorderStyle
} from '@ohos.arkui.component'
import { UIContext } from '@ohos.arkui.UIContext';
import { RenderNode, FrameNode, NodeController } from '@ohos.arkui.node';

// borderStyle test
const renderNode1 = new RenderNode();
renderNode1.frame = { x: 0, y: 0, width: 20, height: 20 };
renderNode1.borderStyle = {
  left: BorderStyle.Solid,
  top: BorderStyle.Dotted,
  right: BorderStyle.Dashed,
  bottom: BorderStyle.Solid };
const borderStyle = renderNode1.borderStyle;

// borderWidth test
const renderNode2 = new RenderNode();
renderNode2.frame = { x: 0, y: 0, width: 20, height: 20 };
renderNode2.borderWidth = { top: 5, bottom: 0, left: 0, right: 0 };
const borderWidth = renderNode2.borderWidth;

// borderColor test
const renderNode3 = new RenderNode();
renderNode3.frame = { x: 0, y: 0, width: 20, height: 20 };
renderNode3.borderWidth = { top: 5, bottom: 0, left: 0, right: 0 };
renderNode3.borderColor = { top: 0XFF00FF00.toInt(), bottom: 0, left: 0, right: 0 };
const borderColor = renderNode3.borderColor;

// borderRadius test
const renderNode4 = new RenderNode();
renderNode4.frame = { x: 0, y: 0, width: 20, height: 20 };
renderNode4.borderRadius = {
  topLeft: 10,
  topRight: 10,
  bottomLeft: 10,
  bottomRight: 10
};
const borderRadius = renderNode4.borderRadius;

// label test
const renderNode5 = new RenderNode();
renderNode5.frame = { x: 0, y: 0, width: 20, height: 20 };
renderNode5.label = 'testLabel';
const label = renderNode5.label;

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
struct RenderNodeBorderAttribute {
  private myNodeController: MyNodeController = new MyNodeController();

  build() {
    Column() {
      NodeContainer(this.myNodeController)

      // borderStyle display
      Row(){
        Text(`borderStyle top: ${borderStyle!.top}`).key('RenderNodeBorderAttribute_borderStyle_top')
          .fontSize(8).width('100%')
      }
      .height('10%')
      .width('100%')

      // borderWidth display
      Row(){
        Text(`borderWidth top: ${borderWidth!.top}`).key('RenderNodeBorderAttribute_borderWidth_top')
          .fontSize(8).width('100%')
      }
      .height('10%')
      .width('100%')

      // borderColor display
      Row(){
        Text(`borderColor top: ${borderColor!.top}`).key('RenderNodeBorderAttribute_borderColor_top')
          .fontSize(8).width('100%')
      }
      .height('10%')
      .width('100%')

      // borderRadius display
      Row(){
        Text(`borderRadius topLeft: ${borderRadius!.topLeft}`).key('RenderNodeBorderAttribute_borderRadius_topLeft')
          .fontSize(8).width('100%')
      }
      .height('10%')
      .width('100%')

      // label display
      Row(){
        Text(`label: ${label}`).key('RenderNodeBorderAttribute_label')
          .fontSize(8).width('100%')
      }
      .height('10%')
      .width('100%')
    }
    .width('100%')
    .height('100%')
  }
}