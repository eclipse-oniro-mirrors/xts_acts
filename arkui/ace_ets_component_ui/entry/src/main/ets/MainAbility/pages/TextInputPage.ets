/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

type Message = boolean|string|number|InputType|Color|Font|EnterKeyType|CopyOptions|TextAlign

@Entry
@Component
struct TextInputPage {
  @State placeholder: string = 'input your word...'
  @State type: InputType = InputType.Email
  @State placeholderColor : Color = Color.Grey
  @State placeholderFont : Font = { size: 14, weight: 400 }
  @State enterKeyType: EnterKeyType = EnterKeyType.Search
  @State caretColor: Color = Color.Blue
  @State maxLength: number = 10
  @State copyOption: CopyOptions = CopyOptions.InApp
  @State showPasswordIcon: boolean = false
  @State style: TextInputStyle = TextInputStyle.Default
  @State textAlign: TextAlign = TextAlign.Center
  @State text: string = 'onChange'
  @State onSubmit: string = ''
  @State onEditChange: string = ''
  @State onCopy: string = ''
  @State onCut: string = ''
  @State onPaste: string = ''
  controller: TextInputController = new TextInputController()
  messageManager = new MessageManager<Message>()

  onPageShow() {
    console.info('TextInput onPageShow')
    globalThis.value = {
      name:'messageManager',message:this.messageManager
    }
    let callback: Callback<Message> = message => {
      console.error('message = ' + message.name + "--" + message.value)
      if (message.name == 'placeholder') {
        this.placeholder = message.value as string
      }
      if (message.name == 'text') {
        this.text = message.value as string
      }
      if (message.name == 'type') {
        this.type = message.value as InputType
      }
      if (message.name == 'placeholderColor') {
        this.placeholderColor = message.value as Color
      }
      if (message.name == 'placeholderFont') {
        this.placeholderFont = message.value as Font
      }
      if (message.name == 'enterKeyType') {
        this.enterKeyType = message.value as EnterKeyType
      }
      if (message.name == 'caretColor') {
        this.caretColor = message.value as Color
      }
      if (message.name == 'maxLength') {
        this.maxLength = message.value as number
      }
      if (message.name == 'copyOption') {
        this.copyOption = message.value as CopyOptions
      }
      if (message.name == 'showPasswordIcon') {
        this.showPasswordIcon = message.value as boolean
      }
      if (message.name == 'style') {
        this.style = message.value as TextInputStyle
      }
      if (message.name == 'textAlign') {
        this.textAlign = message.value as TextAlign
      }
      if (message.name == 'onSubmit') {
        this.onSubmit = message.value as string
      }
      if (message.name == 'onEditChange') {
        this.onEditChange = message.value as string
      }
      if (message.name == 'onCopy') {
        this.onCopy = message.value as string
      }
      if (message.name == 'onCut') {
        this.onCut = message.value as string
      }
      if (message.name == 'onPaste') {
        this.onPaste = message.value as string
      }
    }
    this.messageManager.registerCallback(callback)
  }

  build() {
    Column() {
      TextInput({ placeholder: this.placeholder, controller: this.controller })
        .type(this.type)
        .placeholderColor(this.placeholderColor)
        .placeholderFont(this.placeholderFont)
        .enterKeyType(this.enterKeyType)
        .caretColor(this.caretColor)
        .maxLength(this.maxLength)
        .copyOption(this.copyOption)
        .showPasswordIcon(this.showPasswordIcon)
        .style(this.style)
        .textAlign(this.textAlign)
        .key('textInput')
        .width(400)
        .height(40)
        .margin(20)
        .fontSize(14)
        .fontColor(Color.Black)
        .onChange((value: string) => {
          this.text = value
        })
        .onSubmit((enterKey: EnterKeyType) => {
          this.onSubmit = enterKey.toString()
        })
        .onEditChange((isEditing: boolean) => {
          this.onEditChange = isEditing.toString()
        })
        .onCopy((value: string) => {
          this.onCopy = value
        })
        .onCut((value: string) => {
          this.onCut = value
        })
        .onPaste((value: string) => {
          this.onPaste = value
        })
      Text(this.text).fontSize(20).margin(10).key('text')
      Button('Set caretPosition 1')
        .key('button')
        .margin(15)
        .onClick(() => {
          // 将光标移动至第一个字符后
          this.controller.caretPosition(1)
        })
      // 密码输入框
      TextInput({ placeholder: 'input your password...' })
        .key('password')
        .width(400)
        .height(40)
        .margin(10)
        .type(InputType.Password)
        .maxLength(9)
        .showPasswordIcon(true)
      // 内联风格输入框
      TextInput({ placeholder: 'inline style' })
        .key('input')
        .width(400)
        .height(50)
        .margin(10)
        .borderRadius(0)
        .style(TextInputStyle.Inline)
      Text('onSubmit:' + this.onSubmit).fontSize(20).margin(10).key('submit')
      Text('onEditChange:' + this.onEditChange).fontSize(20).margin(10).key('editChange')
      Text('onCopy:' + this.onCopy).fontSize(20).margin(10).key('copy')
      Text('onCut:' + this.onCut).fontSize(20).margin(10).key('cut')
      Text('onPaste:' + this.onPaste).fontSize(20).margin(10).key('paste')
    }.width('100%')
  }
}