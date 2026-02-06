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

import events_emitter from '@ohos.events.emitter';
import {
  $r,
  Button,
  Color,
  Column,
  ColumnOptions,
  Component,
  Entry,
  Flex,
  FlexDirection,
  HorizontalAlign,
  ItemAlign,
  Margin,
  Padding,
  Row,
  Text,
  TextAlign
} from '@ohos.arkui.component';
import { Link, State } from '@ohos.arkui.stateManagement';
import { RecordData } from '@ohos.base';

@Entry
@Component
struct ColumnExample {
  @State alignItems: HorizontalAlign = HorizontalAlign.Start;

  onPageShow() {
    console.info('[column] page show called');
    let stateChangeEvent: events_emitter.InnerEvent = {
      eventId: 192,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack);
  }

  build() {
    Column() {
      Text('alignItems')
        .fontSize(9)
        .fontColor(0xCCCCCC)
        .width('90%')
      Column() {
        Column()
          .width('50%')
          .height(30)
          .backgroundColor(0xAFEEEE)
        Column()
          .width('50%')
          .height(30)
          .backgroundColor(0x00FFFF)
      }
      .key("alignItemsColumn")
      .width('90%')
      .border({ width: 1 })
      .alignItems(this.alignItems)
    }
    .width('100%')
    .padding({ top: 5 } as Padding)
  }

  private stateChangCallBack: (eventData: events_emitter.EventData) => void = (eventData: events_emitter.EventData) => {
    console.info("[column] page stateChangCallBack");
    if (eventData != null) {
      const data: Record<String,RecordData> =
        eventData.data as Record<String,RecordData>
      console.info("[column] page state change called:" + JSON.stringify(eventData));
      if (data['alignItems'] != null) {
        this.alignItems = data['alignItems'] as HorizontalAlign;
      }
    }
  }
}