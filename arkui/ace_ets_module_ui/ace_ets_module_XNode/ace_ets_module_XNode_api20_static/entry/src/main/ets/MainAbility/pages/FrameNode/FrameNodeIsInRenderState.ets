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

const TEST_TAG: string = 'FrameNodeIsInRenderState '

export class MyNodeController extends NodeController {
  public rootNode: FrameNode | null = null;

  makeNode(uiContext: UIContext): FrameNode | null {
    this.rootNode = new FrameNode(uiContext);
    this.rootNode?.commonAttribute.width(100).height(100).backgroundColor(Color.Blue);
    return this.rootNode;
  }

  checkRenderState() {
    try {
      if (this.rootNode) {
        const inRenderState = this.rootNode?.isInRenderState();
        return `isInRenderState: ${inRenderState}`
      }
      return 'isInRenderState false'
    } catch (e) {
      console.info(`${TEST_TAG} isInRenderState fail: ${JSON.stringify(e)}`);
      return 'isInRenderState false'
    }
  }
}

@Entry
@Component
struct FrameNodeIsInRenderState {
  private myNodeController: MyNodeController = new MyNodeController();
  @State renderStateResult: string = ''

  build() {
    Column() {
      Text(`FrameNode IsInRenderState Test`)
        .fontSize(16)
        .height('5%')

      NodeContainer(this.myNodeController)
        .borderWidth(1)
        .width('60%')
        .height('20%')


      Button(`isInRenderState`)
        .id('ButtonIsInRenderState')
        .width('30%')
        .height('5%')

        .onClick(() => {
          this.renderStateResult = this.myNodeController.checkRenderState();
        })

      Text(this.renderStateResult)
        .id('renderStateResult')
        .height('5%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}