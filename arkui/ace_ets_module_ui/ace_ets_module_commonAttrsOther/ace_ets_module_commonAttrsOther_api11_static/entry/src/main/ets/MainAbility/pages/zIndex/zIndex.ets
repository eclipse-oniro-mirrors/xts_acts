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
  SizeOptions,
  Stack,
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
struct zIndexExample {
  @State zIndexValue: Int = 1;

  onPageShow() {
    console.info('[zIndex] page show called ');
    let stateChangeEvent: emitter.InnerEvent = {
      eventId: 236,
      priority: emitter.EventPriority.LOW
    }
    emitter.on(stateChangeEvent, this.stateChangCallBack);

    let stateChangeEvent2: emitter.InnerEvent = {
      eventId: 1113,
      priority: emitter.EventPriority.LOW
    }
    emitter.on(stateChangeEvent2, this.stateChangCallBack);
  }

  build() {
    Column() {
      Stack() {
        Text('first child, zIndex(2)')
          .size({ width: '40%', height: '60%' } as SizeOptions)
          .backgroundColor('0xbbb2cb')
          .zIndex(2)
        Text('second child, default zIndex(0)')
          .size({ width: '90%', height: '80%' } as SizeOptions)
          .backgroundColor('0xd2cab3')
          .align(Alignment.TopStart)
        Text('third child, zIndex(1)')
          .size({ width: '70%', height: '50%' } as SizeOptions)
          .backgroundColor('0xc1cbac')
          .align(Alignment.TopStart)
          .zIndex(this.zIndexValue)
          .key('zIndex')
      }
    }
    .width('100%')
    .height(200)
  }

  private stateChangCallBack: (eventData: emitter.EventData) => void = (eventData: emitter.EventData) => {
    console.info("[stateChangCallBack] stateChangCallBack ");
    if (eventData != null) {
      const data: Record<String,RecordData> =
        eventData.data as Record<String,RecordData>
      console.info("[stateChangCallBack] state change called: " + JSON.stringify(data));
      if (data['zIndex'] != null) {
        console.info("11111111 ");
        this.zIndexValue = (data!['zIndex']!) as Int;
        console.info("22222222 ::" + this.zIndexValue);
      }
    }
  }
}