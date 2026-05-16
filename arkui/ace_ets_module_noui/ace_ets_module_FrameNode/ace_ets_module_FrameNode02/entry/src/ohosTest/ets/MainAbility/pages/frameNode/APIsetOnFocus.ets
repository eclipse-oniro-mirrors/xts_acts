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

class MyNodeController extends NodeController {
  public rootNode: FrameNode | null = null;
  makeNode(uiContext: UIContext): FrameNode | null {
    this.rootNode = new FrameNode(uiContext);
    this.rootNode.commonAttribute.width(100)
      .height(100)
      .backgroundColor(Color.Pink);
    this.addCommonEvent(this.rootNode);
    return this.rootNode;
  }

  addCommonEvent(frameNode: FrameNode) {
    frameNode.commonEvent.setOnFocus(() => {
      console.log(`onFocus FrameNode`)
    })
    frameNode.commonEvent.setOnBlur(() => {
      console.log(`onBlur FrameNode`)
    })
    frameNode.commonEvent.setOnHover(((isHover: boolean, event: HoverEvent): void => {
      console.log(`isHover FrameNode: ${isHover}`);
      console.log(`isHover FrameNode: ${JSON.stringify(event)}`);
      event.stopPropagation();
    }))
  }
}

@Entry
@Component
struct setOnFocusTest {
  @State text: string = 'start';
  @State oneButtonColor: string = '#87CEFA'
  @State twoButtonColor: string = '#FFC0CB'
  private myNodeController: MyNodeController = new MyNodeController();

  onPageShow() {
    this.myNodeController!.addCommonEvent(this.myNodeController!.rootNode!.getParent()!.getPreviousSibling() !)
  }

  build() {
    Column({space:20}) {
      Button('First Button').id('setOnFocus_1')
        .backgroundColor(this.oneButtonColor)
        .width(260)
        .height(70)
        .fontSize(14)
        .borderWidth(1)
        .defaultFocus(true)
        .onFocus(() => {
          this.oneButtonColor = '#FF0000'
          this.text = 'setOnFocus'
          console.log(`onFocus btn1`)
        })
        .onBlur(() => {
          this.oneButtonColor = '#87CEFA'
          this.text = 'setOnBlur'
          console.log(`onBlur btn1`)
        })

      Button('Second Button').id('setOnFocus_2')
        .backgroundColor(this.twoButtonColor)
        .width(260)
        .height(70)
        .fontSize(14)
        .borderWidth(1)
        .focusable(true)
        .onFocus(() => {
          this.twoButtonColor = '#FF0000'
          this.text = 'setOnFocus'
          console.log(`onFocus btn2`)
        })
        .onBlur(() => {
          this.twoButtonColor = '#FFC0CB'
          this.text = 'setOnBlur'
          console.log(`onBlur btn2`)
        })

      Text(this.text).id('setOn_text')
        .fontWeight(700).fontColor(Color.Green)

      NodeContainer(this.myNodeController)
        .borderWidth(1)
        .width(300)
        .height(100)

    }.width("100%")
  }
}