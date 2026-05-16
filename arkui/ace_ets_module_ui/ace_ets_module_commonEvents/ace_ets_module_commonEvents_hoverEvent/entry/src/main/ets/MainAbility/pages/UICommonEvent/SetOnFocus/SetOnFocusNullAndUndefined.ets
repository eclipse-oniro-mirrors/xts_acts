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

class SetOnFocusNullController extends NodeController {
  public node: FrameNode | null = null;
  public focusResult: string = 'Init';

  makeNode(uiContext: UIContext): FrameNode | null {
    this.node = new FrameNode(uiContext);
    this.node.commonAttribute
      .width('100%')
      .height('5%')
      .backgroundColor('#FF0000FF')
      .focusable(true)
      .align(Alignment.Center);
    
    let text = typeNode.createNode(uiContext, 'Text');
    text.initialize('setOnFocus null');
    this.node.appendChild(text);

    this.node.commonEvent.setOnFocus(() => {
      this.focusResult = 'setOnFocusNullTriggered';
    });
    
    this.node.commonEvent.setOnFocus(null);
    
    return this.node;
  }
}

class SetOnFocusUndefinedController extends NodeController {
  public node: FrameNode | null = null;
  public focusResult: string = 'Init';

  makeNode(uiContext: UIContext): FrameNode | null {
    this.node = new FrameNode(uiContext);
    this.node.commonAttribute
      .width('100%')
      .height('5%')
      .backgroundColor('#FF00FF00')
      .focusable(true)
      .align(Alignment.Center);
    
    let text = typeNode.createNode(uiContext, 'Text');
    text.initialize('setOnFocus undefined');
    this.node.appendChild(text);

    this.node.commonEvent.setOnFocus(() => {
      this.focusResult = 'setOnFocusUndefinedTriggered';
    });
    
    this.node.commonEvent.setOnFocus(undefined);
    
    return this.node;
  }
}

@Entry
@Component
struct SetOnFocusPropertyTest {
  @State setOnFocusNullResult: string = 'Init';
  @State setOnFocusUndefinedResult: string = 'Init';
  
  private nodeNull: SetOnFocusNullController = new SetOnFocusNullController();
  private nodeUndefined: SetOnFocusUndefinedController = new SetOnFocusUndefinedController();

  build() {
    Column() {
      Text('SetOnFocus Property Test')
        .fontWeight(FontWeight.Bold)
        .width('100%')
        .textAlign(TextAlign.Center)

      Text(this.setOnFocusNullResult)
        .id('setOnFocusNullResult')
        .width('100%')
        .height('5%')
        .backgroundColor('#FFCCCCCC')
        .textAlign(TextAlign.Center)

      Text(this.setOnFocusUndefinedResult)
        .id('setOnFocusUndefinedResult')
        .width('100%')
        .height('5%')
        .backgroundColor('#FFCCCCCC')
        .textAlign(TextAlign.Center)

      NodeContainer(this.nodeNull)
        .id('setOnFocusNullBtn')
        .width('100%')
        .height('5%')

      NodeContainer(this.nodeUndefined)
        .id('setOnFocusUndefinedBtn')
        .width('100%')
        .height('5%')

      Button('Check Null')
        .id('checkNullBtn')
        .width('100%')
        .height('5%')
        .onClick(() => {
          this.setOnFocusNullResult = this.nodeNull.focusResult;
        })

      Button('Check Undefined')
        .id('checkUndefinedBtn')
        .width('100%')
        .height('5%')
        .onClick(() => {
          this.setOnFocusUndefinedResult = this.nodeUndefined.focusResult;
        })
    }
    .width('100%')
    .height('100%')
  }
}
