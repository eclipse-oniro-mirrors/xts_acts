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
import { RenderNode, FrameNode, NodeController, DrawContext } from "@ohos.arkui.node"
import drawing from '@ohos.graphics.drawing';
// let para: Record<string> = { 'RenderNodeDemo04': false };
// let storage: LocalStorage = new LocalStorage(para);
let storage: LocalStorage = new LocalStorage();
storage.setOrCreate('RenderNodeDemo04', false);

class MyRenderNode extends RenderNode {
  draw(context: DrawContext) {
    const canvas = context.canvas;
    const brush = new drawing.Brush();
    brush.setColor({ alpha: 255, red: 255, green: 0, blue: 0 });
    canvas.attachBrush(brush);
    canvas.drawRect({ left: 0, right: 200, top: 0, bottom: 200 });
    canvas.detachBrush();

    brush.setColor({ alpha: 255, red: 0, green: 255, blue: 0 });
    canvas.attachBrush(brush);
    canvas.drawRect({ left: 100, right: 300, top: 100, bottom: 300 });
    canvas.detachBrush();
  }
}

const renderNode = new MyRenderNode();
renderNode.frame = { x: 100, y: 100, width: 200, height: 200 };
renderNode.backgroundColor = 0xff0000ff.toInt();

class MyNodeController extends NodeController {
  private rootNode: FrameNode | null = null;
  makeNode(uiContext: UIContext): FrameNode | null {
    this.rootNode = new FrameNode(uiContext);
    if(this.rootNode === null) {
      return this.rootNode
    }
    const rootRenderNode = this.rootNode!.getRenderNode();
    if (rootRenderNode !== null) {
      rootRenderNode!.appendChild(renderNode);
      storage.set('RenderNodeDemo04', renderNode.markNodeGroup);
    }
    return this.rootNode;
  }
}

@Entry
@Component
struct RenderNodeDemo04 {
  @State text1: boolean = false;
  private myNodeController: MyNodeController = new MyNodeController();
  build() {
    Column({space:20} as ColumnOptions){
      Text(`${this.text1}`).key('RenderNodeDemo04_Text')
      Button(`${this.text1}`).key('RenderNodeDemo04_Button')
        .onClick((e:ClickEvent)=>{
          this.text1 = storage!.get<boolean>('RenderNodeDemo04') as boolean
        })
      Row() {
        NodeContainer(this.myNodeController)
      }
    }
  }
}