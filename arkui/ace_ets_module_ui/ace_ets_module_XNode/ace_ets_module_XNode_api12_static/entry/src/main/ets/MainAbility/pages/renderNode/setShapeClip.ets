'use static';
/*
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
  Entry, Component, Builder,NodeContainer,
  Column, ColumnOptions,
  Flex, FlexDirection, ItemAlign, FlexAlign,
  Text, Button, FontWeight, ClickEvent, Margin, Color, Row, TextArea,
} from '@ohos.arkui.component'
import { AppStorage, State, LocalStorage } from '@ohos.arkui.stateManagement';
import { UIContext } from '@ohos.arkui.UIContext';
import { RenderNode, FrameNode, NodeController, ShapeMask, ShapeClip } from '@ohos.arkui.node';
const uiContext = AppStorage.get<UIContext>('uiContext');
const vp2px = uiContext!.vp2px
const clip = new ShapeClip();
clip.setCommandPath({ commands: 'M100 0 L0 100 L50 200 L150 200 L200 100 Z' });

const renderNode = new RenderNode();
renderNode.frame = {
  x: 0,
  y: 0,
  width: 150,
  height: 150
};
renderNode.backgroundColor = 0XFF00FF00.toInt();
renderNode.shapeClip = clip;
const shapeClip = renderNode.shapeClip;

class MyNodeController extends NodeController {
  private rootNode: FrameNode | null = null;

  makeNode(uiContext: UIContext): FrameNode | null {
    this.rootNode = new FrameNode(uiContext);

    const rootRenderNode = this.rootNode!.getRenderNode();
    if (rootRenderNode !== null) {
      rootRenderNode!.appendChild(renderNode);
    }

    return this.rootNode;
  }
}

@Entry
@Component
struct SetShapeClip {
  private myNodeController: MyNodeController = new MyNodeController();
  @State myShapeClip: string = 'Init'

  build() {
    Column({ space: 10 } as ColumnOptions) {
      NodeContainer(this.myNodeController)
        .borderWidth(1)
      TextArea({ text:'Set and Get ShapeClip:' + this.myShapeClip})
      Button(this.myShapeClip).id('SetShapeClip_id')
        .onClick((e:ClickEvent) => {
          shapeClip.setRectShape({
            left: 0,
            right: 150,
            top: 0,
            bottom: 150
          });
          renderNode.shapeClip = shapeClip; //设置的值是值是rect\":{\"top\":0,\"left\":0,\"right\":150,\"bottom\":150},，期望的是"rect":{"left":0,"right":150,"top":0,"bottom":150}
          this.myShapeClip = "" + JSON.stringify(renderNode.shapeClip)
          console.log('+++++++++++++++',JSON.stringify(renderNode.shapeClip)) //值是rect\":{\"top\":0,\"left\":0,\"right\":150,\"bottom\":150},
        })
      Button('setRoundRectShape')
        .onClick((e:ClickEvent) => {
          renderNode.shapeClip.setRoundRectShape({
            rect: {
              left: 0,
              top: 0,
              right: vp2px(150),
              bottom: vp2px(150)
            },
            corners: {
              topLeft: { x: 32, y: 32 },
              topRight: { x: 32, y: 32 },
              bottomLeft: { x: 32, y: 32 },
              bottomRight: { x: 32, y: 32 }
            }
          });
          renderNode.shapeClip = renderNode.shapeClip;
        })
      Button('setCircleShape')
        .onClick((e:ClickEvent) => {
          renderNode.shapeClip.setCircleShape({ centerY: 75, centerX: 75, radius: 75 });
          renderNode.shapeClip = renderNode.shapeClip;

        })
      Button('setOvalShape')
        .onClick((e:ClickEvent) => {
          renderNode.shapeClip.setOvalShape({
            left: 0,
            right: vp2px(150),
            top: 0,
            bottom: vp2px(100)
          });
          renderNode.shapeClip = renderNode.shapeClip;
        })
      Button('setCommandPath')
        .onClick((e:ClickEvent) => {
          renderNode.shapeClip.setCommandPath({ commands: 'M100 0 L0 100 L50 200 L150 200 L200 100 Z' });
          renderNode.shapeClip = renderNode.shapeClip;
        })
    }
  }
}