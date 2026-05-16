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
import { AsyncCallback, BusinessError } from '@ohos.base';
import { PromptAction, UIContext } from '@ohos.arkui.UIContext';
import promptAction from '@ohos.promptAction';
import {
  $r,
  AdaptiveColor,
  AlertDialogParamWithConfirm,
  BackgroundBlurStyleOptions,
  BlurStyleActivePolicy,
  Button,
  Color,
  Column,
  ColumnOptions,
  Component,
  DialogAlignment,
  Entry,
  Row,
  RowOptions,
  SizeOptions,
  Text,
  ThemeColorMode
} from '@ohos.arkui.component';

@Entry
@Component
struct showAlertDialog1 {
  build() {
    Column({ space: 10 } as ColumnOptions) {
      Button('ShowAlertDialog_Options001')
        .id('ShowAlertDialog_Options001')
        .onClick(() => {
          let uiContext: UIContext = this.getUIContext();
          uiContext.showAlertDialog(
            {
              title: 'title',
              message: 'text',
              autoCancel: true,
              alignment: DialogAlignment.Bottom,
              offset: { dx: 0, dy: -20 },
              gridCount: 3,
              confirm: {
                value: 'button',
                action: () => {
                  console.info('Button-clicking callback')
                }
              },
              cancel: () => {
                console.info('Closed callbacks')
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
            } as AlertDialogParamWithConfirm)
        })
      Button('ShowAlertDialog_Options002')
        .id('ShowAlertDialog_Options002')
        .onClick(() => {
          let uiContext: UIContext = this.getUIContext();
          uiContext.showAlertDialog(
            {
              title: 'title',
              message: 'text',
              autoCancel: true,
              alignment: DialogAlignment.Bottom,
              offset: { dx: 0, dy: -20 },
              gridCount: 3,
              confirm: {
                value: 'button',
                action: () => {
                  console.info('Button-clicking callback')
                }
              },
              cancel: () => {
                console.info('Closed callbacks')
              },
              backgroundBlurStyleOptions: {
                policy: undefined,
                adaptiveColor: undefined,
                scale: undefined,
                colorMode: undefined,
                inactiveColor: undefined,
                blurOptions: undefined,
              } as BackgroundBlurStyleOptions
            } as AlertDialogParamWithConfirm)
        })
      Button('ShowAlertDialog_Options003')
        .id('ShowAlertDialog_Options003')
        .onClick(() => {
          let uiContext: UIContext = this.getUIContext();
          uiContext.showAlertDialog(
            {
              title: 'title',
              message: 'text',
              autoCancel: true,
              alignment: DialogAlignment.Bottom,
              offset: { dx: 0, dy: -20 },
              gridCount: 3,
              confirm: {
                value: 'button',
                action: () => {
                  console.info('Button-clicking callback')
                }
              },
              cancel: () => {
                console.info('Closed callbacks')
              },
              backgroundBlurStyleOptions: {
                policy: undefined,
                adaptiveColor: undefined,
                scale: undefined,
                colorMode: undefined,
                inactiveColor: undefined,
                blurOptions: undefined,
              } as BackgroundBlurStyleOptions
            } as AlertDialogParamWithConfirm)
        })
    }
    .height('100%')
    .width('100%')
    .backgroundImage($r('app.media.icon'))
    .backgroundImageSize({ width: '100%', height: '100%' } as SizeOptions)
  }
}