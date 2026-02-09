'use static';
/*
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
import { Popup, PopupTextOptions, PopupButtonOptions, PopupIconOptions, PopupOptions } from '@ohos.arkui.advanced.Popup';
import { Entry, Component, Column, ColumnOptions, Row, Stack, Button, ClickEvent, Color, Curve, FontWeight, Direction,$r  } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';

@Entry
@Component
struct PopupDirection {
  @State currentDirection?: Direction = Direction.Auto

  build() {
    Column() {
      Row() {
        Button('Auto')
          .id('Auto')
          .onClick((e: ClickEvent) => {
          this.currentDirection = Direction.Auto
        })
          .backgroundColor(this.currentDirection == Direction.Auto ? Color.Red : Color.Blue)
        Button('Rtl')
          .id('Rtl')
          .onClick((e: ClickEvent) => {
          this.currentDirection = Direction.Rtl
        })
          .backgroundColor(this.currentDirection == Direction.Rtl ? Color.Red : Color.Blue)
        Button('Ltr')
          .id('Ltr')
          .onClick((e: ClickEvent) => {
          this.currentDirection = Direction.Ltr
        })
          .backgroundColor(this.currentDirection == Direction.Ltr ? Color.Red : Color.Blue)
      }

      // popup 自定义高级组件
      Popup({
        //PopupIconOptions 类型设置图标内容
        direction: this.currentDirection,
        icon: {
          image: $r('app.media.icon'),
          width: 32,
          height: 32,
          fillColor: Color.White,
          borderRadius: 16,
        } as PopupIconOptions,
        // PopupTextOptions 类型设置文字内容
        title: {
          text: 'Title',
          fontSize: 20,
          fontColor: Color.Black,
          fontWeight: FontWeight.Normal,

        } as PopupTextOptions,
        //PopupTextOptions 类型设置文字内容
        message: {
          text: 'This is the message',
          fontSize: 15,
          fontColor: Color.Black,
        } as PopupTextOptions,
        showClose: true,
        onClose: () => {
          console.info('close Button click')
        },
        // PopupButtonOptions 类型设置按钮内容
        buttons: [{
          text: 'confirm',
          action: () => {
            console.info('confirm button click')
          },
          fontSize: 15,
          fontColor: Color.Black,

        },
          {
            text: 'cancel',
            action: () => {
              console.info('cancel button click')
            },
            fontSize: 15,
            fontColor: Color.Black,
          },] as [
          PopupButtonOptions | undefined,
          PopupButtonOptions | undefined
        ],
      } as PopupOptions)
    }
    .width('100%')
    .height('100%')
  }
}