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
import promptAction from '@ohos.promptAction';
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
import { BusinessError } from '@ohos.base';
import { UIContext, Router, PromptAction } from '@ohos.arkui.UIContext';
@Entry
@Component
struct showActionMenuExample {
  promptAction: PromptAction = this.getUIContext().getPromptAction();

  build() {
    Column({ space: 5 } as ColumnOptions,) {
      Button('showActionMenu')
        .margin(100)
        .id('showActionMenu')
        .onClick((e: ClickEvent) => {
          this.promptAction.showActionMenu({
             title: 'showActionMenu Title Info',
             isModal: true,
             buttons: [
               {
                 text: 'item1',
                 color: '#666666'
               } as promptAction.Button,
               {
                 text: 'item2',
                 color: '#000000'
               } as promptAction.Button,
             ] as promptAction.PromptActionDoubleButtons
           } as promptAction.ActionMenuOptions, (err:BusinessError|null, data:promptAction.ActionMenuSuccessResponse|undefined) => {
            if (err) {
              console.info('showActionMenu error: ' + err);
              return;
            }
              console.info('showActionMenu success, click button: ' + data!.index);
          })
             // .then(data => {
             //   console.info('showActionMenu success, click button: ' + data.index);
             // })
             // .catch((err: Error) => {
             //   console.info('showActionMenu error: ' + err);
             // })
        }).backgroundColor(0x317aff)
    }.width('100%').margin({ top: 5 } as Margin)
  }
}