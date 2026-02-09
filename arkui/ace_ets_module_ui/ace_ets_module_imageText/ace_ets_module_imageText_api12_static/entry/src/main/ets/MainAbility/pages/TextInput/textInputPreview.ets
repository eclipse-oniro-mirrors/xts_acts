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
import {
  Entry, Component,
  Column, TextInput, CaretOffset,
  TextInputController
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
@Entry
@Component
struct TextInputPreview {
  @State text: string = ''
  @State positionInfo: CaretOffset = { index: 0, x: 0, y: 0 } as CaretOffset
  controller: TextInputController = new TextInputController()

  build() {
    Column() {
      TextInput({
        text: this.text,
        placeholder: 'input your word...',
        controller: this.controller
      })
        .id('enablePreview_textInput')
        .placeholderFont({ size: 16, weight: 400 })
        .width(336)
        .height(56)
        .margin(20)
        .fontSize(16)
        .fontColor('#182431')
        .backgroundColor('#FFFFFF')
        .enablePreviewText(true)
        // .inputFilter('[a-z]', (e) => {
        //   console.log(JSON.stringify(e))
        // })
        .onChange((value: string):void => {
          this.text = value
        })
    }.width('100%').height('100%').backgroundColor('#F1F3F5')
  }
}