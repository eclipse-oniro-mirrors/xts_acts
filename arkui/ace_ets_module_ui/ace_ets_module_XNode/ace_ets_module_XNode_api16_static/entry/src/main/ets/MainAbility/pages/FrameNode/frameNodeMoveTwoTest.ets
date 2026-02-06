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
import { ColorMetrics } from '@kit.ArkUI';
import { BusinessError } from '@ohos.base';
import { ComponentContent } from '@kit.ArkUI';
import { BuilderNode, FrameNode, NodeController,typeNode } from '@ohos.arkui.node'
import { Entry, Column, Component,Builder,Text,ColumnOptions,Margin,Button,NodeContainer,
  Visibility,wrapBuilder,FontWeight,Color,WrappedBuilder,Scroll,Scroller,ColumnOptions,
  HorizontalAlign,ColumnOptions,Stack,Row,Position,RowOptions,CustomPopupOptions,
  PopupStateChangeParam,Placement

} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import { ClickEvent } from '@ohos.arkui.component';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

class MyNodeController extends NodeController {
  public uiContext: UIContext | null = null
  public rootNode: FrameNode | null = null
  public stackNode: FrameNode | null = null
  public columnNode: FrameNode | null = null
  public button: FrameNode | null = null
  public buttonText: string = ''

  constructor(buttonText:string) {
    super()
    this.buttonText = buttonText
  }

  makeNode(uiContext: UIContext): FrameNode | null {
    this.uiContext = uiContext
    this.rootNode = new FrameNode(uiContext)

    const stack = typeNode.createStackNode(this.uiContext!)
    const column = typeNode.createColumnNode(this.uiContext!)
    const button = typeNode.createButtonNode(this.uiContext!)
    stack.attribute.id('Stack')
    stack.attribute.backgroundColor(Color.Green)
    button.attribute.width(200)
    button.attribute.height(100)
    button.initialize(this.buttonText)
    column.attribute.id('Column')
    this.stackNode = stack
    this.columnNode = column
    this.button = button
    this.rootNode!.appendChild(this.stackNode!)
    this.rootNode!.appendChild(this.columnNode!)
    this.stackNode!.appendChild(this.button!)

    return this.rootNode
  }
}

class MyNodeController2 extends NodeController {
  public uiContext: UIContext | null = null
  public rootNode: FrameNode | null = null
  public stackNode: FrameNode | null = null
  public columnNode: FrameNode | null = null

  makeNode(uiContext: UIContext): FrameNode | null {
    this.uiContext = uiContext
    this.rootNode = new FrameNode(uiContext)

    const column = typeNode.createColumnNode(this.uiContext!)
    this.columnNode = column
    this.rootNode!.appendChild(this.columnNode!)

    return this.rootNode
  }
}

@Entry
@Component
struct frameNodeMoveTwo {
  @State customPopup: boolean = false
  @State frame1ChildCount: number = -1
  @State frame2ChildCount: number = -1
  @State frame3ChildCount: number = -1
  private myNodeController3: MyNodeController2 = new MyNodeController2()

  @Builder
  popupBuilder() {
    Row({ space: 2 } as RowOptions) {
      NodeContainer(this.myNodeController3)

      Column() {
        Text('Custom Popup').fontSize(10)
      }
    }.width('100%').height(100).padding(5).id('popup_id')
    .onClick((e:ClickEvent) => {
      console.log('++++++++++++++++++')
      const uiContext: UIContext = this.getUIContext();
      // console.log('kkk2' + JSON.stringify(uiContext)); //appDied
      const node2: FrameNode | null = uiContext.getFrameNodeById('Stack') || null
      if (node2){
        console.log('kkk2 getNode2 successfully');
      }
      if (this.myNodeController3.columnNode) {
        console.log('kkk2 myNodeController3.ColumnNode');
      }
      node2?.moveTo(this.myNodeController3.columnNode!, 0)

      this.frame1ChildCount = this.myNodeController1.rootNode!.getFirstChild()!.getChildrenCount();
      this.frame2ChildCount = this.myNodeController2.rootNode!.getFirstChild()!.getChildrenCount();
      this.frame3ChildCount = this.myNodeController3.rootNode!.getFirstChild()!.getChildrenCount();

    })
  }

  private myNodeController1: MyNodeController = new MyNodeController('button1')
  private myNodeController2: MyNodeController = new MyNodeController('button2')

  move() {
    this.myNodeController1.stackNode?.moveTo(this.myNodeController2.columnNode!, 1)
  }

  build() {
    Column() {
      NodeContainer(this.myNodeController1).height('20%')
      NodeContainer(this.myNodeController2).height('20%')

      Column() {
        Text(`${this.frame1ChildCount}`).height('5%').id('frame1ChildCount')
        Text(`${this.frame2ChildCount}`).height('5%').id('frame2ChildCount')
        Text(`${this.frame3ChildCount}`).height('5%').id('frame3ChildCount')
      }

      Button('CustomPopupOptions').height('10%').id('customPopupOptions_id')
        .onClick((e:ClickEvent) => {
          console.log('+++++++++++1')
          const uiContext: UIContext = this.getUIContext();
          console.log('+++++++++++2')
          // console.log('kkk' + JSON.stringify(uiContext));  //appDied
          const node1: FrameNode | null = uiContext.getFrameNodeById('Column') || null
          const node2: FrameNode | null = uiContext.getFrameNodeById('Stack') || null
          if (node1 ){
            console.log('kkk node1 exit');
          }
          if (node2 ){
            console.log('kkk node2 exit');
          }
          if (node1 && node2) {
            console.log('kkk CustomPopupOptions move start');
          }
          this.customPopup = !this.customPopup
        })
        .bindPopup(this.customPopup, {
          builder: this.popupBuilder,
          placement: Placement.Bottom,
          mask: { color: '#33000000' },
          popupColor: Color.Yellow,
          enableArrow: true,
          showInSubWindow: true,
          focusable: true,
          onStateChange: (e: PopupStateChangeParam) => {
            if (!e.isVisible) {
              this.customPopup = false
            }
          }
        } as CustomPopupOptions)
    }
    .height('100%')
    .width('100%')
  }
}