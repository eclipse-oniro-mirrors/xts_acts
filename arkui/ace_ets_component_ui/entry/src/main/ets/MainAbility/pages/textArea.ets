
/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
 import {MessageManager,Callback} from '../utils/MessageManager';
@Entry
@Component
struct TextAreaExample {
  @State text:string = 'test1'
  @State sizeT:number = 16
  @State weightT:number = 400
  @State placeholderFont:string ="#FFAACCEE"
  @State placeholderColor:string ="#FFAACCEE"
  @State textAlign:TextAlign = TextAlign.End
  @State caretColor:string = "#ACDEFF"
  @State fontSize:number = 16
  @State copyOption:CopyOptions = CopyOptions.LocalDevice
  @State placeholder:string ="The text area can hold an unlimited amount of text. input your word..."
  controller: TextAreaController = new TextAreaController()
  @State message1:string = 'text'
  @State message2:string = 'text'
  @State message3:string = 'text'
  @State message4:string = 'text'

  messageManager:MessageManager = new MessageManager()

  onPageShow() {
    console.info('TextArea onPageShow')
    globalThis.value = {
      name:'messageManager',message:this.messageManager
    }
    let callback:Callback = (message:any) => {
      console.error('message = ' + message.name + "--" + message.value)
      if (message.name == 'text') {
          this.text = message.value
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
        controller: this.controller,
        text: this.text
      })
        .placeholderFont({ size: this.sizeT, weight: this.weightT })
        .placeholderColor(this.placeholderColor)
        .width(336)
        .key('textArea')
        .height(56)
        .margin(20)
        .fontSize(this.fontSize)
        .fontColor('#182431')
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

      Text(this.message1).key('change')
      Text(this.message2).key('copy')
      Text(this.message3).key('cut')
      Text(this.message4).key('paste')
      Button('Set caretPosition 1')
        .backgroundColor('#007DFF')
        .margin(15)
        .onClick(() => {
          // 设置光标位置到第一个字符后
          this.controller.caretPosition(1)
        })
    }.width('100%').height('100%').backgroundColor('#F1F3F5')
  }
}