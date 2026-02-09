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
  $r,
  AdaptiveColor,
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
  SizeOptions,
  Text,
  ThemeColorMode
} from '@ohos.arkui.component';

@Entry
@Component
struct showDialog2 {
  build() {
    Column({ space: 10 } as ColumnOptions) {
      Button('ShowDialog_Effect001')
        .id('ShowDialog_Effect001')
        .onClick(() => {
          this.getUIContext().getPromptAction().showDialog({
            title: 'Title Info',
            message: 'Message Info',
            buttons: [
              {
                text: 'button1',
                color: '#000000'
              },
              {
                text: 'button2',
                color: '#000000'
              }
            ],
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
          })
        })
      Button('ShowDialog_Effect002')
        .id('ShowDialog_Effect002')
        .onClick(() => {
          this.getUIContext().getPromptAction().showDialog({
            title: 'Title Info',
            message: 'Message Info',
            buttons: [
              {
                text: 'button1',
                color: '#000000'
              },
              {
                text: 'button2',
                color: '#000000'
              }
            ],
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
          })
        })
      Button('ShowDialog_Effect003')
        .id('ShowDialog_Effect003')
        .onClick(() => {
          this.getUIContext().getPromptAction().showDialog({
            title: 'Title Info',
            message: 'Message Info',
            buttons: [
              {
                text: 'button1',
                color: '#000000'
              },
              {
                text: 'button2',
                color: '#000000'
              }
            ],
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
          } as promptAction.ShowDialogOptions)
        })
    }
    .height('100%')
    .width('100%')
    .backgroundImage($r('app.media.icon'))
    .backgroundImageSize({ width: '100%', height: '100%' } as SizeOptions)
  }
}