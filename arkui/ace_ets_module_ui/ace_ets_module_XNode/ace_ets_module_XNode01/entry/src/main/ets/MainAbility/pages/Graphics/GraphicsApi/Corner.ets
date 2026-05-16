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
import { RenderNode, ShapeMask, FrameNode, NodeController, RoundRect } from "@ohos.arkui.node";

const mask = new ShapeMask();
const roundRect: RoundRect = {
  rect: { left: 0, top: 0, right: vp2px(150), bottom: vp2px(150) },
  corners: {
    topLeft: { x: 32, y: 32 },
    topRight: { x: 32, y: 32 },
    bottomLeft: { x: 32, y: 32 },
    bottomRight: { x: 32, y: 32 }
  }
}
mask.setRoundRectShape(roundRect);
mask.fillColor = 0X55FF0000;

const renderNode = new RenderNode();
renderNode.frame = { x: 0, y: 0, width: 150, height: 150 };
renderNode.backgroundColor = 0XFF00FF00;
renderNode.shapeMask = mask;


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
struct Index {
  private myNodeController: MyNodeController = new MyNodeController();

  build() {
    Column({ space: 12 }) {
      Text(roundRect.corners.topLeft.x + "")
        .id("corners_x")
      Text(roundRect.corners.topLeft.y + "")
        .id("corners_y")
        .margin({ top: 20 })
      Row() {
        NodeContainer(this.myNodeController)
      }
    }.width("100%")
  }
}