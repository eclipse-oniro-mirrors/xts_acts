'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { Entry, Text, TextAttribute, Column, Component, Button, ButtonAttribute, ClickEvent,
  Image,ImageFit, CaretOffset, SearchController, TextAlign, Search, Row, Color } from '@ohos.arkui.component'  // TextAttribute should be insert by ui-plugins
import { State } from '@ohos.arkui.stateManagement' // should be insert by ui-plugins

@Entry
@Component
struct SearchGesture {
  @State changeValue: string = '这是预置文本'
  @State changeValue2: string = '这是预置文本'
  @State caretIndexText: string = ''
  @State caretXText: string = ''
  @State positionInfo: CaretOffset = { index: 0, x: 0, y: 0 } as CaretOffset
  @State positionInfo2: CaretOffset = { index: 0, x: 0, y: 0 } as CaretOffset
  controller: SearchController = new SearchController()
  controller2: SearchController = new SearchController()

  build() {
    Column() {
      Text(this.caretXText).key('SearchCaretXText').height('5%').textAlign(TextAlign.Center)
      Text(this.caretIndexText).key('SearchCaretIndexText').height('5%').textAlign(TextAlign.Center)
      Search({ value: this.changeValue, placeholder: 'Type to search...', controller: this.controller })
        .searchButton('SEARCH', {fontSize: 5})
        .width('95%')
        .height('10%')
        .backgroundColor('#F5F5F5')
        .placeholderColor(Color.Grey)
        .placeholderFont({ size: 14, weight: 400 })
        .textFont({ size: 10, weight: 400 })
        .onChange((value: string): void => {
          this.changeValue = value
        })
        .key('SearchGesture')
      Search({ value: this.changeValue2, placeholder: 'Type to search...', controller: this.controller2 })
        .searchButton('SEARCH', {fontSize: 5})
        .width('95%')
        .height('10%')
        .backgroundColor('#F5F5F5')
        .placeholderColor(Color.Grey)
        .placeholderFont({ size: 14, weight: 400 })
        .textFont({ size: 10, weight: 400 })
        .onChange((value: string): void => {
          this.changeValue2 = value
        })
        .key('SearchCaret')
      Row(){
        Button('Caret:11')
          .key('SearchCaret11')
          .onClick((): void => {
            this.controller.caretPosition(11)
            this.positionInfo = this.controller.getCaretOffset() as CaretOffset
            this.caretXText = Number(this.positionInfo.x).toFixed(2)
          })
        Button('Get Caret')
          .key('GetCaret')
          .onClick((): void => {
            this.positionInfo2 = this.controller2.getCaretOffset() as CaretOffset
            this.caretIndexText = this.positionInfo2.index +  ''
          })
      }.height('10%')
      Row(){
        Button('Caret2:11')
          .key('Search2Caret11')
          .onClick((): void => {
            this.controller2.caretPosition(11)
          })
        Button('Caret3:11')
          .key('Search2Caret13')
          .onClick((): void => {
            this.controller2.caretPosition(2)
          })
      }.height('10%')

    }.width('100%')
  }
}