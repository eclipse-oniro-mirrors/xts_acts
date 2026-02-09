
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
  Text, Button, FontWeight, ClickEvent, Margin, Color, Row, BorderStyle,
} from '@ohos.arkui.component'
import { AppStorage, State, LocalStorage } from '@ohos.arkui.stateManagement';
import { UIContext } from '@ohos.arkui.UIContext';
import { RenderNode, FrameNode, NodeController } from "@ohos.arkui.node";

const renderNode = new RenderNode();
renderNode.frame = { x: 0, y: 0, width: 150, height: 150 };
renderNode.backgroundColor = 0XFF00FF00.toInt();
renderNode.borderWidth = { left: 8, top: 8, right: 8, bottom: 8 };
renderNode.borderColor = { left: 0xFF0000FF.toInt(), top: 0xFF0000FF.toInt(),
  right: 0xFF0000FF.toInt(), bottom: 0xFF0000FF.toInt() };
renderNode.borderStyle = {
  left: BorderStyle.Solid,
  top: BorderStyle.Dotted,
  right: BorderStyle.Dashed,
  bottom: BorderStyle.Solid
};
renderNode.borderRadius = { topLeft: 32, topRight: 32, bottomLeft: 32, bottomRight: 32}
const borderColor = renderNode.borderColor;
const borderRadius = renderNode.borderRadius;
const borderWidth = renderNode.borderWidth;
const borderStyle = renderNode.borderStyle;


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
struct renderSetGetInterface{
  private myNodeController: MyNodeController = new MyNodeController();
  @State bRadiusValue: number = 0
  @State bColor: number = 0

  @State bWidth: number = 0

  @State bBorderStyle: BorderStyle = BorderStyle.Dotted
  build() {
    Row() {
      Column() {
        NodeContainer(this.myNodeController).height('30%')
        Text('bRadiusValue:' + this.bRadiusValue).margin(10).id("bRadiusValue").height('2%')
        Button('changeRadius').height('2%')
          .id("changeRadiusClick")
          .onClick((e:ClickEvent) => {
            borderRadius!.topLeft = 20
            renderNode.invalidate()
            this.bRadiusValue = renderNode!.borderRadius!.topLeft
          })


        Text('bColor:' + this.bColor).margin(10).id("bColor").height('2%')
        Button('changeColor').height('2%')
          .id("bColorChange")
          .onClick((e:ClickEvent) => {
            borderColor!.left = 0xFF00FFEE.toInt()
            renderNode.invalidate()
            this.bColor = renderNode!.borderColor!.left  //master22  bColor:-16711698 equals bColor:4278255598
          })


        Text('bWidth:' + this.bWidth).margin(10).id("bWidth").height('2%')
        Button('changeWidth').height('2%')
          .id("bWidthChange")
          .onClick((e:ClickEvent) => {
            borderWidth!.left = 40
            renderNode.invalidate()
            this.bWidth = renderNode!.borderWidth!.left
          })

        Text('bStyle:' + this.bBorderStyle).margin(10).id("bStyle").height('2%')
        Button('changeStyle').height('2%')
          .id("bChangeStyle")
          .onClick((e:ClickEvent) => {
            borderStyle!.left = BorderStyle.Dashed
            renderNode.invalidate()
            this.bBorderStyle = renderNode!.borderStyle!.left
          })

      }
      .height('100%')
    }
  }
}