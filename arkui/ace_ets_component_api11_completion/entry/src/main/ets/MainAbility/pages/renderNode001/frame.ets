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
renderNode.frame = { x: 50, y: 50, width: 100, height: 100 };
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
struct frame {
  @State getX:number = 100
  @State getY:number = 30
  private MyNodeController: MyNodeController = new MyNodeController();
  build() {
    Column({space:5}){
      Row(){
        Text(this.getX.toString())
          .id('text_getFrame')
          .height(100)
          .width(50)
          .backgroundColor(0xF5DEB3)
          .textAlign(TextAlign.Center)
        Button('getFrame')
          .onClick(()=>{
            this.getX =  renderNode.frame.x
          })
          .id('getFrame_id')
          .width('60%')
          .height(100)
          .backgroundColor(0xD2B48C)
      }.width('100%')
      Row(){
        Text(this.getY.toString())
          .id('text_setFrame')
          .height(100)
          .width(50)
          .backgroundColor(0xF5DEB3)
          .textAlign(TextAlign.Center)
        Button('setFrame')
          .onClick(()=>{
            renderNode.frame = { x: 50, y: 60, width: 100, height: 100 };
            this.getY =  renderNode.frame.y
          })
          .id('setFrame_id')
          .width('60%')
          .height(100)
          .backgroundColor(0xD2B48C)
      }.width('100%')
    }.margin({top:20,left:20})
  }
}