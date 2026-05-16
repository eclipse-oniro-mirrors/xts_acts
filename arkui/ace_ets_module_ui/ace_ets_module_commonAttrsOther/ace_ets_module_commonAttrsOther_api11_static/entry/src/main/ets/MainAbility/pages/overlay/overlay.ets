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

import emitter from '@ohos.events.emitter'
import {
  $$,
  $r,
  Alignment,
  BindOptions,
  Button,
  ButtonType,
  ClickEvent,
  Color,
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
  OverlayOffset,
  OverlayOptions,
  Padding,
  Row,
  Scroll,
  SheetOptions,
  SheetType,
  Text,
  TextAlign
} from '@ohos.arkui.component'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage, Link, State } from '@ohos.arkui.stateManagement';
import { Hypium } from '../../../../../hypium/index';
import { RecordData } from '@ohos.base';

@Entry
@Component
struct OverlayExample {
  @State title: String = 'old title'
  @State x: number = 0
  @State y: number = -15
  @State alignment: Alignment = Alignment.Bottom

  onPageShow() {
    console.info('[overlay] page show called ');
    let stateChangeEvent: emitter.InnerEvent = {
      eventId: 143,
      priority: emitter.EventPriority.LOW
    }
    emitter.on(stateChangeEvent, this.stateChangCallBack);

    let stateChangeEvent2: emitter.InnerEvent = {
      eventId: 1110,
      priority: emitter.EventPriority.LOW
    }
    emitter.on(stateChangeEvent2, this.stateChangCallBack);
  }

  build() {
    Column() {
      Column() {
        Text('floating layer')
          .fontSize(12)
          .fontColor('0xCCCCCC')
          .maxLines(1)
        Column() {
          Image('/images/img.jpeg')
            .width(340).height(240)
            .key('overlay')
            .overlay(this.title,
              { align: this.alignment, offset: { x: this.x, y: this.y } as OverlayOffset } as OverlayOptions)
        }.border({ color: Color.Black, width: 2 })
      }.width('100%')
    }.padding({ top: 20 } as Padding)
  }

  private stateChangCallBack: (eventData: emitter.EventData) => void = (eventData: emitter.EventData) => {
    console.info("[stateChangCallBack] stateChangCallBack ");
    if (eventData != null) {
      const data: Record<String,RecordData> =
        eventData.data as Record<String,RecordData>
      console.info("[stateChangCallBack] state change called: " + JSON.stringify(eventData));
      if (data['align'] != null) {
        console.log('test getData Alignment is: 1 ' + data['align'])
        this.alignment = (data['align']) as Alignment
        console.log('test getData Alignment is: 2 ' + this.alignment)
      }
      if (data['title'] != null) {
        console.log('test getData title is: 1 ' + data['title'])
        this.title = (data['title']) as String
        console.log('test getData title is: 2 ' + this.title)
      }
      if (data['x'] != null) {
        console.log('test getData x is: 1 ' + data['x'])
        this.x = (data['x']) as Double
        console.log('test getData x is: 2 ' + this.x)
      }
      if (data['y'] != null) {
        console.log('test getData y is: 1 ' + data['y'])
        this.y = (data['y']) as Double
        console.log('test getData y is: 2 ' + this.y)
      }

    }
  }
}