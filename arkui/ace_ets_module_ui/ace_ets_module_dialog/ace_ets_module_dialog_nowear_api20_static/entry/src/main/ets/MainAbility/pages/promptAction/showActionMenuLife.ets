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
  Builder,
  Button,
  Column,
  Component,
  Entry,
  Menu,
  MenuItem,
  MenuItemOptions,
  Row,
  Text
} from '@ohos.arkui.component';
import { BusinessError } from '@kit.BasicServicesKit';
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct showActionMenuLife {
  @State actionMenuText: string = '';
  @State disappearMenuText: string = '';
  @State actionMenuText1: string = '';
  @State disappearMenuText1: string = '';

  @Builder
  MyMenu() {
    Menu() {
      MenuItem({ content: '菜单选项1' } as MenuItemOptions);
      MenuItem({ content: '菜单选项2' } as MenuItemOptions);
    }
  }

  build() {
    Column() {
      Text(this.actionMenuText).id('actionMenuText');
      Text(this.disappearMenuText).id('disappearMenuText');
      Text(this.actionMenuText1).id('actionMenuText1');
      Text(this.disappearMenuText1).id('disappearMenuText1');

      Row() {
        Button('弹窗1')
          .id('showActionMenu')
          .onClick(() => {
            this.getUIContext()
              .getPromptAction()
              .showActionMenu({
                title: 'showActionMenu',
                buttons: [
                  {
                    text: 'item1',
                    color: '#000000'
                  } as promptAction.Button,
                ] as [promptAction.Button],
                onWillAppear: () => {
                  this.actionMenuText = this.actionMenuText + 'onWillAppear_';
                },
                onDidAppear: () => {
                  this.actionMenuText = this.actionMenuText + 'onDidAppear';
                },
                onWillDisappear: () => {
                  this.disappearMenuText = this.disappearMenuText + 'onWillDisappear_';
                },
                onDidDisappear: () => {
                  this.disappearMenuText = this.disappearMenuText + 'onDidDisappear';
                },
              } as promptAction.ActionMenuOptions)
              .then((data: promptAction.ActionMenuSuccessResponse) => {
                console.info('showActionMenu success, click button: ' + data?.index);
              })
              .catch((err: Error) => {
                console.info('showActionMenu error: ' + err);
              })
          })
        Button('弹窗2')
          .id('showActionMenu1')
          .onClick(() => {
            try {
              this.getUIContext()
                .getPromptAction()
                .showActionMenu({
                  title: 'showActionMenu',
                  buttons: [
                    {
                      text: 'item1',
                      color: '#000000'
                    } as promptAction.Button,
                  ] as [promptAction.Button],
                  onWillAppear: () => {
                    this.actionMenuText1 = this.actionMenuText1 + 'onWillAppear_';
                  },
                  onDidAppear: () => {
                    this.actionMenuText1 = this.actionMenuText1 + 'onDidAppear';
                  },
                  onWillDisappear: () => {
                    this.disappearMenuText1 = this.disappearMenuText1 + 'onWillDisappear_';
                  },
                  onDidDisappear: () => {
                    this.disappearMenuText1 = this.disappearMenuText1 + 'onDidDisappear';
                  },
                } as promptAction.ActionMenuOptions,
                  (err: BusinessError<void> | null, data: promptAction.ActionMenuSuccessResponse | undefined): void => {
                    if (err) {
                      console.error('showActionMenu2 err: ' + err);
                      return;
                    }
                    if (data) {
                      console.info('showActionMenu2 success callback, click button: ' + data.index);
                    }
                  });
            } catch (error) {
              let message = (error as BusinessError).message;
              let code = (error as BusinessError).code;
              console.error(`showActionMenu2 args error code is ${code}, message is ${message}`);
            }
            ;
          })
      }
    }.backgroundColor('#f0f0f0')
    .width('100%')
    .height('100%')
  }
}