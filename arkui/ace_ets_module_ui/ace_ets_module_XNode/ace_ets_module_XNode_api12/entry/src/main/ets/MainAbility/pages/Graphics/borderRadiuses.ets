/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { RenderNode, FrameNode, NodeController, borderRadiuses } from "@ohos.arkui.node";

const renderNode = new RenderNode();
renderNode.frame = { x: 0, y: 0, width: 150, height: 150 };
renderNode.backgroundColor = 0XFF00FF00;
renderNode.borderRadius = borderRadiuses(32);

let borderRadiusesValue = renderNode.borderRadius

class MyNodeController extends NodeController {
  private rootNode: FrameNode | null = null;

  makeNode(uiContext: UIContext): FrameNode | null {
    this.rootNode = new FrameNode(uiContext);

    const rootRenderNode = this.rootNode.getRenderNode();
    if (rootRenderNode !== null) {
      rootRenderNode.appendChild(renderNode);
    }

    return this.rootNode;
  }
}

@Entry
@Component
struct borderRadiusesExample {
  private myNodeController: MyNodeController = new MyNodeController();
  @State borderRadiusesValue: number = 0

  build() {
    Column() {
      NodeContainer(this.myNodeController)
      Text('borderRadiusesValue:' + this.borderRadiusesValue).margin(10).id("borderRadiusesValue") //30
      Button('click borderRadiusesValue')
        .id("borderRadiusesClick")
        .onClick(() => {
          renderNode.borderRadius = borderRadiuses(30)
          renderNode.invalidate()
          this.borderRadiusesValue = renderNode.borderRadius.topLeft
        })
    }
  }
}