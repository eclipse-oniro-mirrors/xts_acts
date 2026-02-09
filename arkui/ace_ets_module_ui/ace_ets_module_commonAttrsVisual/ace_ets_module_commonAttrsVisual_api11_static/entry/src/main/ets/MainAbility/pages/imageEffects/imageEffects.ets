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
import emitter from '@ohos.events.emitter';
import hilog from '@ohos.hilog';
import {
  $$,
  $r,
  Alignment,
  BindOptions,
  Button,
  ButtonType,
  ClickEvent,
  Color,
  ColoringStrategy,
  Column,
  ColumnOptions,
  Component,
  Entry,
  Flex,
  FlexAlign,
  FlexDirection,
  FlexOptions,
  FontWeight,
  Image,
  ItemAlign,
  Margin,
  Padding,
  Row,
  Scroll,
  ShadowOptions,
  ShadowStyle,
  SheetOptions,
  SheetType,
  SizeOptions,
  Text,
  TextAlign
} from '@ohos.arkui.component'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage, Link, State } from '@ohos.arkui.stateManagement';
import { Hypium } from '../../../../../hypium/index';
import { Callback, RecordData } from '@ohos.base';
import { RecordData } from '@ohos.base';


@Entry
@Component
struct ImageEffectsExample {
  @State blurValue: Long = 100;
  @State backdropBlueValue: number = 30;
  @State shadowValue: ShadowOptions = {
    radius: 10,
    color: Color.Gray,
    offsetX: 5,
    offsetY: 5
  } as ShadowOptions
  @State shadowStyleValue: ShadowStyle = ShadowStyle.OUTER_DEFAULT_XS;
  @State grayscaleValue: number = 10;
  @State brightnessValue: Long = 20;
  @State saturateValue: Long = 50;
  @State contrastValue: Long = 20;
  @State invertValue: number = 10;
  @State hueRotateValue: Long = 10

  onPageShow() {
    console.info('imageEffects page show called');
    let stateChangeEvent: emitter.InnerEvent = {
      eventId: 12,
      priority: emitter.EventPriority.LOW
    }
    emitter.on(stateChangeEvent, this.stateChangCallBack);

    let stateChangeEvent2: emitter.InnerEvent = {
      eventId: 13,
      priority: emitter.EventPriority.LOW
    }
    emitter.on(stateChangeEvent2, this.stateChangCallBack);

    let stateChangeEvent3: emitter.InnerEvent = {
      eventId: 14,
      priority: emitter.EventPriority.LOW
    }
    emitter.on(stateChangeEvent3, this.stateChangCallBack);

    let stateChangeEvent4: emitter.InnerEvent = {
      eventId: 15,
      priority: emitter.EventPriority.LOW
    }
    emitter.on(stateChangeEvent4, this.stateChangCallBack);

    let stateChangeEvent5: emitter.InnerEvent = {
      eventId: 16,
      priority: emitter.EventPriority.LOW
    }
    emitter.on(stateChangeEvent5, this.stateChangCallBack);

    let stateChangeEvent6: emitter.InnerEvent = {
      eventId: 17,
      priority: emitter.EventPriority.LOW
    }
    emitter.on(stateChangeEvent6, this.stateChangCallBack);

    let stateChangeEvent7: emitter.InnerEvent = {
      eventId: 18,
      priority: emitter.EventPriority.LOW
    }
    emitter.on(stateChangeEvent7, this.stateChangCallBack);

    let stateChangeEvent8: emitter.InnerEvent = {
      eventId: 19,
      priority: emitter.EventPriority.LOW
    }
    emitter.on(stateChangeEvent8, this.stateChangCallBack);

    let stateChangeEvent9: emitter.InnerEvent = {
      eventId: 20,
      priority: emitter.EventPriority.LOW
    }
    emitter.on(stateChangeEvent9, this.stateChangCallBack);

    let stateChangeEvent10: emitter.InnerEvent = {
      eventId: 21,
      priority: emitter.EventPriority.LOW
    }
    emitter.on(stateChangeEvent10, this.stateChangCallBack);
  }

