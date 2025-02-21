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
renderNode.pivot = { x: 0.5, y: 0.6 };
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
struct pivot {
  @State getX:number = 1
  @State getY:number = 0.2
  private MyNodeController: MyNodeController = new MyNodeController();
  build() {
    Column({space:5}){
      Row(){
        Text(this.getX.toString())
          .id('text_getPivot')
          .height(100)
          .width(50)
          .backgroundColor(0xF5DEB3)
          .textAlign(TextAlign.Center)
        Button('getPivot')
          .onClick(()=>{
            this.getX =  renderNode.pivot.x
          })
          .id('getPivot_id')
          .width('60%')
          .height(100)
          .backgroundColor(0xD2B48C)
      }.width('100%')
      Row(){
        Text(this.getY.toString())
          .id('text_setPivot')
          .width(50)
          .height(100)
          .backgroundColor(0xF5DEB3)
          .textAlign(TextAlign.Center)
        Button('setPivot')
          .onClick(()=>{
            renderNode.pivot = { x: 0.3, y: 0.5 };
            this.getY =  renderNode.pivot.y
          })
          .id('setPivot_id')
          .width('60%')
          .height(100)
          .backgroundColor(0xD2B48C)
      }.width('100%')
    }.margin({top:20,left:20})
  }
}