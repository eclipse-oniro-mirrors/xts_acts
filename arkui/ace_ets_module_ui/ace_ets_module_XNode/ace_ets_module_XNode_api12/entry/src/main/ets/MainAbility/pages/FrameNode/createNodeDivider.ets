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
import { typeNode, NodeController, FrameNode, ComponentContent } from '@ohos.arkui.node';

@Builder
function buildText() {
  Column() {
    Text('hello')
      .width(50)
      .height(50)
      .backgroundColor(Color.Yellow)
  }
}

class MyNodeController extends NodeController {

  public node: FrameNode | null = null;
  makeNode(uiContext: UIContext): FrameNode | null {
    this.node = new FrameNode(uiContext)
    this.node.commonAttribute.width(300).height(300).backgroundColor(Color.Red)
    let col = typeNode.createNode(uiContext, "Divider")
    col.attribute.strokeWidth(20)
    this.node.appendChild(col)
    return this.node
  }
  getNodeType()
  {
    let inspectorInfo = this.node?.getFirstChild()?.getNodeType();
    console.info("inspectorInfo " + JSON.stringify(inspectorInfo));
    return JSON.stringify(inspectorInfo)
  }
}

@Entry
@Component
struct createNodeDividerTest {
  private myNodeController: MyNodeController = new MyNodeController();
  @State node: FrameNode | null = null;
  @State uiContext: UIContext = this.getUIContext()
  @State type: string = "getNodeType"

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceBetween }) {
      Column(){
        Row() {
          NodeContainer(this.myNodeController);
        }.height('30%')
        Text(this.type).margin(30).id("createNodeDividerText").height('10%')
        Button("getInspectorInfo").id("createNodeDividerType").onClick(() => {
          this.type = this.myNodeController?.getNodeType()
        }).height('10%')
      }
      .height('100%')
    }

  }
}