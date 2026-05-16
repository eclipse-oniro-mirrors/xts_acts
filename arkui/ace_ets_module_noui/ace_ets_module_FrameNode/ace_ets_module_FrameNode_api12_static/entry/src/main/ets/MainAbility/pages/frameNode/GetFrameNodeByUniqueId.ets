'use static';
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

import { Entry, Column, Row, ColumnOptions, Component, Button, ClickEvent, NodeContainer, Color } from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { FrameNode, NodeController, typeNode } from '@ohos.arkui.node'
import { UIContext } from '@ohos.arkui.UIContext';

export class MyNodeController extends NodeController {
  public rootNode: FrameNode | null = null;
  public testUniqueId: int = -1;
  public nonExistentUniqueId: int = 999999;

  makeNode(uiContext: UIContext): FrameNode | null {
    this.rootNode = new FrameNode(uiContext);

    let col = typeNode.createColumnNode(uiContext);
    col.initialize({ space: 5 } as ColumnOptions);
    this.rootNode!.appendChild(col);

    let text1 = typeNode.createTextNode(uiContext);
    text1.initialize('Test Node').id('GetFrameNodeByUniqueId_testNode').width(100).height(50);
    this.testUniqueId = text1.getUniqueId();
    col.appendChild(text1);

    return this.rootNode;
  }

  testValidUniqueId(): void {
    if (this.rootNode) {
      let node = this.rootNode!.getFrameNodeByUniqueId(this.testUniqueId);
      if (node) {
        node.commonAttribute.width(120).height(60);
      }
      AppStorage.setOrCreate<FrameNode | null>('getFrameNodeByUniqueIdValidResult', node);
    }
  }

  testNonExistentUniqueId(): void {
    if (this.rootNode) {
      let node = this.rootNode!.getFrameNodeByUniqueId(this.nonExistentUniqueId);
      AppStorage.setOrCreate<FrameNode | null>('getFrameNodeByUniqueIdNonExistentResult', node);
    }
  }
}

@Entry
@Component
struct FrameNodeGetFrameNodeByUniqueId {
  private myNodeController: MyNodeController = new MyNodeController();

  build() {
    Column({ space: 5 } as ColumnOptions) {
      NodeContainer(this.myNodeController)
        .borderWidth(1)
        .width('90%')
        .height('70%')

      Row() {
        Button('Valid')
          .id('GetFrameNodeByUniqueId_testValidButton')
          .onClick(() => {
            this.myNodeController.testValidUniqueId();
          })

        Button('Non Exist')
          .id('GetFrameNodeByUniqueId_testNonExistentButton')
          .onClick(() => {
            this.myNodeController.testNonExistentUniqueId();
          })
      }.height('20%')
    }.width('100%')
  }
}
