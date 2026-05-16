'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { MessageManager, Callback, Message } from '../../common/MessageManager';
import {
  Entry,
  Column,
  Component,
  Button,
  Text,
  Row,
  Color,
  $r,
  Margin,
  ColumnOptions,
  Flex,
  Scroll,
  Padding,
  Position,
  Builder,
  Image,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  Alignment,
  TextAlign,
  TextOverflow,
  LoadingProgress
} from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { ClickEvent } from '@ohos.arkui.component';
import { UIContext } from '@ohos.arkui.UIContext';

@Entry
@Component
struct LoadingProgressExample {
  @State color: Color = Color.Blue

  private stateChangCallBack:(eventData: events_emitter.EventData) => void = (eventData: events_emitter.EventData) => {
    console.info("LoadingProgress page stateChangCallBack");
    if (eventData != null) {
      console.info("LoadingProgress page state change called:" + JSON.stringify(eventData));
      if((eventData.data as ESObject)?.getProperty('color') != null) {
        this.color = (eventData.data as ESObject).getProperty('color').toStaticObject() as Color;
      }
      }
    }

  onPageShow() {
    console.info('LoadingProgress page show called');
    let stateChangeEvent: events_emitter.InnerEvent = {
      eventId: 124,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack)
  }

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Text('Orbital LoadingProgress ')
        .fontSize(19)
        .fontColor(0xCCCCCC)
        .height(50)
        .width('90%')
        .key('LP')
      LoadingProgress()
        .height(50)
        .color(Color.Black)
    }.width('100%').margin({ top: 6 } as Margin)
  }
}