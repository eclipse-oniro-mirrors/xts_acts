/*
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

import { BuilderNode, NodeController, FrameNode, UIContext, InputEventType } from '@kit.ArkUI';

class Params {
  public text: string = 'TestButton'
  public uiContext: UIContext | null = null
}

@Builder
function buttonBuilder(params: Params) {
  Column() {
    Button(params.text)
      .width('80%')
      .height('60%')
      .backgroundColor(Color.Orange)
      .onTouch((event: TouchEvent) => {
        console.info('buttonBuilder onTouch triggered');
      })
      .onMouse((event: MouseEvent) => {
        console.info('buttonBuilder onMouse triggered');
      })
      .onAxisEvent((event: AxisEvent) => {
        console.info('buttonBuilder onAxisEvent triggered');
      })
  }
  .width('100%')
  .height('100%')
  .justifyContent(FlexAlign.Center)
}

class MyNodeController extends NodeController {
  private builderNode: BuilderNode<[Params]> | null = null;
  private wrapBuilder: WrappedBuilder<[Params]> = wrapBuilder(buttonBuilder);
  private storedTouchEvent: TouchEvent | null = null;

  makeNode(uiContext: UIContext): FrameNode | null {
    this.builderNode = new BuilderNode(uiContext);
    this.builderNode.build(this.wrapBuilder, { text: 'TestButton', uiContext: uiContext });
    return this.builderNode.getFrameNode();
  }

  setStoredTouchEvent(event: TouchEvent): void {
    this.storedTouchEvent = event;
  }

  testNullEvent(): boolean {
    if (this.builderNode === null) {
      return false;
    }
    try {
      let nullEvent: InputEventType | null = null;
      return this.builderNode.postInputEventWithStrategy(nullEvent);
    } catch (err) {
      console.error('testNullEvent error: ' + err);
      return false;
    }
  }

  testUndefinedEvent(): boolean {
    if (this.builderNode === null) {
      return false;
    }
    try {
      return this.builderNode.postInputEventWithStrategy(undefined);
    } catch (err) {
      console.error('testUndefinedEvent error: ' + err);
      return false;
    }
  }

  testStrategyNull(uiContext: UIContext): boolean {
    if (this.builderNode === null || this.storedTouchEvent === null) {
      return false;
    }
    try {
      let node: FrameNode | null = this.builderNode.getFrameNode();
      let offsetX: number | null | undefined = node?.getPositionToParent().x;
      let offsetY: number | null | undefined = node?.getPositionToParent().y;
      let touchEvent = this.storedTouchEvent;
      let changedTouchLen = touchEvent.changedTouches.length;
      for (let i = 0; i < changedTouchLen; i++) {
        if (offsetX != null && offsetY != null && offsetX != undefined && offsetY != undefined) {
          touchEvent.changedTouches[i].windowX = uiContext.vp2px(offsetX + touchEvent.changedTouches[i].x);
          touchEvent.changedTouches[i].windowY = uiContext.vp2px(offsetY + touchEvent.changedTouches[i].y);
        }
      }
      let touchesLen = touchEvent.touches.length;
      for (let i = 0; i < touchesLen; i++) {
        if (offsetX != null && offsetY != null && offsetX != undefined && offsetY != undefined) {
          touchEvent.touches[i].windowX = uiContext.vp2px(offsetX + touchEvent.touches[i].x);
          touchEvent.touches[i].windowY = uiContext.vp2px(offsetY + touchEvent.touches[i].y);
        }
      }
      let nullStrategy: CompetitionStrategy | null = null;
      return this.builderNode.postInputEventWithStrategy(touchEvent, nullStrategy);
    } catch (err) {
      console.error('testStrategyNull error: ' + err);
      return false;
    }
  }

  testStrategyUndefined(uiContext: UIContext): boolean {
    if (this.builderNode === null || this.storedTouchEvent === null) {
      return false;
    }
    try {
      let node: FrameNode | null = this.builderNode.getFrameNode();
      let offsetX: number | null | undefined = node?.getPositionToParent().x;
      let offsetY: number | null | undefined = node?.getPositionToParent().y;
      let touchEvent = this.storedTouchEvent;
      let changedTouchLen = touchEvent.changedTouches.length;
      for (let i = 0; i < changedTouchLen; i++) {
        if (offsetX != null && offsetY != null && offsetX != undefined && offsetY != undefined) {
          touchEvent.changedTouches[i].windowX = uiContext.vp2px(offsetX + touchEvent.changedTouches[i].x);
          touchEvent.changedTouches[i].windowY = uiContext.vp2px(offsetY + touchEvent.changedTouches[i].y);
        }
      }
      let touchesLen = touchEvent.touches.length;
      for (let i = 0; i < touchesLen; i++) {
        if (offsetX != null && offsetY != null && offsetX != undefined && offsetY != undefined) {
          touchEvent.touches[i].windowX = uiContext.vp2px(offsetX + touchEvent.touches[i].x);
          touchEvent.touches[i].windowY = uiContext.vp2px(offsetY + touchEvent.touches[i].y);
        }
      }
      return this.builderNode.postInputEventWithStrategy(touchEvent, undefined);
    } catch (err) {
      console.error('testStrategyUndefined error: ' + err);
      return false;
    }
  }

  postTouchEvent(event: TouchEvent, uiContext: UIContext, strategy?: CompetitionStrategy): boolean {
    if (this.builderNode === null) {
      return false;
    }
    try {
      let node: FrameNode | null = this.builderNode.getFrameNode();
      let offsetX: number | null | undefined = node?.getPositionToParent().x;
      let offsetY: number | null | undefined = node?.getPositionToParent().y;

      let touchEvent = event as TouchEvent;
      let changedTouchLen = touchEvent.changedTouches.length;
      for (let i = 0; i < changedTouchLen; i++) {
        if (offsetX != null && offsetY != null && offsetX != undefined && offsetY != undefined) {
          touchEvent.changedTouches[i].windowX = uiContext.vp2px(offsetX + touchEvent.changedTouches[i].x);
          touchEvent.changedTouches[i].windowY = uiContext.vp2px(offsetY + touchEvent.changedTouches[i].y);
        }
      }
      let touchesLen = touchEvent.touches.length;
      for (let i = 0; i < touchesLen; i++) {
        if (offsetX != null && offsetY != null && offsetX != undefined && offsetY != undefined) {
          touchEvent.touches[i].windowX = uiContext.vp2px(offsetX + touchEvent.touches[i].x);
          touchEvent.touches[i].windowY = uiContext.vp2px(offsetY + touchEvent.touches[i].y);
        }
      }

      let result = this.builderNode.postInputEventWithStrategy(event, strategy);
      return result;
    } catch (err) {
      console.error('postTouchEvent error: ' + err);
      return false;
    }
  }

  postMouseEvent(event: MouseEvent, uiContext: UIContext, strategy?: CompetitionStrategy): boolean {
    if (this.builderNode === null) {
      return false;
    }
    try {
      let node: FrameNode | null = this.builderNode.getFrameNode();
      let offsetX: number | null | undefined = node?.getPositionToParent().x;
      let offsetY: number | null | undefined = node?.getPositionToParent().y;

      let mouseEvent = event as MouseEvent;
      if (offsetX != null && offsetY != null && offsetX != undefined && offsetY != undefined) {
        mouseEvent.windowX = uiContext.vp2px(offsetX + mouseEvent.x);
        mouseEvent.windowY = uiContext.vp2px(offsetY + mouseEvent.y);
      }

      let result = this.builderNode.postInputEventWithStrategy(event, strategy);
      return result;
    } catch (err) {
      console.error('postMouseEvent error: ' + err);
      return false;
    }
  }

  postAxisEvent(event: AxisEvent, uiContext: UIContext, strategy?: CompetitionStrategy): boolean {
    if (this.builderNode === null) {
      return false;
    }
    try {
      let node: FrameNode | null = this.builderNode.getFrameNode();
      let offsetX: number | null | undefined = node?.getPositionToParent().x;
      let offsetY: number | null | undefined = node?.getPositionToParent().y;

      let axisEvent = event as AxisEvent;
      if (offsetX != null && offsetY != null && offsetX != undefined && offsetY != undefined) {
        axisEvent.windowX = uiContext.vp2px(offsetX + axisEvent.x);
        axisEvent.windowY = uiContext.vp2px(offsetY + axisEvent.y);
      }

      let result = this.builderNode.postInputEventWithStrategy(event, strategy);
      return result;
    } catch (err) {
      console.error('postAxisEvent error: ' + err);
      return false;
    }
  }
}

@Entry
@Component
struct PostInputEventWithStrategyTest {
  @State postInputEventWithStrategyResultText: string = 'Init';
  @State currentStrategy: CompetitionStrategy = CompetitionStrategy.DEFAULT;
  private nodeController: MyNodeController = new MyNodeController();

  build() {
    Column() {
      Text('PostInputEventWithStrategy Test')
        .fontWeight(FontWeight.Bold)
        .width('100%')
        .textAlign(TextAlign.Center)
        .height('5%')

      Text(this.postInputEventWithStrategyResultText)
        .id('postInputEventWithStrategyResultText')
        .width('100%')
        .height('5%')
        .backgroundColor('#FFCCCCCC')
        .textAlign(TextAlign.Center)

      Stack() {
        NodeContainer(this.nodeController)
          .width('100%')
          .height('25%')

        Column()
          .width('100%')
          .height('25%')
          .backgroundColor(Color.Transparent)
          .id('eventArea')
          .onTouch((event: TouchEvent) => {
            this.nodeController.setStoredTouchEvent(event);
            let result = this.nodeController.postTouchEvent(event, this.getUIContext(), this.currentStrategy);
            this.postInputEventWithStrategyResultText = 'Touch_' + (this.currentStrategy === CompetitionStrategy.DEFAULT ? 'DEFAULT' : 'COMPETITION') + ': ' + result;
            console.info('onTouch result: ' + result);
          })
          .onMouse((event: MouseEvent) => {
            if (event != undefined) {
              let result = this.nodeController.postMouseEvent(event, this.getUIContext(), this.currentStrategy);
              this.postInputEventWithStrategyResultText = 'Mouse_' + (this.currentStrategy === CompetitionStrategy.DEFAULT ? 'DEFAULT' : 'COMPETITION') + ': ' + result;
              console.info('onMouse result: ' + result);
            }
          })
          .onAxisEvent((event: AxisEvent) => {
            if (event != undefined) {
              let result = this.nodeController.postAxisEvent(event, this.getUIContext(), this.currentStrategy);
              this.postInputEventWithStrategyResultText = 'Axis_' + (this.currentStrategy === CompetitionStrategy.DEFAULT ? 'DEFAULT' : 'COMPETITION') + ': ' + result;
              console.info('onAxisEvent result: ' + result);
            }
          })
      }
      .width('100%')
      .height('25%')
      .margin({ top: '1%' })

      Row() {
        Button('Event Null')
          .id('btnEventNull')
          .width('45%')
          .height('100%')
          .onClick(() => {
            let result = this.nodeController.testNullEvent();
            this.postInputEventWithStrategyResultText = 'EventNull: ' + result;
          })

        Button('Event Undefined')
          .id('btnEventUndefined')
          .width('45%')
          .height('100%')
          .onClick(() => {
            let result = this.nodeController.testUndefinedEvent();
            this.postInputEventWithStrategyResultText = 'EventUndefined: ' + result;
          })
      }
      .width('100%')
      .height('7%')
      .justifyContent(FlexAlign.SpaceAround)
      .margin({ top: '2%' })

      Row() {
        Button('Strategy Null')
          .id('btnStrategyNull')
          .width('45%')
          .height('100%')
          .onClick(() => {
            let result = this.nodeController.testStrategyNull(this.getUIContext());
            this.postInputEventWithStrategyResultText = 'StrategyNull: ' + result;
          })

        Button('Strategy Undefined')
          .id('btnStrategyUndefined')
          .width('45%')
          .height('100%')
          .onClick(() => {
            let result = this.nodeController.testStrategyUndefined(this.getUIContext());
            this.postInputEventWithStrategyResultText = 'StrategyUndefined: ' + result;
          })
      }
      .width('100%')
      .height('7%')
      .justifyContent(FlexAlign.SpaceAround)
      .margin({ top: '2%' })

      Row() {
        Button('DEFAULT')
          .id('btnDefault')
          .width('45%')
          .height('100%')
          .backgroundColor(this.currentStrategy === CompetitionStrategy.DEFAULT ? Color.Blue : Color.Gray)
          .onClick(() => {
            this.currentStrategy = CompetitionStrategy.DEFAULT;
            this.postInputEventWithStrategyResultText = 'Strategy: DEFAULT';
          })

        Button('COMPETITION')
          .id('btnCompetition')
          .width('45%')
          .height('100%')
          .backgroundColor(this.currentStrategy === CompetitionStrategy.COMPETITION ? Color.Blue : Color.Gray)
          .onClick(() => {
            this.currentStrategy = CompetitionStrategy.COMPETITION;
            this.postInputEventWithStrategyResultText = 'Strategy: COMPETITION';
          })
      }
      .width('100%')
      .height('7%')
      .justifyContent(FlexAlign.SpaceAround)
      .margin({ top: '2%' })
    }
    .width('100%')
    .height('90%')
    .padding('2%')
  }
}