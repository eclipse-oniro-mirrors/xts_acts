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
import promptAction from '@ohos.promptAction'
import { Entry, Component, Column, Text, Rating, Margin, Button, ClickEvent } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement'
@Entry
@Component
struct promptExample {
  @State text: string = 'item1'
  @State color: string = '#000000'
  build(){
    Column(){
      Button('showActionMenu')
      .key('button1')
      .id('button1')
      .backgroundColor('#FF0B8FE2')
      .fontSize(20)
      .margin({top: 20} as Margin)
        .onClick((e: ClickEvent) => {
          this.getUIContext()
            .getPromptAction()
            .showActionMenu({
              title: 'Title Info',
              buttons: [
                {
                  text: this.text,
                  color: this.color,
                } as promptAction.Button,
              ] as [promptAction.Button]
            } as promptAction.ActionMenuOptions)
            .then((data: promptAction.ActionMenuSuccessResponse) => {
              let result = true
              console.info('showDialog success, click button: ' + data?.index)
            })
            .catch((err: Error) => {
              console.info('showDialog error: ' + err)
            });
        })
      Button('showDialog')
      .key('button2')
      .id('button2')
      .backgroundColor('#FF0B8FE2')
      .fontSize(20)
      .margin({top: 20} as Margin)
      // .onClick((e: ClickEvent) => {
      //   this.getUIContext()
      //     .getPromptAction()
      //     .showDialog({
      //       title: 'Title Info',
      //       message: 'Message Info',
      //       buttons: [
      //         {
      //           text: this.text,
      //           color: this.color
      //         } as promptAction.Button,
      //       ] as [promptAction.Button] | undefined,
      //     } as promptAction.ShowDialogOptions)
      //     .then(data => {
      //     })
      //     .catch((err: Error) => {
      //     })
      // })
    }
    }
}