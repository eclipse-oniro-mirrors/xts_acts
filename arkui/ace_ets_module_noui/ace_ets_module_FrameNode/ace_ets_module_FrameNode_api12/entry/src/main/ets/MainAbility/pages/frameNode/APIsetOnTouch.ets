/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { FrameNode, NodeController } from '@ohos.arkui.node'
import promptAction from '@ohos.promptAction';
let para: Record<string, string> = { 'PropAPIsetOnTouch': 'start' };
let storage: LocalStorage = new LocalStorage(para);

class MyNodeController extends NodeController {
  public rootNode: FrameNode | null = null;
  makeNode(uiContext: UIContext): FrameNode | null {
    this.rootNode = new FrameNode(uiContext);
    this.rootNode.commonAttribute.width(100)
      .height(100)
      .backgroundColor(Color.Pink);
    return this.rootNode;
  }

  addCommonEvent(frameNode: FrameNode) {
    // 长按看看能不能实现
    frameNode.commonEvent.setOnTouch((event: TouchEvent) => {
      storage.set('PropAPIsetOnTouch', 'setOnTouch');
    })
  }
}

@Entry
@Component
struct APIsetOnTouch {
  @State text1: string = 'start';
  private myNodeController: MyNodeController = new MyNodeController();

  onPageShow() {
    this.myNodeController!.addCommonEvent(this.myNodeController!.rootNode!.getParent()!.getPreviousSibling() !)
  }
  build() {
    Column({space:40}) {
      Text("this is a Text").key('APIsetOnTouchText01')
        .fontSize(16)
        .borderWidth(1)
        .margin({top: 40})

      NodeContainer(this.myNodeController)
        .borderWidth(1)
        .width(300)
        .height(100)

      Text(this.text1).key('APIsetOnTouchText02')
        .fontWeight(700).fontColor(Color.Green)
        .onClick(() => {
          this.text1 = storage.get('PropAPIsetOnTouch') as string
        })

    }.width("100%")
  }
}