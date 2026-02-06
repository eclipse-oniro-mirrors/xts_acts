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
  Entry,ResourceColor,
  Component,
  ClickEvent,
  InputType,
  Color,
  Font,
  EnterKeyType,
  CopyOptions,
  TextInputStyle,
  TextAlign,
  TextInputController,
  Column,
  EnterKeyType,
  TextInput,
  Text,
  Button
} from '@ohos.arkui.component'
import {
  State,
} from '@ohos.arkui.stateManagement'
import { MessageManager, Callback,Message } from '../../common/MessageManager';
import { AppStorage } from '@ohos.arkui.stateManagement';
import events_emitter from '@ohos.events.emitter'
import { RecordData } from '@ohos.base';
@Entry
@Component
struct TextInputPage {
  @State placeholder: string = 'input your word...'
  @State type: InputType = InputType.Email
  @State placeholderColor : ResourceColor = Color.Grey
  @State placeholderFont : Font = { size: 14, weight: 400 } as Font
  @State enterKeyType: EnterKeyType = EnterKeyType.Search
  @State caretColor: ResourceColor = Color.Blue
  @State maxLength: int = 10
  @State copyOption: CopyOptions = CopyOptions.InApp
  @State showPasswordIcon: boolean = false
  @State style: TextInputStyle = TextInputStyle.Default
  @State textAlign: TextAlign = TextAlign.Center
  @State text: string = 'onChange'
  @State onSubmit: string = ''
  @State onEditChange: string = ''
  @State onCopy: string = ''
  @State onCut: string = ''
  @State onPaste: string = ''
  controller: TextInputController = new TextInputController()
  private stateChangCallBack : (eventData:events_emitter.EventData) => void = (eventData:events_emitter.EventData) => {
    if (eventData != null) {
      let eventD = eventData.data as Record<String,RecordData>
      if (eventD!['textAlign'] != null) {
        console.info("[SearchPage page textAlign]" + eventD!['textAlign']);
        this.textAlign =  eventD!['textAlign'] as TextAlign;
      }
      if (eventD!['maxLength'] != null) {
        console.info("[SearchPage page]" + eventD!['maxLength']);
        this.maxLength =  eventD!['maxLength'] as int;
      }
      if (eventD!['caretColor'] != null) {
        console.info("[SearchPage page]" + eventD!['caretColor']);
        this.caretColor =  eventD!['caretColor'] as ResourceColor;
      }
      if (eventD!['enterKeyType'] != null) {
        console.info("[SearchPage page]" + eventD!['enterKeyType']);
        this.enterKeyType =  eventD!['enterKeyType'] as EnterKeyType;
      }if (eventD!['placeholderFont'] != null) {
        console.info("[SearchPage page]" + eventD!['placeholderFont']);
        this.placeholderFont =  eventD!['placeholderFont'] as Font;
      }if (eventD!['placeholderColor'] != null) {
        console.info("[SearchPage page]" + eventD!['placeholderColor']);
        this.placeholderColor =  eventD!['placeholderColor'] as ResourceColor;
      }if (eventD!['type'] != null) {
        console.info("[SearchPage page]" + eventD!['type']);
        this.type =  eventD!['type'] as InputType;
      }
      if (eventD!['placeholder'] != null) {
        console.info("[SearchPage page]" + eventD!['placeholder']);
        this.placeholder =  eventD!['placeholder'] as string;
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
      TextInput({ placeholder: this.placeholder, controller: this.controller })
        .type(this.type)
        .placeholderColor(this.placeholderColor)
        .placeholderFont(this.placeholderFont)
        .enterKeyType(this.enterKeyType)
        .caretColor(this.caretColor)
        .maxLength(this.maxLength)
        .copyOption(this.copyOption)
        .showPasswordIcon(this.showPasswordIcon)
        .style(this.style)
        .textAlign(this.textAlign)
        .key('textInput')
        .width(400)
        .height('5%')
        .fontSize(14)
        .fontColor(Color.Black)
        .onChange((value: string):void => {
          this.text = value
        })
        .onSubmit((enterKey: EnterKeyType) :void=> {
          this.onSubmit = enterKey.toString()
        })
        .onEditChange((isEditing: boolean) :void=> {
          this.onEditChange = String(isEditing)
        })
        .onCopy((value: string) :void=> {
          this.onCopy = value
        })
        .onCut((value: string)  :void=> {
          this.onCut = value
        })
        .onPaste((value: string) : void=> {
          this.onPaste = value
        })
      Text(this.text).fontSize(10).key('text').height('5%')
      Button('Set caretPosition 1')
        .key('button')
        .onClick((e:ClickEvent) => {
          // 将光标移动至第一个字符后
          this.controller.caretPosition(1)
        })
        .height('5%')
      // 密码输入框
      TextInput({ placeholder: 'input your password...' })
        .key('password')
        .width(400)
        .height('5%')
        .type(InputType.Password)
        .maxLength(9)
        .showPasswordIcon(true)
      // 内联风格输入框
      TextInput({ placeholder: 'inline style' })
        .key('input')
        .width(400)
        .height('5%')
        .borderRadius(0)
        .style(TextInputStyle.Inline)
      Text('onSubmit:' + this.onSubmit).fontSize(10).margin(1).key('submit').height('5%')
      Text('onEditChange:' + this.onEditChange).fontSize(10).margin(1).key('editChange').height('5%')
      Text('onCopy:' + this.onCopy).fontSize(10).margin(1).key('copy').height('5%')
      Text('onCut:' + this.onCut).fontSize(10).margin(1).key('cut').height('5%')
      Text('onPaste:' + this.onPaste).fontSize(10).margin(1).key('paste').height('5%')
    }.width('100%')
  }
}