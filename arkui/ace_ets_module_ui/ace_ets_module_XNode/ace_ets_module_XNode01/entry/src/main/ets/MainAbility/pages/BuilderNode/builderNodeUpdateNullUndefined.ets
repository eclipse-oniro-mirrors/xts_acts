/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { NodeController, BuilderNode, FrameNode, UIContext, InputEventType } from '@kit.ArkUI';

class Params {
  public text: string = 'hello';
  constructor(text: string) {
    this.text = text;
  }
}

@Component
struct TextBuilder {
  @Prop message: string = 'TextBuilder';

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontWeight(FontWeight.Bold)
          .backgroundColor(Color.Gray)
      }
    }
  }
}

@Builder
function buildText(params: Params) {
  Column() {
    Text(params.text)
      .fontWeight(FontWeight.Bold)
    TextBuilder({message: params.text})
  }
}

class TextNodeController extends NodeController {
  update() {
    throw new Error('Method not implemented');
  }

  private textNode: BuilderNode<[Params]> | null = null;
  private message: string = '';

  constructor(message: string) {
    super();
    this.message = message;
  }

  makeNode(context: UIContext): FrameNode | null {
    this.textNode = new BuilderNode(context);
    this.textNode.build(wrapBuilder<[Params]>(buildText), new Params(this.message));
    return this.textNode.getFrameNode();
  }

  updateNUll() {
    if (this.textNode !== null) {
      this.textNode.update(null);
    }
  }
  updateUndefined() {
    if (this.textNode !== null) {
      this.textNode.update(undefined);
    }
  }

  postTouchEventNull(event: TouchEvent, uiContext: UIContext): boolean {
    if (this.textNode == null) {
      return false;
    }
    let node: FrameNode | null = this.textNode.getFrameNode();
    let offsetX: number | null | undefined = node?.getPositionToParent().x;
    let offsetY: number | null | undefined = node?.getPositionToParent().y;

    let changedTouchLen = event.changedTouches.length;
    for (let i = 0; i < changedTouchLen; i++) {
      if (offsetX != null && offsetY != null && offsetX != undefined && offsetY != undefined) {
        event.changedTouches[i].x = uiContext.vp2px(offsetX + event.changedTouches[i].x);
        event.changedTouches[i].y = uiContext.vp2px(offsetY + event.changedTouches[i].y);
      }
    }
    let result = this.textNode.postTouchEvent(null);
    console.info(`result ${result}`);
    return result;
  }

  postTouchEventUndefined(event: TouchEvent, uiContext: UIContext): boolean {
    if (this.textNode == null) {
      return false;
    }
    let node: FrameNode | null = this.textNode.getFrameNode();
    let offsetX: number | null | undefined = node?.getPositionToParent().x;
    let offsetY: number | null | undefined = node?.getPositionToParent().y;

    let changedTouchLen = event.changedTouches.length;
    for (let i = 0; i < changedTouchLen; i++) {
      if (offsetX != null && offsetY != null && offsetX != undefined && offsetY != undefined) {
        event.changedTouches[i].x = uiContext.vp2px(offsetX + event.changedTouches[i].x);
        event.changedTouches[i].y = uiContext.vp2px(offsetY + event.changedTouches[i].y);
      }
    }
    let result = this.textNode.postTouchEvent(undefined);
    console.info(`result ${result}`);
    return result;
  }

  postInputEventNull(event: InputEventType, uiContext: UIContext): boolean {
    if (this.textNode == null) {
      return false;
    }
    let node: FrameNode | null = this.textNode.getFrameNode();
    let offsetX: number | null | undefined = node?.getPositionToParent().x;
    let offsetY: number | null | undefined = node?.getPositionToParent().y;

    let axisEvent = event as AxisEvent;
    if (offsetX != null && offsetY != null && offsetX != undefined && offsetY != undefined) {
      axisEvent.x = uiContext.vp2px(offsetX + axisEvent.x);
      axisEvent.y = uiContext.vp2px(offsetY + axisEvent.y);
    }
    let result = this.textNode.postInputEvent(null);
    return result;
  }

  postInputEventUndefined(event: InputEventType, uiContext: UIContext): boolean {
    if (this.textNode == null) {
      return false;
    }
    let node: FrameNode | null = this.textNode.getFrameNode();
    let offsetX: number | null | undefined = node?.getPositionToParent().x;
    let offsetY: number | null | undefined = node?.getPositionToParent().y;

    let axisEvent = event as AxisEvent;
    if (offsetX != null && offsetY != null && offsetX != undefined && offsetY != undefined) {
      axisEvent.x = uiContext.vp2px(offsetX + axisEvent.x);
      axisEvent.y = uiContext.vp2px(offsetY + axisEvent.y);
    }
    let result = this.textNode.postInputEvent(undefined);
    return result;
  }

}

@Entry
@Component
struct builderNodeUpdateNullUndefined {
  private textNodeController: TextNodeController = new TextNodeController('hello');

  build() {
    Column({space:5}) {
      Column({space:5}) {
        NodeContainer(this.textNodeController)
          .onTouch((event) => {
            if (event != undefined) {
              this.textNodeController.postTouchEventNull(event, this.getUIContext());
              this.textNodeController.postTouchEventUndefined(event, this.getUIContext());
            }
          })
          .onAxisEvent((event) => {
            if (event != undefined) {
              this.textNodeController.postInputEventNull(event, this.getUIContext());
              this.textNodeController.postInputEventUndefined(event, this.getUIContext());
            }
          })
          .id('builderNodeUpdateNullUndefined')
          .width(100)
          .height(50)
          .backgroundColor('#FFF0F0F0')
        Button('update')
          .onClick(() => {
            try {
              this.textNodeController.updateNUll();
              this.textNodeController.updateUndefined();
            } catch (error) {
              console.info('error code is error')
            }
          })
          .height(25)
          .id('builderNodeUpdateNullUndefinedButton')
      }
    }
    .width('100%')
    .height('100%')
  }
}