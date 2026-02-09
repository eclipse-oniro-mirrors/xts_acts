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
import common from "@ohos.app.ability.common";
import { FrameNode, NodeController } from "@ohos.arkui.node"
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
  TextAlign
} from '@ohos.arkui.component'
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { UIContext } from '@ohos.arkui.UIContext';
import { BusinessError } from '@ohos.base';
import window from '@ohos.window';

const TEST_TAG : string = "FrameNode"
class MyNodeController extends NodeController {
  public frameNode: FrameNode | null = null;
  public childList:Array<FrameNode> = new Array<FrameNode>();
  private rootNode: FrameNode | null = null;
  private uiContext: UIContext | null = null;
  private childrenCount: number = 0;
  private state: string = '';

  makeNode(uiContext: UIContext): FrameNode | null {
    this.rootNode = new FrameNode(uiContext);
    this.childrenCount = this.childrenCount + 1;
    this.uiContext = uiContext;
    this.frameNode =  new FrameNode(uiContext);
    this.rootNode?.appendChild(this.frameNode!);
    for (let i = 0; i < 10; i++) {
      let childNode = new FrameNode(uiContext);
      this.childList.push(childNode);
      this.frameNode?.appendChild(childNode);
    }
    return this.rootNode;
  }
  appendChild()
  {
    let childNode = new FrameNode(this.uiContext!);
    this.rootNode!.appendChild(childNode);
    this.childrenCount = this.childrenCount + 1;
  }
  insertChildAfter(index : number)
  {
    let insertNode = new FrameNode(this.uiContext!);
    let childNode = this.rootNode!.getChild(index as int);
    this.rootNode!.insertChildAfter(insertNode,childNode);
    this.childrenCount = this.childrenCount + 1;
  }
  removeChild(index : number)
  {
    let childNode = this.rootNode!.getChild(index as int);
    if(childNode == null)
    {
      console.log(`${TEST_TAG} getchild at index {${index}} : fail`);
      return;
    }
    this.rootNode!.removeChild(childNode);
    this.childrenCount = this.childrenCount - 1;
  }
  getChildNumber()
  {
    console.log(TEST_TAG + " getChildNumber " + this.rootNode!.getChildrenCount())
    console.log(TEST_TAG + " children count is " + this.childrenCount);

  }
  clearChildren()
  {
    this.rootNode!.clearChildren();
  }
  searchFrameNode()
  {
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

  getPositionToScreen()
  {
    let positionToScreen = this.frameNode?.getPositionToScreen();
    console.log(TEST_TAG + " getPositionToScreen " + JSON.stringify(positionToScreen));
  }
  getPositionToWindowWithTransform()
  {
    let positionToWindowWithTransform = this.frameNode?.getPositionToWindowWithTransform();
    console.log(TEST_TAG + " getPositionToWindowWithTransform " + JSON.stringify(positionToWindowWithTransform));
  }
  getPositionToParentWithTransform()
  {
    let positionToParentWithTransform = this.frameNode?.getPositionToParentWithTransform();
    console.log(TEST_TAG  + " getPositionToParentWithTransform " + JSON.stringify(positionToParentWithTransform));
  }
  getPositionToScreenWithTransform()
  {
    let positionToScreenWithTransform = this.frameNode?.getPositionToScreenWithTransform();
    console.log(TEST_TAG  + " getPositionToScreenWithTransform " + JSON.stringify(positionToScreenWithTransform));
  }

  throwError()
  {
    try{
      this.rootNode!.getParent()!.clearChildren();
    } catch (err) {
      console.log(TEST_TAG + " " + (err as BusinessError).code + " : " +(err as BusinessError).message);
    }
    try{
      this.rootNode!.getParent()!.appendChild(new FrameNode(this.uiContext!)!);
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
struct getPositionExample {
  private myNodeController: MyNodeController = new MyNodeController();
  @State index : number = 0;
  @State getPositionToScreen : string | undefined = 'getPositionToScreen';
  @State getPositionToParentWithTransform : string | undefined = 'getPositionToParentWithTransform';
  @State getPositionToWindowWithTransform : string | undefined = 'getPositionToWindowWithTransform';
  @State getPositionToScreenWithTransform : string | undefined = 'getPositionToScreenWithTransform';
  @State windowLeftVP : string = 'hello';

  build() {
    Column(){
      NodeContainer(this.myNodeController)
        .backgroundColor(Color.Orange)
        .width("100%")
        .height('30%')

      Button("getPositionToScreen").height('5%')
        .id("getPositionToScreen")
        .width(300)
        .onClick((e:ClickEvent)=>{
          this.myNodeController.getPositionToScreen();
          this.getPositionToScreen = this.myNodeController.frameNode?.getPositionToScreen().x.toString().split('.')[0];
        })
      Button("getPositionToParentWithTransform").height('5%')
        .id("getPositionToParentWithTransform")
        .width(300)
        .onClick((e:ClickEvent)=>{
          this.myNodeController.getPositionToParentWithTransform();
          this.getPositionToParentWithTransform = this.myNodeController.frameNode?.getPositionToParentWithTransform().x.toString()
        })
      Button("getPositionToWindowWithTransform").height('5%')
        .id("getPositionToWindowWithTransform")
        .width(300)
        .onClick((e:ClickEvent)=>{
          this.myNodeController.getPositionToWindowWithTransform();
          this.getPositionToWindowWithTransform = this.myNodeController.frameNode?.getPositionToWindowWithTransform().x.toString()
        })
      Button("getPositionToScreenWithTransform").height('5%')
        .id("getPositionToScreenWithTransform")
        .width(300)
        .onClick((e:ClickEvent)=>{
          this.myNodeController.getPositionToScreenWithTransform();
          this.getPositionToScreenWithTransform = this.myNodeController.frameNode?.getPositionToScreenWithTransform().x.toString().split('.')[0];
        })

      Button('getWindowLeftVP').key('getWindowLeftVP').height('5%')
        .id('getWindowLeftVP')
        .width(300)
        .onClick((e:ClickEvent)=>{
          let uiContext:UIContext = this.getUIContext();
          let  promise = window.getLastWindow(AppStorage.get<common.UIAbilityContext>('abilityContext')!);
          promise.then((mainWindow:window.Window) => {
            let windowRect:window.Rect = mainWindow.getWindowProperties().windowRect;
            this.windowLeftVP = uiContext.px2vp(windowRect.left).toString().split('.')[0];
          })
        })


      Text(this.getPositionToScreen).height('5%')
        .id("getPositionToScreenValue")
        .textAlign(TextAlign.Center).borderRadius(10).backgroundColor(0xFFFFFF)
        .width('100%').fontSize(16)

      Text(this.getPositionToParentWithTransform).height('5%')
        .id("getPositionToParentWithTransformValue")
        .textAlign(TextAlign.Center).borderRadius(10).backgroundColor(0xFFFFFF)
        .width('100%').fontSize(16)

      Text(this.getPositionToWindowWithTransform).height('5%')
        .id("getPositionToWindowWithTransformValue")
        .textAlign(TextAlign.Center).borderRadius(10).backgroundColor(0xFFFFFF)
        .width('100%').fontSize(16)

      Text(this.getPositionToScreenWithTransform).height('5%')
        .id("getPositionToScreenWithTransformValue")
        .textAlign(TextAlign.Center).borderRadius(10).backgroundColor(0xFFFFFF)
        .width('100%').fontSize(16)

      Text(this.windowLeftVP).height('5%')
        .id("getWindowLeftVPValue")
        .textAlign(TextAlign.Center).borderRadius(10).backgroundColor(0xFFFFFF)
        .width('100%').fontSize(16)
    }
    .height('100%')

  }
}