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

import { CustomContentDialog } from '@ohos.arkui.advanced.Dialog';
import {
  Builder,
  Button,
  ButtonRole,
  ButtonStyleMode,
  Column,
  Component,
  CustomDialogController,
  Entry,
  FlexAlign,
  Text,
  ClickEvent
} from '@ohos.arkui.component';

@Entry
@Component
struct CustomContentDialogTest {
  dialogController: CustomDialogController = new CustomDialogController({
    builder: CustomContentDialog({
      primaryTitle: '标题',
      secondaryTitle: '辅助文本',
      contentAreaPadding: { top: 0, bottom: 0 },
      contentBuilder: () => {
        this.buildContent();
      },
      buttons: [{
        value: '按钮1', buttonStyle: ButtonStyleMode.TEXTUAL, action: () => {
          console.info('Callback when the button is clicked')
        }
      }, { value: '按钮2', buttonStyle: ButtonStyleMode.TEXTUAL, role: ButtonRole.ERROR }],
    }),
  });

  build() {
    Column() {
      Button('CustomContentDialog')
        .onClick((e:ClickEvent) => {
          this.dialogController.open()
        })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }

  @Builder
  buildContent(): void {
    Column() {
      Text('内容区')
    }
  }
}