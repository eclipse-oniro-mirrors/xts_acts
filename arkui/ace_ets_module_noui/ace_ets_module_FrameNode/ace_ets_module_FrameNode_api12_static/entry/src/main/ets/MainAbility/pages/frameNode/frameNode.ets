'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { Entry, Column, Component,Builder,Text,ColumnOptions,Margin,Button,NodeContainer,
  Visibility,wrapBuilder,CustomBuilderT
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import { ClickEvent } from '@ohos.arkui.component';
import { BuilderNode, FrameNode, NodeController } from '@ohos.arkui.node'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
let frameNode:FrameNode|undefined=new FrameNode(AppStorage.get<UIContext>('UIContent')!)
let childList =new Array<FrameNode>()
for (let i= 0;i<10;i++){
  let childNode = new FrameNode( AppStorage.get<UIContext>('UIContent')!)
  childList.push(childNode)
  frameNode?.appendChild(childNode!)
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
  textNode:BuilderNode<Params>|null=null
  private uiContext:UIContext|null=null
  private childrenCount :number=0
  private wrapBuilder = wrapBuilder<CustomBuilderT<Params>>(buildText)
  makeNode(uiContext: UIContext): FrameNode | null{
    this.rootNode=new FrameNode(uiContext)
    this.rootNode?.appendChild(frameNode!)
    this.textNode= new BuilderNode<Params>(uiContext,{selfIdealSize:{width:100,height:100}})!
    this.textNode?.build(this.wrapBuilder,new Params('HELLO'))
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
  @State index :int =0
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
    Column({space:2} as ColumnOptions) {
      Text('ChildrenCount:'+this.count1).id('frameNode_1').height('2%')
      Button('appendChild').height('2%')
        .id('frameNode_2')
        .onClick((e:ClickEvent)=>{
          console.info('frameNodeTest_static_0100 onClick');
        let child = new FrameNode(AppStorage.get<UIContext>('UIContent')!)
          console.info('frameNodeTest_static_0100 child');
        frameNode!.appendChild(child)
          console.info('frameNodeTest_static_0100 frameNode');
        this.count1=frameNode!.getChildrenCount()
      })
      Button('insertChildAfter').height('2%')
        .id('frameNode_3')
        .onClick((e:ClickEvent)=>{
        let sibling=frameNode!.getChild(this.index)
        let child =new FrameNode( AppStorage.get<UIContext>('UIContent')!)
        frameNode!.insertChildAfter(child,sibling)
        this.count1=frameNode!.getChildrenCount()
      })
      Button('removeChild').height('2%')
        .id('frameNode_4')
        .onClick((e:ClickEvent)=>{
        let sibling=frameNode!.getChild(this.index)
        frameNode?.removeChild(sibling!)
        this.count1=frameNode!.getChildrenCount()
      })
      Button('clearChildren').height('2%')
        .id('frameNode_5')
        .onClick((e:ClickEvent)=>{
        frameNode!.clearChildren()
        this.count1=frameNode!.getChildrenCount()
      })
      Text('frameNode:'+this.frameNode1).id('frameNode_6').height('2%')
      Text('frameNode:'+this.frameNode2).id('frameNode_7').height('2%')
      Text('frameNode:'+this.frameNode3).id('frameNode_8').height('2%')
      Button('frameNode').height('2%')
        .id('frameNode_9')
        .onClick((e:ClickEvent)=>{
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
        Text('getRenderNode:'+this.getRenderNode1).id('frameNode_10').height('2%')
        Text('getRenderNode:'+this.getRenderNode2).id('frameNode_11').height('2%')
        Text('getRenderNode:'+this.getRenderNode3).id('frameNode_12').height('2%')

      Button('getRenderNode').height('2%')
        .id('frameNode_13')
        .onClick((e:ClickEvent)=>{
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
      Text('builderNode:'+this.count3).id('frameNode_14').height('2%')
      Button('builderNode').height('2%')
        .id('frameNode_15')
        .onClick((e:ClickEvent)=>{
        this.count3=this.myNodeController!.textNode!.getFrameNode()!.getChildrenCount()
      })
      NodeContainer(this.myNodeController)
        .visibility(Visibility.Hidden)
        .borderWidth(1)
        .width(20)
        .height('10%')
    }
    .width('100%')
    .height('100%')
    .margin({top:5} as Margin)
  }
}