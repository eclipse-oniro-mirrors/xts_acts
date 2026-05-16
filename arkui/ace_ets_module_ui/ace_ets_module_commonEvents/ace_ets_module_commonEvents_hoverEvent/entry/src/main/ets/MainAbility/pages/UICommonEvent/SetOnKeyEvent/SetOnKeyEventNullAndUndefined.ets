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

class SetOnKeyEventNullController extends NodeController {
  public node: FrameNode | null = null;
  public keyEventResult: string = 'Init';

  makeNode(uiContext: UIContext): FrameNode | null {
    this.node = new FrameNode(uiContext);
    this.node.commonAttribute
      .width('100%')
      .height('5%')
      .backgroundColor('#FF0000FF')
      .focusable(true)
      .align(Alignment.Center);
    
    let text = typeNode.createNode(uiContext, 'Text');
    text.initialize('setOnKeyEvent null');
    this.node.appendChild(text);

    this.node.commonEvent.setOnKeyEvent((event: KeyEvent) => {
      this.keyEventResult = 'setOnKeyEventNullTriggered';
    });
    
    this.node.commonEvent.setOnKeyEvent(null);
    
    return this.node;
  }
}

class SetOnKeyEventUndefinedController extends NodeController {
  public node: FrameNode | null = null;
  public keyEventResult: string = 'Init';

  makeNode(uiContext: UIContext): FrameNode | null {
    this.node = new FrameNode(uiContext);
    this.node.commonAttribute
      .width('100%')
      .height('5%')
      .backgroundColor('#FF00FF00')
      .focusable(true)
      .align(Alignment.Center);
    
    let text = typeNode.createNode(uiContext, 'Text');
    text.initialize('setOnKeyEvent undefined');
    this.node.appendChild(text);

    this.node.commonEvent.setOnKeyEvent((event: KeyEvent) => {
      this.keyEventResult = 'setOnKeyEventUndefinedTriggered';
    });
    
    this.node.commonEvent.setOnKeyEvent(undefined);
    
    return this.node;
  }
}

@Entry
@Component
struct SetOnKeyEventPropertyTest {
  @State setOnKeyEventNullResult: string = 'Init';
  @State setOnKeyEventUndefinedResult: string = 'Init';
  
  private nodeNull: SetOnKeyEventNullController = new SetOnKeyEventNullController();
  private nodeUndefined: SetOnKeyEventUndefinedController = new SetOnKeyEventUndefinedController();

  build() {
    Column() {
      Text('SetOnKeyEvent Property Test')
        .fontWeight(FontWeight.Bold)
        .width('100%')
        .textAlign(TextAlign.Center)

      Text(this.setOnKeyEventNullResult)
        .id('setOnKeyEventNullResult')
        .width('100%')
        .height('5%')
        .backgroundColor('#FFCCCCCC')
        .textAlign(TextAlign.Center)

      Text(this.setOnKeyEventUndefinedResult)
        .id('setOnKeyEventUndefinedResult')
        .width('100%')
        .height('5%')
        .backgroundColor('#FFCCCCCC')
        .textAlign(TextAlign.Center)

      NodeContainer(this.nodeNull)
        .id('setOnKeyEventNullBtn')
        .width('100%')
        .height('5%')

      NodeContainer(this.nodeUndefined)
        .id('setOnKeyEventUndefinedBtn')
        .width('100%')
        .height('5%')

      Button('Check Null')
        .id('checkNullBtn')
        .width('100%')
        .height('5%')
        .onClick(() => {
          this.setOnKeyEventNullResult = this.nodeNull.keyEventResult;
        })

      Button('Check Undefined')
        .id('checkUndefinedBtn')
        .width('100%')
        .height('5%')
        .onClick(() => {
          this.setOnKeyEventUndefinedResult = this.nodeUndefined.keyEventResult;
        })
    }
    .width('100%')
    .height('100%')
  }
}
