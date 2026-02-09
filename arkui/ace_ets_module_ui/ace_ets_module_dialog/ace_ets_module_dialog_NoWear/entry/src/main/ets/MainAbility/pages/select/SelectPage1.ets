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
struct SelectPage1 {
  @State optionValue: string = 'aaa'
  @State icon: string = "/resources/base/media/star_1.png"
  @State selected: number = 0
  @State selectValue: string = 'SelecteButton'
  @State selectFont: Font = { size: 16, weight: 500 }
  @State fontColor: Color = Color.Black
  @State selectedOptionBgColor: Color = Color.Grey
  @State selectedOptionFont: Font = { size: 16, weight: 400 }
  @State selectedOptionFontColor: Color = Color.Red
  @State optionBgColor: Color = Color.White
  @State optionFont: Font = { size: 16, weight: 400 }
  @State optionFontColor: Color = Color.Green
  @State indexValue: number = 0
  messageManager:MessageManager = new MessageManager()

  onPageShow() {
    console.info('SelectPage onPageShow')
    globalThis.value = {
      name:'messageManager',message:this.messageManager
    }
    let callback: Callback = (message: ESObject) => {
      console.error('message = ' + message.name + "--" + message.value)
      if (message.name == 'optionValue') {
        this.optionValue = message.value
      }
      if (message.name == 'icon') {
        this.icon = message.value
      }
      if (message.name == 'selected') {
        this.selected = message.value
      }
      if (message.name == 'selectValue') {
        this.selectValue = message.value
      }
      if (message.name == 'selectFont') {
        this.selectFont = message.value
      }
      if (message.name == 'fontColor') {
        this.fontColor = message.value
      }
      if (message.name == 'selectedOptionBgColor') {
        this.selectedOptionBgColor = message.value
      }
      if (message.name == 'selectedOptionFont') {
        this.selectedOptionFont = message.value
      }
      if (message.name == 'selectedOptionFontColor') {
        this.selectedOptionFontColor = message.value
      }
      if (message.name == 'optionBgColor') {
        this.optionBgColor = message.value
      }
      if (message.name == 'optionFont') {
        this.optionFont = message.value
      }
      if (message.name == 'optionFontColor') {
        this.optionFontColor = message.value
      }
    }
    this.messageManager.registerCallback(callback)
  }

  build() {
    Column() {
      Text('indexValue:' + this.indexValue).fontSize(18).margin(15).key('indexValue')
      Select([{ value: this.optionValue, icon: this.icon },
              { value: 'bbb', icon: "/resources/base/media/star_1.png" },
              { value: 'ccc', icon: "/resources/base/media/star_1.png" }])
        .selected(this.selected)
        .value(this.selectValue)
        .font(this.selectFont)
        .key('select')
        .fontColor(this.fontColor)
        .selectedOptionBgColor(this.selectedOptionBgColor)
        .selectedOptionFont(this.selectedOptionFont)
        .selectedOptionFontColor(this.selectedOptionFontColor)
        .optionBgColor(this.optionBgColor)
        .optionFont(this.optionFont)
        .optionFontColor(this.optionFontColor)
        .onSelect((index: number) => {
          this.indexValue = index
          console.info('Select:' + index)
        })
    }.width('100%')
  }
}