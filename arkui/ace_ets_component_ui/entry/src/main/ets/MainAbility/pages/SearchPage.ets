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

type Message = string|number|Color|Font|TextAlign|CopyOptions

@Entry
@Component
struct SearchPage {
  @State changeValue: string = ''
  @State submitValue: string = ''
  @State copyValue: string = ''
  @State cutValue: string = ''
  @State pasteValue: string = ''
  @State positionValue: number = 1
  @State placeholder: string = 'Type to search...'
  @State icon: string = ''
  @State searchButton: string = 'SEARCH'
  @State placeholderColor: Color = Color.Grey
  @State placeholderFont: Font = { size: 14, weight: 400 }
  @State textFont: Font = { size: 14, weight: 400 }
  @State textAlign: TextAlign = TextAlign.Start
  @State copyOption: CopyOptions = CopyOptions.InApp
  controller: SearchController = new SearchController()
  messageManager = new MessageManager<Message>()

  onPageShow() {
    console.info('SearchPage onPageShow')
    globalThis.value = {
      name:'messageManager',message:this.messageManager
    }
    let callback: Callback<Message> = message => {
      console.error('message = ' + message.name + "--" + message.value)
      if (message.name == 'changeValue') {
        this.changeValue = message.value as string
      }
      if (message.name == 'submitValue') {
        this.submitValue = message.value as string
      }
      if (message.name == 'copyValue') {
        this.copyValue = message.value as string
      }
      if (message.name == 'cutValue') {
        this.cutValue = message.value as string
      }
      if (message.name == 'pasteValue') {
        this.pasteValue = message.value as string
      }
      if (message.name == 'positionValue') {
        this.positionValue = message.value as number
      }
      if (message.name == 'placeHolder') {
        this.placeholder = message.value as string
      }
      if (message.name == 'icon') {
        this.icon = message.value as string
      }
      if (message.name == 'searchButton') {
        this.searchButton = message.value as string
      }
      if (message.name == 'placeholderColor') {
        this.placeholderColor = message.value as Color
      }
      if (message.name == 'placeholderFont') {
        this.placeholderFont = message.value as Font
      }
      if (message.name == 'textFont') {
        this.textFont = message.value as Font
      }
      if (message.name == 'textAlign') {
        this.textAlign = message.value as TextAlign
      }
      if (message.name == 'copyOption') {
        this.copyOption = message.value as CopyOptions
      }
    }
    this.messageManager.registerCallback(callback)
  }

  build() {
    Column() {
      Text('onSubmit:' + this.submitValue).fontSize(10).margin(10).key('submit')
      Text('onChange:' + this.changeValue).fontSize(10).margin(10).key('change')
      Text('onCopy:' + this.copyValue).fontSize(10).margin(10).key('copy')
      Text('onCut:' + this.cutValue).fontSize(10).margin(10).key('cut')
      Text('onPaste:' + this.pasteValue).fontSize(10).margin(10).key('paste')
      Search({ value: this.changeValue, placeholder: this.placeholder, icon: this.icon, controller: this.controller })
        .searchButton(this.searchButton).id("searchButton")
        .width(400)
        .height(40)
        .key('search')
        .backgroundColor(Color.White)
        .placeholderColor(this.placeholderColor)
        .placeholderFont(this.placeholderFont)
        .textFont(this.textFont)
        .textAlign(this.textAlign)
        .copyOption(this.copyOption)
        .onSubmit((value: string) => {
          this.submitValue = value
        })
        .onChange((value: string) => {
          this.changeValue = value
        })
        .onCopy((value: string) => {
          this.copyValue = value
        })
        .onCut((value: string) => {
          this.cutValue = value
        })
        .onPaste((value: string) => {
          this.pasteValue = value
        })
        .margin(20)
      Button('Set caretPosition ' + this.positionValue)
        .onClick(() => {
          // 设置光标位置到输入的第一个字符后
          this.controller.caretPosition(this.positionValue)
        }).key('button')
    }.width('100%')
  }
}