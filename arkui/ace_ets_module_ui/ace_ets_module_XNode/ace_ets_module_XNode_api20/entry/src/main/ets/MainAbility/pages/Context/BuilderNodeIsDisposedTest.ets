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

@Component
struct TestComponent {
  build() {
    Column() {
      Text('This is a BuilderNode.')
        .fontSize(25)
        .fontWeight(FontWeight.Bold)
    }
    .width('100%')
    .height(30)
    .backgroundColor(Color.Gray)
  }

  aboutToAppear() {
    console.info('aboutToAppear');
  }

  aboutToDisappear() {
    console.info('aboutToDisappear');
  }
}

@Builder
function buildComponent() {
  TestComponent()
}

class MyNodeController extends NodeController {
  private rootNode: FrameNode | null = null;
  private builderNode: BuilderNode<[]> | null = null;

  makeNode(uiContext: UIContext): FrameNode | null {
    this.rootNode = new FrameNode(uiContext);
    this.builderNode = new BuilderNode(uiContext, { selfIdealSize: { width: 100, height: 100 } });
    console.info('builderNodeIsDisposed before build:' + this.builderNode.isDisposed());
    AppStorage.SetOrCreate('builderNodeIsDisposedBeforeBuild',this.builderNode.isDisposed());
    this.builderNode.build(new WrappedBuilder(buildComponent));
    AppStorage.SetOrCreate('builderNodeIsDisposedAfterBuild',this.builderNode.isDisposed());
    const rootRenderNode = this.rootNode!.getRenderNode();
    if (rootRenderNode !== null) {
      rootRenderNode.size = { width: 100, height: 100 };
      rootRenderNode.backgroundColor = 0xffd5d5d5;
      rootRenderNode.appendChild(this.builderNode!.getFrameNode()!.getRenderNode());
    }
    return this.rootNode;
  }

  isDisposed() {
    if (this.builderNode !== null) {
      console.info('aboutToDisappear1:' + this.builderNode.isDisposed());
      AppStorage.SetOrCreate('builderNodeIsDisposed1',this.builderNode.isDisposed());
    }
  }

  buildAgain() {
    if (this.builderNode !== null) {
      this.builderNode.build(new WrappedBuilder(buildComponent));
    }
  }

  dispose() {
    if (this.builderNode !== null) {
      this.builderNode.dispose();
      AppStorage.SetOrCreate('builderNodeIsDisposed2',this.builderNode.isDisposed());
      console.info('aboutToDisappear2:' + this.builderNode.isDisposed());
    }
  }

  removeBuilderNode() {
    const rootRenderNode = this.rootNode!.getRenderNode();
    if (rootRenderNode !== null && this.builderNode !== null && this.builderNode.getFrameNode() !== null) {
      rootRenderNode.removeChild(this.builderNode!.getFrameNode()!.getRenderNode());
    }
  }
}

@Entry
@Component
struct Index {
  private myNodeController: MyNodeController = new MyNodeController();

  build() {
    Column({ space: 4 }) {
      NodeContainer(this.myNodeController).height('30%')
      Button('BuilderNode dispose').height('10%')
        .id('btn_BuilderNode_dispose')
        .onClick(() => {
          this.myNodeController.removeBuilderNode();
          this.myNodeController.dispose();
        })
      Button('BuilderNode isDisposed').height('10%')
        .id('btn_BuilderNode_isDisposed')
        .onClick(() => {
          this.myNodeController.isDisposed();
        })
      Button('BuilderNode build again').height('10%')
        .id('btn_BuilderNode_isDisposed_build_again')
        .onClick(() => {
          this.myNodeController.buildAgain();
        })
    }
    .width('100%')
    .height('100%')
  }
}