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
  Text
} from '@ohos.arkui.component';

@Entry
@Component
struct showAlertDialog2 {
  build() {
    Column({ space: 10 } as ColumnOptions) {
      Button('ShowAlertDialog_Effect001')
        .id('ShowAlertDialog_Effect001')
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
              backgroundEffect: {
                radius: 40,
                saturation: 25,
                brightness: 2,
                color: Color.Pink,
                adaptiveColor: AdaptiveColor.DEFAULT,
                policy: BlurStyleActivePolicy.ALWAYS_ACTIVE,
                inactiveColor: Color.Blue,
                blurOptions: {
                  grayscale: [20, 20]
                }
              }
            } as AlertDialogParamWithConfirm)
        })
      Button('ShowAlertDialog_Effect002')
        .id('ShowAlertDialog_Effect002')
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
              backgroundEffect: {
                radius: 0.0,
                saturation: undefined,
                brightness: undefined,
                color: undefined,
                adaptiveColor: undefined,
                policy: undefined,
                inactiveColor: undefined,
                blurOptions: undefined,
              }
            } as AlertDialogParamWithConfirm)
        })
      Button('ShowAlertDialog_Effect003')
        .id('ShowAlertDialog_Effect003')
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
              backgroundEffect: {
                radius: 0.0,
                saturation: undefined,
                brightness: undefined,
                color: undefined,
                adaptiveColor: undefined,
                policy: undefined,
                inactiveColor: undefined,
                blurOptions: undefined,
              }
            } as AlertDialogParamWithConfirm)
        })
    }
    .height('100%')
    .width('100%')
    .backgroundImage($r('app.media.icon'))
    .backgroundImageSize({ width: '100%', height: '100%' } as SizeOptions)
  }
}