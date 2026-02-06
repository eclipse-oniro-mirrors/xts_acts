/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { FrameNode, NodeController, BuilderNode } from '@kit.ArkUI';
import { NodeContent, typeNode } from '@ohos.arkui.node';
import { BusinessError } from '@kit.BasicServicesKit';

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
}

@Builder
function buildComponent() {
  TestComponent()
}

class MyNodeController extends NodeController {
  private rootNode: FrameNode | null = null;
  private builderNode: BuilderNode<[]> | null = null;
  public childrenCount: number = 0;
  private uiContext: UIContext | null = null;

  makeNode(uiContext: UIContext): FrameNode | null {
    this.uiContext = uiContext;
    this.rootNode = new FrameNode(uiContext);
    this.builderNode = new BuilderNode(uiContext, { selfIdealSize: { width: 200, height: 100 } });
    this.builderNode.build(new WrappedBuilder(buildComponent));

    const rootRenderNode = this.rootNode!.getRenderNode();
    if (rootRenderNode !== null) {
      rootRenderNode.size = { width: 200, height: 200 };
      rootRenderNode.backgroundColor = 0xff00ff00;
      rootRenderNode.appendChild(this.builderNode!.getFrameNode()!.getRenderNode());
    }
    return this.rootNode;
  }

  builderNodeAppendChild(): string {
    let errorStr: string = '';
    let textNode = typeNode.createNode(this.uiContext, 'Text')
    try {
      this.builderNode?.getFrameNode()?.moveTo(textNode, 0);
    } catch (e) {
      //100021:The FrameNode is not modifiable.
      errorStr = (e as BusinessError).code + ':' + (e as BusinessError).message;
    }
    return errorStr
  }
}

@Entry
@Component
struct FrameNodeMoveToErrorCodeTest {
  private myNodeController: MyNodeController = new MyNodeController();
  @State errorStr: string = '66666';

  build() {
    Column() {
      NodeContainer(this.myNodeController)
      Text(`${this.errorStr}`).id('error_str_id')
      Button('checkError in BuilderNode')
        .id('check_error_id')
        .onClick(() => {
          this.errorStr = this.myNodeController.builderNodeAppendChild();
        })
        .width('100%')
    }
  }
}