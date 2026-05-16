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
import { RenderNode, FrameNode, NodeController, ShapeMask, LengthMetricsUnit, ShapeClip } from '@ohos.arkui.node';

// shapeMask test
const renderNode1 = new RenderNode();
renderNode1.frame = { x: 0, y: 0, width: 20, height: 20 };
renderNode1.shapeMask = { strokeWidth: 24 };
const shapeMask = renderNode1.shapeMask;

// shapeClip test
const clip = new ShapeClip();
const renderNode2 = new RenderNode();
clip.setCommandPath({ commands: 'M100 0 L0 100 L50 200 L150 200 L200 100 Z' });
renderNode2.frame = { x: 0, y: 0, width: 20, height: 20 };
renderNode2.backgroundColor = 0XFF00FF00.toInt();
renderNode2.shapeClip = clip;
const shapeClip = renderNode2.shapeClip;

// markNodeGroup test
const renderNode3 = new RenderNode();
renderNode3.frame = { x: 0, y: 0, width: 20, height: 20 };
renderNode3.markNodeGroup = true;
const markNodeGroup = renderNode3.markNodeGroup;

// lengthMetricsUnit test
const renderNode4 = new RenderNode();
renderNode4.frame = { x: 0, y: 0, width: 20, height: 20 };
renderNode4.lengthMetricsUnit = LengthMetricsUnit.DEFAULT;
const lengthMetricsUnit = renderNode4.lengthMetricsUnit;

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
    }
    return this.rootNode;
  }
}

@Entry
@Component
struct RenderNodeOtherAttribute {
  private myNodeController: MyNodeController = new MyNodeController();

  build() {
    Column() {
      NodeContainer(this.myNodeController)

      // shapeMask display
      Row(){
        Text(`shapeMask: ${shapeMask!.strokeWidth}`).key('RenderNodeOtherAttribute_shapeMask')
          .fontSize(8).width('100%')
      }
      .height('10%')
      .width('100%')

      // shapeClip display
      Row(){
        Text(`shapeClip: ${shapeClip}`).key('RenderNodeOtherAttribute_shapeClip')
          .fontSize(8).width('100%')
      }
      .height('10%')
      .width('100%')

      // markNodeGroup display
      Row(){
        Text(`markNodeGroup: ${markNodeGroup}`).key('RenderNodeOtherAttribute_markNodeGroup')
          .fontSize(8).width('100%')
      }
      .height('10%')
      .width('100%')

      // lengthMetricsUnit display
      Row(){
        Text(`lengthMetricsUnit: ${lengthMetricsUnit}`).key('RenderNodeOtherAttribute_lengthMetricsUnit')
          .fontSize(8).width('100%')
      }
      .height('10%')
      .width('100%')
    }
    .width('100%')
    .height('100%')
  }
}