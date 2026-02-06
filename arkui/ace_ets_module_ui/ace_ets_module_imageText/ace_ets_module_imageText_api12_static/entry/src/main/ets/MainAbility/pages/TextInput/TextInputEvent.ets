'use static';
/*
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
import {
  Entry, Component,
  Column, Text, TextInput, InsertValue, DeleteValue, Callback
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
@Entry
@Component
struct TextInputEvent {
  @State insertValue: string = ''
  @State insertValue2: string = ''
  @State insertValue3: string = ''
  @State insertValue4: string = ''
  @State insertValue5: string = ''
  @State insertValue6: string = ''

  build() {
    Column() {
      Text(this.insertValue).key('TextInputEventText')
      Text(this.insertValue2).key('TextInputEventText2')
      Text(this.insertValue3).key('TextInputEventText3')
      Text(this.insertValue4).key('TextInputEventText4')
      Text(this.insertValue5).key('TextInputEventText5')
      Text(this.insertValue6).key('TextInputEventText6')

      TextInput({ text: 'TextInput' })
        .height(60)
        .onWillInsert((info: InsertValue): boolean => {
          console.log('onWillInsertonWillInsert',this.insertValue,this.insertValue2)
          this.insertValue = info.insertOffset + ''
          this.insertValue2 = info.insertValue
          return true;
        })
        .onDidInsert((info: InsertValue): void => {
          this.insertValue3 = info.insertOffset + ''
          this.insertValue4 = info.insertValue
        })
        .onWillDelete((info: DeleteValue): boolean => {
          this.insertValue5 = info.deleteOffset + ''
          this.insertValue6 = info.deleteValue
          return true;
        })
        .key('TextInputEvent')

      TextInput({ text: '0' })
        .height(60)
        .onWillInsert((info: InsertValue): boolean => {
          this.insertValue = info.insertOffset + ''
          this.insertValue2 = info.insertValue
          return false;
        })
        .onDidInsert((info: InsertValue): void => {
          this.insertValue3 = info.insertOffset + ''
          this.insertValue4 = info.insertValue
        })
        .key('TextInputEvent2')

      TextInput({ text: '0' })
        .height(60)
        .onWillDelete((info: DeleteValue): boolean => {
          this.insertValue5 = info.deleteOffset + ''
          this.insertValue6 = info.deleteValue
          return false;
        })
        .key('TextInputEvent3')


    }
    .height('100%')
  }
}