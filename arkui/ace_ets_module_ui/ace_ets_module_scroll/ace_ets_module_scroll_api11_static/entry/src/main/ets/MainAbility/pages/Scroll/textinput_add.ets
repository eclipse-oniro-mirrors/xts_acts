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
  Column,
  TextInputController,
  Builder,
  Grid,
  Color,
  Text,
  TextInput,
  Button,
  ForEach,
  BarState,
  GridItem,
  InputType,
  TextInputStyle,
  Margin,
  ClickEvent,
  CustomBuilder
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct TextInputExample {
  @State text: string = ''
  controller: TextInputController = new TextInputController()
  @State isHidden: boolean = false
  @State value1: string = ''
  @State value2: string = ''

  //自定义键盘组件
  @Builder CustomKeyboardBuilder() {
    Column() {
      Grid() {
        ForEach([1, 2, 3, 4, 5, 6, 7, 8, 9, '*', 0, '#'], (item: Int|String, index: int) => {
          GridItem() {
            Button(item + "")
              .width(110)
          }
        })
      }.maxCount(3).columnsGap(10).rowsGap(10).padding(5)
    }.backgroundColor(Color.Gray)
  }

  build() {
    Column() {
      Text('value1:' + this.value1).fontSize(18).margin(15)
      Text('value2:' + this.value2).fontSize(18).margin(15)
      TextInput({ text: this.text, placeholder: 'input your word...', controller: this.controller })
        .placeholderColor(Color.Grey)
        .placeholderFont({ size: 14, weight: 400 })
        .caretColor(Color.Blue)
        .width(400)
        .height(40)
        .margin(20)
        .barState(BarState.On)
        .key('textInputAdd')
        .fontSize(14)
        .customKeyboard(() => {this.CustomKeyboardBuilder()})
        .onContentScroll((totalOffsetX: number, totalOffsetY: number): void => {
        })
        .onTextSelectionChange((selectionStart: Int, selectionEnd: Int): void => {
          this.value1 = selectionStart + "";
          this.value2 = selectionEnd + "";
          this.controller.getTextContentLineCount();
        })
        .fontColor(Color.Black)
        .enableKeyboardOnFocus(true)
        .selectionMenuHidden(this.isHidden)
        .inputFilter('[a-z]', (e: string): void => {
          console.log(JSON.stringify(e))
        })
        .onChange((value: string): void => {
          this.text = value
        })
      Text(this.text)
      Button('Set caretPosition 1')
        .margin(15)
        .onClick((e: ClickEvent) => {
          // 将光标移动至第一个字符后
          this.controller.caretPosition(1)
        })
      Button('stopEditing')
        .onClick((e: ClickEvent) => {
          this.controller.stopEditing();
        }).margin({ top: 20 } as Margin)
      // 密码输入框
      TextInput({ placeholder: 'input your password...' })
        .width(400)
        .height(40)
        .margin(20)
        .type(InputType.Password)
        .maxLength(9)
        .showPasswordIcon(true)
      // 内联风格输入框
      TextInput({ placeholder: 'inline style' })
        .width(400)
        .height(50)
        .margin(20)
        .borderRadius(0)
        .style(TextInputStyle.Inline)
    }.width('100%')
  }
}