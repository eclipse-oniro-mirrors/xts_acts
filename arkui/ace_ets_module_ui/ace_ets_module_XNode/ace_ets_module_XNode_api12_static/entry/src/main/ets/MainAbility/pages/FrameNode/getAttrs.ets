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

import { FrameNode, NodeController } from "@ohos.arkui.node"
import { BusinessError } from '@ohos.base';
import {
  Entry,
  Column,
  Component,
  Flex,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  Text,
  Button,
  FontWeight,
  ButtonType,
  ClickEvent,
  Margin,
  Color,
  Builder,
  Row,
  NodeContainer,
  Padding,
  TextAlign
} from '@ohos.arkui.component'
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { UIContext } from '@ohos.arkui.UIContext';
const TEST_TAG : string = "FrameNode"

class MyNodeControllerGet extends NodeController {
  public frameNode: FrameNode | null = null;
  public childList:Array<FrameNode> = new Array<FrameNode>();
  private rootNode: FrameNode | null = null;
  private uiContext: UIContext | null = null;
  private childrenCount: number = 0;
  private name: string = "Init";

  makeNode(uiContext: UIContext): FrameNode | null {
    this.rootNode = new FrameNode(uiContext);
    this.childrenCount = this.childrenCount + 1;
    this.uiContext = uiContext;
    this.frameNode =  new FrameNode(uiContext);
    this.rootNode?.appendChild(this.frameNode!);
    for (let i = 0; i < 10; i++) {
      let childNode = new FrameNode(uiContext);
      this.childList?.push(childNode);
      this.frameNode?.appendChild(childNode);
    }
    return this.rootNode;
  }

  appendChild(){
    let childNode = new FrameNode(this.uiContext!);
    this.rootNode!.appendChild(childNode);
    this.childrenCount = this.childrenCount + 1;
  }

  insertChildAfter(index : number){
    let insertNode = new FrameNode(this.uiContext!);
    let childNode = this.rootNode!.getChild(index as int);
    this.rootNode!.insertChildAfter(insertNode,childNode);
    this.childrenCount = this.childrenCount + 1;
  }

  removeChild(index : number){
    let childNode = this.rootNode!.getChild(index as int);
    if(childNode == null)
    {
      console.log(`${TEST_TAG} getchild at index {${index}} : fail`);
      return;
    }
    this.rootNode!.removeChild(childNode);
    this.childrenCount = this.childrenCount - 1;
  }

  getChildNumber(){
    console.log(TEST_TAG + " getChildNumber " + this.rootNode!.getChildrenCount())
    console.log(TEST_TAG + " children count is " + this.childrenCount);
  }

  clearChildren(){
    this.rootNode!.clearChildren();
  }

  searchFrameNode(){
    if(this.rootNode!.getFirstChild() === null)
    {
      console.log(TEST_TAG + " the rootNode does not have child node.")
    }
    if(this.rootNode!.getFirstChild() === this.frameNode) {
      console.log(TEST_TAG + " getFirstChild  result: success. The first child of the rootNode is equals to frameNode.");
    } else {
      console.log(TEST_TAG + " getFirstChild  result: fail. The first child of the rootNode is not equals to frameNode.");
    }
    if(this.frameNode!.getChild(5) === this.frameNode!.getChild(4)!.getNextSibling()) {
      console.log(TEST_TAG + " getNextSibling  result: success.");
    } else {
      console.log(TEST_TAG + " getNextSibling  result: fail.");
    }
    if(this.frameNode!.getChild(3) === this.frameNode!.getChild(4)!.getPreviousSibling()) {
      console.log(TEST_TAG + " getPreviousSibling  result: success.");
    } else {
      console.log(TEST_TAG + " getPreviousSibling  result: fail.");
    }
    if(this.rootNode!.getFirstChild() !== null && this.rootNode!.getFirstChild()!.getParent() === this.rootNode) {
      console.log(TEST_TAG + " getParent  result: success.");
    } else {
      console.log(TEST_TAG + " getParent  result: fail.");
    }
    if(this.rootNode!.getParent() !== undefined || this.rootNode!.getParent() !== null)
    {
      console.log(TEST_TAG + " get ArkTsNode success.")
      console.log(TEST_TAG + " check rootNode whether is modifiable " + this.rootNode!.isModifiable())
      console.log(TEST_TAG + " check getParent whether is modifiable " + this.rootNode!.getParent()!.isModifiable())
    } else {
      console.log(TEST_TAG + " get ArkTsNode fail.");
    }
  }

  getPositionToWindow(){
    let positionToWindow = this.frameNode?.getPositionToWindow();
    console.log(TEST_TAG + JSON.stringify(positionToWindow));
    return "" + JSON.stringify(positionToWindow)
  }

