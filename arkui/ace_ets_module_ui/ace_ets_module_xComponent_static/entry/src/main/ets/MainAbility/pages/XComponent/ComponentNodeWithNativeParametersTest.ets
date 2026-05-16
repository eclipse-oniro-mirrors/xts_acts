/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

'use static'
import {
  Entry,
  Column,
  Color,
  Component,
  NativeXComponentParameters,
  NodeContainer,
  UIContext,
  XComponentType
} from '@kit.ArkUI';
import {
  FrameNode,
  NodeController,
  typeNode
} from "@ohos.arkui.node";

export class MyNodeController extends NodeController {
  public uiContext: UIContext | null = null;
  public rootNode: FrameNode | null = null;

  makeNode(uiContext: UIContext): FrameNode | null {
    this.uiContext = uiContext;
    this.rootNode = new FrameNode(uiContext);

    const param = {
      type: XComponentType.SURFACE
    } as NativeXComponentParameters;
    let xcomponentNode: typeNode.XComponent = typeNode.createXComponentNodeWithNativeParameters(uiContext, param);
    let xcomponentNode1: typeNode.XComponent = typeNode.createXComponentNodeWithNativeParameters(uiContext, param, undefined);

    xcomponentNode!.attribute
      .width(100)
      .height(100)
      .backgroundColor(Color.Gray)
      .key('componentNodeWithNativeParameters_id')

    xcomponentNode1!.attribute
      .width(50)
      .height(50)
      .backgroundColor(Color.Green)
      .key('componentNodeWithNativeParameters1_id')

    this!.rootNode!.appendChild(xcomponentNode);
    this!.rootNode!.appendChild(xcomponentNode1);
    return this.rootNode;
  }

  dispose(): void {
    if (this.rootNode) {
      this.rootNode!.clearChildren();
      this.rootNode!.dispose();
    }
  }
}

@Entry
@Component
struct MyStateSample2 {
  private controller: MyNodeController = new MyNodeController();
  aboutToDisappear(): void {
    this.controller.dispose();
  }
  build() {
    Column(undefined) {
      NodeContainer(this.controller)
    }
  }
}