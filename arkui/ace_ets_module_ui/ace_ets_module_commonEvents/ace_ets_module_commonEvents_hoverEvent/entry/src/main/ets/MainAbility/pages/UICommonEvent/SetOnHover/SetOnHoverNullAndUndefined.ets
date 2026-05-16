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

class SetOnHoverNullController extends NodeController {
  public node: FrameNode | null = null;
  public hoverResult: string = 'Init';

  makeNode(uiContext: UIContext): FrameNode | null {
    this.node = new FrameNode(uiContext);
    this.node.commonAttribute
      .width('100%')
      .height('5%')
      .backgroundColor('#FF0000FF')
      .align(Alignment.Center);
    
    let text = typeNode.createNode(uiContext, 'Text');
    text.initialize('setOnHover null');
    this.node.appendChild(text);

    this.node.commonEvent.setOnHover((isHover: boolean) => {
      this.hoverResult = 'setOnHoverNullTriggered';
    });
    
    this.node.commonEvent.setOnHover(null);
    
    return this.node;
  }
}

class SetOnHoverUndefinedController extends NodeController {
  public node: FrameNode | null = null;
  public hoverResult: string = 'Init';

  makeNode(uiContext: UIContext): FrameNode | null {
    this.node = new FrameNode(uiContext);
    this.node.commonAttribute
      .width('100%')
      .height('5%')
      .backgroundColor('#FF00FF00')
      .align(Alignment.Center);
    
    let text = typeNode.createNode(uiContext, 'Text');
    text.initialize('setOnHover undefined');
    this.node.appendChild(text);

    this.node.commonEvent.setOnHover((isHover: boolean) => {
      this.hoverResult = 'setOnHoverUndefinedTriggered';
    });
    
    this.node.commonEvent.setOnHover(undefined);
    
    return this.node;
  }
}

@Entry
@Component
struct SetOnHoverPropertyTest {
  @State setOnHoverNullResult: string = 'Init';
  @State setOnHoverUndefinedResult: string = 'Init';
  
  private nodeNull: SetOnHoverNullController = new SetOnHoverNullController();
  private nodeUndefined: SetOnHoverUndefinedController = new SetOnHoverUndefinedController();

  build() {
    Column() {
      Text('SetOnHover Property Test')
        .fontWeight(FontWeight.Bold)
        .width('100%')
        .textAlign(TextAlign.Center)

      Text(this.setOnHoverNullResult)
        .id('setOnHoverNullResult')
        .width('100%')
        .height('5%')
        .backgroundColor('#FFCCCCCC')
        .textAlign(TextAlign.Center)

      Text(this.setOnHoverUndefinedResult)
        .id('setOnHoverUndefinedResult')
        .width('100%')
        .height('5%')
        .backgroundColor('#FFCCCCCC')
        .textAlign(TextAlign.Center)

      NodeContainer(this.nodeNull)
        .id('setOnHoverNullBtn')
        .width('100%')
        .height('5%')

      NodeContainer(this.nodeUndefined)
        .id('setOnHoverUndefinedBtn')
        .width('100%')
        .height('5%')

      Button('Check Null')
        .id('checkNullBtn')
        .width('100%')
        .height('5%')
        .onClick(() => {
          this.setOnHoverNullResult = this.nodeNull.hoverResult;
        })

      Button('Check Undefined')
        .id('checkUndefinedBtn')
        .width('100%')
        .height('5%')
        .onClick(() => {
          this.setOnHoverUndefinedResult = this.nodeUndefined.hoverResult;
        })
    }
    .width('100%')
    .height('100%')
  }
}
