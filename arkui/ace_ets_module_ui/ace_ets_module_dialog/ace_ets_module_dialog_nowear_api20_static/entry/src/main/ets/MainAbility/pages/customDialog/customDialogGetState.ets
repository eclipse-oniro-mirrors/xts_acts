'use static';
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
  Entry,
  Text,
  Column,
  Component,
  Button,
  ClickEvent,
  CustomDialog,
  CustomDialogController
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@CustomDialog
struct CustomDialogExample {
  controller?: CustomDialogController

  build() {
    Column() {
      Button('点我查询弹窗状态:通过自定义组件自带controller')
        .onClick(() => {
          if (this.getDialogController() != undefined) {
            console.info('customDialog state:' + this.getDialogController()?.getState())
          } else {
            console.info('customDialog state: no exist')
          }
        }).margin(20)
      Button('点我查询弹窗状态:通过CustomDialogController ')
        .onClick((e: ClickEvent) => {
          console.info('customDialog state:' + this.controller?.getState())
        }
        ).margin(20)
      Button('close dialog')
        .id('getDialogController001')
        .onClick(() => {
          if (this.getDialogController() != undefined) {
            this.getDialogController()!.close()
            console.info('customDialog state:' + this.getDialogController()?.getState())
          }
        }).margin(20)

    }
  }
}

@Entry
@Component
struct CustomDialogUser {
  @State Flag1: Int = 0;
  @State Flag2: Int = 0;
  @State Flag3: Int = 0;
  @State Flag4: Int = 0;
  dialogController: CustomDialogController = new CustomDialogController({
    builder: CustomDialogExample(),
    onWillAppear: () => {
      this.Flag1 = this.dialogController.getState();
    },
    onDidAppear: () => {
      this.Flag2 = this.dialogController.getState();
    },
    onWillDisappear: () => {
      this.Flag3 = this.dialogController.getState();
    },
    onDidDisappear: () => {
      this.Flag4 = this.dialogController.getState();
    },
  }) as CustomDialogController

  build() {
    Column() {
      Button('click me')
        .id('customDialog001')
        .onClick(() => {
          if (this.dialogController) {
            this.dialogController!.open()
          }
        }).backgroundColor(0x317aff)
      Text(this.Flag1 + '').id('customDialogFlag1')
      Text(this.Flag2 + '').id('customDialogFlag2')
      Text(this.Flag3 + '').id('customDialogFlag3')
      Text(this.Flag4 + '').id('customDialogFlag4')
    }.width('100%').margin(5)
  }
}