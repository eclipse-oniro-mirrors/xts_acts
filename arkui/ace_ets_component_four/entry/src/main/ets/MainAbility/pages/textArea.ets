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

@Entry
@Component
struct TextAreaExample2 {
  @State text: string = 'TextArea';
  @State fontColor: string = "#FF182432";
  @State fontSize: number = 30;
  @State textAlign: TextAlign = TextAlign.Center;
  @State caretIndex: number = 9999;
  @State text2: string = '';
  @State positionInfo: CaretOffset = { index: 9999, x: 0, y: 0 };
  controller: TextAreaController = new TextAreaController();

  onPageShow() {
    console.info('swiper page show called');
    let stateChangeEvent: events_emitter.InnerEvent = {
      eventId: 215,
      priority: events_emitter.EventPriority.LOW
    }
    console.log("fang--->B");
    events_emitter.on(stateChangeEvent, this.stateChangCallBack)

    let stateChangeEventOne: events_emitter.InnerEvent = {
      eventId: 216,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEventOne, this.stateChangCallBack)

    let stateChangeEventTwo: events_emitter.InnerEvent = {
      eventId: 217,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEventTwo, this.stateChangCallBack)

    let stateChangeEventThree: events_emitter.InnerEvent = {
      eventId: 218,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEventThree, this.stateChangCallBack)
  }

  private stateChangCallBack = (eventData: events_emitter.EventData) => {
    console.info("fang--->A");
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
      if (eventData.data.text != null) {
        this.text = eventData.data.text;
      }
      if (eventData.data.text2 != null) {
        this.text2 = eventData.data.text2;
      }
    }
  }

  build() {
    Column() {
      TextArea({ placeholder: 'input your word', text: this.text })
        .key('textArea')
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
        })
        .onChange((value: string) => {
          this.text = value
        })
      Text(this.text)
        .width('90%')
        .key('text')

      TextArea({ placeholder: 'input your word', text: this.text2, controller: this.controller })
        .key('textArea2')
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
          console.info('text length:' + this.text2.length)
          this.controller.caretPosition(this.text2.length)
          this.positionInfo = this.controller.getCaretOffset()
          console.info("index:" + this.positionInfo.index)
          this.caretIndex = this.positionInfo.index
        })
        .key('caretOffsetBtn1')

      Text("Index" + this.caretIndex)
        .key('caretOffsetText1')
    }
  }
}
