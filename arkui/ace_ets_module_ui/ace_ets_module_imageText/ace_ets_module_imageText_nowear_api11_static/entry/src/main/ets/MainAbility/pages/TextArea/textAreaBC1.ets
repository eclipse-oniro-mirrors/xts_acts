'use static';
/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
  TextAreaController,
  TextAlign,
  CopyOptions,
  Column,
  TextArea,
  Row,
  Text,
  Button,
  ClickEvent
} from '@ohos.arkui.component'
import {
  State,
} from '@ohos.arkui.stateManagement'
import { MessageManager, Callback, Message } from '../../common/MessageManager';
import { AppStorage } from '@ohos.arkui.stateManagement';
import events_emitter from '@ohos.events.emitter'
import { RecordData } from '@ohos.base';
@Entry
@Component
struct TextAreaExampleBC1 {
  @State areaText:string = 'test1'
  @State sizeT:number = 16
  @State weightT:int = 400
  @State placeholderFont:string ="#FFAACCEE"
  @State placeholderColor:string ="#FFAACCEE"
  @State textAlign:TextAlign = TextAlign.Start
  @State caretColor:string | int = "#ACDEFF"
  @State testFontSize:int = 16
  @State textColor:string = '#000000'
  @State copyOption:CopyOptions = CopyOptions.LocalDevice
  @State placeholder:string ="The text area can hold an unlimited amount of text. input your word..."
  controller1: TextAreaController = new TextAreaController()
  controller2: TextAreaController = new TextAreaController()
  @State message1:string = 'text'
  @State message2:string = 'text'
  @State message3:string = 'text'
  @State message4:string = 'text'
  @State text2:string = 'test2'
  @State message5:string = 'start'
  stateChangCallBack : (eventData:events_emitter.EventData) => void = (eventData:events_emitter.EventData) => {
    if (eventData != null) {
      let eventD = eventData.data as Record<String,RecordData>

      if (eventD!['placeholderColor'] != null) {
        console.info("[SearchPage page]" + eventD!['placeholderColor']);
        this.placeholderColor =  eventD!['placeholderColor'] as string;
      }
      if (eventD!['textColor'] != null) {
        console.info("[SearchPage page]" + eventD!['textColor']);
        this.textColor =  eventD!['textColor'] as string;
      }
      if (eventD!['testFontSize'] != null) {
        console.info("[SearchPage page]" + eventD!['testFontSize']);
        this.testFontSize =  eventD!['testFontSize'] as int;
      }

    }
  }
  onPageShow() {
    console.info('SearchPage onPageShow')
    let stateChangeEvent: events_emitter.InnerEvent = {
      eventId: 811,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack);
  }

  build() {
    Column() {
      TextArea({
        placeholder: this.placeholder,
        controller: this.controller1,
        text: this.areaText
      })
        .focusable(true)
        .placeholderFont({ size: this.sizeT, weight: this.weightT })
        .placeholderColor(this.placeholderColor)
        .width(336)
        .key('textArea1')
        .height('10%')
        .fontSize(this.testFontSize)
        .fontColor(this.textColor)
        .textAlign(this.textAlign)
        .caretColor(this.caretColor)
        .backgroundColor('#FFFFFF')
        .copyOption(this.copyOption)
        .onChange((value: string):void => {
          console.info('message1message1',value)
          this.message1 = value
        })
        .onCopy((value:string) => {
          console.info("copy value is " + value);
          this.message2 = 'copy'
        })
        .onCut((value:string) => {
          console.info("cut value is " + value);
          this.message3 = 'cut'
        })
        .onPaste((value:string):void => {
          console.info("paste value is " + value);
          this.message4 = 'paste'
        })
        .onEditChange((isEditing: boolean) => {
          console.info("isEditing value is " + isEditing);
          if(isEditing) {
            this.message5 = 'doing'
          } else {
            this.message5 = 'Nodoing'
          }
        })
      Row(){
        Text(this.message1).key('change').width('45%')
        Text(this.message2).key('copy').width('45%')
      }.height('10%')
      Row(){
        Text(this.message3).key('cut').width('45%')
        Text(this.message4).key('paste').width('45%')
      }.height('10%')
      Text(this.message5).key('isEdit').height('10%')
      Row(){
      Button(`button1`)
        .backgroundColor('#007DFF')
        .key(`button1`)
        .height('10%')
        .onClick((e:ClickEvent) => {
          this.controller1.caretPosition(2)
        })
      Button(`button2`)
	.backgroundColor('#007DFF')
	.key(`button2`)
	.height('10%')
	.onClick((e:ClickEvent) => {
	this.controller2.caretPosition(0)
	})
      }
      TextArea({
        text: this.text2,
        placeholder: '请输入',
        controller: this.controller2
      })
        .key('textArea2')
        .placeholderFont({ size: 16, weight: 400 })
        .width(336)
        .height('10%')
        .fontSize(16)
        .fontColor('#182431')
        .backgroundColor('#FFFFFF')
        .onChange((value: string):void => {
          this.text2 = value
        })


    }.width('100%').height('100%').backgroundColor('#F1F3F5')
  }
}