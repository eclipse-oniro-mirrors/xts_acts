
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
 
import { FrameNode, NodeController ,BuilderNode} from "@ohos.arkui.node"
import { BusinessError } from '@ohos.base';
const TEST_TAG : string = "FrameNode"


@Component
struct TestComponent {
  build() {
    Column() {
      Text('This is a BuilderNode.')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
    }
    .width('100%')
    .backgroundColor(Color.Gray)
  }

  aboutToAppear() {
    console.error('aboutToAppear');
  }

  aboutToDisappear() {
    console.error('aboutToDisappear');
  }
}
@Builder
function buildComponent() {
  TestComponent()
}

class MyNodeController extends NodeController {
  public frameNode: FrameNode | null = null;
  public childList:Array<FrameNode> = new Array<FrameNode>();
  private rootNode: FrameNode | null = null;
  private uiContext: UIContext | null = null;
  private childrenCount: number = 0;
  private builderNode: BuilderNode<[]> | null = null;
  makeNode(uiContext: UIContext): FrameNode | null {
    this.rootNode = new FrameNode(uiContext);
    this.childrenCount = this.childrenCount + 1;
    this.uiContext = uiContext;
    this.frameNode =  new FrameNode(uiContext);

    this.rootNode.appendChild(this.frameNode);
    for (let i = 0; i < 10; i++) {
      const rootRenderNode = this.rootNode.getRenderNode();
      let childNode = new FrameNode(uiContext);
      this.builderNode = new BuilderNode(uiContext, { selfIdealSize: { width: 200, height: 100 } });
      this.builderNode.build(new WrappedBuilder(buildComponent));

      this.childList.push(childNode);
      rootRenderNode!.appendChild(this.builderNode!.getFrameNode()!.getRenderNode());
    }
    return this.rootNode;
  }
  appendChild()
  {
    let cNode = new FrameNode(this.uiContext!);

    const rootRenderNode = cNode.getRenderNode();
    this.builderNode = new BuilderNode(this.uiContext!, { selfIdealSize: { width: 200, height: 100 } });
    this.builderNode.build(new WrappedBuilder(buildComponent));
    rootRenderNode!.appendChild(this.builderNode!.getFrameNode()!.getRenderNode());
    this.childrenCount = this.childrenCount + 1;
  }
  insertChildAfter(index : number)
  {
    let insertNode = new FrameNode(this.uiContext!);
    let childNode = this.rootNode!.getChild(index);
    this.rootNode!.insertChildAfter(insertNode,childNode);
    this.childrenCount = this.childrenCount + 1;
  }
  removeChild(index : number)
  {
    let childNode = this.rootNode!.getChild(index);
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
  getPositionToWindow()
  {
    let positionToWindow = this.frameNode?.getPositionToWindow();
    console.log(TEST_TAG + JSON.stringify(positionToWindow));
  }
  getPositionToParent()
  {
    let positionToParent = this.frameNode?.getPositionToWindow();
    console.log(TEST_TAG + JSON.stringify(positionToParent));
  }
  getMeasuredSize()
  {
    let measuredSize = this.frameNode?.getMeasuredSize();
    console.log(TEST_TAG + JSON.stringify(measuredSize));
  }
  getLayoutPosition()
  {
    let layoutPosition = this.frameNode?.getLayoutPosition();
    console.log(TEST_TAG + JSON.stringify(layoutPosition));
  }
  getUserConfigBorderWidth()
  {
    let userConfigBorderWidth = this.frameNode?.getUserConfigBorderWidth();
    console.log(TEST_TAG + JSON.stringify(userConfigBorderWidth));
  }
  getUserConfigPadding()
  {
    let userConfigPadding = this.frameNode?.getUserConfigPadding();
    console.log(TEST_TAG + JSON.stringify(userConfigPadding));
  }
  getUserConfigMargin()
  {
    let userConfigMargin = this.frameNode?.getUserConfigMargin();
    console.log(TEST_TAG + JSON.stringify(userConfigMargin));
  }
  getUserConfigSize()
  {
    let userConfigSize = this.frameNode?.getUserConfigSize();
    console.log(TEST_TAG + JSON.stringify(userConfigSize));
  }
  getId()
  {
    let id = this.frameNode?.getId();
    console.log(TEST_TAG + id);
  }
  getNodeType()
  {
    let nodeType = this.frameNode?.getNodeType();
    console.log(TEST_TAG + nodeType);
    return nodeType;

  }
  getOpacity()
  {
    let opacity = this.frameNode?.getOpacity();
    console.log(TEST_TAG + JSON.stringify(opacity));
    return opacity
  }
  isVisible()
  {
    let visible = this.frameNode?.isVisible();
    console.log(TEST_TAG + JSON.stringify(visible));
    return visible
  }
  isClipToFrame()
  {
    let clipToFrame = this.frameNode?.isClipToFrame();
    console.log(TEST_TAG + JSON.stringify(clipToFrame));
    return clipToFrame;
  }
  isAttached()
  {
    let attached = this.frameNode?.isAttached();
    console.log(TEST_TAG + JSON.stringify(attached));
    return attached
  }
  getInspectorInfo()
  {
    let inspectorInfo = this.frameNode?.getInspectorInfo();

    console.log(TEST_TAG + JSON.stringify(inspectorInfo));
    return inspectorInfo;
  }

  throwError()
  {
    try{
      this.rootNode!.getParent()!.clearChildren();
    } catch (err) {
      console.log(TEST_TAG + " " + (err as BusinessError).code + " : " +(err as BusinessError).message);
    }
    try{
      this.rootNode!.getParent()!.appendChild(new FrameNode(this.uiContext));
    } catch (err) {
      console.log(TEST_TAG + " " + (err as BusinessError).code + " : " +(err as BusinessError).message);
    }
    try{
      this.rootNode!.getParent()!.removeChild(this.rootNode!.getParent()!.getChild(0));
    } catch (err) {
      console.log(TEST_TAG + " " + (err as BusinessError).code + " : " +(err as BusinessError).message);
    }
  }
}

@Entry
@Component
struct FrameNodeTest {
  private myNodeController: MyNodeController = new MyNodeController();
  @State index : number = 0;

