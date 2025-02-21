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
struct getColor1{
  private MyNodeController:MyNodeController = new MyNodeController()
  @State bgc :number =11
  build(){
    Column({space:10}){
      NodeContainer(this.MyNodeController)
      Text('color:'+`${this.bgc}`).key('render_color')
      Button('get color')
        .key('get_color')
        .onClick(()=>{
        this.bgc = renderNode.backgroundColor
      })
      Button('set get color')
        .key('getSet_color')
        .onClick(()=>{
        renderNode.backgroundColor = 0XFF00FF00
        this.bgc = renderNode.backgroundColor
      })
    }
    .margin({top:100})
    .width('100%')
    .height('100%')
  }
}