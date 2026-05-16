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
import { BusinessError } from '@ohos.base';
import promptAction from '@ohos.promptAction';

import {
  $r,
  AdaptiveColor,
  BackgroundBlurStyleOptions,
  BlurStyleActivePolicy,
  Builder,
  Button,
  Color,
  Column,
  ColumnOptions,
  Component,
  Entry,
  FlexAlign,
  Menu,
  MenuItem,
  MenuItemOptions,
  Row,
  RowOptions,
  SizeOptions,
  Text,
  ThemeColorMode
} from '@ohos.arkui.component';

@Entry
@Component
struct openCustomDialog1 {
  private customDialogComponentId: int = 0

  @Builder
  customDialogComponent() {
    Column() {
      Text('弹窗').fontSize(30)
      Row({ space: 50 } as RowOptions) {
        Button('确认').onClick(() => {
          this.getUIContext().getPromptAction().closeCustomDialog(this.customDialogComponentId)
        })
        Button('取消').onClick(() => {
          this.getUIContext().getPromptAction().closeCustomDialog(this.customDialogComponentId)
        })
      }
    }.height(200).padding(5).justifyContent(FlexAlign.SpaceBetween)
  }

  build() {
    Column({ space: 10 } as ColumnOptions) {
      Button('OpenCustomDialog_Options001')
        .id('OpenCustomDialog_Options001')
        .onClick(() => {
          this.getUIContext().getPromptAction().openCustomDialog({
            builder: () => {
              this.customDialogComponent()
            },
            backgroundBlurStyleOptions: {
              policy: BlurStyleActivePolicy.FOLLOWS_WINDOW_ACTIVE_STATE,
              adaptiveColor: AdaptiveColor.AVERAGE,
              scale: 0,
              colorMode: ThemeColorMode.LIGHT,
              inactiveColor: Color.Pink,
              blurOptions: {
                grayscale: [20, 100]
              }
            } as BackgroundBlurStyleOptions
          } as promptAction.CustomDialogOptions).then((dialogId: int) => {
            this.customDialogComponentId = dialogId
          })
        })
      Button('OpenCustomDialog_Options002')
        .id('OpenCustomDialog_Options002')
        .onClick(() => {
          this.getUIContext().getPromptAction().openCustomDialog({
            builder: () => {
              this.customDialogComponent()
            },
            backgroundBlurStyleOptions: {
              policy: undefined,
              adaptiveColor: undefined,
              scale: undefined,
              colorMode: undefined,
              inactiveColor: undefined,
              blurOptions: undefined,
            } as BackgroundBlurStyleOptions
          } as promptAction.CustomDialogOptions).then((dialogId: int) => {
            this.customDialogComponentId = dialogId
          })
        })
      Button('OpenCustomDialog_Options003')
        .id('OpenCustomDialog_Options003')
        .onClick(() => {
          this.getUIContext().getPromptAction().openCustomDialog({
            builder: () => {
              this.customDialogComponent()
            },
            backgroundBlurStyleOptions: {
              policy: undefined,
              adaptiveColor: undefined,
              scale: undefined,
              colorMode: undefined,
              inactiveColor: undefined,
              blurOptions: undefined,
            } as BackgroundBlurStyleOptions
          } as promptAction.CustomDialogOptions).then((dialogId: int) => {
            this.customDialogComponentId = dialogId
          })
        })
    }
    .height('100%')
    .width('100%')
    .backgroundImage($r('app.media.icon'))
    .backgroundImageSize({ width: '100%', height: '100%' } as SizeOptions)
  }
}