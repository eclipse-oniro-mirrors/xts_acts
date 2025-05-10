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
struct QrCode3 {
  @State qrCodeBackgroundColor: string = "#FF008000";
  @State qrCodeColor: string = "#FF0000FF";
  @State qrCodeValue: string = 'qrCodeValue';
  private stateChangCallBack = (eventData: events_emitter.EventData) => {
    if (eventData != null) {
      console.info("qrCode page state change called:" + JSON.stringify(eventData));
      let colorValue: string = eventData.data?.color;
      if (colorValue != null && colorValue.length != 0) {
        this.qrCodeColor = colorValue;
        console.info("qrCodeColor:" + this.qrCodeColor);
      } else {
        console.info("qrCodeColor is null or empty " + this.qrCodeColor);
      }
    } else {
      console.info("qrCode page color not change called:" + JSON.stringify(eventData));
    }
  }
  private stateChangCallBackTwo = (eventData: events_emitter.EventData) => {
    if (eventData != null) {
      console.info("qrCode page state change called:" + JSON.stringify(eventData));
      let backgroundColorValue: string = eventData.data?.backgroundColor;
      if (backgroundColorValue != null && backgroundColorValue.length != 0) {
        this.qrCodeBackgroundColor = backgroundColorValue;
        console.info("qrCodeBackgroundColor:" + this.qrCodeBackgroundColor);
      } else {
        console.info("backgroundColorValue is null or empty " + this.qrCodeColor);
      }
    } else {
      console.info("qrCode page backgroundColorValue not change called:" + JSON.stringify(eventData));
    }
  }
  
  onPageShow() {
    console.info('qrCode page show called');
    let stateChangeEvent: events_emitter.InnerEvent = {
      eventId: 170,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack);
    
    stateChangeEvent = {
      eventId: 171,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBackTwo);
    
    stateChangeEvent = {
      eventId: 1023,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack);
    
    stateChangeEvent = {
      eventId: 1024,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack);
    
    stateChangeEvent = {
      eventId: 1025,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBackTwo);
    
    stateChangeEvent = {
    eventId: 1026,
    priority: events_emitter.EventPriority.LOW
  }
  events_emitter.on(stateChangeEvent, this.stateChangCallBackTwo);
}

build() {
  Column({ space: 5 }) {
    Text('QRCodeColor')
    .fontSize(40)
    .fontWeight(FontWeight.Bold)
    .width('90%')
    .fontColor(0xCCCCCC)
    QRCode(`${this.qrCodeValue}`)
    .backgroundColor(`${this.qrCodeBackgroundColor}`)
    .color(`${this.qrCodeColor}`)
    .width(198)
    .height(198)
    .key("QrCodeColor")
    Text('QRCodeBackgroundColor')
    .fontSize(40)
    .fontWeight(FontWeight.Bold)
    .width('90%')
    .fontColor(0xCCCCCC)
    QRCode(`${this.qrCodeValue}`)
    .backgroundColor(`${this.qrCodeBackgroundColor}`)
    .color(`${this.qrCodeColor}`)
    .width(197)
    .height(197)
    .key("QrCodeBackgroundColor")
    QRCode(`${this.qrCodeValue}`)
    .color(0xFF000000)
    .backgroundColor(0xFFFFFFFF)
    .width(197)
    .height(197)
    .key("QrCodeDefault")
  }
  .width('100%')
  .height('100%')
  .margin({ top: 5 })
}
}