  getPositionToParent(){
    let positionToParent = this.frameNode?.getPositionToParent();
    console.log(TEST_TAG + JSON.stringify(positionToParent));
    return "" + JSON.stringify(positionToParent)
  }

  getMeasuredSize(){
    let measuredSize = this.frameNode?.getMeasuredSize();
    console.log(TEST_TAG + JSON.stringify(measuredSize));
    return "" + JSON.stringify(measuredSize)
  }

  getLayoutPosition(){
    let layoutPosition = this.frameNode?.getLayoutPosition();
    console.log(TEST_TAG + JSON.stringify(layoutPosition));
    return "" + JSON.stringify(layoutPosition)
  }

  getUserConfigBorderWidth(){
    let userConfigBorderWidth = this.frameNode?.getUserConfigBorderWidth();//SDK12.11 获取的值和预期不符期望20 实际是0
    console.log(TEST_TAG + JSON.stringify(userConfigBorderWidth));
    return "" + JSON.stringify(userConfigBorderWidth)
  }

  getUserConfigPadding(){
    let userConfigPadding = this.frameNode?.getUserConfigPadding();
    console.log(TEST_TAG + JSON.stringify(userConfigPadding));
    return "" + JSON.stringify(userConfigPadding)
  }

  getUserConfigMargin(){
    let userConfigMargin = this.frameNode?.getUserConfigMargin();
    console.log(TEST_TAG + JSON.stringify(userConfigMargin));
    return "" + JSON.stringify(userConfigMargin)
  }

  getUserConfigSize(){
    let userConfigSize = this.frameNode?.getUserConfigSize();
    console.log(TEST_TAG + JSON.stringify(userConfigSize));
    return "" + JSON.stringify(userConfigSize)
  }

  getId(){
    let id = this.frameNode?.getId();
    console.log(TEST_TAG + id);
  }

  getUniqueId()
  {
    let uniqueId = this.frameNode?.getUniqueId();
    console.log(TEST_TAG + uniqueId);
  }

  getNodeType(){
    let nodeType = this.frameNode?.getNodeType();
    console.log(TEST_TAG + nodeType);
  }

  getOpacity(){
    let opacity = this.frameNode?.getOpacity();
    console.log(TEST_TAG + JSON.stringify(opacity));
  }

  isVisible(){
    let visible = this.frameNode?.isVisible();
    console.log(TEST_TAG + JSON.stringify(visible));
  }

  isClipToFrame(){
    let clipToFrame = this.frameNode?.isClipToFrame();
    console.log(TEST_TAG + JSON.stringify(clipToFrame));
  }

  isAttached(){
    let attached = this.frameNode?.isAttached();
    console.log(TEST_TAG + JSON.stringify(attached));
  }

  getInspectorInfo(){
    let inspectorInfo = this.frameNode?.getInspectorInfo();
    console.log(TEST_TAG + JSON.stringify(inspectorInfo));
  }

  getCustomProperty(){
    let customProperty = this.frameNode?.getCustomProperty("FrameNode_button");
    console.log(TEST_TAG + customProperty);
  }

  throwError(){
    try{
      this.rootNode!.getParent()!.clearChildren();
    } catch (err) {
      console.log(TEST_TAG + " " + (err as BusinessError).code + " : " +(err as BusinessError).message);
    }
    try{
      this.rootNode!.getParent()!.appendChild(new FrameNode(this.uiContext!));
    } catch (err) {
      console.log(TEST_TAG + " " + (err as BusinessError).code + " : " +(err as BusinessError).message);
    }
    try{
      this.rootNode!.getParent()!.removeChild(this.rootNode!.getParent()!.getChild(0)!);
    } catch (err) {
      console.log(TEST_TAG + " " + (err as BusinessError).code + " : " +(err as BusinessError).message);
    }
  }
}

@Entry
@Component
struct GetAttrsFrameNode {
  private myNodeController: MyNodeControllerGet = new MyNodeControllerGet();
  @State node: FrameNode | null = null;
  @State uiContext: UIContext = this.getUIContext()
  @State getData: string = "Init";

