/*
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

import { RenderNode, ShapeMask, FrameNode, NodeController } from "@ohos.arkui.node";

let para: Record<string, string> = { 'PropSetCircleShape': 'start' };
let storage: LocalStorage = new LocalStorage(para);


class MyNodeController extends NodeController {
  private rootNode: FrameNode | null = null;

  makeNode(uiContext: UIContext): FrameNode | null {
    this.rootNode = new FrameNode(uiContext);

    const rootRenderNode = this.rootNode.getRenderNode();
    if (rootRenderNode !== null) {
      const mask = new ShapeMask();
      mask.setCircleShape({ centerY: vp2px(75), centerX: vp2px(75), radius: vp2px(75) });
      storage.set('PropSetCircleShape', 'setCircleShape succ');
      mask.fillColor = 0X55FF0000;

      const renderNode = new RenderNode();
      renderNode.frame = { x: 0, y: 0, width: 150, height: 150 };
      renderNode.backgroundColor = 0XFF00FF00;
      renderNode.shapeMask = mask;
      rootRenderNode.appendChild(renderNode);
    }

    return this.rootNode;
  }
}

@Entry
@Component
struct setCircleShapeApi {
  private myNodeController: MyNodeController = new MyNodeController();
  @State flag: string = "start"
  build() {
    Row() {
      Text(this.flag).id("setCircleShape_text")
        .onClick(() => {
          this.flag = storage.get('PropSetCircleShape') as string
        })
      NodeContainer(this.myNodeController)
    }
  }
}