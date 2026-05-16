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
import { FrameNode, NodeController, typeNode } from '@kit.ArkUI'

class SetOnTouchNullController extends NodeController {
  public node: FrameNode | null = null;
  public touchResult: string = 'Init';

  makeNode(uiContext: UIContext): FrameNode | null {
    this.node = new FrameNode(uiContext);
    this.node.commonAttribute
      .width('100%')
      .height('5%')
      .backgroundColor('#FF0000FF')
      .align(Alignment.Center);
    
    let text = typeNode.createNode(uiContext, 'Text');
    text.initialize('setOnTouch null');
    this.node.appendChild(text);

    this.node.commonEvent.setOnTouch((event: TouchEvent) => {
      this.touchResult = 'setOnTouchNullTriggered';
    });
    
    this.node.commonEvent.setOnTouch(null);
    
    return this.node;
  }
}

class SetOnTouchUndefinedController extends NodeController {
  public node: FrameNode | null = null;
  public touchResult: string = 'Init';

  makeNode(uiContext: UIContext): FrameNode | null {
    this.node = new FrameNode(uiContext);
    this.node.commonAttribute
      .width('100%')
      .height('5%')
      .backgroundColor('#FF00FF00')
      .align(Alignment.Center);
    
    let text = typeNode.createNode(uiContext, 'Text');
    text.initialize('setOnTouch undefined');
    this.node.appendChild(text);

    this.node.commonEvent.setOnTouch((event: TouchEvent) => {
      this.touchResult = 'setOnTouchUndefinedTriggered';
    });
    
    this.node.commonEvent.setOnTouch(undefined);
    
    return this.node;
  }
}

@Entry
@Component
struct SetOnTouchPropertyTest {
  @State setOnTouchNullResult: string = 'Init';
  @State setOnTouchUndefinedResult: string = 'Init';
  
  private nodeNull: SetOnTouchNullController = new SetOnTouchNullController();
  private nodeUndefined: SetOnTouchUndefinedController = new SetOnTouchUndefinedController();

  build() {
    Column() {
      Text('SetOnTouch Property Test')
        .fontWeight(FontWeight.Bold)
        .width('100%')
        .textAlign(TextAlign.Center)

      Text(this.setOnTouchNullResult)
        .id('setOnTouchNullResult')
        .width('100%')
        .height('5%')
        .backgroundColor('#FFCCCCCC')
        .textAlign(TextAlign.Center)

      Text(this.setOnTouchUndefinedResult)
        .id('setOnTouchUndefinedResult')
        .width('100%')
        .height('5%')
        .backgroundColor('#FFCCCCCC')
        .textAlign(TextAlign.Center)

      NodeContainer(this.nodeNull)
        .id('setOnTouchNullBtn')
        .width('100%')
        .height('5%')

      NodeContainer(this.nodeUndefined)
        .id('setOnTouchUndefinedBtn')
        .width('100%')
        .height('5%')

      Button('Check Null')
        .id('checkNullBtn')
        .width('100%')
        .height('5%')
        .onClick(() => {
          this.setOnTouchNullResult = this.nodeNull.touchResult;
        })

      Button('Check Undefined')
        .id('checkUndefinedBtn')
        .width('100%')
        .height('5%')
        .onClick(() => {
          this.setOnTouchUndefinedResult = this.nodeUndefined.touchResult;
        })
    }
    .width('100%')
    .height('100%')
  }
}
