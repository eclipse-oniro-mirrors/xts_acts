'use static';
/**
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
import { NodeController, BuilderNode, FrameNode, NodeRenderType } from '@ohos.arkui.node';
import { State, AppStorage } from '@ohos.arkui.stateManagement'
import {
  Builder,
  Entry,
  Component,
  Column,
  WrappedBuilder,
  Button,
  Color,
  Row,
  ClickEvent,
  NodeContainer,
  TapGesture,
  Text,
  wrapBuilder,
  CustomBuilderT
} from "@ohos.arkui.component"
import { GestureEvent, TouchEvent } from '@ohos.arkui.component'

class Params {
  text: string = "this is a text"
}

@Builder
function ButtonBuilder(params: Params) {
  Column() {
    Button(`button ` + params.text)
      .borderWidth(2)
      .backgroundColor(Color.Orange)
      .width("100%")
      .height("100%")
      .key("nodeeventButton")
      .gesture(
        TapGesture()
          .onAction((event: GestureEvent) => {
            console.log("TapGesture");
          })
      )
  }
  .width(500)
  .height(300)
  .backgroundColor(Color.Gray)
}

class MyNodeController extends NodeController {
  private rootNode: BuilderNode<Params> | null = null;
  private wrapBuilder = wrapBuilder<CustomBuilderT<Params>>(ButtonBuilder);

  makeNode(uiContext: UIContext): FrameNode | null {
    this.rootNode = new BuilderNode<Params>(uiContext, { type: NodeRenderType.RENDER_TYPE_DISPLAY });
    this.rootNode?.build(this.wrapBuilder, { text: "this is a string" })
    return this.rootNode?.getFrameNode() ?? null;
  }

  postTouchEvent(touchEvent: TouchEvent): void {
    if (this.rootNode == null) {
      return;
    }
    console.info("postTouchEvent")
  }

  onTouchEvent(touchEvent: TouchEvent): void {
    console.info("touch event info")
  }
}

@Entry
@Component
struct MyComponent {
  private nodeController: MyNodeController = new MyNodeController();
  @State text1: string = "";

  build() {
    Column() {
      Text(this.text1).key('node1Test').height('5%')
      NodeContainer(this.nodeController)
        .height('30%')
        .key("nodeTest")
        .width(500).onTouch((event: TouchEvent) => {
        this.nodeController.onTouchEvent(event)

      })

      Column()
        .width(500)
        .height('10%')
        .backgroundColor(Color.Pink)
        .onTouch((event: TouchEvent) => {
          if (event != undefined) {
            this.nodeController.postTouchEvent(event);
          }
        })
        .key("columnTest")
    }.height('100%')
  }
}