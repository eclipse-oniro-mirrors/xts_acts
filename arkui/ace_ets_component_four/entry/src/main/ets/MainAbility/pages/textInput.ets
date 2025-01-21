// @ts-nocheck
/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import events_emitter from '@ohos.events.emitter';

class CaretOffset {
  index: number;
  x: number;
  y: number;
}

@Entry
@Component
struct TextAreaExample2 {
  @State text: string = 'TextInput';
  @State inputType: InputType = InputType.Normal;
  @State fontSize: number = 16;
  @State fontColor: Color = Color.Black;
  @State textAlign: TextAlign = TextAlign.Start;
  @State caretIndex: number = 9999
  @State text2: string = ''
  @State positionInfo: CaretOffset = { index: 9999, x: 0, y: 0 }
  controller: TextInputController = new TextInputController()
  controller2: TextInputController = new TextInputController()

  onPageShow() {
    let stateChangeEvent: events_emitter.InnerEvent = {
      eventId: 225,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack)
  }

  private stateChangCallBack = (eventData: events_emitter.EventData) => {
    if (eventData != null) {
      console.info("swiper page state change called:" + JSON.stringify(eventData));
      if (eventData.data.fontSize != null) {
        this.fontSize = parseInt(eventData.data.fontSize);
      }
      if (eventData.data.fontColor != null) {
        this.fontColor = eventData.data.fontColor;
      }
      if (eventData.data.textAlign != null) {
        this.textAlign = eventData.data.textAlign;
      }
      if (eventData.data.type != null) {
        this.inputType = eventData.data.type;
      }
      if (eventData.data.Text != null) {
        this.text = eventData.data.text;
      }
      if (eventData.data.text2 != null) {
        this.text2 = eventData.data.text2;
      }
    }
  }

  build() {
    Column() {
      TextArea({ placeholder: 'input your word' })
        .key('TextInput')
        .placeholderColor("rgb(0,0,225)")
        .placeholderFont({ size: 30, weight: 100, family: 'cursive', style: FontStyle.Italic })
        .textAlign(this.textAlign)
        .caretColor(Color.Blue)
        .height(50)
        .fontSize(this.fontSize)
        .fontWeight(FontWeight.Bold)
        .fontFamily("sans-serif")
        .fontStyle(FontStyle.Normal)
        .fontColor(this.fontColor)
        .inputFilter('^[\u4E00-\u9FA5A-Za-z0-9_]+$', (value: string) => {
          console.info("hyb" + value)
        })
        .onChange((value: string) => {
          this.text = value
        })
      Text(this.text).width('90%').key('text')
      Button('caretPosition')
        .onClick(() => {
          this.controller.caretPosition(4)
        })

      TextInput({ text: this.text2, placeholder: 'input your word', controller: this.controller2 })
        .key('TextInput2')
        .placeholderColor("rgb(0,0,225)")
        .placeholderFont({ size: 30, weight: 100, family: 'cursive', style: FontStyle.Italic })
        .textAlign(this.textAlign)
        .caretColor(Color.Blue)
        .height(50)
        .fontSize(this.fontSize)
        .fontWeight(FontWeight.Bold)
        .fontFamily("sans-serif")
        .fontStyle(FontStyle.Normal)
        .fontColor(this.fontColor)
        .maxLength(10)

      Button('caretoffset')
        .backgroundColor('#00FF00')
        .margin(15)
        .onClick(() => {
          console.info('text2 length:' + this.text2.length)
          this.controller2.caretPosition(this.text2.length)
          console.info('getCaretOffset')
          this.positionInfo = this.controller2.getCaretOffset()
          console.info("index:" + this.positionInfo.index)
          this.caretIndex = this.positionInfo.index
        })
        .key('caretOffsetBtn2')

      Text("Index" + this.caretIndex)
        .key('caretOffsetText2')
    }
  }
}
