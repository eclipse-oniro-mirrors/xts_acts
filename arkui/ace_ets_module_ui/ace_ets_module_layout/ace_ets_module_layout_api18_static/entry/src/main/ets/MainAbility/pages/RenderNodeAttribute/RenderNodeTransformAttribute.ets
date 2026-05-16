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

// pivot test
const renderNode1 = new RenderNode();
renderNode1.frame = { x: 0, y: 0, width: 20, height: 20 };
renderNode1.pivot = { x: 0.5, y: 0.6 };
const pivot = renderNode1.pivot;

// scale test
const renderNode2 = new RenderNode();
renderNode2.frame = { x: 0, y: 0, width: 20, height: 20 };
renderNode2.scale = { x: 0.5, y: 1 };
const scale = renderNode2.scale;

// translation test
const renderNode3 = new RenderNode();
renderNode3.frame = { x: 0, y: 0, width: 20, height: 20 };
renderNode3.translation = { x: 100, y: 0 };
const translation = renderNode3.translation;

// rotation test
const renderNode4 = new RenderNode();
renderNode4.frame = { x: 0, y: 0, width: 20, height: 20 };
renderNode4.rotation = { x: 45, y: 0, z: 0 };
const rotation = renderNode4.rotation;

// transform test
const renderNode5 = new RenderNode();
renderNode5.frame = { x: 0, y: 0, width: 20, height: 20 };
renderNode5.transform = [
  1, 0, 0, 0,
  0, 2, 0, 0,
  0, 0, 1, 0,
  0, 0, 0, 1
];
const transform = renderNode5.transform;

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
struct RenderNodeTransformAttribute {
  private myNodeController: MyNodeController = new MyNodeController();

  build() {
    Column() {
      NodeContainer(this.myNodeController)

      // pivot display
      Row(){
        Text(`pivot x: ${pivot.x}`).key('RenderNodeTransformAttribute_pivot_x')
          .fontSize(8).width('50%')
        Text(`pivot y: ${pivot.y}`).key('RenderNodeTransformAttribute_pivot_y')
          .fontSize(8).width('50%')
      }
      .height('10%')
      .width('100%')

      // scale display
      Row(){
        Text(`scale x: ${scale.x}`).key('RenderNodeTransformAttribute_scale_x')
          .fontSize(8).width('50%')
        Text(`scale y: ${scale.y}`).key('RenderNodeTransformAttribute_scale_y')
          .fontSize(8).width('50%')
      }
      .height('10%')
      .width('100%')

      // translation display
      Row(){
        Text(`translation x: ${translation.x}`).key('RenderNodeTransformAttribute_translation_x')
          .fontSize(8).width('50%')
        Text(`translation y: ${translation.y}`).key('RenderNodeTransformAttribute_translation_y')
          .fontSize(8).width('50%')
      }
      .height('10%')
      .width('100%')

      // rotation display
      Row(){
        Text(`rotation x: ${rotation.x}`).key('RenderNodeTransformAttribute_rotation_x')
          .fontSize(8).width('33.33%')
        Text(`rotation y: ${rotation.y}`).key('RenderNodeTransformAttribute_rotation_y')
          .fontSize(8).width('33.33%')
        Text(`rotation z: ${rotation.z}`).key('RenderNodeTransformAttribute_rotation_z')
          .fontSize(8).width('33.33%')
      }
      .height('10%')
      .width('100%')

      // transform display
      Row(){
        Text(`transform[0]: ${transform[0]}`).key('RenderNodeTransformAttribute_transform_0')
          .fontSize(8).width('50%')
        Text(`transform[5]: ${transform[5]}`).key('RenderNodeTransformAttribute_transform_5')
          .fontSize(8).width('50%')
      }
      .height('10%')
      .width('100%')
    }
    .width('100%')
    .height('100%')
  }
}