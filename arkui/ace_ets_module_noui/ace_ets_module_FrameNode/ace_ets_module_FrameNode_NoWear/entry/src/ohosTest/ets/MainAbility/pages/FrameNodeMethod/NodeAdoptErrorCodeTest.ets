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
import { NodeController, FrameNode, UIContext, NodeContent, RenderNode, BuilderNode, PromptAction } from '@kit.ArkUI';
import { BusinessError } from '@ohos.base'

const TEST_TAG: string = 'FrameNode '

class Params {
  text: string = 'this is a text'
  uiContext: UIContext | null = null
}

@Builder
function ButtonBuilder(params: Params) {
  Column() {
    Button(params.text)
      .borderWidth(2)
      .align(Alignment.Center)
      .backgroundColor(Color.Orange)
      .fontSize(20)
      .width('45%')
      .height('30%')
      .offset({ x: 100, y: 100 })
      .onTouch((event) => {
        let promptAction: PromptAction = params.uiContext!.getPromptAction();
        promptAction.showToast({
          message: 'onTouch',
          duration: 3000
        });
        console.info('onTouch')
      })
  }
  .width('100%')
  .height('30%')
  .backgroundColor(Color.Gray)
}

// 继承NodeController实现自定义UI控制器
class MyNodeController extends NodeController {
  public adoptedChild: FrameNode | null = null;
  public rootNode: FrameNode | null = null;
  public normalParent: FrameNode | null = null;
  public nodeContent: NodeContent | null = null;
  public renderNode: RenderNode | null = null;
  public disposeNode: FrameNode | null = null;
  public builderNode: BuilderNode<[Params]> | null = null;
  public builderRootNode: FrameNode | null = null;
  private wrapBuilder: WrappedBuilder<[Params]> = wrapBuilder(ButtonBuilder);

  makeNode(uiContext: UIContext): FrameNode | null {
    this.rootNode = new FrameNode(uiContext);
    this.adoptedChild = new FrameNode(uiContext);
    this.normalParent = new FrameNode(uiContext);
    this.nodeContent = new NodeContent();
    this.renderNode = new RenderNode();
    this.disposeNode = new FrameNode(uiContext);
    this.disposeNode.dispose();
    this.addCommonEvent(this.adoptedChild)
    this.builderNode = new BuilderNode(uiContext);
    this.builderNode.build(this.wrapBuilder, { text: 'This is a string', uiContext });
    this.builderRootNode = this.builderNode.getFrameNode();
    return this.rootNode;
  }

  addCommonEvent(frameNode: FrameNode) {
    frameNode.commonEvent.setOnClick((event: ClickEvent) => {
      console.info(`Click FrameNode: ${JSON.stringify(event)}`)
    })
  }

  adoptChild() {
    try {
      this.rootNode?.adoptChild(this.adoptedChild);
      console.info(TEST_TAG + `Adopt Success`);
    } catch (e) {
      console.error(TEST_TAG + `adoptChild Fail: Message: ${e.message}, ErrorCode: ${e.code}`);
    }
  }

  removeAdoptedChild() {
    try {
      this.rootNode?.removeAdoptedChild(this.adoptedChild);
      console.info(TEST_TAG + `removeAdoptedChild Success`);
    } catch (e) {
      console.error(TEST_TAG + `removeAdoptedChild Fail: Message: ${e.message}, ErrorCode: ${e.code}`);
    }
  }

  startTestOldApis() {
    this.normalParent?.adoptChild(this.adoptedChild);
    // test_affectedApi001 测试NodeContent adopt子节点
    try {
      this.nodeContent?.addFrameNode(this.adoptedChild);
      console.info(`test_affectedApi001 Fail`);
    } catch (e) {
      AppStorage.SetOrCreate('AddFrameNode100025', (e as BusinessError).code);
      console.info(`test_affectedApi001 Success: Message: ${e.message}, ErrorCode: ${e.code}, Expect: 100025`);
    }

    // test_affectedApi002 测试FrameNode移动adopt状态的子节点
    try {
      this.rootNode?.insertChildAfter(this.adoptedChild, null);
      console.info(`test_affectedApi002 Fail`);
    } catch (e) {
      AppStorage.SetOrCreate('FrameNodeInsertChildAfter100025', (e as BusinessError).code);
      console.info(`test_affectedApi002 insertChildAfter Success: Message: ${e.message}, ErrorCode: ${e.code}, Expect: 100025`);
    }
    try {
      this.rootNode?.appendChild(this.adoptedChild);
      console.info(`test_affectedApi002 Fail`);
    } catch (e) {
      AppStorage.SetOrCreate('FrameNodeAppendChild100025', (e as BusinessError).code);
      console.info(`test_affectedApi002 appendChild Success: Message: ${e.message}, ErrorCode: ${e.code}, Expect: 100025`);
    }
    try {
      this.adoptedChild?.moveTo(this.rootNode);
      console.info(`test_affectedApi002 Fail`);
    } catch (e) {
      AppStorage.SetOrCreate('MoveTo100027', (e as BusinessError).code);
      console.info(`test_affectedApi002 moveTo Success: Message: ${e.message}, ErrorCode: ${e.code}, Expect: 100027`);
    }

    // test_affectedApi003 测试RenderNode移动adopt状态的子节点
    const renderNodeFromAdoptedFrameNode: RenderNode | null | undefined = this.adoptedChild?.getRenderNode();
    const parentRenderNode: RenderNode | null | undefined = this.rootNode?.getRenderNode();
    if (renderNodeFromAdoptedFrameNode === null || renderNodeFromAdoptedFrameNode === undefined) {
      console.info(`test_affectedApi003 Fail, renderNodeFromAdoptedFrameNode is null or undefined`);
    }
    if (parentRenderNode === null || parentRenderNode === undefined) {
      console.info(`test_affectedApi003 Fail, parentRenderNode is null or undefined`);
    }
    if (renderNodeFromAdoptedFrameNode && parentRenderNode) {
      try {
        parentRenderNode.appendChild(renderNodeFromAdoptedFrameNode);
        console.info(`test_affectedApi003 Fail`);
      } catch (e) {
        AppStorage.SetOrCreate('RenderNodeAppendChild100025', (e as BusinessError).code);
        console.info(`test_affectedApi003 appendChild Success: Message: ${e.message}, ErrorCode: ${e.code}, Expect: 100025`);
      }
      try {
        parentRenderNode.insertChildAfter(renderNodeFromAdoptedFrameNode, null);
        console.info(`test_affectedApi003 Fail`);
      } catch (e) {
        AppStorage.SetOrCreate('RenderNodeInsertChildAfter100025', (e as BusinessError).code);
        console.info(`test_affectedApi003 insertChildAfter Success: Message: ${e.message}, ErrorCode: ${e.code}, Expect: 100025`);
      }
    }
    // 将adoptedChild解除adopt状态
    this.normalParent?.removeAdoptedChild(this.adoptedChild);
  }
}

@Entry
@Component
struct Index {
  private myNodeController: MyNodeController = new MyNodeController();

  build() {
    Column({ space: 8 }) {
      NodeContainer(this.myNodeController)
        .borderWidth(1)
        .width('100%')
        .height('30%')

      Button('startTestOldApis')
        .id('btn_startTestOldApis')
        .width('100%')
        .height('10%')
        .onClick(() => {
          this.myNodeController.startTestOldApis();
        })
    }
    .height('100%')
  }
}