'use static';
/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import { ColorMetrics } from '@kit.ArkUI';
import { BusinessError } from '@ohos.base';
import { ComponentContent } from '@kit.ArkUI';
import { BuilderNode, FrameNode, NodeController,typeNode } from '@ohos.arkui.node'
import { Entry, Column, Component,Builder,Text,ColumnOptions,Margin,Button,NodeContainer,
  Visibility,FontWeight,Color,WrappedBuilder,Scroll,Scroller,ColumnOptions,
  HorizontalAlign,ColumnOptions,Stack,Row,Position,CustomBuilderT,Alignment,

} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import { ClickEvent } from '@ohos.arkui.component';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

@Builder
function buildText(string: string) {
  Text(string)
    .fontSize(25)
    .fontWeight(FontWeight.Bold)
}

class MyNodeController extends NodeController {
  public uiContext: UIContext | null = null
  public rootNode: FrameNode | null = null
  public builderRootNode: FrameNode | null = null
  public nativeNode: FrameNode | null = null
  public nativeNode2: FrameNode | null = null
  public node1: FrameNode | null = null
  public node2: FrameNode | null = null
  public stackBlue: FrameNode | null = null
  public child3: FrameNode | null = null
  public textNode: FrameNode | null = null

  makeNode(uiContext: UIContext): FrameNode | null {
    console.log('++++++++++++makeNode',uiContext)
    this.uiContext = uiContext
    this.rootNode = new FrameNode(uiContext)
    this.rootNode?.commonAttribute.width('100%').id('root_id1')
    return this.rootNode
  }

  refreshNode(): void {
    console.log('++++++++++++refreshNode1',this.uiContext)
    this.nativeNode = this.uiContext!.getFrameNodeById('column')
    console.log('++++++++++++refreshNode2',this.nativeNode)
    const builderNode = new BuilderNode<string>(this.uiContext!)
    console.log('++++++++++++refreshNode3')
    builderNode.build(new WrappedBuilder<CustomBuilderT<string>>(buildText), 'hello')
    console.log('++++++++++++refreshNode4')
    this.builderRootNode = builderNode.getFrameNode()
    console.log('++++++++++++refreshNode5')
  }

  operate(): void {
    const node = new FrameNode(this.uiContext!)
    this.node1 = new FrameNode(this.uiContext!)
    this.node1?.commonAttribute.width(150)
      .height(150)
      .backgroundColor(Color.Gray)
      .borderWidth(1)
      .id('node1_sally')
    console.log('++++++++++++++++this.node2-1+uicontext',this.uiContext)
    this.node2 = new FrameNode(this.uiContext!)
    console.log('++++++++++++++++this.node2-2')
    this.node2?.commonAttribute.width(150)
      .height(150)
      .backgroundColor(Color.Grey)
      .position({ x: 200, y: 0 } as Position)
      .borderWidth(1)

    const stack1 = typeNode.createStackNode(this.uiContext!)
    stack1.commonAttribute.width(30).height(30).backgroundColor(Color.Red)
    stack1.initialize({ alignContent: Alignment.Bottom })
    const stack2 = typeNode.createStackNode(this.uiContext!)
    stack2.commonAttribute.width(30)
      .height(30)
      .backgroundColor(Color.Yellow)
      .offset({ x: 20, y: 15 } as Position)
    this.stackBlue = typeNode.createStackNode(this.uiContext!)
    this.stackBlue?.commonAttribute.width(30)
      .height(30)
      .backgroundColor(Color.Blue)
      .offset({ x: 40 } as Position)
    const stack4 = typeNode.createStackNode(this.uiContext!)
    stack4.commonAttribute.width(30).height(30).backgroundColor(Color.Red)
    const stack5 = typeNode.createStackNode(this.uiContext!)
    stack5.commonAttribute.width(30)
      .height(30)
      .backgroundColor(Color.Yellow)
      .offset({ x: 20, y: 15 } as Position)

    this.rootNode!.appendChild(this.node1!)

    this.node1!.appendChild(stack1)
    this.node1!.appendChild(stack2)
    this.node2!.appendChild(stack4)
    this.node2!.appendChild(stack5)

    const current = node
    const source = current.getParent()
    const target = this.rootNode
    const index = 3
    console.log('mzj 原父节点孩子数：', source?.getChildrenCount())
    console.log('mzj 新父节点孩子数：', target?.getChildrenCount())
    current.moveTo(target!, index)
    console.log('mzj 原父节点孩子数：', source?.getChildrenCount())
    console.log('mzj 新父节点孩子数：', target?.getChildrenCount())
    console.log('mzj 新父节点第一个子节点是否是当前节点：', target?.getFirstChild() === current)
    console.log('mzj 新父节点第i个子节点是否是当前节点：', target?.getChild(index) === current)
  }

