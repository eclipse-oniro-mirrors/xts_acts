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
let frameNode:FrameNode|undefined=new FrameNode( AppStorage.get<UIContext>('UIContent')!)
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
    this.rootNode.appendChild((this.textNode!.getFrameNode()))
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
  @State frameNode1:string=''
  @State frameNode2:string=''
  @State frameNode3:string=''
  @State boolean1:boolean=false
  @State boolean2:boolean=false
  @State boolean3:boolean=false
  @State builderNode:string=''

  build() {
    Column({space:2}) {
        Text('nodeContainer:'+this.text1).id('nodeContainer_1').height('2%')
        Text('nodeContainer:'+this.text2).id('nodeContainer_2').height('2%')
        Text('nodeContainer:'+this.text3).id('nodeContainer_3').height('2%')
        Text('nodeContainer:'+this.text4).id('nodeContainer_4').height('2%')
        Text('nodeContainer:'+this.text5).id('nodeContainer_5').height('2%')
        Text('nodeContainer:'+this.count2).id('nodeContainer_6').height('2%')
      Button('nodeContainer:count').height('2%')
        .id('nodeContainer_7')
        .onClick(()=>{
          let nodeContainerNode=this.myNodeController.rootNode!.getParent()
          this.count2=nodeContainerNode!.getChildrenCount()
        })
      Button('nodeContainer').height('2%')
        .id('nodeContainer_8')
        .onClick(()=>{
        let nodeContainerNode=this.myNodeController.rootNode!.getParent()
        if(nodeContainerNode!.getFirstChild()==this.myNodeController.rootNode){
          this.text1='getFirstChild'

        }
        if(nodeContainerNode!.getChild(0)==this.myNodeController.rootNode){
          this.text2='getChild'
        }
        if(nodeContainerNode!.getNextSibling()==null){
          this.text3='getNextSibling'
        }
        if(nodeContainerNode!.getPreviousSibling()!=null){
          this.text4='getPreviousSibling'
        }
        if(nodeContainerNode!.getParent() !== null){
          this.text5='getParent'
        }
      })
        Text('isModifiable:' + this.boolean1).id('nodeContainer_9').height('2%')
        Text('isModifiable:' + this.boolean2).id('nodeContainer_10').height('2%')
      Button('isModifiable').height('2%')
        .id('nodeContainer_11')
        .onClick(()=>{
        this.boolean1=this.myNodeController.rootNode!.isModifiable()
        console.log('2',this.myNodeController.rootNode!.isModifiable())
        console.log('3',this.myNodeController.rootNode!.getParent()!.isModifiable())
        this.boolean2=this.myNodeController.rootNode!.getParent()!.isModifiable()
      })
      Text('builderNode:'+this.builderNode).id('nodeContainer_12').height('2%')
      Button('builderNode').height('2%')
        .id('nodeContainer_13')
        .onClick(()=>{
         if(this.myNodeController!.rootNode!.getChild(1)==this.myNodeController!.textNode!.getFrameNode()){
            this.builderNode='builderNode'
         }
        })
      Text('isModifiable:'+this.boolean3).id('nodeContainer_14').height('2%')
      Button('isModifiable').height('2%')
        .id('nodeContainer_15')
        .onClick(()=>{
       this.boolean3 = this.myNodeController!.textNode!.getFrameNode()!.isModifiable()
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