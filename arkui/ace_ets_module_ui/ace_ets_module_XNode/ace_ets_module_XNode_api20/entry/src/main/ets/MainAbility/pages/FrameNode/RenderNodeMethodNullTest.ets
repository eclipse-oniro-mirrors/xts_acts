/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import {  RenderNode, FrameNode, NodeController } from '@kit.ArkUI';

const renderNode = new RenderNode();
renderNode.backgroundColor = 0xffff0000;
renderNode.size = { width: 100, height: 100 };

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
struct RenderNodeMethodNullIndex {
  private myNodeController: MyNodeController = new MyNodeController();

  build() {
    Column() {
      NodeContainer(this.myNodeController)
        .width(200)
        .height('30%')
      Button('getNextSibling')
        .id('btn_renderNodeMethodNull')
        .width(200)
        .height('10%')
        .onClick(() => {
          AppStorage.SetOrCreate('renderNodeGetChildNull', renderNode.getChild(1));
          AppStorage.SetOrCreate('renderNodeGetFirstChildNull', renderNode.getFirstChild());
          AppStorage.SetOrCreate('renderNodeGetNextSiblingNull', renderNode.getNextSibling());
          AppStorage.SetOrCreate('renderNodeGetPreviousSiblingNull', renderNode.getPreviousSibling());

          console.info('the getChild result:' + renderNode.getChild(1));
          console.info('the getFirstChild result:' + renderNode.getFirstChild());
          console.info('the getNextSibling result:' + renderNode.getNextSibling());
          console.info('the getPreviousSibling result:' + renderNode.getPreviousSibling());
        })
    }
  }
}