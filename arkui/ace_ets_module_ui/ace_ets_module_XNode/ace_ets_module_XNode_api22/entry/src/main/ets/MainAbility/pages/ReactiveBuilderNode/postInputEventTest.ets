/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { NodeController, ReactiveBuilderNode, FrameNode, UIContext, PromptAction, InputEventType  } from '@kit.ArkUI';

@Builder
function buttonBuilder(text: string, uiContext: UIContext) {
  Column() {
    Button(text)
      .borderWidth(2)
      .align(Alignment.Center)
      .backgroundColor(Color.Orange)
      .fontSize(20)
      .width('45%')
      .height('30%')
      .offset({x: 50, y: 50})
      .id('button')
      .onTouch((event) => {
        let promptAction: PromptAction = uiContext!.getPromptAction();
        promptAction.showToast({
          message: 'onTouch',
          duration: 3000
        });
        console.info('onTouch')
      })
  }
  .width(300)
  .height(100)
  .backgroundColor(Color.Gray)
}
// 继承NodeController实现自定义UI控制器
class MyNodeController extends NodeController {
  private rootNode: FrameNode | null = null;
  private builderNode: ReactiveBuilderNode<[text: string, uiContext: UIContext]> | null = null;

  private wrapBuilder: WrappedBuilder<[text: string, uiContext: UIContext]> = 
  wrapBuilder<[text: string, uiContext: UIContext]>(buttonBuilder);
  makeNode(uiContext: UIContext): FrameNode | null {
    this.rootNode = new FrameNode(uiContext);
    this.builderNode = new ReactiveBuilderNode(uiContext);
    this.builderNode.build(this.wrapBuilder, {}, 'This is a string', uiContext )
    const rootRenderNode = this.rootNode!.getRenderNode();
    rootRenderNode?.appendChild(this.builderNode!.getFrameNode()!.getRenderNode());
    return this.rootNode;
  }

  postInputEvent(event: InputEventType, uiContext: UIContext): boolean {
    if (this.builderNode == null) {
      return false;
    }
    let node: FrameNode | null = this.builderNode.getFrameNode();
    let offsetX: number | null | undefined = node?.getPositionToParent().x;
    let offsetY: number | null | undefined = node?.getPositionToParent().y;

    // 只转发原始事件，不转发鼠标模拟的触摸事件
    if (event.source == SourceType.TouchScreen) {
      let touchEvent = event as TouchEvent;
      let changedTouchLen = touchEvent.changedTouches.length;
      for (let i = 0; i < changedTouchLen; i++) {
        if (offsetX != null && offsetY != null && offsetX != undefined && offsetY != undefined) {
          touchEvent.changedTouches[i].windowX = uiContext.vp2px(offsetX + touchEvent.changedTouches[i].x);
          touchEvent.changedTouches[i].windowY = uiContext.vp2px(offsetY + touchEvent.changedTouches[i].y);
          touchEvent.changedTouches[i].displayX = uiContext.vp2px(offsetX + touchEvent.changedTouches[i].x);
          touchEvent.changedTouches[i].displayY = uiContext.vp2px(offsetY + touchEvent.changedTouches[i].y);
        }
      }
      let touchesLen = touchEvent.touches.length;
      for (let i = 0; i < touchesLen; i++) {
        if (offsetX != null && offsetY != null && offsetX != undefined && offsetY != undefined) {
          touchEvent.touches[i].windowX = uiContext.vp2px(offsetX + touchEvent.touches[i].x);
          touchEvent.touches[i].windowY = uiContext.vp2px(offsetY + touchEvent.touches[i].y);
          touchEvent.touches[i].displayX = uiContext.vp2px(offsetX + touchEvent.touches[i].x);
          touchEvent.touches[i].displayY = uiContext.vp2px(offsetY + touchEvent.touches[i].y);
        }
      }
    }

    let result = this.builderNode.postInputEvent(event);
    console.log('onTouch:'+ result);
    AppStorage.setOrCreate('lastPostInputEventResult', result);
    return result;
  }
}
@Entry
@Component
struct MyComponent {
  private nodeController: MyNodeController = new MyNodeController();
  build() {
    Stack() {
      NodeContainer(this.nodeController)
        .height(100)
        .width(300)
      Column()
        .id('column1')
        .width(300)
        .height(100)
        .backgroundColor(Color.Transparent)
        .onTouch((event) => {
          if (event != undefined) {
            this.nodeController.postInputEvent(event, this.getUIContext());
          }
        })
    }.offset({top: 100})
  }
}
