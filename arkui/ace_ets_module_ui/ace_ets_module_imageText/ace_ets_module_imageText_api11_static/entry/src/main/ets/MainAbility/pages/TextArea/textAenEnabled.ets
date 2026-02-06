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

//TextArea、TextInput组件禁用
import {
  Entry,
  Component,
  Column,
  ColumnOptions,
  Text,
  Margin,
  TextAreaController,
  TextInputController,
  TextArea,
  TextInput,
  Color
} from '@ohos.arkui.component'
import {
  State,
} from '@ohos.arkui.stateManagement'
@Entry
@Component
struct TextAenExample {
  @State text: string = ''
  controller: TextAreaController = new TextAreaController()
  controller1: TextInputController = new TextInputController()
  @State text1: string = 'TextArea组件事件触发'
  @State text2: string = 'TextInput组件事件触发'
  @State text3: string = ''

  build() {
    Column({ space: 20 } as ColumnOptions) {
      Column(){
        Text(this.text1).key("taEnable")
          .margin({top: 10} as Margin)
        TextArea({
          text: this.text,
          placeholder: 'The text area can hold an unlimited amount of text. input your word...',
          controller: this.controller
        }).key("taText")
          .placeholderFont({ size: 16, weight: 400 })
          .width(336)
          .height(56)
          .margin(20)
          .fontSize(16)
          .fontColor('#182431')
          .backgroundColor('#FFFFFF')
          .enabled(false)
          .onChange((value: string) :void=> {
            this.text = value
            this.text1 = 'onChange 已触发'
          })
          .onEditChange(() :void=> {
            this.text1 = 'onEditChange 已触发'
          })
          .onCopy(() :void=> {
            this.text1 = 'onCopy 已触发'
          })
          .onCut(() :void=> {
            this.text1 = 'onCut 已触发'
          })
          .onPaste(() :void=> {
            this.text1 = 'onPaste 已触发'
          })
      }.width('100%').height('30%').backgroundColor('#F1F3F5')


      Column(){
        Text(this.text2).key("tiEnable")
          .margin({top: 10} as Margin)
        TextInput({ text: this.text3, placeholder: 'input your word...', controller: this.controller1 })
          .key("tiText")
          .placeholderColor(Color.Grey)
          .placeholderFont({ size: 16, weight: 400 })
          .caretColor(Color.Blue)
          .width(336)
          .height(56)
          .margin(20)
          .fontSize(16)
          .fontColor(Color.Black)
          .backgroundColor('#FFFFFF')
          .enabled(false)
          .inputFilter('[a-z]', (e:string) :void=> {
            console.log(JSON.stringify(e))
          })
          .onChange((value: string) :void=> {
            this.text3 = value
            this.text2 = 'onChange 已触发'
          })
          .onSubmit(() :void=> {
            this.text2 = 'onSubmit 已触发'
          })
          .onEditChange(() :void=> {
            this.text2 = 'onEditChange 已触发'
          })
          .onCopy(() :void=> {
            this.text2 = 'onCopy 已触发'
          })
          .onCut(() :void=> {
            this.text2 = 'onCut 已触发'
          })
          .onPaste(() :void=> {
            this.text2 = 'onPaste 已触发'
          })
      }.width('100%').height('30%').backgroundColor('#F1F3F5')

    }
  }
}