/**
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
import { DrawContext, RenderNode, FrameNode, NodeController } from "@ohos.arkui.node"

let width = 1

class MyRenderNode extends RenderNode {
  draw(context: DrawContext) {
    width = context.size.width
  }
}

class MyNodeController extends NodeController {
  private rootNode: FrameNode | null = null;

  makeNode(uiContext: UIContext): FrameNode | null {
    this.rootNode = new FrameNode(uiContext);

    const rootRenderNode = this.rootNode.getRenderNode();
    if (rootRenderNode !== null) {
      const renderNode = new MyRenderNode();
      renderNode.size = { width: 100, height: 100 }
      rootRenderNode.appendChild(renderNode);
    }
    return this.rootNode;
  }
}

@Entry
@Component
struct DrawContextGetSize{
  private MyNodeController: MyNodeController = new MyNodeController()

  build() {
    Column({ space: 10 }) {
      NodeContainer(this.MyNodeController)
      Text("width: " + width).key('DrawContext_get_Size_width')
      Button('Graphics DrawContext get Size')
        .key('DrawContext_get_Size')
        .onClick(() => {
          const child =new MyRenderNode()
          width = child.size.width
        })
        .margin({ top: 100 })
        .width('100%')
        .height('100%')
    }
  }
}