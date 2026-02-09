'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import {
  $rawfile,
  Alignment,
  ClickEvent,
  Component,
  Entry,
  Flex,
  FlexAlign,
  FlexDirection,
  FontWeight,
  Image,
  ItemAlign,
  Path,
  Text,
  TextAlign,
  TextOverflow
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import prompt from '@ohos.prompt'
import Log from '../common/Log';
import promptAction from '@ohos.promptAction';
import events_emitter from '@ohos.events.emitter';

const TAG = 'ets_apiLack_add';

@Entry
@Component
struct PromptShowDialog {
  aboutToAppear() {
    Log.showInfo(TAG, `aboutToAppear PromptShowDialog start`)
  }

  aboutToDisappear() {
    Log.showInfo(TAG, `aboutToDisAppear PromptShowDialog end`)
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {

      Text("prompt-ShowDialog")
        .width(100)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .onClick((e: ClickEvent) => {
          this.getUIContext()
            .getPromptAction()
            .showDialog({
              title: 'Title Info',
              message: 'Message Info',
              buttons: [
                { text: 'button1', color: 'red' },
                { text: 'button2', color: 'blue' }
              ]
            })
            .then((data: promptAction.ShowDialogSuccessResponse) => {
              console.info('showDialog success, click button: ' + data.index)
            })
            .catch((err: Error) => {
              console.info('showDialog error: ' + err)
            })
        })

      Text("prompt-ShowActionMenu")
        .width(100)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .onClick((e: ClickEvent) => {
          this.getUIContext()
            .getPromptAction()
            .showActionMenu({
              title: 'Title Info',
              buttons: [
                { text: 'item1', color: '#666666' } as promptAction.Button,
                { text: 'item2', color: '#000000' } as promptAction.Button,
                { text: 'item3', color: '#000000' } as promptAction.Button,
                { text: 'item4', color: '#000000' } as promptAction.Button,
                { text: 'item5', color: '#000000' } as promptAction.Button,
                { text: 'item6', color: '#000000' } as promptAction.Button
              ] as [promptAction.Button, promptAction.Button | undefined, promptAction.Button | undefined, promptAction.Button | undefined, promptAction.Button | undefined, promptAction.Button | undefined]
            })
            .then((data: promptAction.ActionMenuSuccessResponse) => {
              let result = true
              console.info('showDialog success, click button: ' + data.index)
            })
            .catch((err: Error) => {
              console.info('showDialog error: ' + err)
            })
        })

    }.width("100%").height("100%")
  }
}

