'use static'

/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { Entry, Row, Column, Component, Button, ClickEvent,
  Text, TextArea, TextInput, Search, ResourceStr, $r, Resource, TextInputStyle, OnTextSelectionChangeCallback } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct Index {
  @State text: string = 'Hello World!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!' +
    '!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!';
  @State message: Int = 0;
  callBack: OnTextSelectionChangeCallback = (selectionStart: Int, selectionEnd: Int) => {
    this.isOnChangeText = true;
    this.message = selectionStart;
  }

  @State isOnChangeText: boolean = false;
  @State searchIndex: Int = 0;
  searchArray: (OnTextSelectionChangeCallback | undefined)[] = [undefined, this.callBack];
  @State searchArrayStr: string[] = ['undefined', 'callback'];

  build() {
    Row(undefined) {
      Column(undefined) {
        Button('Search onTextSelectionChange: ' + this.searchArrayStr[this.searchIndex])
          .onClick((e: ClickEvent)=>{
            this.searchIndex = ++this.searchIndex % this.searchArray.length;
            this.isOnChangeText = false;
          })
          .id('button_onTextSelectionChange')
        Text(this.isOnChangeText ? `${this.message}` : 'undefined')
          .id('text_onTextSelectionChange')
        Search({value: this.text})
          .id('SearchTest')
          .height(56)
          .onTextSelectionChange(this.searchArray[this.searchIndex])
      }.height('100%')
    }.width('100%')
  }
}