  @State textS: string = "";

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceBetween }) {
      Column(){
        Text("result " + this.textS)
          .textAlign(TextAlign.Center).borderRadius(10).backgroundColor(0xFFFFFF).key("resultKey")
          .width('100%').fontSize(16)
        Row()
        {
          Button("ADD")
            .onClick(()=>{this.index++;})
          Button("DEC")
            .onClick(()=>{this.index--;})
        }
        Text("Current index is " + this.index)
          .textAlign(TextAlign.Center).borderRadius(10).backgroundColor(0xFFFFFF)
          .width('100%').fontSize(16)
      }
      Button("appendChild")
        .width(300)
        .onClick(()=>{
          this.myNodeController.appendChild();
        })
      Button("insertChildAfter")
        .width(300)
        .onClick(()=>{
          this.myNodeController.insertChildAfter(this.index);
        })
      Button("removeChild")
        .width(300)
        .onClick(()=>{
          this.myNodeController.removeChild(this.index);
        })
      Button("clearChildren")
        .width(300)
        .onClick(()=>{
          this.myNodeController.clearChildren();
        })
      Button("getChildNumber")
        .width(300)
        .onClick(()=>{
          this.myNodeController.getChildNumber();
        })
      Button("searchFrameNode")
        .width(300)
        .onClick(()=>{
          this.myNodeController.searchFrameNode();
        })

      Button("getNodeType")
        .width(300)
        .onClick(()=>{
          let result = this.myNodeController.getNodeType();
          this.textS = result + ""
        }).margin(5).key("getNodeTypeKey");

      Button("getOpacity")
        .width(300)
        .onClick(()=>{
           let result = this.myNodeController.getOpacity();
           this.textS =  JSON.stringify(result);
        }).key("getOpacityKey")
      Button("isVisible")
        .width(300)
        .onClick(()=>{
            let result = this.myNodeController.isVisible();
            this.textS = JSON.stringify(result)
        }).key("isVisibleKey")
      Button("isClipToFrame")
        .width(300)
        .onClick(()=>{
          let result = this.myNodeController.isClipToFrame();
           this.textS = JSON.stringify(result);
        }).key("isCliptoFrameKey")
      Button("isAttached")
        .width(300)
        .onClick(()=>{
             let result = this.myNodeController.isAttached();
             this.textS =  JSON.stringify(result);
        }).key("isAttachedKey")
      Button("getInspectorInfo")
        .width(300)
        .onClick(()=>{
          let result = this.myNodeController.getInspectorInfo();
          this.textS = JSON.stringify(result);
        }).key("getInspectorInfoKey")
      Button("throwError")
        .width(300)
        .onClick(()=>{
          this.myNodeController.throwError();
        })
      Column(){
        Text("This is a NodeContainer.")
          .textAlign(TextAlign.Center).borderRadius(10).backgroundColor(0xFFFFFF)
          .width('100%').fontSize(16)
        NodeContainer(this.myNodeController)
          .borderWidth(1)
          .width(300)
          .height(100)
      }
    }
    .padding({ left: 35, right: 35, top: 35, bottom: 35 })
    .width("100%")
    .height("100%")
  }
}