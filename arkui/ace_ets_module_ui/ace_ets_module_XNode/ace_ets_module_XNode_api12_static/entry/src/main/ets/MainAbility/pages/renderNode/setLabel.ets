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
import {  RenderNode, FrameNode, NodeController } from '@ohos.arkui.node';
import { UIContext } from '@ohos.arkui.UIContext';

let para: Record<string,string> = { 'renderNode_label': 'start' };
let storage: LocalStorage = new LocalStorage(para);
// let storage: LocalStorage = new LocalStorage();
storage.setOrCreate('RenderNodeDemo04', 'start');


class MyNodeController extends NodeController {
  private rootNode: FrameNode | null = null;

  makeNode(uiContext: UIContext): FrameNode | null {
    this.rootNode = new FrameNode(uiContext);
    const renderNode: RenderNode | null = this.rootNode!.getRenderNode();
    if (renderNode !== null) {
      const renderChildNode: RenderNode = new RenderNode();
      renderChildNode.frame = { x: 0, y: 0, width: 100, height: 100 };
      renderChildNode.backgroundColor = 0xffff0000.toInt();
      renderChildNode.label = 'customRenderChildNode';
      storage.set('renderNode_label', renderChildNode.label);
      console.log('label:', renderChildNode.label);
      renderNode.appendChild(renderChildNode);
    }

    return this.rootNode;
  }
}

@Entry
@Component
struct SetLabel {
  private myNodeController: MyNodeController = new MyNodeController();
  @State getLabel: string = "Init"

  build() {
    Column() {
      Button(this.getLabel).margin(100).id("SetLabel_text")
        .onClick((e:ClickEvent)=>{
          console.log('+++++++++++++++++++++++++1')
          this.getLabel = storage.get<string>('renderNode_label') as string  //在这里died
          console.log('+++++++++++++++++++++++++2')
        })
      NodeContainer(this.myNodeController)
        .width(300)
        .height(700)
        .backgroundColor(Color.Gray)
    }
  }
}