  addFrame2(): void {
    console.log('+++++++++addFrame2-1')
    if(this.rootNode == null ){
      console.log('+++++++++addFrame2-1 rootNode = null ',)
    }
    try{
      console.log('++++++++++++node2',this.node2)
      this.rootNode!.appendChild(this.node2!)  // NullPointerError
    } catch(err){
      console.log('+++++++++addFrame2-1 Error ',err)
    }
    // this.rootNode!.appendChild(this.node2!) //
    console.log('+++++++++addFrame2-2')
  }

  frame1AddBlue(): void {
    this.node1?.appendChild(this.stackBlue!)
  }

  move(moveflag: boolean): void {
    if (moveflag) {
      this.stackBlue?.moveTo(this.node2!, 2)
    } else {
      this.stackBlue?.commonAttribute.offset({ x: 40 } as Position)
      this.stackBlue?.moveTo(this.node1!, 2)
    }
  }

  addText(uicontext: UIContext): void {
    let textNode = typeNode.createTextNode(uicontext)
    textNode.initialize('hello sally').fontColor(Color.White).id('text_id')
    textNode.commonAttribute.offset({ y: 100 } as Position)

    this.textNode = textNode
    if (this.rootNode) {
      this.rootNode!.appendChild(this.textNode!)
    }
  }

  moveText(): void {
    this.textNode?.moveTo(this.node2!)
  }

}

@Entry
@Component
struct frameNodeMoveOne {
  private myNodeController: MyNodeController = new MyNodeController()
  @State frame1ChildCount: number = -1
  @State frame2ChildCount: number = -1
  @State frame3ChildCount: number = -1
  @State getNodeParentId: string = '0'
  @State moveFlag: boolean = true

  onPageShow(): void {
    console.log('+++++++++++++++++onPageShow0')
    this.myNodeController.refreshNode()
    console.log('+++++++++++++++++onPageShow1')
    this.myNodeController.operate()
    console.log('+++++++++++++++++onPageShow2')
  }

  build() {
    Column() {
      NodeContainer(this.myNodeController).height('50%')
      Column() {
        Text(`${this.frame1ChildCount}`).id('frame1ChildCount_id').height('3%')
        Text(`${this.frame2ChildCount}`).id('frame2ChildCount_id').height('3%')
        Text(`${this.frame3ChildCount}`).id('frame3ChildCount_id').height('3%')
        Text(`${this.getNodeParentId}`).id('getNodeParentId_id').height('3%')
      }
      Row() {
        Button('addFrame2').height('3%').id('addFrame2_id')
          .onClick((e:ClickEvent) => {
            console.log('++++++++++++++++++++1')
            this.myNodeController.addFrame2()
            console.log('++++++++++++++++++++2')
            this.frame1ChildCount = this.myNodeController.rootNode!.getFirstChild()!.getChildrenCount()

            console.log('++++++++++++++++++++3')
            if (this.myNodeController.rootNode!.getChild(1)) {
              console.log('sally' + this.myNodeController.rootNode!.getChild(1)!.getChildrenCount())
              this.frame2ChildCount = this.myNodeController.rootNode!.getChild(1)!.getChildrenCount()
              console.log('++++++++++++++++++++4')
            }
          })
        Button('frame1AddBlue').height('3%').id('frame1AddBlue_id')
          .onClick((e:ClickEvent) => {
            this.myNodeController.frame1AddBlue()
          })
      }

      Button('move').height('3%').id('move_id')
        .onClick((e:ClickEvent) => {
          this.myNodeController.move(this.moveFlag)
          this.moveFlag = !this.moveFlag
        })

      Row() {
        Button('addText').height('3%').id('addText_id')
          .onClick((e:ClickEvent) => {
            this.myNodeController.addText(this.getUIContext())
          })
        Button('moveText').height('3%').id('moveText_id')
          .onClick((e:ClickEvent) => {
            this.myNodeController.moveText()
          })
      }

      Button('child count').height('3%').id('count_id')
        .onClick((e:ClickEvent) => {
          this.frame1ChildCount = this.myNodeController.rootNode!.getFirstChild()!.getChildrenCount()
          this.frame2ChildCount = this.myNodeController.rootNode!.getChild(1)!.getChildrenCount()
          this.frame3ChildCount = this.myNodeController.rootNode!.getChildrenCount()  //取值为 "2"
          console.log('+++++++this.frame3ChildCount ',this.frame3ChildCount )
          this.getNodeParentId = this.getUIContext().getFrameNodeById('text_id')?.getParent()?.getId() + ''  //取值为 "undefined"
          console.log('+++++++this.getNodeParentId  ',this.getNodeParentId  )
        })
    }
    .height('100%')
    .width('100%')
  }
}