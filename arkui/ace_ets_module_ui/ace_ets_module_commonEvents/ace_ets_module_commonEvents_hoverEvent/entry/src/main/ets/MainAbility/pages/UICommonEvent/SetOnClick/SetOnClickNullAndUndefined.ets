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

class SetOnClickNullController extends NodeController {
  public node: FrameNode | null = null;
  public clickResult: string = 'Init';

  makeNode(uiContext: UIContext): FrameNode | null {
    this.node = new FrameNode(uiContext);
    this.node.commonAttribute
      .width('100%')
      .height('5%')
      .backgroundColor('#FF0000FF')
      .align(Alignment.Center);
    
    let text = typeNode.createNode(uiContext, 'Text');
    text.initialize('setOnClick null');
    this.node.appendChild(text);

    this.node.commonEvent.setOnClick((event: ClickEvent) => {
      this.clickResult = 'setOnClickNullTriggered';
    });
    
    this.node.commonEvent.setOnClick(null);
    
    return this.node;
  }
}

class SetOnClickUndefinedController extends NodeController {
  public node: FrameNode | null = null;
  public clickResult: string = 'Init';

  makeNode(uiContext: UIContext): FrameNode | null {
    this.node = new FrameNode(uiContext);
    this.node.commonAttribute
      .width('100%')
      .height('5%')
      .backgroundColor('#FF00FF00')
      .align(Alignment.Center);
    
    let text = typeNode.createNode(uiContext, 'Text');
    text.initialize('setOnClick undefined');
    this.node.appendChild(text);

    this.node.commonEvent.setOnClick((event: ClickEvent) => {
      this.clickResult = 'setOnClickUndefinedTriggered';
    });
    
    this.node.commonEvent.setOnClick(undefined);
    
    return this.node;
  }
}

@Entry
@Component
struct SetOnClickPropertyTest {
  @State setOnClickNullResult: string = 'Init';
  @State setOnClickUndefinedResult: string = 'Init';
  
  private nodeNull: SetOnClickNullController = new SetOnClickNullController();
  private nodeUndefined: SetOnClickUndefinedController = new SetOnClickUndefinedController();

  build() {
    Column() {
      Text('SetOnClick Property Test')
        .fontWeight(FontWeight.Bold)
        .width('100%')
        .textAlign(TextAlign.Center)

      Text(this.setOnClickNullResult)
        .id('setOnClickNullResult')
        .width('100%')
        .height('5%')
        .backgroundColor('#FFCCCCCC')
        .textAlign(TextAlign.Center)

      Text(this.setOnClickUndefinedResult)
        .id('setOnClickUndefinedResult')
        .width('100%')
        .height('5%')
        .backgroundColor('#FFCCCCCC')
        .textAlign(TextAlign.Center)

      NodeContainer(this.nodeNull)
        .id('setOnClickNullBtn')
        .width('100%')
        .height('5%')

      NodeContainer(this.nodeUndefined)
        .id('setOnClickUndefinedBtn')
        .width('100%')
        .height('5%')

      Button('Check Null')
        .id('checkNullBtn')
        .width('100%')
        .height('5%')
        .onClick(() => {
          this.setOnClickNullResult = this.nodeNull.clickResult;
        })

      Button('Check Undefined')
        .id('checkUndefinedBtn')
        .width('100%')
        .height('5%')
        .onClick(() => {
          this.setOnClickUndefinedResult = this.nodeUndefined.clickResult;
        })
    }
    .width('100%')
    .height('100%')
  }
}
