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

class SetOnMouseNullController extends NodeController {
  public node: FrameNode | null = null;
  public mouseResult: string = 'Init';

  makeNode(uiContext: UIContext): FrameNode | null {
    this.node = new FrameNode(uiContext);
    this.node.commonAttribute
      .width('100%')
      .height('5%')
      .backgroundColor('#FF0000FF')
      .align(Alignment.Center);
    
    let text = typeNode.createNode(uiContext, 'Text');
    text.initialize('setOnMouse null');
    this.node.appendChild(text);

    this.node.commonEvent.setOnMouse((event: MouseEvent) => {
      this.mouseResult = 'setOnMouseNullTriggered';
    });
    
    this.node.commonEvent.setOnMouse(null);
    
    return this.node;
  }
}

class SetOnMouseUndefinedController extends NodeController {
  public node: FrameNode | null = null;
  public mouseResult: string = 'Init';

  makeNode(uiContext: UIContext): FrameNode | null {
    this.node = new FrameNode(uiContext);
    this.node.commonAttribute
      .width('100%')
      .height('5%')
      .backgroundColor('#FF00FF00')
      .align(Alignment.Center);
    
    let text = typeNode.createNode(uiContext, 'Text');
    text.initialize('setOnMouse undefined');
    this.node.appendChild(text);

    this.node.commonEvent.setOnMouse((event: MouseEvent) => {
      this.mouseResult = 'setOnMouseUndefinedTriggered';
    });
    
    this.node.commonEvent.setOnMouse(undefined);
    
    return this.node;
  }
}

@Entry
@Component
struct SetOnMousePropertyTest {
  @State setOnMouseNullResult: string = 'Init';
  @State setOnMouseUndefinedResult: string = 'Init';
  
  private nodeNull: SetOnMouseNullController = new SetOnMouseNullController();
  private nodeUndefined: SetOnMouseUndefinedController = new SetOnMouseUndefinedController();

  build() {
    Column() {
      Text('SetOnMouse Property Test')
        .fontWeight(FontWeight.Bold)
        .width('100%')
        .textAlign(TextAlign.Center)

      Text(this.setOnMouseNullResult)
        .id('setOnMouseNullResult')
        .width('100%')
        .height('5%')
        .backgroundColor('#FFCCCCCC')
        .textAlign(TextAlign.Center)

      Text(this.setOnMouseUndefinedResult)
        .id('setOnMouseUndefinedResult')
        .width('100%')
        .height('5%')
        .backgroundColor('#FFCCCCCC')
        .textAlign(TextAlign.Center)

      NodeContainer(this.nodeNull)
        .id('setOnMouseNullBtn')
        .width('100%')
        .height('5%')

      NodeContainer(this.nodeUndefined)
        .id('setOnMouseUndefinedBtn')
        .width('100%')
        .height('5%')

      Button('Check Null')
        .id('checkNullBtn')
        .width('100%')
        .height('5%')
        .onClick(() => {
          this.setOnMouseNullResult = this.nodeNull.mouseResult;
        })

      Button('Check Undefined')
        .id('checkUndefinedBtn')
        .width('100%')
        .height('5%')
        .onClick(() => {
          this.setOnMouseUndefinedResult = this.nodeUndefined.mouseResult;
        })
    }
    .width('100%')
    .height('100%')
  }
}
