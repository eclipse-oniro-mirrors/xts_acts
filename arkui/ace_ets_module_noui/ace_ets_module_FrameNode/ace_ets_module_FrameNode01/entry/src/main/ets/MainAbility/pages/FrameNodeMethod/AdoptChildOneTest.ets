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
import { FrameNode, NodeController, BuilderNode } from '@kit.ArkUI';
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

  makeNode(uiContext: UIContext): FrameNode | null {
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

  adoptChild100021() {
    try {
      this.builderNode?.getFrameNode()?.adoptChild(this.rootNode);
      console.info(`adoptChild 100021 success`);
    } catch (e) {
      AppStorage.SetOrCreate('AdoptChildErrorCode100021', (e as BusinessError).code);
      console.info(`adoptChild 100021 errorCode:` + (e as BusinessError).code);
    }
  }

  removeAdoptedChild100021() {
    try {
      this.builderNode?.getFrameNode()?.removeAdoptedChild(this.rootNode);
      console.info(`removeAdoptedChild 100021 success`);
    } catch (e) {
      AppStorage.SetOrCreate('RemoveAdoptedChildErrorCode100021', (e as BusinessError).code);
      console.info(`removeAdoptedChild 100021 errorCode:` + (e as BusinessError).code);
    }
  }
}

@Entry
@Component
struct AdoptChild100021 {
  private myNodeController: MyNodeController = new MyNodeController();
  @State errorStr100021: string = '';

  build() {
    Column({ space: 4 }) {
      NodeContainer(this.myNodeController)
        .borderWidth(1)
        .width('100%')
        .height('30%')
      Button('adoptChild 100021')
        .id('btn_adoptChild_100021')
        .width('100%')
        .height('10%')
        .onClick(() => {
          this.myNodeController.adoptChild100021();
        })
      Button('removeAdoptedChild 100021')
        .id('btn_removeAdoptedChild_100021')
        .width('100%')
        .height('10%')
        .onClick(() => {
          this.myNodeController.removeAdoptedChild100021();
        })
    }
  }
}