  build() {
    Column({ space: 10 } as ColumnOptions) {
      Text('font blur')
        .fontSize(15)
        .fontColor('0xCCCCCC')
        .width('90%')
      Text('text')
        .blur(this.blurValue)
        .width('90%')
        .height(40)
        .fontSize(16)
        .backgroundColor('0xF9CF93')
        .padding({ left: 5 } as Padding)
        .key('centerRow')

      Text('backdropBlur')
        .fontSize(15)
        .fontColor('0xCCCCCC')
        .width('90%')

      Text()
        .width('90%')
        .height(40)
        .fontSize(16)
        .backdropBlur(this.backdropBlueValue)
        .backgroundImage('/images/download.png')
        .backgroundImageSize({ width: 1200, height: 160 } as SizeOptions)
        .key('centerRow2')

      Text('shadow')
        .fontSize(15)
        .fontColor('0xCCCCCC')
        .width('90%')

      Image('/images/download.png')
        .width('90%')
        .height(40)
        .shadow(this.shadowValue as ShadowOptions)
        .key('centerRow3')

      Text('shadow--枚举类型')
        .fontSize(15)
        .fontColor('0xCCCCCC')
        .width('90%')

      Image('/images/download.png')
        .width('90%')
        .height(40)
        .shadow(this.shadowStyleValue)
        .key('shadowDefaultShadow')

      Text('grayscale')
        .fontSize(15)
        .fontColor('0xCCCCCC')
        .width('90%')

      Image('/images/download.png')
        .width('90%')
        .height(40)
        .grayscale(this.grayscaleValue)
        .key('centerRow4')

      Text('brightness')
        .fontSize(15)
        .fontColor('0xCCCCCC')
        .width('90%')

      Image('/images/download.png')
        .width('90%')
        .height(40)
        .brightness(this.brightnessValue)
        .key('centerRow5')

      Text('saturate')
        .fontSize(15)
        .fontColor('0xCCCCCC')
        .width('90%')
      Image('/images/download.png')
        .width('90%')
        .height(40)
        .saturate(this.saturateValue)
        .key('centerRow6')

      Text('contrast')
        .fontSize(15)
        .fontColor('0xCCCCCC')
        .width('90%')

      Image('/images/download.png')
        .width('90%')
        .height(40)
        .contrast(this.contrastValue)
        .key('centerRow7')

      Text('invert')
        .fontSize(15)
        .fontColor('0xCCCCCC')
        .width('90%')

      Image('/images/download.png')
        .width('90%')
        .height(40)
        .invert(this.invertValue)
        .key('centerRow8')

      Text('hueRotate')
        .fontSize(15)
        .fontColor('0xCCCCCC')
        .width('90%')
      Image('/images/download.png')
        .width('90%')
        .height(40)
        .hueRotate(`${this.hueRotateValue}`)
        .key('centerRow9')
    }
    .width('100%')
    .margin({ top: 5 } as Margin)
  }

  private stateChangCallBack: Callback<emitter.EventData> = (eventData: emitter.EventData) => {
    ``
    if (eventData.data != null) {
      const data: Record<String,RecordData> =
        eventData.data as Record<String,RecordData>
      console.info("imageEffects page state change called:" + JSON.stringify(eventData));
      if (data['blurValue'] != null) {
        console.log('test blurValue start is: ' + data['blurValue'])
        this.blurValue = data['blurValue'] as Long
        console.log('test blurValue end is: ' + this.blurValue) // test blurValue end is: 2147483648
      }
      if (data['shadowValue'] != null) {
        console.log('test shadowValue start is: ' + JSON.stringify(data['shadowValue']))
        this.shadowValue = data['shadowValue'] as ShadowOptions
        console.log('test shadowValue end is: ' + JSON.stringify(this.shadowValue))
      }
      if (data['shadowStyleValue'] != null) {
        this.shadowStyleValue = data['shadowStyleValue'] as ShadowStyle;
      }
      if (data['grayscaleValue'] != null) {
        this.grayscaleValue = data['grayscaleValue'] as Number;
      }
      if (data['brightnessValue'] != null) {
        this.brightnessValue = data['brightnessValue'] as Long;
      }
      if (data['saturateValue'] != null) {
        this.saturateValue = data['saturateValue'] as Long;
      }
      if (data['contrastValue'] != null) {
        this.contrastValue = data['contrastValue'] as Long;
      }
      if (data['invertValue'] != null) {
        this.invertValue = data['invertValue'] as Number;
      }
      if (data['hueRotateValue'] != null) {
        this.hueRotateValue = data['hueRotateValue'] as Long;
      }
    }
  }
}
