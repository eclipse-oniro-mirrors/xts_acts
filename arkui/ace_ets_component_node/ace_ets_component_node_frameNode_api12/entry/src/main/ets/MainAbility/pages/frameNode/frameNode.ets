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
import { BuilderNode, FrameNode, NodeController } from '@ohos.arkui.node'
import { UIContext } from '@ohos.arkui.UIContext'
let frameNode:FrameNode|undefined=new FrameNode(AppStorage.get<UIContext>('UIContent')!)
let childList =new Array<FrameNode>()
for (let i= 0;i<10;i++){
  let childNode = new FrameNode( AppStorage.get<UIContext>('UIContent')!)
  childList.push(childNode)
  frameNode.appendChild(childNode)
}
class Params{
  text:string=''
  constructor(text:string) {
    this.text=text
  }
}
@Builder
function buildText(params:Params){
  Column(){
    Column(){
      Text(params.text)
      Text(params.text)
      Text(params.text)
    }
  }
}
class MyNodeController extends NodeController{
  rootNode:FrameNode|null=null
  textNode:BuilderNode<[Params]>|null=null
  private uiContext:UIContext|null=null
  private childrenCount :number=0
  makeNode(uiContext: UIContext): FrameNode | null{
    this.rootNode=new FrameNode(uiContext)
    this.rootNode!.appendChild(frameNode)
    this.textNode=new BuilderNode(uiContext,{selfIdealSize:{width:100,height:100}})
    this.textNode.build(wrapBuilder<[Params]>(buildText),new Params('HELLO'))
    this.childrenCount = this.childrenCount+2
    this.uiContext = uiContext
    return this.rootNode
  }
}
@Entry
@Component
struct frameNode1{
  private myNodeController:MyNodeController=new MyNodeController()
  private uiContext:UIContext|null=null
  @State index :number =0
  @State count1 :number =0
  @State count2 :number =0
  @State count3 :number =0
  @State text1:string=''
  @State text2:string=''
  @State text3:string=''
  @State text4:string=''
  @State text5:string=''
  @State getRenderNode1:string=''
  @State getRenderNode2:string=''
  @State getRenderNode3:string=''
  @State frameNode1:string=''
  @State frameNode2:string=''
  @State frameNode3:string=''
  @State boolean1:boolean=false
  @State boolean2:boolean=false
  build() {
    Column({space:2}) {
      Text('ChildrenCount:'+this.count1).id('frameNode_1')
      Button('appendChild')
        .id('frameNode_2')
        .onClick(()=>{
        let child =new FrameNode( AppStorage.get<UIContext>('UIContent')!)
        frameNode!.appendChild(child)
        this.count1=frameNode!.getChildrenCount()
      })
      Button('insertChildAfter')
        .id('frameNode_3')
        .onClick(()=>{
        let sibling=frameNode!.getChild(this.index)
        let child =new FrameNode( AppStorage.get<UIContext>('UIContent')!)
        frameNode!.insertChildAfter(child,sibling)
        this.count1=frameNode!.getChildrenCount()
      })
      Button('removeChild')
        .id('frameNode_4')
        .onClick(()=>{
        let sibling=frameNode!.getChild(this.index)
        frameNode!.removeChild(sibling)
        this.count1=frameNode!.getChildrenCount()
      })
      Button('clearChildren')
        .id('frameNode_5')
        .onClick(()=>{
        frameNode!.clearChildren()
        this.count1=frameNode!.getChildrenCount()
      })
      Text('frameNode:'+this.frameNode1).id('frameNode_6')
      Text('frameNode:'+this.frameNode2).id('frameNode_7')
      Text('frameNode:'+this.frameNode3).id('frameNode_8')
      Button('frameNode')
        .id('frameNode_9')
        .onClick(()=>{
        if(this.myNodeController!.rootNode!.getFirstChild()==frameNode!){
          this.frameNode1 = 'getFirstChild'
        }
        if(frameNode!.getChild(2)==frameNode!.getChild(1)!.getNextSibling()){
          this.frameNode2 = 'getNextSibling'
        }
        if(frameNode!.getChild(2)==frameNode!.getChild(3)!.getPreviousSibling()){
          this.frameNode3='getPreviousSibling'
        }
      })
        Text('getRenderNode:'+this.getRenderNode1).id('frameNode_10')
        Text('getRenderNode:'+this.getRenderNode2).id('frameNode_11')
        Text('getRenderNode:'+this.getRenderNode3).id('frameNode_12')

      Button('getRenderNode')
        .id('frameNode_13')
        .onClick(()=>{
        if(this.myNodeController.rootNode!.getParent()!.getRenderNode()==null){
          this.getRenderNode1='getRenderNode1'
        }
        if(this.myNodeController.rootNode!.getRenderNode()!==null){
          this.getRenderNode2='getRenderNode2'
        }
        if(this.myNodeController!.textNode!.getFrameNode()!.getRenderNode()!==null){
          this.getRenderNode3='getRenderNode3'
        }
      })
      Text('builderNode:'+this.count3).id('frameNode_14')
      Button('builderNode')
        .id('frameNode_15')
        .onClick(()=>{
        this.count3=this.myNodeController!.textNode!.getFrameNode()!.getChildrenCount()
      })
      NodeContainer(this.myNodeController)
        .visibility(Visibility.Hidden)
        .borderWidth(1)
        .width(20)
        .height(30)
    }
    .width('100%')
    .height('100%')
    .margin({top:5})
  }
}