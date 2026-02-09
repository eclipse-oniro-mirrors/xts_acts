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

import {
  Entry,
  Component,
  Column,
  ColumnOptions,
  ClickEvent,
  Builder,
  Text,
  Button,
  Search,
  TextArea,
  Row,
  TextAlign,
  CopyOptions,
  TextOverflow,
  EllipsisMode,
  ButtonStyleMode,
  Color,
  SearchType,
  TextAreaType
} from '@ohos.arkui.component'
import {
  State,
} from '@ohos.arkui.stateManagement'
import inspector from '@ohos.arkui.inspector'
@Entry
@Component
struct buttonExample {
  @State message: string = 'Hello World'
  @State text: string = '3145897936@QQ.COM'
  @State onCopy: string = ''
  @State text1: string = 'This is set selection to Selection text content This is set selection to Selection text content.111111'
  @State start: int = 0
  @State end: int = 20

  @Builder
  build() {
    Column({space:5} as ColumnOptions) {
      Text('TextDataDetectorType.EMAIL')
        .id('TextKeyAllNUMBER8898888888')
        .textAlign(TextAlign.End)
        .fontSize(12)
        .border({width:1})
        .padding(10)
        .width('100%')
        .copyOption(CopyOptions.InApp)
        .enableDataDetector(true)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .selection(0,1)
        .ellipsisMode(EllipsisMode.START)
        .height('5%')


      Button('OK')
        .id('buttonStyle')
        .borderRadius(8)
        .backgroundColor('0x317aff')
        .width(90)
        .onClick((e:ClickEvent) => {
          console.log('ButtonType.Normal')
        })
        .buttonStyle(ButtonStyleMode.EMPHASIZED)
        .onClick((e:ClickEvent) => {
          console.log('TextKeyAllNUMBER8898888888' + JSON.stringifyJsonElement(JSON.parseJsonElement(inspector.getInspectorByKey('TextKeyAllNUMBER8898888888')).getElement('$attrs')))


        })
        .height('5%')


      Search({placeholder: 'Type to Search'})
        .searchButton('SEARCH')
        .width('90%')
        .id('searchType777777')
        .backgroundColor('#F5F5F5')
        .placeholderColor(Color.Grey)
        .placeholderFont({size: 14,weight: 400})
        .type(SearchType.PHONE_NUMBER)
        .height('5%')
        .margin(0)

      Search({placeholder: 'Type 23222'})
        .searchButton('SEARCH')
        .width('90%')
        .id('searchEMAIL66666666')
        .backgroundColor('#F5F5F5')
        .placeholderColor(Color.Grey)
        .placeholderFont({size: 14,weight: 400})
        .type(SearchType.EMAIL)
        .height('5%')
        .margin(0)




      TextArea({
        text: this.text,
        placeholder: 'The text area can hold an unlimited amount of text. input your word...',
      })
        .placeholderFont({ size: 16, weight: 400 })
        .width(336)
        .fontSize(16)
        .id('TextAreaTypeEMAIL333333333')
        .fontColor('#182431')
        .backgroundColor('#FFFFFF')
        .type(TextAreaType.EMAIL)
        .height('5%')



      TextArea({
        placeholder: 'The text area can hold an unlimited amount of text. input your word...',
      })
        .placeholderFont({ size: 16, weight: 400 })
        .width(236)
        .fontSize(16)
        .fontColor('#182431')
        .backgroundColor('#FFFFFF')
        .id('TextAreaTypeNUMBER44444444')
        .type(TextAreaType.PHONE_NUMBER)
        .height('5%')




      Text(this.text1)
        .fontSize(10)
        .copyOption(CopyOptions.InApp)
        .selection(this.start, this.end)
        .height('15%')
      Row(){
        Text(''+this.start).fontSize(12).margin(0).key('selectionStart').width('40%')
        Text(''+this.end).fontSize(12).margin(0).key('selectionEnd').width('40%')
      }.height('5%')
      Button('Set text selection')
        .onClick((e:ClickEvent) => {
          // 变更文本选中起始点、终点
          this.start = 10
          this.end = 30
        }).id('buttonSelect')
        .height('5%')
    }.height('100%')


  }

}