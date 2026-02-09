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
  Text, Button, FontWeight, ClickEvent, Margin, Color, Row,
} from '@ohos.arkui.component'
import { AppStorage, State, LocalStorage } from '@ohos.arkui.stateManagement';
import { UIContext } from '@ohos.arkui.UIContext';
import { RenderNode, ShapeMask, FrameNode, NodeController  } from "@ohos.arkui.node";

const uiContext =  AppStorage.get<UIContext>('uiContext');
const vp2px = uiContext!.vp2px
const mask = new ShapeMask();
mask.setRectShape({ left: 0, right: vp2px(150), top: 0, bottom: vp2px(150) });
mask.fillColor = 0X55FF0000;

const renderNode = new RenderNode();
renderNode.frame = { x: 0, y: 0, width: 150, height: 150 };
renderNode.backgroundColor = 0XFF00FF00.toInt();
renderNode.shapeMask = mask;


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
struct setRectShapeExample {
  private myNodeController: MyNodeController = new MyNodeController();
  @State setRectShape: number = 0


  build() {
    Column() {
      NodeContainer(this.myNodeController)
      Text('setRectShape:' + this.setRectShape).margin(10).id("setRectShape")
      Button('click setRectShape')
        .id("setRectShapeClick")
        .onClick((e:ClickEvent) => {
          this.setRectShape = renderNode.size.width
        })
    }
  }
}