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

import { UIContext } from '@ohos.arkui.UIContext';
import { NodeController, BuilderNode, Size, FrameNode } from '@ohos.arkui.node';
import {
  Entry, Component,
  Column, ColumnOptions, Row, Builder, TouchEvent,Color, WrappedBuilder, NodeContainer, CustomBuilderT,
  Text, Button, FontWeight, ClickEvent, Margin, WidthBreakpoint, HeightBreakpoint, CustomBuilderT
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

class Params {
  text: string = "this is a text"
}

@Builder
function buttonBuilder(params: Params) {
  Column() {
    Button(`button ` + params.text)
      .borderWidth(2)
      .backgroundColor(Color.Orange).key('nodeButton')
  }
}

class MyNodeController extends NodeController {
  private rootNode: FrameNode|null = null;
  private buttonNode: BuilderNode<Params> | null = null;
  private wrapBuilder = new WrappedBuilder<CustomBuilderT<Params>>(buttonBuilder);

  makeNode(uiContext: UIContext): FrameNode {
    if (this.rootNode == null) {
      this.rootNode = new FrameNode(uiContext);
      this.buttonNode = new BuilderNode<Params>(uiContext);
      this.buttonNode?.build(this.wrapBuilder, { text: "this is a string" } as Params)

      const rootRenderNode = this.rootNode?.getRenderNode();
      if (rootRenderNode !== null) {
        rootRenderNode?.appendChild(this.buttonNode?.getFrameNode()?.getRenderNode()!);
      }
    }
    return this.rootNode!;
  }

  aboutToResize(size: Size) {
    console.log("aboutToResize width : " + size.width + " height : " + size.height)
  }

  aboutToAppear() {
    console.log("aboutToAppear")
  }

  aboutToDisappear() {
    console.log("aboutToDisappear");
  }
  update()
  {
    if(this.rootNode == null)
    {
      return;
    }
    this.rebuild();
  }

  onTouchEvent(event:TouchEvent) {
    console.log("onTouchEvent");
  }
}

@Entry
@Component
struct nodeIndex {
  private myNodeController: MyNodeController = new MyNodeController();

  build() {
    Row() {
      NodeContainer(this.myNodeController).onClick((e:ClickEvent)=> {
           this.myNodeController.update();
      }).key("nodeContainer")
    }
  }
}