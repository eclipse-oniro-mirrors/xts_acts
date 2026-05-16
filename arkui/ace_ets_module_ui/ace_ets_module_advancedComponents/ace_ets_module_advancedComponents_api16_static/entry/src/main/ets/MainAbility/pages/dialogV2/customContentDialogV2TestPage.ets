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
import { CustomContentDialogV2, AdvancedDialogV2Button } from '@ohos.arkui.advanced.DialogV2';
import { ColorMetrics, LengthMetrics } from '@ohos.arkui.node';
import {
  Entry,
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
  Scroll,
  HorizontalAlign,
  Margin,
  Divider,
  SizeOptions,
  LocalizedPadding,
  FlexAlign,
  Builder,
  ClickEvent,
  LocalizedPadding,
  ButtonRole,
  ButtonStyleMode
} from '@ohos.arkui.component';
import { UIContext } from '@ohos.arkui.UIContext';
import  promptAction from '@ohos.promptAction';

@Entry
@ComponentV2
struct Index {
  contentAreaPadding: LocalizedPadding = {
    start: LengthMetrics.vp(1),
    end: LengthMetrics.vp(1),
  } as LocalizedPadding
  @Builder
  dialogBuilder(): void {
    CustomContentDialogV2({
      primaryTitle: '标题',
      secondaryTitle: '辅助文本',
      contentBuilder: () => {
        this.buildContent();
      },
      contentAreaPadding: this.contentAreaPadding,
      buttons: [
        new AdvancedDialogV2Button({
          background: ColorMetrics.rgba(500, 300, 255, 255),
          fontColor:  ColorMetrics.rgba(0, 0, 500, 500),
          role: ButtonRole.NORMAL,
          defaultFocus: false,
          enabled: true,
          content: '按钮1',
          buttonStyle: ButtonStyleMode.TEXTUAL,
          action: () => {
            console.info('Callback when the button is clicked');
          },
        }),
        new AdvancedDialogV2Button({
          content: '按钮2', buttonStyle: ButtonStyleMode.TEXTUAL, role: ButtonRole.ERROR,
        })
      ],
    })
  }

  build() {
    Column() {
      Button('打开customContentDialogV2弹窗')
        .onClick((e: ClickEvent) => {
          let uiContext: UIContext = this.getUIContext();
          uiContext.getPromptAction().openCustomDialog({
            builder:this.dialogBuilder
          } as promptAction.CustomDialogOptions)
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