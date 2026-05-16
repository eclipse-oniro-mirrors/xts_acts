'use static';
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {
  Entry,
  Text,
  Column,
  Component,
  Button,
  ClickEvent,
  Alignment,
  Color,
  FlexAlign
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import hilog from '@ohos.hilog';
import { NodeController, FrameNode } from '@ohos.arkui.node';
import { NodeContainer } from '@ohos.arkui.component';
import { UIContext } from '@ohos.arkui.UIContext';

const TEST_TAG: string = 'FrameNode '

// 继承NodeController实现自定义UI控制器
export class MyNodeController extends NodeController {
  public frameNode: FrameNode | null = null;
  public rootNode: FrameNode | null = null;

  makeNode(uiContext: UIContext): FrameNode | null {
    this.rootNode = new FrameNode(uiContext);
    this.frameNode = new FrameNode(uiContext);
    this.addCommonEvent(this.frameNode);
    return this.rootNode;
  }

  addCommonEvent(frameNode: FrameNode | null) {
    frameNode!.commonEvent.setOnClick((event: ClickEvent) => {
      console.info(`${TEST_TAG} Click FrameNode: ${JSON.stringify(event)}`);
    })
  }

  adoptChild() {
    try {
      this.rootNode?.adoptChild(this.frameNode as FrameNode);
      return 'adoptChild success'
    } catch (e) {
      console.info(`${TEST_TAG} adoptChild fail: ${JSON.stringify(e)}`);
      return 'adoptChild false'
    }
  }
}

@Entry
@Component
struct FrameNodeAdoptChild {
  private myNodeController: MyNodeController = new MyNodeController();
  @State adoptChildResult: string = ''

  build() {
    Column() {
      Column() {
        Text(`This is a NodeContainer.`)
          .borderRadius(10)
          .backgroundColor(0xFFFFFF)
          .width('30%')
          .height('30%')
          .fontSize(8)
        NodeContainer(this.myNodeController)
          .borderWidth(1)
          .width('60%')
          .height('60%')
      }
      .width('60%')
      .height('50%')

      Button(`adoptChild`)
        .id('ButtonRemoveAdoptedChild')
        .width('30%')
        .height('30%')
        .onClick(() => {
          this.adoptChildResult = this.myNodeController.adoptChild();
        })

      Text(this.adoptChildResult)
        .id('adoptChildResult')
        .fontSize(8)
        .height('10%')
    }
    .width('100%')
    .height('100%')
  }
}