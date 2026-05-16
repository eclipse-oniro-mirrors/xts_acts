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
import { RenderNode, FrameNode, NodeController, borderStyles } from "@ohos.arkui.node";

const renderNode = new RenderNode();
let borderStyleValue = renderNode.borderColor;
renderNode.frame = { x: 0, y: 0, width: 150, height: 150 };
renderNode.backgroundColor = 0XFF00FF00.toInt();
renderNode.borderWidth = { left: 8, top: 8, right: 8, bottom: 8 };
renderNode.borderColor = { left: 0XFF00FF00.toInt(), top: 0xFF0000FF.toInt(),
  right: 0xFF0000FF.toInt(), bottom: 0xFF0000FF.toInt() };
renderNode.borderStyle = borderStyles(BorderStyle.Dotted);



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
struct borderStylesExample {
  private myNodeController: MyNodeController = new MyNodeController();
  @State borderStyleValue: number = 0

  build() {
    Column() {
      NodeContainer(this.myNodeController)
      Text('borderStyleValue:' + this.borderStyleValue).margin(10).id("borderStylesValue") //2
      Button('click borderStyleValue')
        .id("borderStylesClick")
        .onClick((e:ClickEvent) => {
          // renderNode.borderColor = borderStyles(BorderStyle.Dotted)    // ←源码，疑似.borderColor错误，改为.borderStyle
          renderNode.borderStyle = borderStyles(BorderStyle.Dotted)
          renderNode.invalidate()
          this.borderStyleValue = renderNode!.borderStyle!.left
        })
    }
  }
}