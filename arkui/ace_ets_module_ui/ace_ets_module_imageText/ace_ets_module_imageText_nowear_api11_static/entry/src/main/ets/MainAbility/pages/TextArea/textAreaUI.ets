'use static';
/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
  ClickEvent,
  TextAlign,
  Resource,
  CopyOptions,
  TextAreaController,
  Column,
  TextArea,
  Text,
  Button,
  $r,Color,ResourceColor
} from '@ohos.arkui.component'
import {
  State,
} from '@ohos.arkui.stateManagement'
import { AppStorage } from '@ohos.arkui.stateManagement';

 import { MessageManager, Callback,Message } from '../../common/MessageManager';
import events_emitter from '@ohos.events.emitter'
import { RecordData } from '@ohos.base';
@Entry
@Component
struct TextAreaExample {
  @State areaText:string = 'test1'
  @State sizeT:int = 16
  @State weightT:int = 400
  @State placeholderFont:string ="#FFAACCEE"
  @State placeholderColor:ResourceColor ="#FFAACCEE"
  @State textAlign:TextAlign = TextAlign.End
  @State caretColor:ResourceColor = "#ACDEFF"
  @State fontSize:number = 16
  @State copyOption:CopyOptions = CopyOptions.LocalDevice
  @State placeholder:string ="The text area can hold an unlimited amount of text. input your word..."
  controller: TextAreaController = new TextAreaController()
  @State message1:string = 'text'
  @State message2:string = 'text'
  @State message3:string = 'text'
  @State message4:string = 'text'
  stateChangCallBack : (eventData:events_emitter.EventData) => void = (eventData:events_emitter.EventData) => {
    if (eventData != null) {
      let eventD = eventData.data as Record<String,RecordData>

      if (eventD!['caretColor'] != null) {
        console.info("[SearchPage page caretColor]" + eventD!['caretColor']);
        this.caretColor =  eventD!['caretColor'] as ResourceColor;
      }
      if (eventD!['sizeT'] != null) {
        console.info("[SearchPage page sizeT]" + eventD!['sizeT']);
        this.sizeT =  eventD!['sizeT'] as int;
      }
      if (eventD!['weightT'] != null) {
        console.info("[SearchPage page weightT]" + eventD!['weightT']);
        this.weightT =  eventD!['weightT'] as int;
      }
      if (eventD!['placeholderColor'] != null) {
        console.info("[SearchPage page placeholderColor]" + eventD!['placeholderColor']);
        this.placeholderColor =  eventD!['placeholderColor'] as ResourceColor;
      }
      if (eventD!['areaText'] != null) {
        console.info("[SearchPage page areaText]" + eventD!['areaText']);
        this.areaText =  eventD!['areaText'] as string;
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
        controller: this.controller,
        text: this.areaText
      })
        .placeholderFont({ size: this.sizeT, weight: this.weightT })
        .placeholderColor(this.placeholderColor)
        .width(336)
        .key('textArea')
        .height(56)
        .margin(20)
        .fontSize(this.fontSize)
        .fontColor('#182431')
        .textAlign(this.textAlign)
        .caretColor(this.caretColor)
        .backgroundColor('#FFFFFF')
        .copyOption(this.copyOption)
        .onChange((value: string) : void=> {
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
        .onPaste((value:string) : void => {
          console.info("paste value is " + value);
          this.message4 = 'paste'
        })

      TextArea({
        placeholder: this.placeholder,
        controller: this.controller,
        text: this.areaText
      })
        .caretColor($r('sys.color.ohos_id_color_connected'))
        .key('textAreaResource')

      Text(this.message1).key('change')
      Text(this.message2).key('copy')
      Text(this.message3).key('cut')
      Text(this.message4).key('paste')
      Button('Set caretPosition 1')
        .backgroundColor('#007DFF')
        .margin(15)
        .onClick((e:ClickEvent) => {
          // 设置光标位置到第一个字符后
          this.controller.caretPosition(1)
        })
    }.width('100%').height('100%').backgroundColor('#F1F3F5')
  }
}