/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
import { NodeController, FrameNode, UIContext, typeNode } from '@kit.ArkUI';

// 继承NodeController实现自定义UI控制器
class MyNodeController extends NodeController {
  public frameNode: FrameNode | null = null;
  public childList: Array<FrameNode> = new Array<FrameNode>();
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

  getInteractionEventBindingInfo() {
    let bindingInfo1 = this.frameNode?.getInteractionEventBindingInfo(undefined);
    console.info(`win6 undefined ` + bindingInfo1);
    AppStorage.SetOrCreate('GetInteractionEventBindingInfoUndefined', bindingInfo1);

    let bindingInfo2 = this.frameNode?.getInteractionEventBindingInfo(null);
    console.info(`win6 null ` + bindingInfo2);
    AppStorage.SetOrCreate('GetInteractionEventBindingInfoNull', bindingInfo2);
  }
}

@Entry
@Component
struct GetInteractionEventBindingInfoIndex {
  private myNodeController: MyNodeController = new MyNodeController();
  private scroller: Scroller = new Scroller();

  build() {
    Scroll(this.scroller) {
      Column({ space: 8 }) {
        NodeContainer(this.myNodeController)
          .borderWidth(1)
          .width('100%')
          .height('30%')
        Button('getInteractionEventBindingInfo')
          .id('btn_getInteractionEventBindingInfo_id')
          .height('10%')
          .onClick(() => {
            this.myNodeController.getInteractionEventBindingInfo();
          })
      }
      .width('100%')
      .height('100%')
    }
    .scrollable(ScrollDirection.Vertical) // 滚动方向为纵向
  }
}