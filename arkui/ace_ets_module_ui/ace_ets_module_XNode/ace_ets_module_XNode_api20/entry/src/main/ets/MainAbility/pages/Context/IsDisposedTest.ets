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
import { RenderNode, FrameNode, NodeController, BuilderNode,
  ComponentContent, PromptAction, NodeAdapter, typeNode } from '@kit.ArkUI';

@Builder
function buildText() {
  Text('test').id('test_id')
}

class MyNodeAdapter extends NodeAdapter {
}

class MyNodeController extends NodeController {
  private rootNode: FrameNode | null = null;
  private builderNode: BuilderNode<[]> | null = null;
  private renderNode: RenderNode | null = null;
  private frameNode: FrameNode | null = null;
  public nodeAdapter: MyNodeAdapter | null = null;

  public builderNodeBeforeValue: string  = '';
  public builderNodeAfterValue: string  = '';
  public frameNodeBeforeValue: string  = '';
  public frameNodeAfterValue: string  = '';
  public renderNodeBeforeValue: string  = '';
  public renderNodeAfterValue: string  = '';
  public nodeAdapterBeforeValue: string  = '';

  makeNode(uiContext: UIContext): FrameNode | null {
    this.rootNode = new FrameNode(uiContext);
    this.builderNode = new BuilderNode(uiContext, { selfIdealSize: { width: 200, height: 100 } });
    this.builderNode.build(new WrappedBuilder(buildText));

    const rootRenderNode = this.rootNode!.getRenderNode();
    if (rootRenderNode !== null) {
      rootRenderNode.size = { width: 200, height: 200 };
      rootRenderNode.backgroundColor = 0xff00ff00;
      rootRenderNode.appendChild(this.builderNode!.getFrameNode()!.getRenderNode());
      this.renderNode = new RenderNode();
      rootRenderNode.appendChild(this.renderNode);
      this.frameNode = new FrameNode(uiContext);
      this.rootNode.appendChild(this.frameNode);

      let listNode = typeNode.createNode(uiContext, 'List');
      listNode.initialize({ space: 3 }).borderWidth(2).borderColor(Color.Black);
      this.rootNode.appendChild(listNode);
      this.nodeAdapter = new MyNodeAdapter();
      NodeAdapter.attachNodeAdapter(this.nodeAdapter, listNode);
    }

    return this.rootNode;
  }

  disposeTest() {
    if (this.frameNode !== null && this.nodeAdapter !== null && this.builderNode !== null && this.renderNode !== null) {
      console.log(`jerry before BuilderNode dispose: isDisposed=`, this.builderNode.isDisposed());
      this.builderNodeBeforeValue = this.builderNode.isDisposed() + '';
      this.builderNode.dispose();
      console.log(`jerry after BuilderNode dispose: isDisposed=`, this.builderNode.isDisposed());
      this.builderNodeAfterValue = this.builderNode.isDisposed() + '';
      console.log(`jerry before FrameNode dispose: isDisposed=`, this.frameNode.isDisposed());
      this.frameNodeBeforeValue = this.frameNode.isDisposed() + '';
      this.frameNode.dispose();
      console.log(`jerry after FrameNode dispose: isDisposed=`, this.frameNode.isDisposed());
      this.frameNodeAfterValue = this.frameNode.isDisposed() + '';
      console.log(`jerry before RenderNode dispose: isDisposed=`, this.renderNode.isDisposed());
      this.renderNodeBeforeValue = this.renderNode.isDisposed() + '';
      this.renderNode.dispose();
      console.log(`jerry after RenderNode dispose: isDisposed=`, this.renderNode.isDisposed());
      this.renderNodeAfterValue = this.renderNode.isDisposed() + '';
      console.log(`jerry before NodeAdapter dispose: isDisposed=`, this.nodeAdapter.isDisposed());
      this.nodeAdapterBeforeValue = this.nodeAdapter.isDisposed() + '';
    }
  }
}
@Entry
@Component
struct Index {
  private myNodeController: MyNodeController = new MyNodeController();
  private promptAction: PromptAction | null = null;
  private contentNode: ComponentContent<[]> | null = null;

  @State builderNodeBeforeValue: string  = '5';
  @State builderNodeAfterValue: string  = '1';
  @State frameNodeBeforeValue: string  = '9';
  @State frameNodeAfterValue: string  = '1';
  @State renderNodeBeforeValue: string  = '6';
  @State renderNodeAfterValue: string  = '5';
  @State nodeAdapterBeforeValue: string  = '2';
  @State componentContentBeforeValue: string  = '9';
  @State componentContentAfterValue: string  = '9';

  build() {
    Column({ space: 2 }) {
      NodeContainer(this.myNodeController)
        .height('30%')
      Button('OpenDialog')
        .id('btn_OpenDialog')
        .onClick(() => {
          let uiContext = this.getUIContext();
          this.promptAction = uiContext.getPromptAction();
          this.contentNode = new ComponentContent(uiContext, wrapBuilder(buildText));
          this.promptAction.openCustomDialog(this.contentNode);
        })
        .width('100%')
        .height('5%')
      Button('DisposeTest')
        .id('btn_DisposeTest')
        .onClick(() => {
          this.myNodeController.disposeTest();
          this.builderNodeBeforeValue = this.myNodeController.builderNodeBeforeValue
          this.builderNodeAfterValue = this.myNodeController.builderNodeAfterValue
          this.frameNodeBeforeValue = this.myNodeController.frameNodeBeforeValue
          this.frameNodeAfterValue = this.myNodeController.frameNodeAfterValue
          this.renderNodeBeforeValue = this.myNodeController.renderNodeBeforeValue
          this.renderNodeAfterValue = this.myNodeController.renderNodeAfterValue
          this.nodeAdapterBeforeValue = this.myNodeController.nodeAdapterBeforeValue

          this.promptAction?.closeCustomDialog(this.contentNode);
          console.log(`jerry before ComponentContent dispose: isDisposed=`, this.contentNode?.isDisposed());
          this.componentContentBeforeValue = this.contentNode?.isDisposed() + '';
          this.contentNode?.dispose();
          console.log(`jerry after ComponentContent dispose: isDisposed=`, this.contentNode?.isDisposed());
          this.componentContentAfterValue = this.contentNode?.isDisposed() + '';
        })
        .width('100%')
        .height('5%')

      Text(`${this.builderNodeBeforeValue}`).height('2%').id('BuilderNodeBeforeValue')
      Text(`${this.builderNodeAfterValue}`).height('2%').id('BuilderNodeAfterValue')
      Text(`${this.frameNodeBeforeValue}`).height('2%').id('FrameNodeBeforeValue')
      Text(`${this.frameNodeAfterValue}`).height('2%').id('FrameNodeAfterValue')
      Text(`${this.renderNodeBeforeValue}`).height('2%').id('RenderNodeBeforeValue')
      Text(`${this.renderNodeAfterValue}`).height('2%').id('RenderNodeAfterValue')
      Text(`${this.nodeAdapterBeforeValue}`).height('2%').id('NodeAdapterBeforeValue')
      Text(`${this.componentContentBeforeValue}`).height('2%').id('ComponentContentBeforeValue')
      Text(`${this.componentContentAfterValue}`).height('2%').id('ComponentContentAfterValue')

    }
    .height('100%')
  }
}