/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import events_emitter from '@ohos.events.emitter'

export default class shadowValue {
  radius: number = 0
  color: Color = Color.Gray
  offsetX: number = 0
  offsetY: number = 0
}

@Entry
@Component
struct ImageEffectsExample {
  @State blurValue: number = 100;
  @State backdropBlueValue: number = 30;
  @State shadowValue: shadowValue = { radius: 10, color: Color.Gray, offsetX: 5, offsetY: 5 }
  @State shadowStyleValue: ShadowStyle = ShadowStyle.OUTER_DEFAULT_XS;
  @State grayscaleValue: number = 10;
  @State brightnessValue: number = 20;
  @State saturateValue: number = 50;
  @State contrastValue: number = 20;
  @State invertValue: number = 10;
  @State hueRotateValue: number = 10
  private stateChangCallBack = (eventData: events_emitter.EventData) => {
    if (eventData != null) {
      console.info('imageEffects page state change called:' + JSON.stringify(eventData));
      if (eventData.data?.blurValue != null) {
        this.blurValue = Number(eventData.data?.blurValue) || 0;
      }
      if (eventData.data?.shadowValue != null) {
        this.shadowValue = JSON.parse(eventData.data?.shadowValue);
      }
      if (eventData.data?.shadowStyleValue != null) {
        this.shadowStyleValue = eventData.data?.shadowStyleValue;
      }
      if (eventData.data?.grayscaleValue != null) {
        this.grayscaleValue = Number(eventData.data?.grayscaleValue) || 0;
      }
      if (eventData.data?.brightnessValue != null) {
        this.brightnessValue = Number(eventData.data?.brightnessValue) || 0;
      }
      if (eventData.data?.saturateValue != null) {
        this.saturateValue = Number(eventData.data?.saturateValue) || 0;
      }
      if (eventData.data?.contrastValue != null) {
        this.contrastValue = Number(eventData.data?.contrastValue) || 0;
      }
      if (eventData.data?.invertValue != null) {
        this.invertValue = Number(eventData.data?.invertValue) || 0;
      }
      if (eventData.data?.hueRotateValue != null) {
        this.hueRotateValue = Number(eventData.data?.hueRotateValue) || 0;
      }
    }
  }

  onPageShow() {
    console.info('imageEffects page show called');
    let stateChangeEvent: events_emitter.InnerEvent = {
      eventId: 12,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack);

    let stateChangeEvent2: events_emitter.InnerEvent = {
      eventId: 13,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent2, this.stateChangCallBack);

    let stateChangeEvent3: events_emitter.InnerEvent = {
      eventId: 14,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent3, this.stateChangCallBack);

    let stateChangeEvent4: events_emitter.InnerEvent = {
      eventId: 15,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent4, this.stateChangCallBack);

    let stateChangeEvent5: events_emitter.InnerEvent = {
      eventId: 16,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent5, this.stateChangCallBack);

    let stateChangeEvent6: events_emitter.InnerEvent = {
      eventId: 17,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent6, this.stateChangCallBack);

    let stateChangeEvent7: events_emitter.InnerEvent = {
      eventId: 18,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent7, this.stateChangCallBack);

    let stateChangeEvent8: events_emitter.InnerEvent = {
      eventId: 19,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent8, this.stateChangCallBack);

    let stateChangeEvent9: events_emitter.InnerEvent = {
      eventId: 20,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent9, this.stateChangCallBack);

    let stateChangeEvent10: events_emitter.InnerEvent = {
      eventId: 21,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent10, this.stateChangCallBack);
  }

  build() {
    Column({ space: 10 }) {
      Text('font blur')
        .fontSize(15)
        .fontColor(0xCCCCCC)
        .width('90%')
      Text('text')
        .blur(this.blurValue)
        .width('90%')
        .height(40)
        .fontSize(16)
        .backgroundColor(0xF9CF93)
        .padding({ left: 5 })
        .key('centerRow')

      Text('backdropBlur')
        .fontSize(15)
        .fontColor(0xCCCCCC)
        .width('90%')

      Text()
        .width('90%')
        .height(40)
        .fontSize(16)
        .backdropBlur(this.backdropBlueValue)
        .backgroundImage('/images/download.png')
        .backgroundImageSize({ width: 1200, height: 160 })
        .key('centerRow2')

      Text('shadow')
        .fontSize(15)
        .fontColor(0xCCCCCC)
        .width('90%')

      Image('/images/download.png')
        .width('90%')
        .height(40)
        .shadow(this.shadowValue)
        .key('centerRow3')

      Text('shadow--枚举类型')
        .fontSize(15)
        .fontColor(0xCCCCCC)
        .width('90%')

      Image('/images/download.png')
        .width('90%')
        .height(40)
        .shadow(this.shadowStyleValue)
        .key('shadowDefaultShadow')

      Text('grayscale')
        .fontSize(15)
        .fontColor(0xCCCCCC)
        .width('90%')

      Image('/images/download.png')
        .width('90%')
        .height(40)
        .grayscale(this.grayscaleValue)
        .key('centerRow4')

      Text('brightness')
        .fontSize(15)
        .fontColor(0xCCCCCC)
        .width('90%')

      Image('/images/download.png')
        .width('90%')
        .height(40)
        .brightness(this.brightnessValue)
        .key('centerRow5')

      Text('saturate')
        .fontSize(15)
        .fontColor(0xCCCCCC)
        .width('90%')
      Image('/images/download.png')
        .width('90%')
        .height(40)
        .saturate(this.saturateValue)
        .key('centerRow6')

      Text('contrast')
        .fontSize(15)
        .fontColor(0xCCCCCC)
        .width('90%')

      Image('/images/download.png')
        .width('90%')
        .height(40)
        .contrast(this.contrastValue)
        .key('centerRow7')

      Text('invert')
        .fontSize(15)
        .fontColor(0xCCCCCC)
        .width('90%')

      Image('/images/download.png')
        .width('90%')
        .height(40)
        .invert(this.invertValue)
        .key('centerRow8')

      Text('hueRotate')
        .fontSize(15)
        .fontColor(0xCCCCCC)
        .width('90%')
      Image('/images/download.png')
        .width('90%')
        .height(40)
        .hueRotate(`${this.hueRotateValue}`)
        .key('centerRow9')
    }
    .width('100%')
    .margin({ top: 5 })
  }
}
