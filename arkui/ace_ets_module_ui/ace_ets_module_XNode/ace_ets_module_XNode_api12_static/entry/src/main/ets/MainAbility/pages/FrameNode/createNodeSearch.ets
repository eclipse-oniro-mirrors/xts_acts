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
import { typeNode, NodeController, FrameNode, ComponentContent } from '@ohos.arkui.node';
import {
  Entry,
  Column,
  Component,
  Flex,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  Text,
  Button,
  FontWeight,
  ButtonType,
  ClickEvent,
  Margin,
  Color,
  Builder,
  Row,
  NodeContainer
} from '@ohos.arkui.component'
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { UIContext } from '@ohos.arkui.UIContext';
@Builder
function buildText() {
  Column() {
    Text('hello')
      .width(50)
      .height(50)
      .backgroundColor(Color.Yellow)
  }
}

class MyNodeController extends NodeController {

  public node: FrameNode | null = null;
  makeNode(uiContext: UIContext): FrameNode | null {
    this.node = new FrameNode(uiContext)
    this.node?.commonAttribute.width(300).height(300).backgroundColor(Color.Red)
    let col = typeNode.createSearchNode(uiContext)
    col.attribute.width(200)
      .height(20)
      .borderWidth(1)
      .borderColor(Color.Black)
      .backgroundColor(0xAFEEEE)
    this.node?.appendChild(col)
    return this.node
  }
  getNodeType()
  {
    let inspectorInfo = this.node?.getFirstChild()?.getNodeType();
    console.info("inspectorInfo " + JSON.stringify(inspectorInfo));
    return JSON.stringify(inspectorInfo)
  }
}

@Entry
@Component
struct createNodeSearchTest {
  private myNodeController: MyNodeController = new MyNodeController();
  @State node: FrameNode | null = null;
  @State uiContext: UIContext = this.getUIContext()
  @State type: string = "getNodeType"

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceBetween }) {
      Column(){
        Row() {
          NodeContainer(this.myNodeController);
        }.height('30%')
        Text(this.type).margin(30).id("createNodeSearchText").height('10%')
        Button("getInspectorInfo").id("createNodeSearchType").onClick((e:ClickEvent) => {
          this.type = this.myNodeController?.getNodeType()!
        }).height('10%')
      }
      .height('100%')
    }

  }
}