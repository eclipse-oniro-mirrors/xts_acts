/**
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

import { NodeContent, typeNode } from '@kit.ArkUI';

class NodeContentCtrl {
  public content: NodeContent;
  public textNode: typeNode.Text[] = [];
  public uiContext: UIContext;
  public width: number;

  constructor(uiContext: UIContext) {
    this.content = new NodeContent();
    this.uiContext = uiContext;
    this.width = Infinity;
  }

  AddNode() {
    let node = typeNode.createNode(this.uiContext, 'Text');
    node.initialize('ContentText:' + this.textNode.length).fontSize(20);
    this.textNode.push(node);
    try {
      this.content.addFrameNode(null);
    } catch (error) {
      console.info('error code is error')
    }
    try {
      this.content.addFrameNode(undefined);
    } catch (error) {
      console.info('error code is error')
    }
  }

  RemoveNode() {
    this.content.removeFrameNode(null);
  }

  RemoveFront() {
    this.content.removeFrameNode(undefined);
  }

  GetContent(): NodeContent {
    return this.content;
  }
}

@Entry
@Component
struct nodeContentApiNullUndefined {
  @State str :string = 'hello'
  controller = new NodeContentCtrl(this.getUIContext());

  build() {
    Column() {
      Column({space:5}) {
        ContentSlot(this.controller.GetContent())
        Text(this.str).height(25).id('nodeContentApiNullUndefinedText')
        Button('AddToSlot')
          .onClick(() => {
            this.controller.AddNode();
            this.str = 'addFrameNode'
          })
          .width(90)
          .height(25)
          .id('nodeContentAddToSlot')
        Button('RemoveBack')
          .onClick(() => {
            this.controller.RemoveNode();
            this.str = 'removeFrameNode'
          })
          .width(90)
          .height(25)
          .id('nodeContentRemoveBack')
        Button('RemoveFront')
          .onClick(() => {
            this.controller.RemoveFront();
            this.str = 'removeFrameNode'
          })
          .width(90)
          .height(25)
          .id('nodeContentRemoveFront')
      }
    }
    .width('100%')
    .height('100%')
  }
}