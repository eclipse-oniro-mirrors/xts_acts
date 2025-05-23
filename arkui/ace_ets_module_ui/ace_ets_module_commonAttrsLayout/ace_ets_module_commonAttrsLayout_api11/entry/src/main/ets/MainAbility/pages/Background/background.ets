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
import events_emitter from '@ohos.events.emitter'

@Entry
@Component
struct Background3Example {
  @State widthValue: string = "200px";
  @State heightValue: string = "200px";
  @State colorValues: Array<number[]> = [[0x080808], [0xEEEE00], [0xFF0000]];
  @State backgroundColorValue: string = '';
  @State backgroundImageValue: string  =  '';
  @State backgroundImageSizeValue: SizeOptions | ImageSize = ImageSize.Cover;
  @State backgroundImagePositionValue: Position | Alignment =  Alignment.Center;
  @State srcValue : string  =  '';

  private stateChangCallBack = (eventData: events_emitter.EventData) => {
    if (eventData != null) {
      console.info("gauge page state change called:" + JSON.stringify(eventData));
      if (eventData.data?.colorValues != null) {
        this.colorValues = JSON.parse(eventData.data?.colorValues);
      }
      if (eventData.data?.width != null) {
        this.widthValue = eventData.data?.width;
      }
      if (eventData.data?.height != null) {
        this.heightValue = eventData.data?.height;
      }
      if (eventData.data?.srcValue != null) {
        this.srcValue = eventData.data?.srcValue;
      }
    }
  }
  private stateChangCallBackTwo = (eventData: events_emitter.EventData) => {
    if (eventData != null) {
      console.info("Background page state change called:" + JSON.stringify(eventData));
      if (eventData.data?.backgroundColor != null) {
        this.backgroundColorValue = eventData.data.backgroundColor;
      }
      if (eventData.data?.backgroundImage != null) {
        this.backgroundImageValue = eventData.data.backgroundImage;
      }
      if (eventData.data?.backgroundImageSize != null) {
        this.backgroundImageSizeValue = eventData.data.backgroundImageSize;
      }
      if (eventData.data?.backgroundImagePosition != null) {
        this.backgroundImagePositionValue = eventData.data.backgroundImagePosition;
      }
    }
  }

  onPageShow() {
    console.info('background page show called');
    let stateChangeEvent: events_emitter.InnerEvent = {
      eventId: 1,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack);

    let stateChangeEventTwo: events_emitter.InnerEvent = {
      eventId: 2,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEventTwo, this.stateChangCallBackTwo);
  }

  build() {
    Column({ space: 5 }) {
      Text('background color').fontSize(9).width('90%').fontColor(0xFF0000).key("fontColor")
      Row()
        .width('90%')
        .height(50)
        .backgroundColor(0xEEEE00)
        .key("backgroundColor")
        .border({ width: 1 })
      Text('background image repeat along X').fontSize(9).width('90%').fontColor(0xCCCCCC)
      Row()
        .backgroundImage('/images/bg.jpg', ImageRepeat.X)
        .backgroundImageSize({ width: '250px', height: '140px' })
        .width('90%')
        .height(70)
        .border({ width: 1 })
      Text('background image repeat along Y').fontSize(9).width('90%').fontColor(0xFF0000)
      Row()
        .backgroundImage('/images/bg.jpg', ImageRepeat.Y)
        .backgroundImageSize({ width: '500px', height: '120px' })
        .width('90%')
        .height(100)
        .border({ width: 1 })
      Text('background image size').fontSize(9).width('90%').fontColor(0xFF0000)
      Row()
        .width('90%')
        .height(150)
        .backgroundImage('/images/bg.jpg', ImageRepeat.NoRepeat)
        .backgroundImageSize({ width: 1000, height: 500 })
        .border({ width: 1 })
      Text('background fill the box(Cover)').fontSize(9).width('90%').fontColor(0xFF0000)
      Row()
        .width(200)
        .height(50)
        .backgroundImage('/images/bg.jpg', ImageRepeat.NoRepeat)
        .backgroundImageSize(ImageSize.Cover)
        .border({ width: 1 })
      Text('background fill the box(Contain)').fontSize(9).width('90%').fontColor(0xFF0000)
      Row()
        .width(200)
        .height(50)
        .backgroundImage('/images/bg.jpg', ImageRepeat.NoRepeat)
        .backgroundImageSize(ImageSize.Contain)
        .border({ width: 1 })
      Text('background image position').fontSize(9).width('90%').fontColor(0xFF0000)
      Row()
        .width(100)
        .height(50)
        .backgroundImage('/images/bg.jpg', ImageRepeat.NoRepeat)
        .backgroundImageSize({ width: 1000, height: 560 })
        .backgroundImagePosition({ x: -500, y: -300 })
        .border({ width: 1 })
    }
    .width('100%').height('100%').padding({ top: 5 })
  }
}