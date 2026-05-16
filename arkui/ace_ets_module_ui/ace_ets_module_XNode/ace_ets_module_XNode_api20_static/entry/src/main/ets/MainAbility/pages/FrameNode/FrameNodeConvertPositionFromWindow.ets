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
  Entry, Text, Column, Component, Button, Color
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import { NodeController, FrameNode } from '@ohos.arkui.node';
import { NodeContainer } from '@ohos.arkui.component';
import { UIContext } from '@ohos.arkui.UIContext';

const TEST_TAG: string = 'FrameNodeConvertPositionFromWindow '

export class MyNodeController extends NodeController {
  public frameNode: FrameNode | null = null;

  makeNode(uiContext: UIContext): FrameNode | null {
    this.frameNode = new FrameNode(uiContext);
    this.frameNode?.commonAttribute.width(100)
      .height(100)
      .backgroundColor(Color.Blue);
    return this.frameNode;
  }

  convertPositionFromWindow() {
    try {
      if (this.frameNode) {
        this.frameNode!.convertPositionFromWindow({ x: 10, y: 10 });
        return `convertPositionFromWindow success`
      }
      return 'convertPositionFromWindow false'
    } catch (e) {
      console.info(`${TEST_TAG} convertPositionFromWindow fail: ${JSON.stringify(e)}`);
      return 'convertPositionFromWindow false'
    }
  }
}

@Entry
@Component
struct FrameNodeConvertPositionFromWindow {
  private myNodeController: MyNodeController = new MyNodeController();
  @State convertResult: string = ''

  build() {
    Column() {
      Text(`FrameNode ConvertPositionFromWindow Test`)
        .fontSize(8)


      NodeContainer(this.myNodeController)
        .borderWidth(1)
        .width('60%')
        .height('20%')


      Button(`convertPositionFromWindow`)
        .id('ButtonConvertPositionFromWindow')
        .width('40%')
        .height('5%')

        .onClick(() => {
          this.convertResult = this.myNodeController.convertPositionFromWindow();
        })

      Text(this.convertResult)
        .id('convertResultConvertPositionFromWindow')
        .height('5%')
        .fontSize(8)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}