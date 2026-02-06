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
import { FrameNode, NodeController,ComponentContent, BuilderNode } from '@kit.ArkUI';
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
  private frameNode: FrameNode | null = null;

  makeNode(uiContext: UIContext): FrameNode | null {
    this.uiContext = uiContext;
    this.rootNode = new FrameNode(uiContext);
    this.builderNode = new BuilderNode(uiContext, { selfIdealSize: { width: 200, height: 100 } });
    this.builderNode.build(new WrappedBuilder(buildComponent));
    this.frameNode = new FrameNode(uiContext);


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
    try {
      this.builderNode?.getFrameNode()?.appendChild(this.frameNode);
    } catch (e) {
      errorStr = (e as BusinessError).code + ':' + (e as BusinessError).message;
    }
    return errorStr
  }

  builderNodeInsertChildAfter(): string {
    let errorStr: string = '';
    let sibling=this.builderNode?.getFrameNode()?.getChild(1)
    try {
      this.builderNode?.getFrameNode()?.insertChildAfter(this.frameNode,sibling);
    } catch (e) {
      errorStr = (e as BusinessError).code + ':' + (e as BusinessError).message;
    }
    return errorStr
  }

  builderNodeRemoveChild(): string {
    let errorStr: string = '';
    try {
      this.builderNode?.getFrameNode()?.removeChild(this.frameNode);
    } catch (e) {
      errorStr = (e as BusinessError).code + ':' + (e as BusinessError).message;
    }
    return errorStr
  }

  builderNodeClearChildren(): string {
    let errorStr: string = '';
    try {
      this.builderNode?.getFrameNode()?.clearChildren();
    } catch (e) {
      errorStr = (e as BusinessError).code + ':' + (e as BusinessError).message;
    }
    return errorStr
  }
}

@Entry
@Component
struct AddComponentContentTest {
  private myNodeController: MyNodeController = new MyNodeController();
  @State errorStr1: string = '55555';
  @State errorStr2: string = '55555';
  @State errorStr3: string = '55555';
  @State errorStr4: string = '55555';

  build() {
    Column() {
      NodeContainer(this.myNodeController).height('30%')
      Text(`${this.errorStr1}`).id('error_str_appendChild').height('5%')
      Text(`${this.errorStr2}`).id('error_str_insertChildAfter').height('5%')
      Text(`${this.errorStr3}`).id('error_str_removeChild').height('5%')
      Text(`${this.errorStr4}`).id('error_str_clearChildren').height('5%')
      Button('checkError in appendChild').height('5%')
        .id('check_error_appendChild')
        .onClick(() => {
          this.errorStr1 = this.myNodeController.builderNodeAppendChild();
        })
        .width('100%')
      Button('checkError in insertChildAfter').height('5%')
        .id('check_error_insertChildAfter')
        .onClick(() => {
          this.errorStr2 = this.myNodeController.builderNodeInsertChildAfter();
        })
        .width('100%')
      Button('checkError in removeChild').height('5%')
        .id('check_error_removeChild')
        .onClick(() => {
          this.errorStr3 = this.myNodeController.builderNodeRemoveChild();
        })
        .width('100%')
      Button('checkError in clearChildren').height('5%')
        .id('check_error_clearChildren')
        .onClick(() => {
          this.errorStr4 = this.myNodeController.builderNodeClearChildren();
        })
        .width('100%')
    }
    .height('100%')
  }
}