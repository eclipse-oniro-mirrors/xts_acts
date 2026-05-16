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
  FlexAlign,
  AlertDialogParamWithButtons,
  AlertDialogParamWithOptions,
  DialogButtonDirection
} from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { ClickEvent } from '@ohos.arkui.component';
import { MessageManager, Callback, Message } from '../../common/MessageManager';
import { UIContext } from '@ohos.arkui.UIContext';

@Entry
@Component
struct DialogPage {
  @State title: string = 'title'
  @State message: string = "This is the message of alertdialog"
  @State autoCancel: boolean = true
  @State buttonName: string = 'ButtonHORIZONTAL'
  @State buttonName1: string = 'ButtonVERTICAL'
  @State buttonName2: string = 'ButtonAuto'
  messageManager: MessageManager = new MessageManager()
  uiContext: UIContext = this.getUIContext()

  onPageShow() {
    console.info('DialogPage onPageShow')

    AppStorage.setOrCreate<MessageManager>("messageManager", this.messageManager);

    let callback: Callback = (message: Message) => {
      console.error('message = ' + message.name + "--" + message.value)
      if (message.name == 'autoCancel') {
        this.autoCancel = message.value as boolean
      }
    }
    this.messageManager.registerCallback(callback)
  }

  build() {
    Column({ space: 8 } as ColumnOptions,) {
      Button(this.buttonName)
        .id('buttonDialogPage')
        .onClick((e: ClickEvent) => {
          this.buttonName = 'threeButtonHor:succ'
          this.showThreeButtonHORIZONTAL()
        }).backgroundColor(0x317aff)

      Button(this.buttonName1)
        .id('button1')
        .onClick((e: ClickEvent) => {
          this.buttonName1 = 'threeButtonVer:succ'
          this.showThreeButtonVERTICAL()
        }).backgroundColor(0x317aff)

      Button(this.buttonName2)
        .id('button2')
        .onClick((e: ClickEvent) => {
          this.buttonName2 = 'threeButtonAuto:succ'
          this.showThreeButtonAUTO()
        }).backgroundColor(0x317aff)

    }
    .width("100%")
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }

  private showThreeButtonHORIZONTAL() {
    this.uiContext.showAlertDialog(
      {
        title: this.title,
        message: this.message,
        autoCancel: this.autoCancel,
        buttonDirection: DialogButtonDirection.HORIZONTAL,

        buttons: [
          {
            value: this.buttonName,
            fontColor: 0xffffff,
            backgroundColor: 0x317aff,
            action: () => {
              this.buttonName = "OneButton3:succ"
              console.info("Button AlertDialog Button-Clicking callback")
            }
          },
          {
            value: this.buttonName1,
            fontColor: 0xffffff,
            backgroundColor: 0x317aff,
            action: () => {
              this.buttonName1 = "OneButton3:succ"
              console.info("Button AlertDialog Button-Clicking callback")
            }
          },
          {
            value: this.buttonName2,
            fontColor: 0xffffff,
            backgroundColor: 0x317aff,
            action: () => {
              this.buttonName2 = "OneButton3:succ"
              console.info("Button AlertDialog Button-Clicking callback")
            }
          },
        ],
        cancel: () => {
          console.info('Closed callbacks')
        }
      } as AlertDialogParamWithOptions
    )
  }

  private showThreeButtonVERTICAL() {
    this.uiContext.showAlertDialog(
      {
        title: this.title,
        message: this.message,
        autoCancel: this.autoCancel,
        buttonDirection: DialogButtonDirection.VERTICAL,

        buttons: [
          {
            value: this.buttonName,
            fontColor: 0xffffff,
            backgroundColor: 0x317aff,
            action: () => {
              this.buttonName = "OneButton3:succ"
              console.info("Button AlertDialog Button-Clicking callback")
            }
          },
          {
            value: this.buttonName1,
            fontColor: 0xffffff,
            backgroundColor: 0x317aff,
            action: () => {
              this.buttonName1 = "OneButton3:succ"
              console.info("Button AlertDialog Button-Clicking callback")
            }
          },
          {
            value: this.buttonName2,
            fontColor: 0xffffff,
            backgroundColor: 0x317aff,
            action: () => {
              this.buttonName2 = "OneButton3:succ"
              console.info("Button AlertDialog Button-Clicking callback")
            }
          },
        ],

        cancel: () => {
          console.info('Closed callbacks')
        }
      } as AlertDialogParamWithOptions
    )
  }

  private showThreeButtonAUTO() {
    this.uiContext.showAlertDialog(
      {
        title: this.title,
        message: this.message,
        autoCancel: this.autoCancel,
        buttonDirection: DialogButtonDirection.AUTO,
        buttons: [
          {
            value: this.buttonName,
            fontColor: 0xffffff,
            backgroundColor: 0x317aff,
            action: () => {
              this.buttonName = "OneButton3:succ"
              console.info("Button AlertDialog Button-Clicking callback")
            }
          },
          {
            value: this.buttonName1,
            fontColor: 0xffffff,
            backgroundColor: 0x317aff,
            action: () => {
              this.buttonName1 = "OneButton3:succ"
              console.info("Button AlertDialog Button-Clicking callback")
            }
          },
          {
            value: this.buttonName2,
            fontColor: 0xffffff,
            backgroundColor: 0x317aff,
            action: () => {
              this.buttonName2 = "OneButton3:succ"
              console.info("Button AlertDialog Button-Clicking callback")
            }
          },
        ],
        cancel: () => {
          console.info('Closed callbacks')
        }
      } as AlertDialogParamWithOptions
    )
  }
}