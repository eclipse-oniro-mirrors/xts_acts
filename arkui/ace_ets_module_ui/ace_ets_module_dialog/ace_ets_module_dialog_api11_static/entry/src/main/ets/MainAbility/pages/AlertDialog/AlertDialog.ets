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
  Entry,
  Column,
  Component,
  Button,
  Text,
  Row,
  Color,
  $r,
  Margin,
  ColumnOptions,
  Flex,
  AlertDialogParamWithButtons,
  AlertDialogParamWithConfirm,
  DialogAlignment
} from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { ClickEvent } from '@ohos.arkui.component';
import { UIContext } from '@ohos.arkui.UIContext';

@Entry
@Component
struct alertdialog {
  @State currentTest: string = 'default'
  uiContext: UIContext = this.getUIContext()

  build() {
    Column() {
      Text(`${this.currentTest}`)
        .fontSize(20)

      Button('Show Dialog With Two Buttons')
        .width(300)
        .margin(10)
        .backgroundColor(Color.Blue)
        .onClick((e: ClickEvent) => {
          this.uiContext.showAlertDialog({
            title: 'Title',
            message: 'This is message',
            alignment: DialogAlignment.Top,
            autoCancel: true,
            primaryButton: {
              value: '11111111111',
              fontColor: '#FFFF0000',
              backgroundColor: '#FFFFC0CB',

              action: () => {
                this.currentTest = 'primaryButton'
              }
            },
            secondaryButton: {
              value: 'cancle',
              fontColor: '#FFFF0000',
              backgroundColor: '#FFFFC0CB',
              action: () => {
                this.currentTest = 'secondaryButton'
              }
            },
            cancel: () => {
              this.currentTest = 'cancel'
            }
          } as AlertDialogParamWithButtons)
          // .key('alertDialog')  // 按照结论删除处理，如果跑测没问题，删掉即可
        })
      Button('Show Dialog With Two Buttons')
        .width(300)
        .margin(10)
        .backgroundColor(Color.Blue)
        .onClick((e: ClickEvent) => {
          this.uiContext.showAlertDialog({
            title: 'Title',
            message: 'This is message',
            alignment: DialogAlignment.Center,
            primaryButton: {
              value: '11111111111',
              fontColor: '#FFFF0000',
              backgroundColor: '#FFFFC0CB',
              action: () => {
                this.currentTest = 'primaryButton'
              }
            },
            secondaryButton: {
              value: 'cancle',
              fontColor: '#FFFF0000',
              backgroundColor: '#FFFFC0CB',
              action: () => {
                this.currentTest = 'secondaryButton'
              }
            },
            cancel: () => {
              this.currentTest = 'cancel'
            }
          } as AlertDialogParamWithButtons)
          // .key('alertDialog1')
        })

      Button('Show Dialog With Two Buttons')
        .width(300)
        .margin(10)
        .backgroundColor(Color.Blue)
        .onClick((e: ClickEvent) => {
          this.uiContext.showAlertDialog({
            title: 'Title',
            message: 'This is message',
            alignment: DialogAlignment.Bottom,
            primaryButton: {
              value: '11111111111',
              fontColor: '#FFFF0000',
              backgroundColor: '#FFFFC0CB',
              action: () => {
                this.currentTest = 'primaryButton'
              }
            },
            secondaryButton: {
              value: 'cancle',
              fontColor: '#FFFF0000',
              backgroundColor: '#FFFFC0CB',
              action: () => {
                this.currentTest = 'secondaryButton'
              }
            },
            cancel: () => {
              this.currentTest = 'cancel'
            }
          } as AlertDialogParamWithButtons)
          // .key('alertDialog2')
        })

      Button('Show Dialog With Two Buttons')
        .width(300)
        .margin(10)
        .backgroundColor(Color.Blue)
        .onClick((e: ClickEvent) => {
          this.uiContext.showAlertDialog({
            title: 'Title',
            message: 'This is message',
            alignment: DialogAlignment.Default,
            primaryButton: {
              value: '11111111111',
              fontColor: '#FFFF0000',
              backgroundColor: '#FFFFC0CB',
              action: () => {
                this.currentTest = 'primaryButton'
              }
            },
            secondaryButton: {
              value: 'cancle',
              fontColor: '#FFFF0000',
              backgroundColor: '#FFFFC0CB',
              action: () => {
                this.currentTest = 'secondaryButton'
              }
            },
            cancel: () => {
              this.currentTest = 'cancel'
            }
          } as AlertDialogParamWithButtons)
          // .key('alertDialog3')
        })
      Button('Show Dialog With Two Buttons')
        .width(300)
        .margin(10)
        .backgroundColor(Color.Blue)
        .onClick((e: ClickEvent) => {
          this.uiContext.showAlertDialog({
            title: 'Title',
            message: 'This is message',
            alignment: DialogAlignment.TopStart,
            primaryButton: {
              value: '11111111111',
              fontColor: '#FFFF0000',
              backgroundColor: '#FFFFC0CB',
              action: () => {
                this.currentTest = 'primaryButton'
              }
            },
            secondaryButton: {
              value: 'cancle',
              fontColor: '#FFFF0000',
              backgroundColor: '#FFFFC0CB',
              action: () => {
                this.currentTest = 'secondaryButton'
              }
            },
            cancel: () => {
              this.currentTest = 'cancel'
            }
          } as AlertDialogParamWithButtons)
          // .key('alertDialog4')
        })
      Button('Show Dialog With Two Buttons')
        .width(300)
        .margin(10)
        .backgroundColor(Color.Blue)
        .onClick((e: ClickEvent) => {
          this.uiContext.showAlertDialog({
            title: 'Title',
            message: 'This is message',
            alignment: DialogAlignment.TopEnd,
            primaryButton: {
              value: '11111111111',
              fontColor: '#FFFF0000',
              backgroundColor: '#FFFFC0CB',
              action: () => {
                this.currentTest = 'primaryButton'
              }
            },
            secondaryButton: {
              value: 'cancle',
              fontColor: '#FFFF0000',
              backgroundColor: '#FFFFC0CB',
              action: () => {
                this.currentTest = 'secondaryButton'
              }
            },
            cancel: () => {
              this.currentTest = 'cancel'
            }
          } as AlertDialogParamWithButtons)
          // .key('alertDialog5')
        })
      Button('Show Dialog With Two Buttons')
        .width(300)
        .margin(10)
        .backgroundColor(Color.Blue)
        .onClick((e: ClickEvent) => {
          this.uiContext.showAlertDialog({
            title: 'Title',
            message: 'This is message',
            alignment: DialogAlignment.CenterStart,
            primaryButton: {
              value: '11111111111',
              fontColor: '#FFFF0000',
              backgroundColor: '#FFFFC0CB',
              action: () => {
                this.currentTest = 'primaryButton'
              }
            },
            secondaryButton: {
              value: 'cancle',
              fontColor: '#FFFF0000',
              backgroundColor: '#FFFFC0CB',
              action: () => {
                this.currentTest = 'secondaryButton'
              }
            },
            cancel: () => {
              this.currentTest = 'cancel'
            }
          } as AlertDialogParamWithButtons)
          // .key('alertDialog6')
        })
      Button('Show Dialog With Two Buttons')
        .width(300)
        .margin(10)
        .backgroundColor(Color.Blue)
        .onClick((e: ClickEvent) => {
          this.uiContext.showAlertDialog({
            title: 'Title',
            message: 'This is message',
            alignment: DialogAlignment.CenterEnd,
            primaryButton: {
              value: '11111111111',
              fontColor: '#FFFF0000',
              backgroundColor: '#FFFFC0CB',
              action: () => {
                this.currentTest = 'primaryButton'
              }
            },
            secondaryButton: {
              value: 'cancle',
              fontColor: '#FFFF0000',
              backgroundColor: '#FFFFC0CB',
              action: () => {
                this.currentTest = 'secondaryButton'
              }
            },
            cancel: () => {
              this.currentTest = 'cancel'
            }
          } as AlertDialogParamWithButtons)
          // .key('alertDialog7')
        })
      Button('Show Dialog With Two Buttons')
        .width(300)
        .margin(10)
        .backgroundColor(Color.Blue)
        .onClick((e: ClickEvent) => {
          this.uiContext.showAlertDialog({
            title: 'Title',
            message: 'This is message',
            alignment: DialogAlignment.BottomStart,
            primaryButton: {
              value: '11111111111',
              fontColor: '#FFFF0000',
              backgroundColor: '#FFFFC0CB',
              action: () => {
                this.currentTest = 'primaryButton'
              }
            },
            secondaryButton: {
              value: 'cancle',
              fontColor: '#FFFF0000',
              backgroundColor: '#FFFFC0CB',
              action: () => {
                this.currentTest = 'BottomStart'
              }
            },
            cancel: () => {
              this.currentTest = 'cancel'
            }
          } as AlertDialogParamWithButtons)
          // .key('alertDialog8')
        })

      Button('Show Dialog With Confirm')
        .width(300)
        .margin(10)
        .backgroundColor(Color.Blue)
        .onClick((e: ClickEvent) => {
          this.uiContext.showAlertDialog({
            title: 'Title',
            message: 'This is message',
            gridCount: 1,
            alignment: DialogAlignment.BottomEnd,
            confirm: {
              value: '11111111111',
              fontColor: '#FFFF0000',
              backgroundColor: '#FFFFC0CB',
              action: () => {
                this.currentTest = 'confirm'
              }
            },
            cancel: () => {
              this.currentTest = 'cancel'
            }
          } as AlertDialogParamWithConfirm)
          // .key('alertDialog9')
        })
    }
    .width('100%')
    .height('100%')
  }
}