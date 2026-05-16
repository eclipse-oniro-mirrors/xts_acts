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
@Entry
@Component
struct TextAreaExample {
  @State text: string = ''
  controller: TextAreaController = new TextAreaController()
  @State value1: string = ''
  @State value2: string = ''

  // 自定义键盘组件
  @Builder CustomKeyboardBuilder() {
    Column() {
      Grid() {
        ForEach([1, 2, 3, 4, 5, 6, 7, 8, 9, '*', 0, '#'], (item: ESObject) => {
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
      TextArea({
        text: this.text,
        placeholder: 'The text area can hold an unlimited amount of text. input your word...',
        controller: this.controller
      })
        .placeholderFont({ size: 16, weight: 400 })
        .width(336)
        .height(56)
        .enableKeyboardOnFocus(true)
        .selectionMenuHidden(false)
        .margin(20)
        .customKeyboard(this.CustomKeyboardBuilder())
        .barState(BarState.On)
        .style(TextContentStyle.INLINE)
        .key('textAreaAdd')
        .fontSize(16)
        .onTextSelectionChange((selectionStart: number, selectionEnd: number)=>{
              this.value1 = selectionStart + "";
              this.value2  = selectionEnd + "";
              this.controller.getTextContentLineCount();
        })
        .onContentScroll((totalOffsetX: number, totalOffsetY: number) =>{
        })
        .fontColor('#182431')
        .backgroundColor('#FFFFFF')
        .onChange((value: string) => {
          this.text = value
        })
      Text(this.text)
      Button('Set caretPosition 1')
        .backgroundColor('#007DFF')
        .margin(15)
        .onClick(() => {
          // 设置光标位置到第一个字符后
          this.controller.caretPosition(1)
        })

       Button('stopEditing')
        .onClick(() => {
          this.controller.stopEditing();
        }).margin({top:20})

      Button('getTextContentRect')
        .onClick(() => {
          this.controller.getTextContentRect();
        }).margin({top:20})
      Button('stopEditing')
        .onClick(() => {
          this.controller.getTextContentLineCount();
        }).margin({top:20})

    }.width('100%').height('100%').backgroundColor('#F1F3F5')
  }
}