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

import { RenderNode, FrameNode, NodeController } from '@kit.ArkUI';

const renderNode = new RenderNode();
renderNode.frame = { x: 0, y: 0, width: 100, height: 50 };
renderNode.backgroundColor = 0xffff0000;

class MyNodeController extends NodeController {
  private rootNode: FrameNode | null = null;

  makeNode(uiContext: UIContext): FrameNode | null {
    this.rootNode = new FrameNode(uiContext);
    let rootRenderNode = this.rootNode!.getRenderNode();
    if (rootRenderNode !== null) {
      rootRenderNode.size = { width: 200, height: 50 };
      rootRenderNode.backgroundColor = 0xff00ff00;
      rootRenderNode.appendChild(renderNode);
    }

    return this.rootNode;
  }

  disposeRenderNode() {
    const rootRenderNode = this.rootNode!.getRenderNode();
    if (rootRenderNode !== null) {
      rootRenderNode.removeChild(renderNode);
    }
    rootRenderNode?.dispose();
  }

  getRenderNode() {
    const rootRenderNode = this.rootNode!.getRenderNode();
    if (rootRenderNode !== null && renderNode !== null ) {
      return true
    } else {
      return false
    }
  }
}

@Entry
@Component
struct RenderNodeDisposeIndex {
  private myNodeController: MyNodeController = new MyNodeController();
  @State flag: boolean | null = null
  @State result: string = '99999'

  build() {
    Column() {
      NodeContainer(this.myNodeController)
      Button('RenderNode dispose')
        .id('dispose_id')
        .onClick(() => {
          this.myNodeController.disposeRenderNode();
        })
        .width('100%')
      Button('result').id('result_id').height('10%')
        .onClick(() => {
          this.flag = this.myNodeController.getRenderNode();
          if(this.flag){
            this.result = 'dispose fail'
          }else{
            this.result = 'Init'
          }
        }).width('100%')
      Text(this.result).id('dispose_result').height('10%')
    }
  }
}