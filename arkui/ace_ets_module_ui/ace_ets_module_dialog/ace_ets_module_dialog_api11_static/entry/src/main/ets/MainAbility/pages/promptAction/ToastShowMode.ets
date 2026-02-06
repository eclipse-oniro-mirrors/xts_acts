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
  Flex
} from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { ClickEvent } from '@ohos.arkui.component';
import { UIContext, Router, PromptAction } from '@ohos.arkui.UIContext';

@Entry
@Component
struct PromptActionShowMode {
  @State message: string = 'Hello World'
  promptActionT: PromptAction = this.getUIContext().getPromptAction();

  build() {
    Column({ space: 5 } as ColumnOptions,) {
      Button(this.message)
        .id('mess_mode')
      Button('DEFAULT').key('ShowMode_p1')
        .onClick((e: ClickEvent) => {
          this.message = 'Message DEFAULT'
          this.promptActionT.showToast({
            message: this.message,
            duration: 2000,
            bottom: 100,
            showMode: promptAction.ToastShowMode.DEFAULT
          })
        }).backgroundColor(0x317aff)

      Button('TOP_MOST').id('ShowMode_p2')
        .onClick((e: ClickEvent) => {
          this.message = 'Message TOP_MOST'
          this.promptActionT.showToast({
            message: this.message,
            duration: 2000,
            bottom: 100,
            showMode: promptAction.ToastShowMode.TOP_MOST
          })
        }).backgroundColor(0x317aff)
    }.width('100%').height('100%')
  }
}