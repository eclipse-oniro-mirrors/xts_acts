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

const TEST_TAG: string = 'FrameNodeConvertPositionToWindow '

export class MyNodeController extends NodeController {
  public frameNode: FrameNode | null = null;

  makeNode(uiContext: UIContext): FrameNode | null {
    this.frameNode = new FrameNode(uiContext);
    this.frameNode?.commonAttribute.width(100).height(100).backgroundColor(Color.Blue);
    return this.frameNode;
  }

  convertPositionToWindow() {
    try {
      if (this.frameNode) {
        this.frameNode!.convertPositionToWindow({ x: 10, y: 10 });
        return `convertPositionToWindow success`
      }
      return 'convertPositionToWindow false'
    } catch (e) {
      console.info(`${TEST_TAG} convertPositionToWindow fail: ${JSON.stringify(e)}`);
      return 'convertPositionToWindow false'
    }
  }
}

@Entry
@Component
struct FrameNodeConvertPositionToWindow {
  private myNodeController: MyNodeController = new MyNodeController();
  @State convertResult: string = ''

  build() {
    Column() {
      Text(`FrameNode ConvertPositionToWindow Test`)
        .fontSize(8)
        .height('5%')


      NodeContainer(this.myNodeController)
        .borderWidth(1)
        .width('60%')
        .height('20%')


      Button(`convertPositionToWindow`)
        .id('ButtonConvertPositionToWindow')
        .width('40%')
        .height('5%')

        .onClick(() => {
          this.convertResult = this.myNodeController.convertPositionToWindow();
        })

      Text(this.convertResult)
        .id('convertResultConvertPositionToWindow')
        .height('5%')
        .fontSize(8)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}