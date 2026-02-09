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
  Component,
  RichEditor,
  Column,
  Button,
  ClickEvent,
  $r,
  TextAlign,
  RichEditorController,
  RichEditorOptions,
  RichEditorImageSpanResult,
  Text,
  Scroll,
  Color
} from '@ohos.arkui.component'
import {
  State,
} from '@ohos.arkui.stateManagement'
@Entry
@Component
struct richEditorApi5 {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller } as RichEditorOptions;
  @State selection: string = ''
  @State text1: string = '111'

  build() {
    Scroll() {
      Column() {
        RichEditor(this.options)
          .onReady(() :void=> {
            this.controller.addTextSpan('ssssss')
          })
          .borderWidth(1)
          .borderColor(Color.Green)
          .width("100%")
          .height('40%')
          .key('RichEditor5')

        Button('setSelection').onClick((event: ClickEvent) => {
          this.controller.setSelection(-1, -1)
        }).id('richEditorApi5_btn1')
        Button('getSelection').onClick((event: ClickEvent) => {
          this.text1 = JSON.stringify(this.controller.getSelection()!.selection)
        }).id('richEditorApi5_btn2')
        Text('' + this.text1).key('richEditorApi5_text1')

      }.borderWidth(1).borderColor(Color.Red).height('100%')
    }
  }
}