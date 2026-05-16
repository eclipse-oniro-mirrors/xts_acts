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

class SetOnSizeChangeNullController extends NodeController {
  public node: FrameNode | null = null;
  public sizeChangeResult: string = 'Init';

  makeNode(uiContext: UIContext): FrameNode | null {
    this.node = new FrameNode(uiContext);
    this.node.commonAttribute
      .width('100%')
      .height('5%')
      .backgroundColor('#FF0000FF')
      .align(Alignment.Center);
    
    let text = typeNode.createNode(uiContext, 'Text');
    text.initialize('setOnSizeChange null');
    this.node.appendChild(text);

    this.node.commonEvent.setOnSizeChange((oldValue: Size, newValue: Size) => {
      this.sizeChangeResult = 'setOnSizeChangeNullTriggered';
    });
    
    this.node.commonEvent.setOnSizeChange(null);
    
    return this.node;
  }
}

class SetOnSizeChangeUndefinedController extends NodeController {
  public node: FrameNode | null = null;
  public sizeChangeResult: string = 'Init';

  makeNode(uiContext: UIContext): FrameNode | null {
    this.node = new FrameNode(uiContext);
    this.node.commonAttribute
      .width('100%')
      .height('5%')
      .backgroundColor('#FF00FF00')
      .align(Alignment.Center);
    
    let text = typeNode.createNode(uiContext, 'Text');
    text.initialize('setOnSizeChange undefined');
    this.node.appendChild(text);

    this.node.commonEvent.setOnSizeChange((oldValue: Size, newValue: Size) => {
      this.sizeChangeResult = 'setOnSizeChangeUndefinedTriggered';
    });
    
    this.node.commonEvent.setOnSizeChange(undefined);
    
    return this.node;
  }
}

@Entry
@Component
struct SetOnSizeChangePropertyTest {
  @State setOnSizeChangeNullResult: string = 'Init';
  @State setOnSizeChangeUndefinedResult: string = 'Init';
  
  private nodeNull: SetOnSizeChangeNullController = new SetOnSizeChangeNullController();
  private nodeUndefined: SetOnSizeChangeUndefinedController = new SetOnSizeChangeUndefinedController();

  build() {
    Column() {
      Text('SetOnSizeChange Property Test')
        .fontWeight(FontWeight.Bold)
        .width('100%')
        .textAlign(TextAlign.Center)

      Text(this.setOnSizeChangeNullResult)
        .id('setOnSizeChangeNullResult')
        .width('100%')
        .height('5%')
        .backgroundColor('#FFCCCCCC')
        .textAlign(TextAlign.Center)

      Text(this.setOnSizeChangeUndefinedResult)
        .id('setOnSizeChangeUndefinedResult')
        .width('100%')
        .height('5%')
        .backgroundColor('#FFCCCCCC')
        .textAlign(TextAlign.Center)

      NodeContainer(this.nodeNull)
        .id('setOnSizeChangeNullBtn')
        .width('100%')
        .height('5%')

      NodeContainer(this.nodeUndefined)
        .id('setOnSizeChangeUndefinedBtn')
        .width('100%')
        .height('5%')

      Button('Check Null')
        .id('checkNullBtn')
        .width('100%')
        .height('5%')
        .onClick(() => {
          this.setOnSizeChangeNullResult = this.nodeNull.sizeChangeResult;
        })

      Button('Check Undefined')
        .id('checkUndefinedBtn')
        .width('100%')
        .height('5%')
        .onClick(() => {
          this.setOnSizeChangeUndefinedResult = this.nodeUndefined.sizeChangeResult;
        })
    }
    .width('100%')
    .height('100%')
  }
}
