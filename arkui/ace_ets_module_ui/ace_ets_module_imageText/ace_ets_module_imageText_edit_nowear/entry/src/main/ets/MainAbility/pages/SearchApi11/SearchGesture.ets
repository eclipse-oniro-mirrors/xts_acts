/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
@Entry
@Component
struct SearchGesture {
  @State changeValue: string = '这是预置文本'
  @State changeValue2: string = '这是预置文本'
  @State caretIndexText: string = ''
  @State caretXText: string = ''
  @State positionInfo: CaretOffset = { index: 0, x: 0, y: 0 }
  @State positionInfo2: CaretOffset = { index: 0, x: 0, y: 0 }
  controller: SearchController = new SearchController()
  controller2: SearchController = new SearchController()

  build() {
    Column() {
      Row(){
        Text(this.caretXText).key('SearchCaretXText').textAlign(TextAlign.Center).width('50%')
        Text(this.caretIndexText).key('SearchCaretIndexText').textAlign(TextAlign.Center).width('50%')
      }.height('5%')
      Search({ value: this.changeValue, placeholder: 'Type to search...', controller: this.controller })
        .searchButton('SEARCH1', {fontSize: 5})
        .width('95%')
        .height('10%')
        .backgroundColor('#F5F5F5')
        .placeholderColor(Color.Grey)
        .placeholderFont({ size: 14, weight: 400 })
        .textFont({ size: 10, weight: 400 })
        .onChange((value: string) => {
          this.changeValue = value
        })
        .key('SearchGesture')
      Search({ value: this.changeValue2, placeholder: 'Type to search...', controller: this.controller2 })
        .searchButton('SEARCH2', {fontSize: 5})
        .width('95%')
        .height('10%')
        .backgroundColor('#F5F5F5')
        .placeholderColor(Color.Grey)
        .placeholderFont({ size: 14, weight: 400 })
        .textFont({ size: 10, weight: 400 })
        .onChange((value: string) => {
          this.changeValue2 = value
        })
        .key('SearchCaret')
      Row(){
        Button('Caret:11')
          .key('SearchCaret11')
          .onClick(() => {
            this.controller.caretPosition(11)
            this.positionInfo = this.controller.getCaretOffset()
            this.caretXText = this.positionInfo.x.toFixed(2)
          })
        Button('Get Caret')
          .key('GetCaret')
          .onClick(() => {
            this.positionInfo2 = this.controller2.getCaretOffset()
            this.caretIndexText = this.positionInfo2.index +  ''
          })
      }.height('5%')
      Row(){
        Button('Caret2:11')
          .key('Search2Caret11')
          .onClick(() => {
            this.controller2.caretPosition(11)
          })
        Button('Caret3:11')
          .key('Search2Caret13')
          .onClick(() => {
            this.controller2.caretPosition(2)
          })
      }.height('5%')

    }.width('100%')
  }
}