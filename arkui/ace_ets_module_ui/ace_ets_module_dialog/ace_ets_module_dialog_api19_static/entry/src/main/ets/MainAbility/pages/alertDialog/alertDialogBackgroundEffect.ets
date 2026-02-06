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
  $r,
  AdaptiveColor,
  AlertDialogParamWithOptions,
  BlurStyleActivePolicy,
  Button,
  Color,
  Column,
  ColumnOptions,
  Component,
  DialogAlignment,
  DialogButtonDirection,
  DialogButtonStyle,
  Entry,
  SizeOptions
} from '@ohos.arkui.component';

@Entry
@Component
struct AlertDialog2 {
  build() {
    Column({ space: 10 } as ColumnOptions) {
      Button('AlertDialog_Effect001')
        .id('AlertDialog_Effect001')
        .onClick(() => {
          this.getUIContext().showAlertDialog({
            title: 'title',
            subtitle: 'subtitle',
            message: 'text',
            autoCancel: true,
            alignment: DialogAlignment.Bottom,
            gridCount: 4,
            offset: { dx: 0, dy: -20 },
            buttonDirection: DialogButtonDirection.HORIZONTAL,
            buttons: [
              {
                value: '按钮',
                action: () => {
                  console.info('Callback when button1 is clicked')
                }
              },
              {
                value: '按钮',
                action: () => {
                  console.info('Callback when button2 is clicked')
                }
              },
              {
                value: '按钮',
                enabled: true,
                defaultFocus: true,
                style: DialogButtonStyle.HIGHLIGHT,
                action: () => {
                  console.info('Callback when button3 is clicked')
                }
              },
            ],
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
          } as AlertDialogParamWithOptions)
        })
      Button('AlertDialog_Effect002')
        .id('AlertDialog_Effect002')
        .onClick(() => {
          this.getUIContext().showAlertDialog({
            title: 'title',
            subtitle: 'subtitle',
            message: 'text',
            autoCancel: true,
            alignment: DialogAlignment.Bottom,
            gridCount: 4,
            offset: { dx: 0, dy: -20 },
            buttonDirection: DialogButtonDirection.HORIZONTAL,
            buttons: [
              {
                value: '按钮',
                action: () => {
                  console.info('Callback when button1 is clicked')
                }
              },
              {
                value: '按钮',
                action: () => {
                  console.info('Callback when button2 is clicked')
                }
              },
              {
                value: '按钮',
                enabled: true,
                defaultFocus: true,
                style: DialogButtonStyle.HIGHLIGHT,
                action: () => {
                  console.info('Callback when button3 is clicked')
                }
              },
            ],
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
          } as AlertDialogParamWithOptions)
        })
      Button('AlertDialog_Effect003')
        .id('AlertDialog_Effect003')
        .onClick(() => {
          this.getUIContext().showAlertDialog({
            title: 'title',
            subtitle: 'subtitle',
            message: 'text',
            autoCancel: true,
            alignment: DialogAlignment.Bottom,
            gridCount: 4,
            offset: { dx: 0, dy: -20 },
            buttonDirection: DialogButtonDirection.HORIZONTAL,
            buttons: [
              {
                value: '按钮',
                action: () => {
                  console.info('Callback when button1 is clicked')
                }
              },
              {
                value: '按钮',
                action: () => {
                  console.info('Callback when button2 is clicked')
                }
              },
              {
                value: '按钮',
                enabled: true,
                defaultFocus: true,
                style: DialogButtonStyle.HIGHLIGHT,
                action: () => {
                  console.info('Callback when button3 is clicked')
                }
              },
            ],
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
          } as AlertDialogParamWithOptions)
        })
    }
    .height('100%')
    .width('100%')
    .backgroundImage($r('app.media.icon'))
    .backgroundImageSize({ width: '100%', height: '100%' } as SizeOptions)
  }
}