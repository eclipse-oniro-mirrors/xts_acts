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
      console.log(`Mouse FrameNode: ${JSON.stringify(event)}`)
    })
    frameNode.commonEvent.setOnSizeChange((oldValue: SizeOptions, newValue: SizeOptions) => {
      console.info(`onSizeChange FrameNode: oldValue is ${JSON.stringify(oldValue)} value is ${JSON.stringify(newValue)}`)
    })
  }
}

@Entry
@Component
struct onAppearExample {
  @State Text: string = "setOnAppear";
  private myNodeController: MyNodeController = new MyNodeController();
  @State isShow: boolean = true
  @State changeAppear: string = '点我卸载挂载组件'
  private myText: string = 'Text for onAppear'

  build() {
    Column() {


      Button("add CommonEvent to Text")
        .margin(20)
        .onClick(() => {
          this.myNodeController!.addCommonEvent(this.myNodeController!.rootNode!.getParent()!.getPreviousSibling() !)
        })
      if (this.isShow) {
        Button("this is a Text")
          .margin(30)
          .fontSize(16)
          .height(20)
          .borderWidth(1)
          .onHover(((isHover: boolean, event: HoverEvent): void => {
            console.log(`isHover Text: ${isHover}`);
            console.log(`isHover Text: ${JSON.stringify(event)}`);
            event.stopPropagation();
          }))
          .onClick((event: ClickEvent) => {
            console.log(`Click Text    : ${JSON.stringify(event)}`)
          })
          .onTouch((event: TouchEvent) => {
            console.log(`touch Text    : ${JSON.stringify(event)}`)
          })
          .onAppear(() => {
            return this.myNodeController?.rootNode?.commonEvent?.setOnAppear(() => {
              this.Text = "setOnAppear success"
              console.log(`on Appear FrameNode`)
            });
          })
          .onDisAppear(() => {
            return this.myNodeController?.rootNode?.commonEvent?.setOnDisappear(() => {
              this.Text = "setOnDisappear success"
              console.log(`on Appear FrameNode`)
            });
          })
          .onFocus(() => {
            console.log(`onFocus Text`)
          })
          .onBlur(() => {
            console.log(`onBlur Text`)
          })
          .onKeyEvent((event: KeyEvent) => {
            console.log(`Key Text    : ${JSON.stringify(event)}`)
          })
          .onMouse((event: MouseEvent) => {
            console.log(`Mouse Text : ${JSON.stringify(event)}`)
          })
          .onSizeChange((oldValue: SizeOptions, newValue: SizeOptions) => {
            console.info(`onSizeChange Text: oldValue is ${JSON.stringify(oldValue)} value is ${JSON.stringify(newValue)}`)
          })

        NodeContainer(this.myNodeController)
          .borderWidth(1)
          .width(300)
          .height(100)
      }


      Button(this.changeAppear)
        .id("setOnDisappear")
        .onClick(() => {
          this.isShow = !this.isShow
        }).margin(15)

      Text(this.Text).margin(20).id("setOnAppear")
    }.width("100%")
  }
}