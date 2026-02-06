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

import prompt from '@ohos.prompt'
import Log from '../../common/Log';
import emitter from '@ohos.events.emitter';
import { BusinessError } from '@ohos.base';
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
  Builder,
  FlexDirection,
  FlexAlign,
  ItemAlign,
  TextAlign,
  TextOverflow,
  Alignment,
} from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { ClickEvent } from '@ohos.arkui.component';

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
          this.getUIContext().getPromptAction().showDialog({
            title: 'Title Info',
            message: 'Message Info',
            buttons: [
              { text: 'button1', color: 'red' },
              { text: 'button2', color: 'blue' }
            ]
          })
          //   .then(data => {  // 原写法
          //   console.info('showDialog success, click button: ' + data.index)
          // }).catch((err: Error) => {
          //   console.info('showDialog error: ' + err)
          // })
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
          // 编译问题
          // this.getUIContext().getPromptAction().showActionMenu({
          //   title: 'Title Info',
          //   buttons: [
          //     { text: 'item1', color: '#666666' },
          //     { text: 'item2', color: '#000000' }
          //   ]
          // })
          // .then(data => {   // 原写法
          //   let result = true
          //   console.info('showDialog success, click button: ' + data.index)
          // }).catch(err => {
          //   console.info('showDialog error: ' + err)
          // })
        })

    }.width("100%").height("100%")
  }
}