  onPageShow(){
    this.node = this.uiContext.getFrameNodeById("FrameNode_button")
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceBetween }) {
      Text(this.getData).id("FrameNode_Text").height('5%')
      Button("FrameNode_button").id("FrameNode_button").height('5%')
        .size({width: 300, height: 50})
        .padding(10)
        .margin(20)
        .borderWidth(3)

      Button("getPositionToWindow").id("getPositionToWindow").height('5%')
        .width(300)
        .onClick((e:ClickEvent)=>{
          if(this.uiContext && this.node){
            this.getData = "" + JSON.stringify(this.node?.getPositionToWindow())
          }
        })
      Button("getPositionToParent").id("getPositionToParent").height('5%')
        .width(300)
        .onClick((e:ClickEvent)=>{
          if(this.uiContext && this.node){
            this.getData = "" + JSON.stringify(this.node?.getPositionToParent())
            console.log('++++++++++++++',JSON.stringify(this.node?.getPositionToParent()))
          }
        })
      Button("getMeasuredSize").id("getMeasuredSize").height('5%')
        .width(300)
        .onClick((e:ClickEvent)=>{
          if(this.uiContext && this.node){
            this.getData = "" + JSON.stringify(this.node?.getMeasuredSize())
          }
        })
      Button("getLayoutPosition").id("getLayoutPosition").height('5%')
        .width(300)
        .onClick((e:ClickEvent)=>{
          if(this.uiContext && this.node){
            this.getData = "" + JSON.stringify(this.node?.getLayoutPosition())
          }
        })
      Button("getUserConfigBorderWidth").id("getUserConfigBorderWidth").height('5%')
        .width(300)
        .onClick((e:ClickEvent)=>{
          if(this.uiContext && this.node){
            this.getData = "" + JSON.stringify(this.node?.getUserConfigBorderWidth()) //取值不对
          }
        })
      Button("getUserConfigPadding").id("getUserConfigPadding").height('5%')
        .width(300)
        .onClick((e:ClickEvent)=>{
          if(this.uiContext && this.node){
            this.getData = "" + JSON.stringify(this.node?.getUserConfigPadding())
          }
        })
      Button("getUserConfigMargin").id("getUserConfigMargin").height('5%')
        .width(300)
        .onClick((e:ClickEvent)=>{
          if(this.uiContext && this.node){
            this.getData = "" + JSON.stringify(this.node?.getUserConfigMargin())
          }
        })
      Button("getUserConfigSize").id("getUserConfigSize").height('5%')
        .width(300)
        .onClick((e:ClickEvent)=>{
          if(this.uiContext && this.node){
            this.getData = "" + JSON.stringify(this.node?.getUserConfigSize())
          }
        })
      Button("getUniqueId").id("getUniqueId").height('5%')
        .width(300)
        .onClick((e:ClickEvent)=>{
          if(this.uiContext && this.node){
            this.getData = "" + JSON.stringify(this.node?.getUniqueId())
          }
        })
      Button("getCustomProperty").id("getCustomProperty").height('5%')
        .width(300)
        .onClick((e:ClickEvent)=>{
          if(this.uiContext && this.node){
            this.getData = "" + JSON.stringify(this.node?.getCustomProperty("FrameNode_button"))
          }
        })
      Button("getCommonAttribute").id("getCommonAttribute").height('5%')
        .width(300)
        .onClick((e:ClickEvent)=>{
          if(this.uiContext && this.node){
            this.getData = "" + JSON.stringify(this.node?.commonAttribute.padding(undefined))
          }
        })
      Button("getId").height('5%')
        .width(300)
        .onClick((e:ClickEvent)=>{
          this.myNodeController.getId();
        })
      Button("getNodeType").height('5%')
        .width(300)
        .onClick((e:ClickEvent)=>{
          this.myNodeController.getNodeType();
        })
      Button("getOpacity").height('5%')
        .width(300)
        .onClick((e:ClickEvent)=>{
          this.myNodeController.getOpacity();
        })
      Button("isVisible").height('5%')
        .width(300)
        .onClick((e:ClickEvent)=>{
          this.myNodeController.isVisible();
        })
      Button("isClipToFrame").height('5%')
        .width(300)
        .onClick((e:ClickEvent)=>{
          this.myNodeController.isClipToFrame();
        })
      Button("isAttached").height('5%')
        .width(300)
        .onClick((e:ClickEvent)=>{
          this.myNodeController.isAttached();
        })
      Button("getInspectorInfo").height('5%')
        .width(300)
        .onClick((e:ClickEvent)=>{
          this.myNodeController.getInspectorInfo();
        })
      Button("throwError").height('5%')
        .width(300)
        .onClick((e:ClickEvent)=>{
          this.myNodeController.throwError();
        })
      Column(){
        Text("This is a NodeContainer.").height('10%')
          .textAlign(TextAlign.Center).borderRadius(10).backgroundColor(0xFFFFFF)
          .width('100%').fontSize(16)
        NodeContainer(this.myNodeController)
          .borderWidth(1)
          .width(300)
          .height('50%')
      }.height('30%')
    }
    .padding({ left: 35, right: 35, top: 35, bottom: 35 } as Padding)
    .width("100%")
    .height("100%")
  }
}