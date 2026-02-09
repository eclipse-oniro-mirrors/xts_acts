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
import {
  $$,
  $r,
  Alignment,
  AnimateParam,
  BindOptions,
  Button,
  ButtonType,
  ClickEvent,
  Color,
  Column,
  ColumnOptions,
  Component,
  Curve,
  Entry,
  Flex,
  FlexAlign,
  FlexDirection,
  FlexOptions,
  FontWeight,
  Image,
  ItemAlign,
  Margin,
  RotateOptions,
  Row,
  Scroll,
  SheetOptions,
  SheetType,
  Text,
  TextAlign,
  TransitionEffect,
  Visibility
} from '@ohos.arkui.component'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage, Link, State } from '@ohos.arkui.stateManagement';
import { Hypium } from '../../../../../hypium/index';
import { RecordData } from '@ohos.base';

@Entry
@Component
struct VisibilityExample {
  @State visibilityValue: Visibility = Visibility.Visible;

  onPageShow() {
    let hiddenChangeEvent: emitter.InnerEvent = {
      eventId: 47,
      priority: emitter.EventPriority.LOW
    }
    emitter.on(hiddenChangeEvent, this.hiddenChangCallBack)

    let noneChangeEvent: emitter.InnerEvent = {
      eventId: 48,
      priority: emitter.EventPriority.LOW
    }
    emitter.on(noneChangeEvent, this.noneChangCallBack)

    let stateChangeEvent2: emitter.InnerEvent = {
      eventId: 1116,
      priority: emitter.EventPriority.LOW
    }
    emitter.on(stateChangeEvent2, this.hiddenChangCallBack);
  }

  build() {
    Column() {
      Column() {
        Text('BoxOne')
          .fontSize(9)
          .width('90%')
          .fontColor('0xCCCCCC')
        Row()
          .visibility(this.visibilityValue)
          .width('90%')
          .height(80)
          .backgroundColor('0xAFEEEE')
          .padding(20)
          .key('box')

        Text('BoxTwo')
          .fontSize(9)
          .width('90%')
          .fontColor('0xCCCCCC')
        Row()
          .visibility(Visibility.Visible)
          .width('90%')
          .height(80)
          .backgroundColor('0xAFEEEE')
          .padding(20)
      }
      .width('90%')
      .border({ width: 1 })
    }
    .width('100%')
    .margin({ top: 5 } as Margin)
  }

  private hiddenChangCallBack: (eventData: emitter.EventData) => void =
    (eventData: emitter.EventData) => {
      console.info("[hiddenChangCallBack] stateChangCallBack");
      if (eventData != null) {
        const data: Record<String,RecordData> =
          eventData.data as Record<String,RecordData>
        console.info("[hiddenChangCallBack] state change called:" + JSON.stringify(eventData));
        if (data['visibility'] != null) {
          this.visibilityValue = data['visibility'] as Visibility
        }
      }
    }
  private noneChangCallBack: (eventData: emitter.EventData) => void = (eventData: emitter.EventData) => {
    console.info("[noneChangCallBack] stateChangCallBack");
    if (eventData != null) {
      const data: Record<String,RecordData> =
        eventData.data as Record<String,RecordData>
      console.info("[noneChangCallBack] state change called:" + JSON.stringify(eventData));
      if (data['visibility'] != null) {
        this.visibilityValue = data['visibility'] as Visibility
      }
    }
  }
}
