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

class MyNodeControllerFrameNode extends NodeController {
  public rootNode: FrameNode | null = null;
  public text1: string = '';
  public text2: string = '';

  makeNode(uiContext: UIContext): FrameNode | null {
    this.rootNode = new FrameNode(uiContext);
    this.rootNode.commonAttribute.width(100)
      .height(100)
      .backgroundColor(Color.Pink);
    this.addCommonEvent(this.rootNode);
    return this.rootNode;
  }


  changeNode(){
    this.rootNode?.commonAttribute
      .width(80)
  }

  addCommonEvent(frameNode: FrameNode) {
    frameNode.commonEvent.setOnHover(((isHover: boolean, event: HoverEvent): void => {
      console.log(`isHover FrameNode: ${isHover}`);
      console.log(`isHover FrameNode: ${JSON.stringify(event)}`);
      event.stopPropagation();
    }))
    frameNode.commonEvent.setOnClick((event: ClickEvent) => {
      console.log(`Click FrameNode: ${JSON.stringify(event)}`)
    })
    frameNode.commonEvent.setOnTouch((event: TouchEvent) => {
      console.log(`touch FrameNode: ${JSON.stringify(event)}`)
    })
    frameNode.commonEvent.setOnAppear(() => {
      console.log(`on Appear FrameNode`)
    })
    frameNode.commonEvent.setOnDisappear(() => {
      console.log(`onDisAppear FrameNode`)
    })
    frameNode.commonEvent.setOnFocus(() => {
      console.log(`onFocus FrameNode`)
    })
    frameNode.commonEvent.setOnBlur(() => {
      console.log(`onBlur FrameNode`)
    })
    frameNode.commonEvent.setOnKeyEvent((event: KeyEvent) => {
      console.log(`Key FrameNode: ${JSON.stringify(event)}`)
    })
    frameNode.commonEvent.setOnMouse((event: MouseEvent) => {
      this.text1 = 'setOnMouseFrameNode'
      console.log(`Mouse FrameNode: ${JSON.stringify(event)}`)
    })
    frameNode.commonEvent.setOnSizeChange((oldValue: SizeOptions, newValue: SizeOptions) => {
      this.text2 = 'setOnSizeChangeFrameNode'
      console.info(`onSizeChange FrameNode: oldValue is ${JSON.stringify(oldValue)} value is ${JSON.stringify(newValue)}`)
    })
  }
}


@Entry
@Component
struct commonEventTest1 {
  private myNodeController: MyNodeControllerFrameNode = new MyNodeControllerFrameNode();
  @State str1: string = '1'
  @State str2: string = '2'


  build() {
    Column({space:10}) {

      Text(this.str1).id('commonEventTest1_text1')
      Text(this.str2).id('commonEventTest1_text2')

      Row() {
        Button('getOnMouse')
          .onClick(()=>{
            this.str1 = this.myNodeController.text1
          })
          .id('commonEventTest1_getOnMouse')
          .width('30%')

        Button('getOnSizeChange')
          .onClick(()=>{
            this.str2 = this.myNodeController.text2
          })
          .id('commonEventTest1_getOnSizeChange')
          .width('30%')

        Button('changeSize')
          .onClick(()=>{
            this.myNodeController.changeNode()
          })
          .id('commonEventTest1_changeSize')
          .width('30%')
      }

      NodeContainer(this.myNodeController)
        .id('commonEventTest1_node')
        .borderWidth(1)
        .width(100)
        .height(100)

    }.width("100%")
  }
}