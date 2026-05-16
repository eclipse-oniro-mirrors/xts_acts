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
import { Entry, Text, Callback, Row, Column, Component, Button, TextAlign, ClickEvent, DeleteValue, InputType, InsertValue, TextOverflow, TextInputStyle, TextInput } from '@ohos.arkui.component'
import {
  State,
  AppStorage
} from '@ohos.arkui.stateManagement'
@Entry
@Component
struct SearchEvent2 {
  @State insertValue: string = ''
  @State insertValue2: string = ''
  @State insertValue3: string = ''
  @State insertValue4: string = ''
  @State insertValue5: string = ''
  @State insertValue6: string = ''
  @State type: InputType = InputType.Normal
  @State textIndent: number = 0
  @State style: TextInputStyle = TextInputStyle.Default
  @State textOverFlow: TextOverflow = TextOverflow.None
  @State text: string = '0'

  build() {
    Column() {
      Row() {
        Text(this.insertValue).key('SearchEvent2Text').fontSize(10).width('100%').textAlign(TextAlign.Center).height('5%')
        Text(this.insertValue2).key('SearchEvent2Text2').fontSize(10).width('100%').textAlign(TextAlign.Center).height('5%')
        Text(this.insertValue3).key('SearchEvent2Text3').fontSize(10).width('100%').textAlign(TextAlign.Center).height('5%')
      }
      Row() {
        Text(this.insertValue4).key('SearchEvent2Text4').fontSize(10).width('100%').textAlign(TextAlign.Center).height('5%')
        Text(this.insertValue5).key('SearchEvent2Text5').fontSize(10).width('100%').textAlign(TextAlign.Center).height('5%')
        Text(this.insertValue6).key('SearchEvent2Text6').fontSize(10).width('100%').textAlign(TextAlign.Center).height('5%')
      }
      Row() {
        TextInput()
          .height('10%')
          .fontSize(10)
          .width(100)
          .onWillInsert((info: InsertValue): boolean => {
            this.insertValue += '0'
            return true;
          })
          .onDidInsert((info: InsertValue): void => {
            this.insertValue += '1'
          })
          .onWillDelete((info: DeleteValue): boolean => {
            this.insertValue += '2'
            return true;
          })
          .onDidDelete((info: DeleteValue):void => {
            this.insertValue += '3'
            this.insertValue2 = info.deleteOffset + ''
          })
          .key('Search2Event')

        TextInput({ text: '0' })
          .height('10%')
          .fontSize(10)
          .width(100)
          .onWillInsert((info: InsertValue): boolean => {
            this.insertValue = ''
            return false;
          })
          .onDidInsert((info: InsertValue): void => {
            this.insertValue = '1'
          })
          .onWillDelete((info: DeleteValue): boolean => {
            this.insertValue2 = '0'
            return true;
          })
          .onDidDelete((info: DeleteValue): void => {
            this.insertValue2 += '1'
          })
          .key('Search2Event2')
      }

      Row() {
        TextInput({ text: '0' })
          .height('10%')
          .fontSize(10)
          .width(100)
          .onWillInsert((info: InsertValue): boolean => {
            this.insertValue3 = '0'
            return true;
          })
          .onDidInsert((info: InsertValue): void => {
            this.insertValue3 += '1'
          })
          .onWillDelete((info: DeleteValue): boolean => {
            this.insertValue4 = '0'
            return false;
          })
          .onDidDelete((info: DeleteValue): void => {
            this.insertValue4 = '1'
          })
          .key('Search2Event3')

        TextInput({ text: '0' })
          .height('10%')
          .fontSize(10)
          .width(100)
          .onWillInsert((info: InsertValue): boolean => {
            this.insertValue3 = '0'
            return false;
          })
          .onDidInsert((info: InsertValue): void => {
            this.insertValue3 = '1'
          })
          .onWillDelete((info: DeleteValue): boolean => {
            this.insertValue4 = '0'
            return false;
          })
          .onDidDelete((info: DeleteValue): void => {
            this.insertValue4 = '1'
          })
          .key('Search2Event4')
      }

      Row() {
        TextInput({ text: this.text })
          .height('10%')
          .fontSize(10)
          .width(100)
          .type(this.type)
          .textIndent(this.textIndent)
          .style(this.style)
          .textOverflow(this.textOverFlow)
          .onWillInsert((info: InsertValue): boolean => {
            this.insertValue5 = 'onWillInsert'
            return false;
          })
          .key('Search2Event5')

        TextInput({ text: this.text })
          .height('10%')
          .fontSize(10)
          .width(100)
          // .inputFilter('[a-z]', (e) => {
          //   console.log(String(e))
          // })
          .onWillInsert((info: InsertValue): boolean => {
            this.insertValue5 = 'onWillInsert'
            return false;
          })
          .key('Search2Event6')
      }
      Row () {
        Button('change')
          .key('Search2EventBt')
          .onClick((event: ClickEvent) => {
            this.type = InputType.PhoneNumber
            this.textIndent = 10
            this.style = TextInputStyle.Inline
            this.textOverFlow = TextOverflow.Clip
          }).height('5%')
        Button('change')
          .key('Search2EventBt2')
          .onClick((event: ClickEvent) => {
            this.text = 'text'
          }).height('5%')
      }
    }
    .height('100%')
  }
}