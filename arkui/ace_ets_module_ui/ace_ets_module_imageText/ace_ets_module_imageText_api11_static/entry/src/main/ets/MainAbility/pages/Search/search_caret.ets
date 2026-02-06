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

import {
  Entry,
  Component,
  Column,
  Text,
  Search,
  Row,
  Button,
  ClickEvent,
  CaretOffset,
  SearchController,
  Color
} from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct SearchCaret {
  @State changeValue: string = '123456789'
  @State submitValue: string = ''
  @State text: string = ''
  @State positionInfo: CaretOffset = { index: 0, x: 0, y: 0 } as CaretOffset
  controller: SearchController = new SearchController()

  build() {
    Column() {
      Text(this.text).fontSize(18).margin(15).key('SearchCaretText')
      Search({ value: this.changeValue, placeholder: 'Type to search...', controller: this.controller })
        .searchButton('SEARCH')
        .width('95%')
        .height(40)
        .backgroundColor('#F5F5F5')
        .placeholderColor(Color.Grey)
        .placeholderFont({ size: 14, weight: 400 })
        .textFont({ size: 14, weight: 400 })
        .onChange((value: string): void => {
          this.changeValue = value
        })
        .margin(20)
      Row() {
        Button('Caret:1')
          .key('SearchCaret1')
          .onClick((e: ClickEvent) => {
            this.controller.caretPosition(1)
            this.positionInfo = this.controller.getCaretOffset()!
            this.text = this.positionInfo.index + ''
          })
        Button('Caret:5')
          .key('SearchCaret5')
          .onClick((e: ClickEvent) => {
            this.controller.caretPosition(5)
            this.positionInfo = this.controller.getCaretOffset()!
            this.text = this.positionInfo.index + ''
          })
        Button('Caret:3')
          .key('SearchCaret3')
          .onClick((e: ClickEvent) => {
            this.controller.caretPosition(3)
            this.positionInfo = this.controller.getCaretOffset()!
            this.text = this.positionInfo.index + ''
          })
      }

      Row() {
        Button('Caret:20')
          .key('SearchCaret20')
          .onClick((e: ClickEvent) => {
            this.controller.caretPosition(20)
            this.positionInfo = this.controller.getCaretOffset()!
            this.text = this.positionInfo.index + ''
          })
        Button('Caret:-1')
          .key('SearchCaret_1')
          .onClick((e: ClickEvent) => {
            this.controller.caretPosition(-1)
            this.positionInfo = this.controller.getCaretOffset()!
            this.text = this.positionInfo.index + ''
          })
      }
    }.width('100%')
  }
}