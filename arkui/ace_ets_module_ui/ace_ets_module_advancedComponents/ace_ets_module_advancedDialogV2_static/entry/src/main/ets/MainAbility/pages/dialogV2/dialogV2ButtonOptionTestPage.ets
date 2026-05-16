'use static';
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { AlertDialogV2, AdvancedDialogV2Button, AdvancedDialogV2ButtonOptions} from '@ohos.arkui.advanced.DialogV2';
import { ComponentContent } from '@ohos.arkui.node'
import promptAction from '@ohos.promptAction';
import {
  Entry,
  CustomBuilder,
  WrappedBuilder,
  Column,
  ComponentV2,
  TextAlign,
  Text,
  Color,
  Row,
  ClickEvent,
  Stack,
  Alignment,
  Button,
  Alignment,
  Builder,
  SizeOptions,
  Margin,
  ClickEvent,
  wrapBuilder,
  $r,
  ColorMetrics,
  ButtonStyleMode,
  ButtonRole
} from '@ohos.arkui.component';
// import { CustomDialogOptions } from '@ohos.promptAction'
import { State } from '@ohos.arkui.stateManagement';
import { UIContext } from '@ohos.arkui.UIContext';

@Entry
@ComponentV2
struct Index {
  private uiContext: UIContext = this.getUIContext();
  private dialogV2ButtonOptions: AdvancedDialogV2ButtonOptions = {
    content: $r('app.string.content_resourceStr'),
    action: () => {
      console.info('Callback when the second button is clicked');
    },
    textAlign: TextAlign.Center,
    background: ColorMetrics.resourceColor('#ff18cb53'),
    fontColor: ColorMetrics.resourceColor('#ffec5d5d'),
    buttonStyle: ButtonStyleMode.TEXTUAL,
    role: ButtonRole.ERROR,
    defaultFocus: false,
    enabled: true
  }

  private secondaryOptions: AdvancedDialogV2ButtonOptions = {
    content: $r('app.string.content_resourceStr'),
    action: () => {
      console.info('Callback when the second button is clicked');
    },
    textAlign: TextAlign.Start,
    background: ColorMetrics.resourceColor('#ff18cb53'),
    fontColor: ColorMetrics.resourceColor('#ffec5d5d'),
    buttonStyle: ButtonStyleMode.TEXTUAL,
    defaultFocus: true,
    enabled: false
  }

  @Builder
  dialogBuilder(): void {
    AlertDialogV2({
      primaryTitle: '弹框一级标题',
      secondaryTitle: '弹框二级标题',
      content: '文本文本文本文本文本',
      primaryButton: new AdvancedDialogV2Button(this.dialogV2ButtonOptions),
      secondaryButton: new AdvancedDialogV2Button(this.secondaryOptions),
    })
  }

  build() {
    Row() {
      Stack() {
        Column() {
          Button('打开DialogV2弹窗')
            .width(96)
            .height(40)
            .onClick((e: ClickEvent) => {
              this.uiContext.getPromptAction().openCustomDialog({
                builder: this.dialogBuilder
              } as promptAction.CustomDialogOptions);
            })
        }.margin({ bottom: 300 } as Margin)
      }.align(Alignment.Bottom)
      .width('100%').height('100%')
    }
    .backgroundImageSize({ width: '100%', height: '100%' } as SizeOptions)
    .height('100%')
  }
}