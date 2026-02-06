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
import { NodeController, FrameNode, UIContext, typeNode, ExpandMode } from '@kit.ArkUI';

class MyNodeController extends NodeController {
  public frameNode: FrameNode | null = null;
  public childList: Array<FrameNode> = [];
  private rootNode: FrameNode | null = null;
  private uiContext: UIContext | null = null;
  private childrenCount: number = 0;

  makeNode(uiContext: UIContext): FrameNode | null {
    this.rootNode = new FrameNode(uiContext);
    this.uiContext = uiContext;

    this.frameNode = new FrameNode(uiContext);
    this.frameNode.commonAttribute.backgroundColor(Color.Pink);
    this.frameNode.commonAttribute.size({ width: 100, height: 100 });
    this.addCommonEvent(this.frameNode)
    this.rootNode.appendChild(this.frameNode);
    this.childrenCount = this.childrenCount + 1;
    for (let i = 0; i < 10; i++) {
      let childNode = new FrameNode(uiContext);
      this.childList.push(childNode);
      this.frameNode.appendChild(childNode);
    }
    let stackNode = typeNode.createNode(uiContext, 'Stack');
    this.frameNode.appendChild(stackNode);
    return this.rootNode;
  }

  addCommonEvent(frameNode: FrameNode) {
    frameNode.commonEvent.setOnClick((event: ClickEvent) => {
      console.info(`Click FrameNode: ${JSON.stringify(event)}`)
    })
  }

  createFrameNode() {
    let frameNode = new FrameNode(this.uiContext!);
    frameNode.commonAttribute.backgroundColor(Color.Pink);
    frameNode.commonAttribute.size({ width: 100, height: 100 });
    frameNode.commonAttribute.position({ x: this.childrenCount * 120, y: 0 });
    frameNode.commonAttribute.visibility(Visibility.Hidden);

    return frameNode;
  }

  getMethodReturnNull() {
    const childNode = this.createFrameNode();
    AppStorage.SetOrCreate('getChildNullOne', this.rootNode!.getChild(5));
    AppStorage.SetOrCreate('getChildNullTwoExpand', this.rootNode!.getChild(19, ExpandMode.EXPAND));
    AppStorage.SetOrCreate('getFirstChildNull', childNode.getFirstChild());
    AppStorage.SetOrCreate('getNextSiblingNull', childNode.getNextSibling());
    AppStorage.SetOrCreate('getPreviousSiblingNull', childNode.getPreviousSibling());
    AppStorage.SetOrCreate('getParentNull', childNode.getParent());
    console.info('FrameNode getChild  result: ' + this.rootNode!.getChild(5));
    console.info('FrameNode getChild  result: ' + this.rootNode!.getChild(19, ExpandMode.EXPAND));
    console.info('FrameNode getFirstChild  result: ' + childNode.getFirstChild());
    console.info('FrameNode getNextSibling  result: ' + childNode.getNextSibling());
    console.info('FrameNode getPreviousSibling  result: ' + childNode.getPreviousSibling());
    console.info('FrameNode getParent  result: ' + childNode.getParent());
  }

  getRenderNodeNull() {
    const rootRenderNode = this.rootNode!.getRenderNode();
    rootRenderNode?.dispose();
    AppStorage.SetOrCreate('getRenderNodeNull', this.rootNode!.getRenderNode());
    console.info('FrameNode getRenderNode  result: ' + this.rootNode!.getRenderNode());
  }

  isVisibleBoolean() {
    const childNode = this.createFrameNode();
    AppStorage.SetOrCreate('isVisibleTrue', this.frameNode?.isVisible());
    AppStorage.SetOrCreate('isVisibleFalse', childNode.isVisible());

    console.info('FrameNode isVisible  result: ' + this.frameNode?.isVisible());
    console.info('FrameNode isVisible  result: ' + childNode.isVisible());
  }

  isClipToFrameBoolean() {
    AppStorage.SetOrCreate('isClipToFrameFalse', this.frameNode?.isClipToFrame());
    console.info('FrameNode isClipToFrame  result: ' + this.frameNode?.isClipToFrame());
    this.frameNode?.dispose();
    AppStorage.SetOrCreate('isClipToFrameTrue', this.frameNode?.isClipToFrame());
    console.info('FrameNode isClipToFrame  result: ' + this.frameNode?.isClipToFrame());
  }

  isAttachedBoolean() {
    const childNode = this.createFrameNode();
    AppStorage.SetOrCreate('isAttachedTrue', this.frameNode?.isAttached());
    AppStorage.SetOrCreate('isAttachedFalse', childNode.isAttached());
    console.info('FrameNode isAttached  result: ' + this.frameNode?.isAttached());
    console.info('FrameNode isAttached  result: ' + childNode?.isAttached());
  }
}

@Entry
@Component
struct GetFrameNodeMethodNullIndex {
  private myNodeController: MyNodeController = new MyNodeController();

  build() {
    Column({ space: 8 }) {
      Column() {
        NodeContainer(this.myNodeController)
          .borderWidth(1)
          .width(300)
          .height(100)
      }.height('50%')

      Button('test null')
        .id('btn_getMethodReturnNull')
        .height('5%')
        .width(300)
        .onClick(() => {
          this.myNodeController.getMethodReturnNull();
        })

      Button('getRenderNode null')
        .id('btn_getRenderNodeNull')
        .height('5%')
        .width(300)
        .onClick(() => {
          this.myNodeController.getRenderNodeNull();
        })

      Button('isVisible boolean')
        .id('btn_isVisibleBoolean')
        .height('5%')
        .width(300)
        .onClick(() => {
          this.myNodeController.isVisibleBoolean();
        })

      Button('isClipToFrame boolean')
        .id('btn_isClipToFrameBoolean')
        .height('5%')
        .width(300)
        .onClick(() => {
          this.myNodeController.isClipToFrameBoolean();
        })

      Button('isAttached boolean')
        .id('btn_isAttachedBoolean')
        .height('5%')
        .width(300)
        .onClick(() => {
          this.myNodeController.isAttachedBoolean();
        })

      Button('getCustomProperty undefined')
        .id('btn_getCustomProperty')
        .height('5%')
        .width(300)
        .onClick(() => {
          const uiContext: UIContext = this.getUIContext();
          if (uiContext) {
            const node: FrameNode | null = uiContext.getFrameNodeById('btn_getCustomProperty') || null;
            if (node) {
              AppStorage.SetOrCreate('customPropertyUndefined', node.getCustomProperty('customProperty'));
              console.info('FrameNode getCustomProperty  result: ' + node.getCustomProperty('customProperty'));
            }
          }
        })
    }
    .width('100%')
  }
}