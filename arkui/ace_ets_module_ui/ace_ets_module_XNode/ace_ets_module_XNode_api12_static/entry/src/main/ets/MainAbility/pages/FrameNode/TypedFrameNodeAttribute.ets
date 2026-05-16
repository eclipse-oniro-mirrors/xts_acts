'use static';
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

import {
  Entry,
  Text,
  Column,
  Component,
  Color
} from '@ohos.arkui.component';
import { NodeController, FrameNode, typeNode } from '@ohos.arkui.node';
import { NodeContainer } from '@ohos.arkui.component';
import { UIContext } from '@ohos.arkui.UIContext';

const TEST_TAG: string = 'TypedFrameNodeAttribute '

export class MyNodeController extends NodeController {
  public rootNode: FrameNode | null = null;

  makeNode(uiContext: UIContext): FrameNode | null {
    let node = new FrameNode(uiContext);
    node.commonAttribute;
    let col = typeNode.createColumnNode(uiContext);
    col.attribute.width('50%').height('20%').backgroundColor(Color.Pink).id('getAttribute');
    node.appendChild(col);
    return node;
    return this.rootNode;
  }
}

@Entry
@Component
struct TypedFrameNodeAttribute {
  private myNodeController: MyNodeController = new MyNodeController();

  build() {
    Column() {
      Text(`FrameNode CommonAttribute Test`)
        .fontSize(8)
        .height('20%')

      NodeContainer(this.myNodeController)
        .borderWidth(1)
        .width('60%')
        .height('20%')
    }
    .width('100%')
    .height('100%')
    .padding('5%')
    .backgroundColor('#F5F5F5')
  }
}