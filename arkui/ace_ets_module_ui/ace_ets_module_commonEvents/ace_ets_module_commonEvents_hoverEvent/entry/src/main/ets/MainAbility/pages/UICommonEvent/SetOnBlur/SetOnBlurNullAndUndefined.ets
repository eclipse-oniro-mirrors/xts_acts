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

class SetOnBlurNullController extends NodeController {
  public node: FrameNode | null = null;
  public blurResult: string = 'Init';

  makeNode(uiContext: UIContext): FrameNode | null {
    this.node = new FrameNode(uiContext);
    this.node.commonAttribute
      .width('100%')
      .height('5%')
      .backgroundColor('#FF0000FF')
      .focusable(true)
      .align(Alignment.Center);
    
    let text = typeNode.createNode(uiContext, 'Text');
    text.initialize('setOnBlur null');
    this.node.appendChild(text);

    this.node.commonEvent.setOnBlur(() => {
      this.blurResult = 'setOnBlurNullTriggered';
    });
    
    this.node.commonEvent.setOnBlur(null);
    
    return this.node;
  }
}

class SetOnBlurUndefinedController extends NodeController {
  public node: FrameNode | null = null;
  public blurResult: string = 'Init';

  makeNode(uiContext: UIContext): FrameNode | null {
    this.node = new FrameNode(uiContext);
    this.node.commonAttribute
      .width('100%')
      .height('5%')
      .backgroundColor('#FF00FF00')
      .focusable(true)
      .align(Alignment.Center);
    
    let text = typeNode.createNode(uiContext, 'Text');
    text.initialize('setOnBlur undefined');
    this.node.appendChild(text);

    this.node.commonEvent.setOnBlur(() => {
      this.blurResult = 'setOnBlurUndefinedTriggered';
    });
    
    this.node.commonEvent.setOnBlur(undefined);
    
    return this.node;
  }
}

@Entry
@Component
struct SetOnBlurPropertyTest {
  @State setOnBlurNullResult: string = 'Init';
  @State setOnBlurUndefinedResult: string = 'Init';
  
  private nodeNull: SetOnBlurNullController = new SetOnBlurNullController();
  private nodeUndefined: SetOnBlurUndefinedController = new SetOnBlurUndefinedController();

  build() {
    Column() {
      Text('SetOnBlur Property Test')
        .fontWeight(FontWeight.Bold)
        .width('100%')
        .textAlign(TextAlign.Center)

      Text(this.setOnBlurNullResult)
        .id('setOnBlurNullResult')
        .width('100%')
        .height('5%')
        .backgroundColor('#FFCCCCCC')
        .textAlign(TextAlign.Center)

      Text(this.setOnBlurUndefinedResult)
        .id('setOnBlurUndefinedResult')
        .width('100%')
        .height('5%')
        .backgroundColor('#FFCCCCCC')
        .textAlign(TextAlign.Center)

      NodeContainer(this.nodeNull)
        .id('setOnBlurNullBtn')
        .width('100%')
        .height('5%')

      NodeContainer(this.nodeUndefined)
        .id('setOnBlurUndefinedBtn')
        .width('100%')
        .height('5%')

      Button('Check Null')
        .id('checkNullBtn')
        .width('100%')
        .height('5%')
        .onClick(() => {
          this.setOnBlurNullResult = this.nodeNull.blurResult;
        })

      Button('Check Undefined')
        .id('checkUndefinedBtn')
        .width('100%')
        .height('5%')
        .onClick(() => {
          this.setOnBlurUndefinedResult = this.nodeUndefined.blurResult;
        })
    }
    .width('100%')
    .height('100%')
  }
}
