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

import { NodeController, ReactiveBuilderNode, FrameNode, UIContext } from '@kit.ArkUI';

@Builder
function buttonBuilder(text: string) {
  Column() {
    Button(`button ` + text)
      .borderWidth(2)
      .backgroundColor(Color.Orange)
      .width(100)
      .height(50)
      .id('nodeEventButton')
      .gesture(
        TapGesture()
          .onAction((event: GestureEvent) => {
            console.info('TapGesture');
          })
      )
      .onTouch(()=>{
        console.log(`postTouchEvent Success`);
      })
  }
  .width(300)
  .height(50)
  .backgroundColor(Color.Gray)
}

// 继承NodeController实现自定义UI控制器
class MyNodeController extends NodeController {
  private rootNode: FrameNode | null = null;
  private builderNode: ReactiveBuilderNode<[text: string]> | null = null;
  private wrapBuilder: WrappedBuilder<[text: string]> = wrapBuilder(buttonBuilder);

  makeNode(uiContext: UIContext): FrameNode | null {
    this.rootNode = new FrameNode(uiContext);
    this.builderNode = new ReactiveBuilderNode(uiContext);
    this.builderNode.build(this.wrapBuilder, {}, 'this is a string');
    const rootRenderNode = this.rootNode!.getRenderNode();
    rootRenderNode?.appendChild(this.builderNode!.getFrameNode()!.getRenderNode());
    return this.rootNode;
  }

  // 坐标转换示例
  postTouchEvent(event: TouchEvent, uiContext: UIContext): boolean {
    if (this.builderNode == null) {
      return false;
    }
    let node: FrameNode | null = this.builderNode.getFrameNode();
    let offsetX: number | null | undefined = node?.getPositionToParent().x;
    let offsetY: number | null | undefined = node?.getPositionToParent().y;

    let changedTouchLen = event.changedTouches.length;
    for (let i = 0; i < changedTouchLen; i++) {
      if (offsetX != null && offsetY != null && offsetX != undefined && offsetY != undefined) {
        event.changedTouches[i].x = uiContext.vp2px(offsetX + event.changedTouches[i].x);
        event.changedTouches[i].y = uiContext.vp2px(offsetY + event.changedTouches[i].y);
      }
    }
    let result = this.builderNode.postTouchEvent(event);
    console.info('result ' + result);
    AppStorage.setOrCreate('lastPostTouchEventResult', result);
    return result;
  }
}

@Entry
@Component
struct MyComponent {
  private nodeController: MyNodeController = new MyNodeController();
  @State text1:string = '';

  build() {
    Column() {
      Text('textClick')
        .id('textClick')
        .height(50)
        .width(100)
        .backgroundColor(Color.Pink)
        .onTouch((event) => {
          if (event != undefined) {
            this.nodeController.postTouchEvent(event, this.getUIContext());
          }
        })
      NodeContainer(this.nodeController)
        .height(50)
        .width(300)
        .onTouch((event) => {
          if (event != undefined) {
            this.nodeController.postTouchEvent(event, this.getUIContext());
          }
        })
        .id('nodeTest')


      Column()
        .width(300)
        .height(50)
        .backgroundColor(Color.Pink)
        .onTouch((event) => {
          if (event != undefined) {
            this.nodeController.postTouchEvent(event, this.getUIContext());
          }
        }).id('columnTest')
    }
  }
}