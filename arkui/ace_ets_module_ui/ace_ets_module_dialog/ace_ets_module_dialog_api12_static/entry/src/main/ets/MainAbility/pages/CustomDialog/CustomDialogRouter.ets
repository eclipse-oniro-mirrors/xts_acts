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
import router from '@ohos.router';

import {
  Entry, Component,
  Column, ColumnOptions, Color,
  Text, Button, ClickEvent, Margin, CustomDialog, CustomDialogController,
  Flex, FlexDirection, ItemAlign, FlexAlign, DismissDialogAction,
} from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext,Router } from '@ohos.arkui.UIContext';
@CustomDialog
struct CustomDialogRouterExample{
  controller?: CustomDialogController

  build() {
    Column() {
      Text('CustomDialog router test').fontSize(20).margin({ top: 10, bottom: 10 } as Margin)

      Button('Go to new page').key('CustomDialogRouterButton')
        .onClick((e:ClickEvent) => {
          let router = AppStorage.get<Router>("router") as Router
          router.pushUrl({url: 'MainAbility/pages/openCustomDialog/openCustomDialog1'})
        })

      Button('Confirm').key('CustomDialogConfirm')
        .onClick((e:ClickEvent) => {
          if (this.controller != undefined) {
            this.controller!.close()
          }
        }).margin({ bottom: 10 } as Margin)
    }
  }
}


@Entry
@Component
struct CustomDialogRouter {
  dialogController: CustomDialogController | null = new CustomDialogController({
    builder: CustomDialogRouterExample(),
  })

  build() {
    Column() {
      Button('Click me').key('Custom_Dialog_Router')
        .onClick((e:ClickEvent) => {
          this.dialogController?.open()
        }).backgroundColor(0x317aff)
    }.width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}