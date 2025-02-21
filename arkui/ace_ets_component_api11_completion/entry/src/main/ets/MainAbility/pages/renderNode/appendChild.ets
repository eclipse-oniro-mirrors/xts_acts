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
import { RenderNode, FrameNode, NodeController } from "@ohos.arkui.node"

const renderNode = new RenderNode();
renderNode.size = { width: 150, height: 150 };

const renderNode2 = new RenderNode();
renderNode2.size = { width: 150, height: 150 };
renderNode2.position = { x: 150, y: 150 };


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
struct appendChild1 {
  private MyNodeController: MyNodeController = new MyNodeController()
  @State RenderNode: RenderNode = new RenderNode()
  @State width1: number = 100

  build() {
    Column({ space: 10 }) {
      NodeContainer(this.MyNodeController)
      Text("width1: " + this.width1).key('appendChild_width1')
      Button('appendChild')
        .key('appendChild_1')
        .onClick(() => {
          const child = new RenderNode()
          child.size = { width: 50, height: 50 }
          const renderNode1 = renderNode.appendChild(child)
          this.width1 = renderNode.getChild(0).size.width
        })
      Button('在最后添加子节点')
        .key('insertChildAfter_1')
        .onClick(() => {
          const child1 = new RenderNode()
          const sibling = renderNode.getChild(0)
          sibling.size = { width: 40, height: 40 }
          renderNode.insertChildAfter(child1, sibling)
          const sibling1 = renderNode.getChild(1)
          if (sibling1 != null) {
            this.width1 = sibling1.size.width
          } else {
            this.width1 = 60
          }
        })
      Button('removeChild')
        .key('removeChild_1')
        .onClick(() => {
          const sibling = renderNode.getChild(0)
          renderNode.removeChild(sibling)
          if (sibling != null) {
            this.width1 = sibling.size.width
          } else {
            this.width1 = 120
          }
        })

      Button('删除所有')
        .key('clearChild_1')
        .onClick(() => {
          const sibling = renderNode.getChild(0)
          renderNode.clearChildren()
          if (sibling != null) {
            this.width1 = sibling.size.width
          } else {
            this.width1 = 130
          }
        })
    }
    .margin({ top: 100 })
    .width('100%')
    .height('100%')
  }
}