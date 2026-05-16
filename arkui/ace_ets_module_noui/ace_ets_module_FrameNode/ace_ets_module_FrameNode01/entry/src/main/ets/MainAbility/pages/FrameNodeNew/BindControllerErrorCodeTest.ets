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
import { typeNode } from '@ohos.arkui.node';
import { BusinessError } from '@kit.BasicServicesKit';

@Component
struct TestComponent {
  build() {
    Scroll() {
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
  private scroller: Scroller = new Scroller();

  makeNode(uiContext: UIContext): FrameNode | null {
    this.uiContext = uiContext;
    this.rootNode = new FrameNode(uiContext);
    this.builderNode = new BuilderNode(uiContext, { selfIdealSize: { width: 200, height: 50 } });
    this.builderNode.build(new WrappedBuilder(buildComponent));

    const rootRenderNode = this.rootNode!.getRenderNode();
    if (rootRenderNode !== null) {
      rootRenderNode.size = { width: 200, height: 50 };
      rootRenderNode.backgroundColor = 0xff00ff00;
      rootRenderNode.appendChild(this.builderNode!.getFrameNode()!.getRenderNode());
    }
    return this.rootNode;
  }

  builderNodeBindController401(): string {
    let errorStr401: string = '';
    let textNode = typeNode.createNode(this.uiContext, 'Text');
    try {
      typeNode.bindController(textNode, this.scroller, 'Scroll');
    } catch (e) {
      errorStr401 = (e as BusinessError).code + '';
    }
    return errorStr401
  }

  builderNodeBindController100021(): string {
    let errorStr100021: string = '';
    try {
      typeNode.bindController(this.builderNode?.getFrameNode()?.getFirstChild(), this.scroller, 'Scroll');
    } catch (e) {
      errorStr100021 = (e as BusinessError).code + ':' + (e as BusinessError).message;
    }
    return errorStr100021
  }
}

@Entry
@Component
struct BindControllerTest {
  private myNodeController: MyNodeController = new MyNodeController();
  @State errorStr401: string = '';
  @State errorStr100021: string = '';

  build() {
    Column({ space: 4 }) {
      NodeContainer(this.myNodeController)
      Text(`${this.errorStr401}`).id('error_str401_id')
      Text(`${this.errorStr100021}`).id('error_str100021_id')
      Button('BindController checkError 401')
        .id('error_bnt401_id')
        .width('100%')
        .onClick(() => {
          this.errorStr401 = this.myNodeController.builderNodeBindController401();
        })
      Button('BindController checkError 100021')
        .id('error_bnt100021_id')
        .width('100%')
        .onClick(() => {
          this.errorStr100021 = this.myNodeController.builderNodeBindController100021();
        })
    }
  }
}