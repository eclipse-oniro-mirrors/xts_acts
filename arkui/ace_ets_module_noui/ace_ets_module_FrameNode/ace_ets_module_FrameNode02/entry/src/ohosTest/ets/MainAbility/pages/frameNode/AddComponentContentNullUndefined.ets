/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { NodeController, FrameNode, ComponentContent, typeNode } from '@kit.ArkUI';

@Builder
function buildText() {
  Column() {
    Text('hello')
      .width(50)
      .height(50)
      .backgroundColor(Color.Yellow)
  }
}

// 继承NodeController实现自定义UI控制器
class MyNodeController extends NodeController {
  private rootNode: FrameNode | null = null;
  public rowNode: FrameNode | null = null;

  makeNode(uiContext: UIContext): FrameNode | null {
    this.rootNode = new FrameNode(uiContext)
    this.rootNode.commonAttribute.width(200).height(200).backgroundColor(Color.Red)
    
    this.rowNode = typeNode.createNode(uiContext, 'Row')
    this.rowNode.commonAttribute.width(100)
      .height(100)
      .backgroundColor(Color.Green)
    // 创建组件内容
    let component = new ComponentContent<Object>(uiContext, wrapBuilder(buildText))
    let component2 = new ComponentContent<Object>(uiContext, wrapBuilder(buildText))
    if (this.rowNode.isModifiable()) {
      // 添加新创建的builderText至rowNode中
      this.rowNode.addComponentContent(component)
      this.rowNode.addComponentContent(component2)
      this.rowNode.addComponentContent(null)
      this.rowNode.addComponentContent(undefined)
    }
    this.rootNode.appendChild(this.rowNode)
    
    return this.rootNode
  }

  // 打印节点计数
  getChildNumber() {
    return this.rowNode!.getChildrenCount();
  }
}

@Entry
@Component
struct AddComponentContentNullUndefinedTest {
  private myNodeController: MyNodeController = new MyNodeController();
  @State count: number = -1;

  build() {
    Column() {
      NodeContainer(this.myNodeController);
      Row() {
        Button('getChildNumber').key('AddComponentContentNullUndefinedTest_getChildNumber')
          .onClick(() => {
            this.count = this.myNodeController.getChildNumber();
          })
        Text(this.count.toString()).key('AddComponentContentNullUndefinedTest_text')
      }
    }
  }
}