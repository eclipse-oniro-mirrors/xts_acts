/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import {MessageManager,Callback} from '../utils/MessageManager';
@Entry
@Component
struct TextAreaExampleBC1 {
  @State text:string = 'test1'
  @State sizeT:number = 16
  @State weightT:number = 400
  @State placeholderFont:string ="#FFAACCEE"
  @State placeholderColor:string ="#FFAACCEE"
  @State textAlign:TextAlign = TextAlign.Start
  @State caretColor:string = "#ACDEFF"
  @State fontSize:number = 16
  @State textColor:string = '#000000'
  @State copyOption:CopyOptions = CopyOptions.LocalDevice
  @State placeholder:string ="The text area can hold an unlimited amount of text. input your word..."
  controller1: TextAreaController = new TextAreaController()
  controller2: TextAreaController = new TextAreaController()
  @State message1:string = 'text'
  @State message2:string = 'text'
  @State message3:string = 'text'
  @State message4:string = 'text'
  @State text2:string = 'test2'
  @State message5:string = 'start'
  messageManager:MessageManager = new MessageManager()
  onPageShow() {
    console.info('TextArea onPageShow')
    globalThis.value = {
      name:'messageManager',message:this.messageManager
    }
    let callback:Callback = (message: any) => {
      console.error('message = ' + message.name + "--" + message.value)
      if (message.name == 'text') {
        this.text = message.value
      }
      if (message.name == 'text2') {
        this.text2 = message.value
      }
      if (message.name == 'message5') {
        this.message5 = message.value
      }
      if (message.name == 'message1') {
        this.message1 = message.value
      }
      if (message.name == 'sizeT') {
        this.sizeT = message.value
      }
      if (message.name == 'weightT') {
        this.weightT = message.value
      }
      if (message.name == 'placeholderFont') {
        this.placeholderFont = message.value
      }
      if (message.name == 'placeholderColor') {
        this.placeholderColor = message.value
      }
      if (message.name == 'textAlign') {
        this.textAlign = message.value
      }
      if (message.name == 'caretColor') {
        this.caretColor = message.value
      }
      if (message.name == 'fontSize') {
        this.fontSize = message.value
      }
      if (message.name == 'textColor') {
        this.textColor = message.value
      }
      if (message.name == 'copyOption') {
        this.copyOption = message.value
      }
      if (message.name == 'placeholder') {
        this.placeholder = message.value
      }
      if (message.name == 'message2') {
        this.message2 = message.value
      }
      if (message.name == 'message3') {
        this.message3 = message.value
      }
      if (message.name == 'message4') {
        this.message4 = message.value
      }
    }
    this.messageManager.registerCallback(callback)
  }
  build() {
    Column() {
      TextArea({
        placeholder: this.placeholder,
        controller: this.controller1,
        text: this.text
      })
        .focusable(true)
        .placeholderFont({ size: this.sizeT, weight: this.weightT })
        .placeholderColor(this.placeholderColor)
        .width(336)
        .key('textArea1')
        .height(56)
        .margin(10)
        .fontSize(this.fontSize)
        .fontColor(this.textColor)
        .textAlign(this.textAlign)
        .caretColor(this.caretColor)
        .backgroundColor('#FFFFFF')
        .copyOption(this.copyOption)
        .onChange((value: string) => {
          this.message1 = value
        })
        .onCopy((value:string) => {
          console.info("copy value is " + value);
          this.message2 = 'copy'
        })
        .onCut((value:string) => {
          console.info("cut value is " + value);
          this.message3 = 'cut'
        })
        .onPaste((value:string) => {
          console.info("paste value is " + value);
          this.message4 = 'paste'
        })
        .onEditChange((isEditing: boolean) => {
          console.info("isEditing value is " + isEditing);
          if(isEditing) {
            this.message5 = 'doing'
          } else {
            this.message5 = 'Nodoing'
          }
        })
      Text(this.message1).key('change')
      Text(this.message2).key('copy')
      Text(this.message3).key('cut')
      Text(this.message4).key('paste')
      Text(this.message5).key('isEdit')
      Button(`button1`)
        .backgroundColor('#007DFF')
        .key(`button1`)
        .margin(10)
        .onClick(() => {
          this.controller1.caretPosition(2)
        })
      TextArea({
        text: this.text2,
        placeholder: '请输入',
        controller: this.controller2
      })
        .key('textArea2')
        .placeholderFont({ size: 16, weight: 400 })
        .width(336)
        .height(56)
        .margin(10)
        .fontSize(16)
        .fontColor('#182431')
        .backgroundColor('#FFFFFF')
        .onChange((value: string) => {
          this.text2 = value
        })
      Button(`button2`)
        .backgroundColor('#007DFF')
        .key(`button2`)
        .margin(5)
        .onClick(() => {
          this.controller2.caretPosition(0)
        })

    }.width('100%').height('100%').backgroundColor('#F1F3F5')
  }
}