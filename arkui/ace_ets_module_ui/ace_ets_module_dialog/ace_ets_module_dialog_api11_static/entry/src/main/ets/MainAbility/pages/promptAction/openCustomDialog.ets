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
import promptAction from '@ohos.promptAction'

import {
  Entry,
  Column,
  Component,
  Button,
  Text,
  Row,
  Color,
  $r,
  Margin,
  ColumnOptions,
  Flex,
  Builder,
  Blank,
  FontWeight
} from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { ClickEvent } from '@ohos.arkui.component';
import { UIContext, Router, PromptAction } from '@ohos.arkui.UIContext';

let customDialogId: int = 0

@Builder
function customDialogBuilder() {
  Column() {
    Text('Custom dialog Message').fontSize(10).id("openCustomDialog")
    Row() {
      Button("确认").onClick((e: ClickEvent) => {
        AppStorage.get<UIContext>('uiContent')!.getPromptAction().closeCustomDialog(customDialogId)
      })
      Blank().width(50)
      Button("取消").onClick((e: ClickEvent) => {
        AppStorage.get<UIContext>('uiContent')!.getPromptAction().closeCustomDialog(customDialogId)
      })
    }
  }.height(200).padding(5)
}

@Entry
@Component
struct openCustomDialogExample {
  @State message: string = 'Hello World'
  promptAction: PromptAction = this.getUIContext().getPromptAction();

  build() {
    Row() {
      Column() {
        Button(this.message)
          .id("CustomDialog")
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .onClick((e: ClickEvent) => {
            this.promptAction.openCustomDialog({
              // builder: customDialogBuilder.bind(this)
              builder: customDialogBuilder
            } as promptAction.CustomDialogOptions).then((dialogId: int) => {
              customDialogId = dialogId
            })
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}