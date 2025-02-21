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
import { RenderNode, DrawContext, NodeController, FrameNode } from "@ohos.arkui.node"

const renderNode = new RenderNode();
renderNode.size = { width: 100, height: 100 };
renderNode.shadowOffset = { x: 10, y: 10 };
renderNode.shadowAlpha = 0.5;
renderNode.shadowRadius  = 10;

class MyRenderNode extends RenderNode {
  draw(context: DrawContext) {
    renderNode.shadowAlpha = 0.7;
  }
}

class MyNodeController extends NodeController {
  private rootNode: FrameNode | null = null;

  makeNode(uiContext: UIContext): FrameNode | null {
    this.rootNode = new FrameNode(uiContext);

    const rootRenderNode = this.rootNode.getRenderNode();
    if (rootRenderNode !== null) {
      let renderNode = new MyRenderNode();
      rootRenderNode.appendChild(renderNode);
    }

    return this.rootNode;
  }
}

@Entry
@Component
struct RenderNodeDraw {
  private MyNodeController: MyNodeController = new MyNodeController();
  build() {
    Column() {
      NodeContainer(this.MyNodeController).key('RenderNodeDraw')
      Button('Click to set')
        .id('invalidate_draw')
        .onClick(() => {
          renderNode.invalidate()
        })
      Text("Draw:" + renderNode.shadowAlpha).key('RenderNodeDraw_get')
    }
  }
}