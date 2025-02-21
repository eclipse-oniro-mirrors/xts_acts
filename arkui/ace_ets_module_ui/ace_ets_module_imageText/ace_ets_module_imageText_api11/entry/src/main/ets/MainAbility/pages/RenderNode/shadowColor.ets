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
renderNode.size = { width: 200, height: 200 };
renderNode.shadowColor = 0XFF00FF00
renderNode.shadowAlpha = 0.7;


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

struct getShadowColor {
  @State MyNodeController: MyNodeController = new MyNodeController();
  @State sColor : number = 10;

  build() {
    Column({space:10}){
      NodeContainer(this.MyNodeController)
      Text('shadowColor:'+ this.sColor).key('render_shadowColor')
      Button('set get shadowColor')
        .key('getSet_shadowColor')
        .onClick(()=>{
          this.sColor = renderNode.shadowColor
        })
    }
    .margin({top:100})
    .width('100%')
    .height('100%')
  }
}