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
renderNode.backgroundColor = 0XFF00FF00
renderNode.size = { width: 200, height: 200 };
renderNode.shadowAlpha = 0.7;
renderNode.shadowOffset = { x: 10, y: 10 };

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

struct setShadowOffset {
  @State MyNodeController: MyNodeController = new MyNodeController();
  @State getX: number = 0 ;
  @State getY :number = 0;

  build() {
    Row() {
      Column() {
        NodeContainer(this.MyNodeController).height('30%')
        Text('getOffset_X:' + this.getX).key('getX').height('5%')
        Text('getOffset_Y:' + this.getY).key('getY').height('5%')

        Button('get shadowOffset').margin(10).height('5%')
          .key('get_shadowOffset')
          .onClick(()=>{
            this.getX = renderNode.shadowOffset.x
            this.getY = renderNode.shadowOffset.y
          })

      }.width('100%').height('100%')
    }.height('100%')

  }
}