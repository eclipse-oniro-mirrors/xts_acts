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
  Flex,
  Text,
  BorderStyle,
  EdgeStyles,
  BorderRadiuses,
  BorderOptions,
  EdgeWidths,
  Length,
  ResourceColor,
  EdgeColors,
  BorderStyle,
  FlexAlign,
  ItemAlign,
  TextAlign
} from '@ohos.arkui.component'
import {
  State,
} from '@ohos.arkui.stateManagement'
import emitter from '@ohos.events.emitter';
import { RecordData } from '@ohos.base';

@Entry
@Component
struct BorderExample {
  @State borderStyle1: BorderStyle | EdgeStyles = BorderStyle.Solid;
  @State borderRadius1: number = 70;
  @State border1?: BorderOptions | null = null;
  @State borderWidth1: EdgeWidths | Length | null = null;
  @State borderColor1: ResourceColor | EdgeColors| null = null;
  private stateChangCallBack :(eventData: emitter.EventData) =>void  = (eventData: emitter.EventData) : void => {
    if (eventData != null) {
      console.info("Border page state change called:" + JSON.stringify(eventData));
      const data = eventData.data as Record<String,RecordData>
      if (data['border'] != null) {
        this.border1 = data['border'] as BorderOptions | null;
      }
      if (data['borderStyle'] != null) {
        this.borderStyle1 = data['borderStyle'] as BorderStyle|EdgeStyles;
      }
      if (data['borderWidth'] != null) {
        this.borderWidth1 = data['borderWidth'] as  EdgeWidths | Length | null;
      }
      if (data['borderColor'] != null) {
        this.borderColor1 = data['borderColor'] as ResourceColor | EdgeColors| null;
      }
      if (data['borderRadius'] != null) {
        this.borderRadius1 = data['borderRadius']  as number;
      }
      console.info("Border borderStyle state change called:" + JSON.stringify(eventData));
      switch (String(data['borderStyle'])) {
        case 'Dotted':
          this.borderStyle1 = BorderStyle.Dotted;
          break;
        case 'Dashed':
          this.borderStyle1 = BorderStyle.Dashed;
          break;
        case 'Solid':
          this.borderStyle1 = BorderStyle.Solid;
          break;
        default:
          this.borderStyle1 = BorderStyle.Solid;
      }
    }
  }

  onPageShow() {
    console.info('border page show called');
    let stateChangeEvent: emitter.InnerEvent = {
      eventId: 3,
      priority: emitter.EventPriority.LOW
    }
    emitter.on(stateChangeEvent, this.stateChangCallBack);
  }

  build() {
    Flex({ justifyContent: FlexAlign.SpaceAround, alignItems: ItemAlign.Center }) {
      Text('dashed')
        .borderStyle(BorderStyle.Dashed)
        .borderWidth(5)
        .borderColor(0xAFEEEE)
        .borderRadius(this.borderRadius1)
        .key("borderRadius")
        .width(120)
        .height(120)
        .textAlign(TextAlign.Center)
        .fontSize(16)
      Text('Solid')
        .borderStyle(BorderStyle.Solid)
        .borderWidth(5)
        .key("borderWidth")
        .borderColor(0xEE0000)
        .borderRadius(10)
        .width(120)
        .height(120)
        .textAlign(TextAlign.Center)
        .fontSize(16)
      Text('dotted')
        .border({ width: 5, color: 0x317AF7, radius: 8, style: BorderStyle.Dotted })
        .key("borderColor")
        .width(120)
        .height(120)
        .textAlign(TextAlign.Center)
        .fontSize(16)
    }.width('100%').height(150)
  }
}