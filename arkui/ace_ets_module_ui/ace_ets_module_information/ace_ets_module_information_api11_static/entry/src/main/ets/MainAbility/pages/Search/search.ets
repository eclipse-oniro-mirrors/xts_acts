'use static';
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
import events_emitter from '@ohos.events.emitter'
import {Entry, Component, CopyOptions, SearchController, CaretOffset, FontStyle, Font, Column, Text, Search, SearchOptions, ClickEvent, Button, Color } from '@ohos.arkui.component'
import { State, StoragePropRef, AppStorage } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct SearchExample {
  @State changevalue: string= ''
  @State submitvalue: string= ''
  @StoragePropRef('textFont') textFont:Font = {
          size: 10,
          weight: 10,
          family: 'serif', 
          style: FontStyle.Normal
        } as Font
  @StoragePropRef('searchButton') searchButton:string = "10"
  @StoragePropRef('maxLength') maxLength: int = 19
  @StoragePropRef('copyOption') copyOption:CopyOptions = CopyOptions.LocalDevice
  controller: SearchController= new SearchController()
  controller2: SearchController= new SearchController()
  @State caretIndex : number = 9999
  @StoragePropRef('searchText') searchText: string = ''
  @State positionInfo: CaretOffset = { index: 9999, x: 0, y: 0 } as CaretOffset

  build() {
    Column() {
      Text(this.submitvalue)
      Text(this.changevalue)
      Search({ value: '', placeholder: 'input content', controller: this.controller } as SearchOptions)
        .searchButton('search')
        .textFont(this.textFont)
        .searchButton(this.searchButton)
        .maxLength(this.maxLength)
        .copyOption(this.copyOption)
        .key('search')
        .placeholderColor(Color.Red)
        .placeholderFont({
          size: 10,
          weight: 10,
          family: 'serif',
          style: FontStyle.Normal
        })
        .onSubmit((value: string):void => {
          this.submitvalue = value
        })
        .onChange((value: string):void => {
          this.changevalue = value
        })

      Search({ value: this.searchText, placeholder: 'input content', controller: this.controller2 } as SearchOptions)
        .textFont(this.textFont)
        .key('mySearch')
        .placeholderColor(Color.Red)
        .maxLength(10)
        .placeholderFont({
          size: 10,
          weight: 10,
          family: 'serif',
          style: FontStyle.Normal
        })

      Button('caretoffset')
        .backgroundColor('#00FF00')
        .margin(15)
        .onClick((e: ClickEvent) => {
          console.info('text length:' + this.searchText.length)
          this.controller2.caretPosition(this.searchText.length)
          this.positionInfo = this.controller2.getCaretOffset() as CaretOffset
          console.info("index1111111:" + this.positionInfo.index)
          this.caretIndex = this.positionInfo.index
        })
        .key('caretOffsetBtn')

      Text("Index" + this.caretIndex).key('caretOffsetText')
    }
  }
}











