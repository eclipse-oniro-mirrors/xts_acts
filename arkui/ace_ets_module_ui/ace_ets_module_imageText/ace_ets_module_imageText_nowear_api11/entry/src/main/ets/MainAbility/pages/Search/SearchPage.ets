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
import { MessageManager, Callback } from '../../common/MessageManager';

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
  messageManager:MessageManager = new MessageManager()

  onPageShow() {
    console.info('SearchPage onPageShow')
    globalThis.value = {
      name:'messageManager',message:this.messageManager
    }
    let callback: Callback = (message: ESObject) => {
      console.error('message = ' + message.name + "--" + message.value)
      if (message.name == 'changeValue') {
        this.changeValue = message.value
      }
      if (message.name == 'submitValue') {
        this.submitValue = message.value
      }
      if (message.name == 'copyValue') {
        this.copyValue = message.value
      }
      if (message.name == 'cutValue') {
        this.cutValue = message.value
      }
      if (message.name == 'pasteValue') {
        this.pasteValue = message.value
      }
      if (message.name == 'positionValue') {
        this.positionValue = message.value
      }
      if (message.name == 'placeHolder') {
        this.placeholder = message.value
      }
      if (message.name == 'icon') {
        this.icon = message.value
      }
      if (message.name == 'searchButton') {
        this.searchButton = message.value
      }
      if (message.name == 'placeholderColor') {
        this.placeholderColor = message.value
      }
      if (message.name == 'placeholderFont') {
        this.placeholderFont = message.value
      }
      if (message.name == 'textFont') {
        this.textFont = message.value
      }
      if (message.name == 'textAlign') {
        this.textAlign = message.value
      }
      if (message.name == 'copyOption') {
        this.copyOption = message.value
      }
    }
    this.messageManager.registerCallback(callback)
  }

  build() {
    Column() {
      Row(){
        Text('onSubmit:' + this.submitValue).fontSize(10).key('submit').textAlign(TextAlign.Center).width('20%')
        Text('onChange:' + this.changeValue).fontSize(10).key('change').textAlign(TextAlign.Center).width('20%')
        Text('onCopy:' + this.copyValue).fontSize(10).key('copy').textAlign(TextAlign.Center).width('20%')
        Text('onCut:' + this.cutValue).fontSize(10).key('cut').textAlign(TextAlign.Center).width('20%')
        Text('onPaste:' + this.pasteValue).fontSize(10).key('paste').textAlign(TextAlign.Center).width('20%')
      }.height('5%')
      Search({ value: this.changeValue, placeholder: this.placeholder, icon: this.icon, controller: this.controller })
        .searchButton(this.searchButton, {fontSize: 10}).id("searchButton")
        .width('80%')
        .height('10%')
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
        }).key('button').height('5%')
    }.width('100%')
  }
}