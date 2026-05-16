/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
@Entry
@Component
struct TextAreaExample {
  @State text: string = 'sdas'
  @State positionInfo: CaretOffset = { index: 0, x: 0, y: 0 }
  controller: TextAreaController = new TextAreaController()

  build() {
    Column() {
      TextArea({
        text: $$this.text,
        placeholder: 'The text area can hold an unlimited amount of text. input your word...',
        controller: this.controller
      })
        .placeholderFont({ size: 16, weight: 400 })
        .width(336)
        .height(56)
        .fontSize(9)
        .fontColor('#182431')
        .backgroundColor('#FFFFFF')
        .id('textArea')
      Text(this.text).id('textAreaText').height('5%')
      Button('Set caretPosition 1')
        .backgroundColor('#007DFF')
        .height('5%')
        .onClick(() => {
          // 设置光标位置到第一个字符后
          this.controller.caretPosition(1)
        })
      Button('Get CaretOffset').height('5%')
        .backgroundColor('#007DFF')
        
        .onClick(() => {
          this.positionInfo = this.controller.getCaretOffset()
        })
    }.width('100%').height('100%').backgroundColor('#F1F3F5')
  }
}