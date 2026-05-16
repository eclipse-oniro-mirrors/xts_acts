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
  Entry, Component, Builder, NodeContainer,
  Column, ColumnOptions,
  Flex, FlexDirection, ItemAlign, FlexAlign,
  Text, Button, FontWeight, ClickEvent, Margin, Color, Row, BorderStyle,
} from '@ohos.arkui.component'
import { AppStorage, State, LocalStorage } from '@ohos.arkui.stateManagement';
import { UIContext } from '@ohos.arkui.UIContext';
import { RenderNode, ShapeMask, FrameNode, NodeController } from '@ohos.arkui.node';

// backgroundColor test
const renderNode1 = new RenderNode();
renderNode1.frame = { x: 0, y: 0, width: 20, height: 20 };
renderNode1.shadowColor = 0XFF00FF00.toInt()
renderNode1.borderColor = { left: 0XFF00FF00.toInt(), top: 0xFF0000FF.toInt(), right: 0xFF0000FF.toInt(), bottom: 0xFF0000FF.toInt() };
const backgroundColor = renderNode1.borderColor!;

// clipToFrame test
const renderNode2 = new RenderNode();
renderNode2.frame = { x: 0, y: 0, width: 20, height: 20 };
renderNode2.clipToFrame = true;
const clipToFrame = renderNode2.clipToFrame;

// opacity test
const renderNode3 = new RenderNode();
renderNode3.frame = { x: 0, y: 0, width: 20, height: 20 };
renderNode3.opacity = 0.5;
const opacity = renderNode3.opacity;

// size test
const renderNode4 = new RenderNode();
renderNode4.size = { width: 20, height: 20 };
const size = renderNode4.size;

// position test
const renderNode5 = new RenderNode();
renderNode5.size = { width: 20, height: 20 };
renderNode5.position = { x: 10, y: 10 };
const position = renderNode5.position;

// frame test
const renderNode6 = new RenderNode();
renderNode6.frame = { x: 10, y: 10, width: 20, height: 20 };
const frame = renderNode6.frame;

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
      rootRenderNode!.appendChild(renderNode6);
    }
    return this.rootNode;
  }
}

@Entry
@Component
struct RenderNodeAttribute {
  private myNodeController: MyNodeController = new MyNodeController();

  build() {
    Column() {
      NodeContainer(this.myNodeController)
      // backgroundColor display
      Row(){
        Text(`backgroundColor: ${backgroundColor.left}`).key('RenderNodeAttribute_backgroundColor')
          .fontSize(8).width('100%')
      }
      .height('10%')
      .width('100%')

      // clipToFrame display
      Row(){
        Text(`clipToFrame: ${clipToFrame}`).key('RenderNodeAttribute_clipToFrame')
          .fontSize(8).width('100%')
      }
      .height('10%')
      .width('100%')

      // opacity display
      Row(){
        Text(`opacity: ${opacity}`).key('RenderNodeAttribute_opacity')
          .fontSize(8).width('100%')
      }
      .height('10%')
      .width('100%')

      // size display
      Row(){
        Text(`size width: ${size.width}`).key('RenderNodeAttribute_size_width')
          .fontSize(8).width('50%')
        Text(`size height: ${size.height}`).key('RenderNodeAttribute_size_height')
          .fontSize(8).width('50%')
      }
      .height('10%')
      .width('100%')

      // position display
      Row(){
        Text(`position x: ${position.x}`).key('RenderNodeAttribute_position_x')
          .fontSize(8).width('50%')
        Text(`position y: ${position.y}`).key('RenderNodeAttribute_position_y')
          .fontSize(8).width('50%')
      }
      .height('10%')
      .width('100%')

      // frame display
      Row(){
        Text(`frame x: ${frame.x}`).key('RenderNodeAttribute_frame_x')
          .fontSize(8).width('25%')
        Text(`frame y: ${frame.y}`).key('RenderNodeAttribute_frame_y')
          .fontSize(8).width('25%')
        Text(`frame w: ${frame.width}`).key('RenderNodeAttribute_frame_width')
          .fontSize(8).width('25%')
        Text(`frame h: ${frame.height}`).key('RenderNodeAttribute_frame_height')
          .fontSize(8).width('25%')
      }
      .height('10%')
      .width('100%')
    }
    .width('100%')
    .height('100%')
  }
}