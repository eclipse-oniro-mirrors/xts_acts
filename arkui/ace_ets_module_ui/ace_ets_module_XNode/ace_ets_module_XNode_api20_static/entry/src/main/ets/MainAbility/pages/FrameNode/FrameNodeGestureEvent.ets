'use static';
/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
  Color
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import { NodeController, FrameNode } from '@ohos.arkui.node';
import { NodeContainer } from '@ohos.arkui.component';
import { UIContext } from '@ohos.arkui.UIContext';
import { PanGestureHandler } from '@kit.ArkUI';

const TEST_TAG: string = 'FrameNodeGestureEvent '

// 继承NodeController实现自定义UI控制器
export class MyNodeController extends NodeController {
  public rootNode: FrameNode | null = null;

  makeNode(uiContext: UIContext): FrameNode | null {
    this.rootNode = new FrameNode(uiContext);
    return this.rootNode;
  }

  addGestureEvent() {
    try {
      this.rootNode?.gestureEvent.addGesture(new PanGestureHandler()
        .onActionStart(() => {
          console.info(`${TEST_TAG} Pan start`);
        })
      )
      return 'GestureEvent success'
    }catch (e) {
      console.info(`${TEST_TAG} adoptChild fail: ${JSON.stringify(e)}`);
      return 'GestureEvent false'
    }
  }
}

@Entry
@Component
struct FrameNodeGestureEvent {
  private myNodeController: MyNodeController = new MyNodeController();
  @State addGestureEventResult: string = ''

  build() {
    Column() {
      Text('FrameNode GestureEvent Test')
        .fontSize(8)
        .height('5%')

      NodeContainer(this.myNodeController)
        .borderWidth(1)
        .width('60%')
        .height('20%')
        .backgroundColor(Color.Pink)

      Button(`GestureEvent`)
        .id('ButtonGestureEvent')
        .width('30%')
        .height('30%')
        .onClick(() => {
          this.addGestureEventResult = this.myNodeController.addGestureEvent();
        })
      Text(this.addGestureEventResult)
        .id('addGestureEventResult')
        .height('5%')
        .fontSize(8)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}