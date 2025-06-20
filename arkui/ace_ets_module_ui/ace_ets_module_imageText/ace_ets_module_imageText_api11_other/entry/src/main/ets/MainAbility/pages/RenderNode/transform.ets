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
renderNode.transform = [
  1, 0, 45, 0,
  0, 1,  0, 0,
  0, 0,  1, 0,
  0, 0,  0, 1
];
const transform = renderNode.transform;

renderNode.translation = { x: 30, y: 30 };

renderNode.rotation = { x: 10, y: 45, z: 0 };

renderNode.backgroundColor = 0XFF00FF00;


renderNode.size = {width: 100, height: 100 };


renderNode.position = { x: 100, y: 100 };
renderNode.scale = { x: 1, y: 1 }

renderNode.shadowColor = 0x008000;
renderNode.shadowOffset = { x: 20, y: 20 }

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
struct transformExample {
  private MyNodeController: MyNodeController = new MyNodeController();


  build() {
    Column() {
      NodeContainer(this.MyNodeController)

      List(){
        ListItem(){
          Text('transform is ' + transform ).id('transform')
        }

      }
    }
  }
}