'use static'
/**
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

import {
  Button,
  Color,
  Column,
  ColumnOptions,
  Component,
  Entry,
  Margin,
  Text,
  FontWeight,
  Margin,
  Row,
  ComponentContent,
  wrapBuilder,
  TransitionEffect,
  ClickEvent
} from '@ohos.arkui.component';
import promptAction from '@ohos.promptAction';
import { UIContext, PromptAction, TargetInfo } from '@ohos.arkui.UIContext'
import { Link, State } from '@ohos.arkui.stateManagement';

@Component
struct ICustomDialog {
  build() {
    Column() {
      Text('Hello')
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 36 } as Margin)
      Button('close dialog')
        .id('getDialogController001')
        .onClick((e: ClickEvent) => {
          const controller = this.getDialogController();
          if (controller) {
            controller.close();
          }
        })
      Button('点我获取状态：通过外部传递的DialogController')
        .onClick((e: ClickEvent) => {
          const controller = this.getDialogController();
          if (controller) {
            let state: promptAction.CommonState = controller.getState();
            console.info('state:' + state);
          }
        })
    }.backgroundColor('#FFF0F0F0')
  }
}

@Builder
function buildText() {
  ICustomDialog()
}

@Entry
@Component
struct Index {
  @State Flag1: Int = 0;
  @State Flag2: Int = 0;
  @State Flag3: Int = 0;
  @State Flag4: Int = 0;
  private dialogController: promptAction.DialogController = new promptAction.DialogController()

  build() {
    Row() {
      Column() {
        Button('click me')
          .id('openCustomDialogWithController001')
          .onClick(() => {
            let uiContext = this.getUIContext();
            let promptAction = uiContext.getPromptAction();
            let contentNode = new ComponentContent(uiContext, wrapBuilder(buildText),
            );
            promptAction.openCustomDialogWithController(contentNode, this.dialogController, {
              transition: TransitionEffect.OPACITY.animation({
                duration: 3000
              }),
              onDidAppear: () => {
                this.Flag2 = this.dialogController.getState();
              },
              onDidDisappear: () => {
                this.Flag4 = this.dialogController.getState();
              },
              onWillAppear: () => {
                this.Flag1 = this.dialogController.getState();
              },
              onWillDisappear: () => {
                this.Flag3 = this.dialogController.getState();
              }
            })
          }).margin({top: '2%'} as Margin)
        Text(this.Flag1+'').id('openCustomDialogWithControllerFlag1')
        Text(this.Flag2+'').id('openCustomDialogWithControllerFlag2')
        Text(this.Flag3+'').id('openCustomDialogWithControllerFlag3')
        Text(this.Flag4+'').id('openCustomDialogWithControllerFlag4')
      }
      .width('100%')
      .height('100%')
    }
    .height('100%')
  }
}