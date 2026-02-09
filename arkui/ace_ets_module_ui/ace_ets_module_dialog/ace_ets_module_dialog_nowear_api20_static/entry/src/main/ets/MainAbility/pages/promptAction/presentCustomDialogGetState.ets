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

import { State } from '@ohos.arkui.stateManagement'
import {
  Entry,
  Component,
  NavDestination,
  ClickEvent,
  Column,
  Button,
  Text,
  CustomBuilderT
} from '@ohos.arkui.component'
import { UIContext, PromptAction, TargetInfo } from '@ohos.arkui.UIContext'
import promptAction from '@ohos.promptAction';
import hilog from '@ohos.hilog'


@Entry
@Component
struct PresentGetState {
  @State Flag1: Int = 0;
  @State Flag2: Int = 0;
  @State Flag3: Int = 0;
  @State Flag4: Int = 0;

  @Builder
  customDialogComponentWithId(dialogId: int) {
    Column() {
      Button('点我查询弹窗状态:通过DialogController')
        .onClick(() => {
          console.info('presentCustomDialog state:', this.dialogController3.getState())
        }).margin(20)
      Button('close dialog')
        .onClick(() => {
          this.promptAction.closeCustomDialog(dialogId);
        }).margin(20)
    }
  }

  dialogController3: promptAction.DialogController = new promptAction.DialogController()
  dialogOptions: promptAction.DialogOptions = {
    onDidAppear: () => {
      this.Flag2 = this.dialogController3.getState();
    },
    onDidDisappear: () => {
      this.Flag4 = this.dialogController3.getState();
    },
    onWillAppear: () => {
      this.Flag1 = this.dialogController3.getState();
    },
    onWillDisappear: () => {
      this.Flag3 = this.dialogController3.getState();
    }
  } as promptAction.DialogOptions
  private uiContext: UIContext = this.getUIContext();
  private promptAction: PromptAction = this.uiContext.getPromptAction();

  build() {
    Column() {
      Button(`presentCustomDialog`)
        .id('presentCustomDialog001')
        .onClick(() => {
          try {
            this.promptAction.presentCustomDialog(this.customDialogComponentWithId as CustomBuilderT<int>,
              this.dialogController3, this.dialogOptions)
              .then(() => {
                console.info('presentCustomDialog  success');
              })
              .catch((err: Error) => {
                console.info('presentCustomDialog  error:' + err.code + '+' + err.message);
              })
          } catch (error) {
            let message = (error as Error).message;
            let code = (error as Error).code;
            console.error(`presentCustomDialog error code is ${code}, message is ${message}`);
          }
          ;
        })
      Text(this.Flag1 + '').id('presentCustomDialogFlag1')
      Text(this.Flag2 + '').id('presentCustomDialogFlag2')
      Text(this.Flag3 + '').id('presentCustomDialogFlag3')
      Text(this.Flag4 + '').id('presentCustomDialogFlag4')
    }
  }
}