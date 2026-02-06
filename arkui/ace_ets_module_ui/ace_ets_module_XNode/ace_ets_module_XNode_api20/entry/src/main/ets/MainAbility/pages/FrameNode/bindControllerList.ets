/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { typeNode, FrameNode, NodeController, BuilderNode } from '@ohos.arkui.node';
import { BusinessError } from '@kit.BasicServicesKit';

@Component
struct TestComponent {
  build() {
    List() {
      ListItem(){
        Text('List')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
      }
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

  bindControllerList10023(): string {
    let errorList100023: string = '';
    let textNode = typeNode.createNode(this.uiContext, 'ListItem');
    try {
      typeNode.bindController(textNode, this.scroller, 'List');
    } catch (e) {
      errorList100023 =  'Error: ' + (e as BusinessError).code;
    }
    return errorList100023
  }

  bindControllerList100021(): string {
    let errorList100021: string = '';
    try {
      typeNode.bindController(this.builderNode?.getFrameNode()?.getFirstChild(), this.scroller, 'List');
    } catch (e) {
      errorList100021 = (e as BusinessError).code + ':' + (e as BusinessError).message;
    }
    return errorList100021
  }
}

@Entry
@Component
struct BindControllerListTest {
  private myNodeController: MyNodeController = new MyNodeController();
  @State errorList100023: string = 'List';
  @State errorList100021: string = 'List';

  build() {
    Column({ space: 5 }) {
      NodeContainer(this.myNodeController)
      Text(`${this.errorList100023}`).id('error_list_100023')
      Text(`${this.errorList100021}`).id('error_list_100021')
      Button('List checkError 100023')
        .id('list_btn_100023')
        .onClick(() => {
          this.errorList100023 = this.myNodeController.bindControllerList10023();
        })
      Button('List checkError 100021')
        .id('list_btn_100021')
        .onClick(() => {
          this.errorList100021 = this.myNodeController.bindControllerList100021();
        })
    }
    .width('90%')
  }
}