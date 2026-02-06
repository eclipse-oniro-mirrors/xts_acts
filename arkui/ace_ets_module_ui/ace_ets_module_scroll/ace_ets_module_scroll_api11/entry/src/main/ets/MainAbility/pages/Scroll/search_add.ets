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
struct SearchExample {
  @State changeValue: string = ''
  @State submitValue: string = ''
  controller: SearchController = new SearchController()
  @State isHidden:boolean = false
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
      Text('onSubmit:' + this.submitValue).fontSize(18).margin(15)
      Text('onChange:' + this.changeValue).fontSize(18).margin(15)
      Text('value1:' + this.value1).fontSize(18).margin(15)
      Text('value2:' + this.value2).fontSize(18).margin(15)
      Search({ value: this.changeValue, placeholder: 'Type to search...', controller: this.controller })
        .searchButton('SEARCH')
        .width('95%')
        .height(40)
        .key('searchAdd')
        .backgroundColor('#F5F5F5')
        .placeholderColor(Color.Grey)
        .enableKeyboardOnFocus(true)
        .selectionMenuHidden(this.isHidden)
        .placeholderFont({ size: 14, weight: 400 })
        .customKeyboard(this.CustomKeyboardBuilder())
        .onContentScroll((totalOffsetX: number, totalOffsetY: number) =>{
        })
        .onTextSelectionChange((selectionStart: number, selectionEnd: number)=>{
              this.value1 = selectionStart + "";
              this.value2  = selectionEnd + "";
              this.controller.getTextContentLineCount();
        })
        .textFont({ size: 14, weight: 400 })
        .onSubmit((value: string) => {
          this.submitValue = value
        })
        .onChange((value: string) => {
          this.changeValue = value
        })
        .margin(20)
      Button('Set caretPosition 1')
        .onClick(() => {
          // 设置光标位置到输入的第一个字符后
          this.controller.caretPosition(1)
        })

      Button('stopEditing')
        .onClick(() => {
          this.controller.stopEditing();
        }).margin({top:20})
    }.width('100%')
  }
}
