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
  Alignment,
  Color,
  Column,
  ColumnOptions,
  Component,
  Entry,
  GridCol,
  Image,
  ImageSize,
  Margin,
  Padding,
  Position,
  Row,
  SizeOptions,
  Text,
} from '@ohos.arkui.component';
import { AppStorage, Link, PropRef, State, } from '@ohos.arkui.stateManagement';
import { ComponentUtils, Router, UIContext } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';
import { Callback, RecordData } from '@ohos.base';

@Entry
@Component
struct GridSetting {
  @State smSpan: number = 2;
  @State smOffset: number = 1;
  @State gridSpanValue: number = 1;
  @State gridOffsetValue: number = 0;

  build() {
    GridCol() {
      Row() {
        Row() {
          Text('Left').fontSize(25)
        }
        // .gridOffset(this.gridOffsetValue)
        .height("100%")
        .backgroundColor('0x66bbb2cb')
        .key('gridOffset')

        Row() {
          Text('Center').fontSize(25)
        }
        // .useSizeType({
        //   xs: { span: 1, offset: 0 },
        //   sm: { span: this.smSpan, offset: this.smOffset },
        //   md: { span: 5, offset: 1 },
        //   lg: { span: 7, offset: 2 }
        // })
        .height("100%")
        .backgroundColor('0x66b6c5d1')
        .key('gridRow')

        Row() {
          Text('Right').fontSize(25)
        }
        // .gridSpan(this.gridSpanValue)
        .height("100%")
        .backgroundColor('0x66bbb2cb')
        .key('gridSpan')
      }
      .height(200)
    }
    .backgroundColor('0xf1f3f5')
    .margin({ top: 10 } as Margin)
    .key('gridContainer')
  }

  onPageShow() {
    let smChangeEvent: emitter.InnerEvent = {
      eventId: 9,
      priority: emitter.EventPriority.LOW
    }
    emitter.on(smChangeEvent, this.stateChangCallBack);
    let offsetChangeEvent: emitter.InnerEvent = {
      eventId: 10,
      priority: emitter.EventPriority.LOW
    }
    emitter.on(offsetChangeEvent, this.stateChangCallBack);
    let spanChangeEvent: emitter.InnerEvent = {
      eventId: 11,
      priority: emitter.EventPriority.LOW
    }
    emitter.on(spanChangeEvent, this.stateChangCallBack);
  }

  stateChangCallBack: Callback<emitter.EventData> = (eventData: emitter.EventData) => {
    console.info("GridSetting page stateChangCallBack" + JSON.stringify(eventData));
    if (eventData && eventData.data) {
      const data: Record<String,RecordData> =
        eventData.data as Record<String,RecordData>
      if (data['span'] != null) {
        this.smSpan = data['span'] as number;
        this.smOffset = data['offset'] as number;
      } else if (data['gridOffset'] != null) {
        this.gridOffsetValue = data['gridOffset'] as number;
      } else if (data['gridSpan'] != null) {
        this.gridSpanValue = data['gridSpan'] as number;
      }
    }
  } as Callback<emitter.EventData>
}