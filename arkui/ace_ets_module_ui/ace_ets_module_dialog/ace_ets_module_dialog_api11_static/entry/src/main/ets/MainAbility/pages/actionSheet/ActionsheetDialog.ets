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
  FlexDirection,
  ItemAlign,
  FlexAlign,
  ActionSheetOptions
} from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { ClickEvent } from '@ohos.arkui.component';
import { UIContext } from '@ohos.arkui.UIContext';

@Entry
@Component
struct ActionSheetExampleA {
  uiContext: UIContext = this.getUIContext()

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Button('ActionSheet按esc弹窗逐层退出').key('Actionsheet_dialog_A')
        .onClick((e: ClickEvent) => {
          this.uiContext.showActionSheet({
            title: 'ActionSheet title',
            subtitle: 'ActionSheet subtitle',
            message: 'message',
            autoCancel: true,
            sheets: [
              {
                title: 'apples',
                action: () => {
                  console.log('apples')
                }
              },
            ]
          } as ActionSheetOptions)
          this.uiContext.showActionSheet({
            title: 'ActionSheet title',
            subtitle: 'ActionSheet subtitle',
            message: 'message',
            autoCancel: true,
            sheets: [
              {
                title: 'apples',
                action: () => {
                  console.log('apples')
                }
              },
            ]
          } as ActionSheetOptions)
        })
    }.width('100%')
    .height('100%')
  }
}