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
import { PromptAction } from '@ohos.arkui.UIContext';
import {
  Entry, Component,
  Column, ColumnOptions, Color,
  Text, Button, ClickEvent, Margin, BlurStyle, ShadowStyle,
  Flex, FlexDirection, ItemAlign, FlexAlign, DismissDialogAction
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct PromptActionShowToast {
  promptActionC: PromptAction = this.getUIContext().getPromptAction();
  build() {
    Column({ space: 5 } as ColumnOptions) {
      Button('backgroundColor').id('backgroundColor')
        .onClick((e:ClickEvent) => {
          this.promptActionC.showToast({
            message: 'backgroundColor',
            duration: 2000,
            bottom: 100,
            backgroundColor: Color.Pink,
            showMode: promptAction.ToastShowMode.DEFAULT
          })
        }).backgroundColor(0x317aff)

      Button('backgroundBlurStyle').id('backgroundBlurStyle')
        .onClick((e:ClickEvent) => {
          this.promptActionC.showToast({
            message: 'backgroundBlurStyle',
            duration: 2000,
            bottom: 100,
            backgroundBlurStyle:BlurStyle.Thin,
            showMode: promptAction.ToastShowMode.DEFAULT
          })
        }).backgroundColor(0x317aff)

      Button('textColor').id('textColor')
        .onClick((e:ClickEvent) => {
          this.promptActionC.showToast({
            message: 'textColor',
            duration: 2000,
            bottom: 100,
            textColor:Color.Orange,
            showMode: promptAction.ToastShowMode.DEFAULT
          })
        }).backgroundColor(0x317aff)

      Button('Shadow').id('Shadow')
        .onClick((e:ClickEvent) => {
          this.promptActionC.showToast({
            message: 'Shadow',
            duration: 2000,
            bottom: 100,
            shadow:ShadowStyle.OUTER_DEFAULT_XS,
            showMode: promptAction.ToastShowMode.DEFAULT
          })
        }).backgroundColor(0x317aff)
    }.width('100%').height('100%')
  }
}