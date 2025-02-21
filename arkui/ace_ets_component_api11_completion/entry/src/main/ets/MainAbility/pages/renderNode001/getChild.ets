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
struct getChild1{
  private MyNodeController:MyNodeController = new MyNodeController()
  @State RenderNode:RenderNode =new RenderNode()
  @State index :number = 0
  @State width0 : number = 0
  @State height0 : number = 0
  @State x0 : number = 0
  @State y0 : number = 0
  @State show0 :boolean=false
  @State width1 : number = 0
  @State height1 : number = 0
  @State x1 : number = 0
  @State y1 : number = 0
  @State show1 :boolean=false
  @State width2 : number = 0
  @State height2 : number = 0
  @State x2 : number = 0
  @State y2 : number = 0
  @State show2 :boolean=false
  @State width3 : number = 0
  @State height3 : number = 0
  @State x3 : number = 0
  @State y3 : number = 0
  @State show3 :boolean=false
  build(){
    Column({space:10}){
      NodeContainer(this.MyNodeController)
      Button('添加子节点')
        .key('getChild_0')
        .onClick(()=>{
        const child =new RenderNode()
        const sibling=renderNode.getChild(this.index)
        child.size = {width:100,height:100}
        child.position = {x:100 , y:100}
        renderNode.insertChildAfter(child,sibling)
      })
      Button('改变子节点的位置')
        .key('getChild_1')
        .onClick(()=>{
        this.index++
      })
      Button('获取RenderNode的getChild接口')
        .key('getChild_2')
        .onClick(()=>{
        const child0 = renderNode.getChild(this.index)
        if(child0 != null) {
          this.show0 = true
          this.width0 = child0.size.width
        }else {
          this.show0 = false
        }
      })
      if(this.show0){
        Text('width:'+`${this.width0}`).key('getChild_2_text')
      }
      Button('获取RenderNode的getFirstChild接口')
        .key('getChild_3')
        .onClick(()=>{
        const child1 = renderNode.getFirstChild()
        if(child1 != null) {
          this.show1 = true
          this.width1 = child1.size.width
        }else {
          this.show1 = false
        }
      })
      if(this.show1){
        Text('width:'+`${this.width1}`).key('getChild_3_text')
      }
      Button('获取RenderNode的getNextSibling接口')
        .key('getChild_4')
        .onClick(()=>{
        const child2 = renderNode.getChild(this.index)
        if(child2 != null) {
          this.show2 = true
          const nextSibling = child2.getNextSibling()
          if (nextSibling!==null) {
            console.log('getNextSibling')
            this.width2 = nextSibling.size.width
          }else{
            this.show3 = false
          }
        }else {
          this.show2 = false
        }
      })
      if(this.show2){
        Text('width:'+`${this.width2}`).key('getChild_4_text')
      }
      Button('获取RenderNode的getPreviousSibling接口')
        .key('getChild_5')
        .onClick(()=>{
        const child3 = renderNode.getChild(this.index)
        if(child3 != null) {
          console.log('sssss')
          this.show3 = true
          const previousSibling = child3.getPreviousSibling()
          if (previousSibling!== null) {
            console.log('previousSibling')
            this.width3 = previousSibling.size.width
          }else{
            this.show3 = false
          }
        }else {
          this.show3 = false
        }
      })
      if(this.show3){
        Text('width:'+`${this.width3}`).key('getChild_5_text')
      }
    }
    .margin({top:100})
    .width('100%')
    .height('100%')
  }
}