/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { FrameNode, LengthMetrics, NodeController, typeNode, UIContext, UIState } from '@kit.ArkUI';
import { logger } from '../../common/Logger';
import { IFrameNode, StyleCallback } from '../../common/StyleCallback';

export class RadioNodeListController extends NodeController {
  private rootNode: typeNode.Column | null = null;
  private isEnable: boolean = true;
  private supportUIState = UIState.NORMAL | UIState.PRESSED | UIState.FOCUSED | UIState.DISABLED | UIState.SELECTED;
  private onUIStyleStateChange: StyleCallback = (currentUIStates: number, node: IFrameNode) => {
    if (currentUIStates == UIState.NORMAL) {
      logger.log(`currentUIStates:  NORMAL${currentUIStates}`);
      node.initialize('NORMAL')
    }
    if ((currentUIStates & UIState.PRESSED) == UIState.PRESSED) {
      node.attribute.backgroundColor(Color.Red);
      logger.log(`currentUIStates:  PRESSED${currentUIStates}`);
    }
    if ((currentUIStates & UIState.FOCUSED) == UIState.FOCUSED) {
      logger.log(`currentUIStates:  FOCUSED${currentUIStates}`);
      node.initialize('FOCUSED')
    }

    if ((currentUIStates & UIState.DISABLED) == UIState.DISABLED) {
      logger.log(`currentUIStates:  DISABLED${currentUIStates}`);
      node.initialize('DISABLED')
    }

    if ((currentUIStates & UIState.SELECTED) == UIState.SELECTED) {
      logger.log(`currentUIStates:  SELECTED${currentUIStates}`);
      node.initialize('DISABLED')
    }
  };

  makeNode(uiContext: UIContext): FrameNode | null {
    this.rootNode = typeNode.createNode(uiContext, 'Column');
    this.rootNode.initialize({ space: 32 })
      .width('100%')
      .height('100%')
      .padding({
        start: LengthMetrics.resource($r('sys.float.padding_level8')),
        end: LengthMetrics.resource($r('sys.float.padding_level8'))
      });

    let column: typeNode.Column = typeNode.createNode(uiContext, 'Column');
    column.initialize({ space: 20 })
      .width('100%')
      .height('100%')
      .backgroundColor($r('sys.color.ohos_id_color_sub_background'))

    let buttonContent: typeNode.Button = typeNode.createNode(uiContext, 'Button')
    buttonContent.initialize('button').backgroundColor(Color.Pink).enabled(this.isEnable).id('buttonTest')
    buttonContent.addSupportedUIStates(this.supportUIState, (node: FrameNode, curState: number) => {
      this.onUIStyleStateChange(curState, buttonContent);
    });
    column.appendChild(buttonContent);

    this.rootNode.appendChild(column);
    let buttonContent1: typeNode.Button = typeNode.createNode(uiContext, 'Button')
    buttonContent1.initialize('button').backgroundColor(Color.Pink).id('buttonDis').onClick(() => {
      this.isEnable = !this.isEnable
      buttonContent.attribute.enabled(this.isEnable)
    })
    column.appendChild(buttonContent1);

    let uiStateRemove: typeNode.Button = typeNode.createNode(uiContext, 'Button')
    uiStateRemove.initialize('RemoveUIStates')
      .id('remove')
      .fontColor($r('sys.color.font_primary'))
      .fontSize($r('sys.float.Body_M'))
      .fontWeight(FontWeight.Bold)
      .height(56)
      .type(ButtonType.Normal)
      .borderRadius($r('sys.float.corner_radius_level16'))
      .onClick(() => {
        buttonContent.removeSupportedUIStates(this.supportUIState);
      });
    column.appendChild(uiStateRemove);
    return this.rootNode;
  }
}

@Entry
@Component
export struct RadioNodeListView {
  private radioNodeListController: RadioNodeListController = new RadioNodeListController();

  build() {
    Column() {
      NodeContainer(this.radioNodeListController)
        .width('100%')
        .height('100%')
    }
    .height('100%')
    .width('100%')
  }
}