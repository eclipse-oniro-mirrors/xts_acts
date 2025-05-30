/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
struct TextStyle {
  @State fontColor: Color = Color.Red;
  @State fontSize: number = 20;
  @State fontStyle: FontStyle = FontStyle.Italic;
  @State fontWeight: number = 700;
  @State fontFamily: string = 'sans-serif';

  build() {
    Column() {
      Text('default text').fontSize(10).height('10%').textAlign(TextAlign.Center)

      Text(`text font color ${this.fontColor}`)
        .fontColor('error')
        .fontSize(10)
        .key('fontColor').height('10%').textAlign(TextAlign.Center)

      Text(`text font size ${this.fontSize}`)
        .fontSize('error')
        .key('fontSize').height('10%').textAlign(TextAlign.Center)

      Text(`text font style ${this.fontStyle}`)
        .fontStyle(this.fontStyle)
        .fontSize(10)
        .key('fontStyle').height('10%').textAlign(TextAlign.Center)

      Text(`text fontWeight ${this.fontWeight}`)
        .fontWeight(this.fontWeight)
        .fontSize(10)
        .key('fontWeight').height('10%').textAlign(TextAlign.Center)

      Text(`text fontFamily ${this.fontFamily}`)
        .fontFamily(this.fontFamily)
        .fontSize(10)
        .key('fontFamily').height('10%').textAlign(TextAlign.Center)

      Text('red 20 Italic bold cursive text')
        .fontColor(Color.Red)
        .fontSize(10)
        .fontStyle(FontStyle.Italic)
        .fontWeight(700)
        .fontFamily('cursive')
        .textAlign(TextAlign.Center)
        .width('90%').height('10%').textAlign(TextAlign.Center)

      Text('Orange 18 Normal source-sans-pro text')
        .fontColor(Color.Orange)
        .fontSize(10)
        .fontStyle(FontStyle.Normal)
        .fontWeight(400)
        .fontFamily('source-sans-pro,cursive,sans-serif')
        .height('10%').textAlign(TextAlign.Center)
    }
    .width('100%')
    .height('100%')
  }

  onPageShow() {
    let fontColorChangeEvent: events_emitter.InnerEvent = {
      eventId: 37,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(fontColorChangeEvent, this.textStyleChangCallBack);
    let fontSizeChangeEvent: events_emitter.InnerEvent = {
      eventId: 38,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(fontSizeChangeEvent, this.textStyleChangCallBack);
    let fontStyleChangeEvent: events_emitter.InnerEvent = {
      eventId: 39,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(fontStyleChangeEvent, this.textStyleChangCallBack);
    let fontWeightChangeEvent: events_emitter.InnerEvent = {
      eventId: 40,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(fontWeightChangeEvent, this.textStyleChangCallBack);
    let fontFamilyChangeEvent: events_emitter.InnerEvent = {
      eventId: 41,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(fontFamilyChangeEvent, this.textStyleChangCallBack);
  }

  textStyleChangCallBack = (eventData: events_emitter.EventData) => {
    console.info("textStyle page stateChangCallBack" + JSON.stringify(eventData));
    if (eventData && eventData.data) {
      if (eventData.data?.fontColor) {
        this.fontColor = eventData.data?.fontColor;
      } else if (eventData.data?.fontSize) {
        this.fontSize = eventData.data?.fontSize;
      } else if (eventData.data?.fontWeight) {
        this.fontWeight = eventData.data?.fontWeight;
      } else if (eventData.data?.fontFamily) {
        this.fontFamily = eventData.data?.fontFamily;
      } else {
        this.fontStyle = eventData.data?.fontStyle;
      }
    }
  }
}