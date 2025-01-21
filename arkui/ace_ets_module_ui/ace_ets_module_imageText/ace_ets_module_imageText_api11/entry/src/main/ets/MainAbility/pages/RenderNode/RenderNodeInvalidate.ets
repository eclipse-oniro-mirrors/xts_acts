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
let renderNode = new RenderNode();
renderNode.size = { width: 300, height: 300 };
renderNode.backgroundColor = 0XFF00FF00
renderNode.opacity = 1.0
let opacity = renderNode.opacity
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
struct invalidateExample {
  @State MyNodeController: MyNodeController = new MyNodeController();
  @State setOpacity: number = opacity
  build() {
    Row() {
      Column() {
        NodeContainer(this.MyNodeController)
        Button('Click to set')
          .id('invalidate_Opacity')
          .onClick(() => {
            renderNode.opacity = 0.5
            renderNode.invalidate()
            this.setOpacity = renderNode.opacity
          })
        Text('statusOpacity:' + this.setOpacity).margin(10)
          .key('Opacity_reset')
      }.width('100%')
    }.height('100%')
  }
}