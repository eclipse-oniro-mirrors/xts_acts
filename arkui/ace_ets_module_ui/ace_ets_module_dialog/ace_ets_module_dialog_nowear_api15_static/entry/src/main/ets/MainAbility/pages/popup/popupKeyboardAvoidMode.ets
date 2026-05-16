'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { Entry, Component, Builder, Row, Column, Button, Text, TextInput, $r, Image, ColumnOptions, RowOptions, KeyboardAvoidMode, ClickEvent, FlexAlign, Margin, PopupStateChangeParam,
  Placement, Color, CustomPopupOptions, PopupOptions } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct popupKeyboardAvoidMode {
  @State handlePopup: boolean = false
  @State customPopup: boolean = false
  @State keyboardAvoidMode: KeyboardAvoidMode = KeyboardAvoidMode.DEFAULT

  @Builder
  popupBuilder() {
    Row({ space: 2 } as RowOptions) {
      Image($r('app.media.icon')).width('10%').height('10%')
      Text('Custom Popup')
        .onClick((e: ClickEvent) => {
          this.customPopup = false
        })
        .id('text')
        .fontSize(10)
    }
  }

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Column() {
        TextInput().id('ipt')
        Button('keyboardAvoidMode: DEFAULT' + this.keyboardAvoidMode)
          .height('8%')
          .id('default')
          .onClick((e: ClickEvent) => {
            this.keyboardAvoidMode = KeyboardAvoidMode.DEFAULT
          })
        Button('keyboardAvoidMode: NONE' + this.keyboardAvoidMode)
          .height('8%')
          .id('none')
          .onClick((e: ClickEvent) => {
            this.keyboardAvoidMode = KeyboardAvoidMode.NONE
          })
      }

      Column() {
        Button('PopupOptions')
          .id('popup')
          .onClick((e: ClickEvent) => {
            this.handlePopup = !this.handlePopup
          })
          .bindPopup(this.handlePopup, {
            message: 'This is a popup with PopupOptions',
            // placementOnTop: true,
            showInSubWindow: false,
            keyboardAvoidMode: this.keyboardAvoidMode,
            autoCancel: false,
            mask: false,
            primaryButton: {
              value: 'confirm',
              action: () => {
                this.handlePopup = !this.handlePopup
                console.info('confirm Button click')
              }
            },
            secondaryButton: {
              value: 'cancel',
              action: () => {
                this.handlePopup = !this.handlePopup
                console.info('cancel Button click')
              }
            },
            onStateChange: (e: PopupStateChangeParam):void => {
              console.info(JSON.stringify(e.isVisible))
              if (!e.isVisible) {
                this.handlePopup = false
              }
            }
          } as PopupOptions)

        Button('CustomPopupOptions')
          .id('CustomPopup')
          .onClick((e: ClickEvent) => {
            this.customPopup = !this.customPopup
          })
          .bindPopup(this.customPopup, {
            builder: this.popupBuilder,
            placement: Placement.Top,
            autoCancel: false,
            popupColor: Color.Yellow,
            mask: false,
            keyboardAvoidMode: this.keyboardAvoidMode,
            enableArrow: true,
            showInSubWindow: false,
            onStateChange: (e: PopupStateChangeParam):void => {
              if (!e.isVisible) {
                this.customPopup = false
              }
            }
          } as CustomPopupOptions)
      }
      .width('100%')
      .height('80%')
      .margin({ bottom: 10 } as Margin)
      .justifyContent(FlexAlign.End)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.SpaceEvenly)
  }
}