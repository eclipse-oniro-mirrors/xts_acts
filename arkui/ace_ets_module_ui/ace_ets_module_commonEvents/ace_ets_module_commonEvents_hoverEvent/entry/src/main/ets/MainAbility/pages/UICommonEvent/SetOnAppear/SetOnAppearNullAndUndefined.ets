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

class SetOnAppearNullController extends NodeController {
  public node: FrameNode | null = null;
  public appearResult: string = 'Init';

  makeNode(uiContext: UIContext): FrameNode | null {
    this.node = new FrameNode(uiContext);
    this.node.commonAttribute
      .width('100%')
      .height('5%')
      .backgroundColor('#FF0000FF')
      .align(Alignment.Center);
    
    let text = typeNode.createNode(uiContext, 'Text');
    text.initialize('setOnAppear null');
    this.node.appendChild(text);

    this.node.commonEvent.setOnAppear(() => {
      this.appearResult = 'setOnAppearNullTriggered';
    });
    
    this.node.commonEvent.setOnAppear(null);
    
    return this.node;
  }
}

class SetOnAppearUndefinedController extends NodeController {
  public node: FrameNode | null = null;
  public appearResult: string = 'Init';

  makeNode(uiContext: UIContext): FrameNode | null {
    this.node = new FrameNode(uiContext);
    this.node.commonAttribute
      .width('100%')
      .height('5%')
      .backgroundColor('#FF00FF00')
      .align(Alignment.Center);
    
    let text = typeNode.createNode(uiContext, 'Text');
    text.initialize('setOnAppear undefined');
    this.node.appendChild(text);

    this.node.commonEvent.setOnAppear(() => {
      this.appearResult = 'setOnAppearUndefinedTriggered';
    });
    
    this.node.commonEvent.setOnAppear(undefined);
    
    return this.node;
  }
}

@Entry
@Component
struct SetOnAppearPropertyTest {
  @State setOnAppearNullResult: string = 'Init';
  @State setOnAppearUndefinedResult: string = 'Init';
  
  private nodeNull: SetOnAppearNullController = new SetOnAppearNullController();
  private nodeUndefined: SetOnAppearUndefinedController = new SetOnAppearUndefinedController();

  build() {
    Column() {
      Text('SetOnAppear Property Test')
        .fontWeight(FontWeight.Bold)
        .width('100%')
        .textAlign(TextAlign.Center)

      Text(this.setOnAppearNullResult)
        .id('setOnAppearNullResult')
        .width('100%')
        .height('5%')
        .backgroundColor('#FFCCCCCC')
        .textAlign(TextAlign.Center)

      Text(this.setOnAppearUndefinedResult)
        .id('setOnAppearUndefinedResult')
        .width('100%')
        .height('5%')
        .backgroundColor('#FFCCCCCC')
        .textAlign(TextAlign.Center)

      NodeContainer(this.nodeNull)
        .id('setOnAppearNullBtn')
        .width('100%')
        .height('5%')

      NodeContainer(this.nodeUndefined)
        .id('setOnAppearUndefinedBtn')
        .width('100%')
        .height('5%')

      Button('Check Null')
        .id('checkNullBtn')
        .width('100%')
        .height('5%')
        .onClick(() => {
          this.setOnAppearNullResult = this.nodeNull.appearResult;
        })

      Button('Check Undefined')
        .id('checkUndefinedBtn')
        .width('100%')
        .height('5%')
        .onClick(() => {
          this.setOnAppearUndefinedResult = this.nodeUndefined.appearResult;
        })
    }
    .width('100%')
    .height('100%')
  }
}
