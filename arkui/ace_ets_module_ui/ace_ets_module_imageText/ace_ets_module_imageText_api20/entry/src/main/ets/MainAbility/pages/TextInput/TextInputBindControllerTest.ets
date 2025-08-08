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
  private textInputController: TextInputController = new TextInputController();

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

  builderNodeBindControllerSuccess(): string {
    let successStr: string = 'true';
    let textInputNode = typeNode.createNode(this.uiContext, 'TextInput');
    try {
      typeNode.bindController(textInputNode, this.textInputController, 'TextInput');
    } catch (e) {
      successStr = 'false'
    }
    return successStr
  }

  builderNodeBindController100023(): string {
    let errorStr100023: string = '';
    let scrollNode = typeNode.createNode(this.uiContext, 'Scroll');
    try {
      typeNode.bindController(scrollNode, this.textInputController, 'TextInput');
    } catch (e) {
      errorStr100023 = (e as BusinessError).code + '';
    }
    return errorStr100023
  }
}

@Entry
@Component
struct TextInputBindControllerTest {
  private myNodeController: MyNodeController = new MyNodeController();

  build() {
    Column({ space: 4 }) {
      NodeContainer(this.myNodeController)
      Button('BindController checkError 100023')
        .id('TextInput_error_bnt100023_id')
        .height('10%')
        .width('100%')
        .onClick(() => {
          console.log('TextInputErrorStr100023:'+this.myNodeController.builderNodeBindController100023())
          AppStorage.SetOrCreate('TextInputErrorStr100023',this.myNodeController.builderNodeBindController100023())
        })
      Button('BindController SuccessStr')
        .id('TextInput_successStr_bnt_id')
        .height('10%')
        .width('100%')
        .onClick(() => {
          console.log('TextInputSuccessStr:'+this.myNodeController.builderNodeBindControllerSuccess())
          AppStorage.SetOrCreate('TextInputSuccessStr',this.myNodeController.builderNodeBindControllerSuccess())
        })
    }
  }
}