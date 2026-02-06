
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
import { RenderNode, ShapeMask, FrameNode, NodeController } from "@ohos.arkui.node";
const uiContext = AppStorage.get<UIContext>('uiContext');
const vp2px = uiContext!.vp2px
const mask = new ShapeMask();

mask.setOvalShape({ left: 0, right: vp2px(150), top: 0, bottom: vp2px(100) });
mask.setCommandPath({ commands: "M100 0 L0 100 L50 200 L150 200 L200 100 Z" });
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

  getInspectorInfo() {
    let inspectorInfo = this.rootNode?.getInspectorInfo();
    return inspectorInfo
  }

}

@Entry
@Component
struct overflowShape{
  private myNodeController: MyNodeController = new MyNodeController();
  @State text1:string = "";
  @State text2:string = ""

  build() {
    Row() {

      NodeContainer(this.myNodeController)

      Text(this.text1).key("overLay")
      Text(this.text2).key("overLay2")
      Button('click')
        .id("setOvalShape")
        .onClick((e:ClickEvent) => {
           let json = this.myNodeController.getInspectorInfo();
           let obj = JSON.stringify(json);
           this.text1 = JSON.parseJsonElement(obj).getElement('$attrs').getString('width')
           this.text2 = JSON.parseJsonElement(obj).getElement('$attrs').getString('height')
        })
    }
  }
}