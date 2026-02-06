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
  $r,
  $rawfile,
  Alignment,
  Circle,
  Color,
  Column,
  ColumnOptions,
  Component,
  Ellipse,
  Entry,
  Flex,
  FlexAlign,
  FlexDirection,
  Image,
  ItemAlign,
  Text,
  TextAlign,
  TextOverflow,
} from '@ohos.arkui.component';
import { Link, PropRef, State, } from '@ohos.arkui.stateManagement';

import emitter from '@ohos.events.emitter';
import { RecordData } from '@ohos.base';

@Entry
@Component
struct EllipseExample {
  @State theWidth: string = "200.00px";
  @State theHeight: string = "200.00px";

  onPageShow() {
    console.info('[ellipse] page show called');
    let stateChangeEvent: emitter.InnerEvent = {
      eventId: 92,
      priority: emitter.EventPriority.LOW
    }
    emitter.on(stateChangeEvent, this.stateChangCallBack);

    let stateChangeEventTwo: emitter.InnerEvent = {
      eventId: 907,
      priority: emitter.EventPriority.LOW
    }
    emitter.on(stateChangeEventTwo, this.stateChangCallBack);

    let stateChangeEventThree: emitter.InnerEvent = {
      eventId: 908,
      priority: emitter.EventPriority.LOW
    }
    emitter.on(stateChangeEventThree, this.stateChangCallBack);
  }

  build() {
    Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Ellipse()
        .width(`${this.theWidth}`)
        .height(`${this.theHeight}`)
        .key('ellipse')
    }
    .width('100%')
    .height('100%')
  }

  private stateChangCallBack: (eventData: emitter.EventData) => void =
    (eventData: emitter.EventData): void => {
      console.info("[ellipse] page stateChangCallBack");
      if (eventData != null) {
        const data: Record<String,RecordData> =
          eventData.data as Record<String,RecordData>
        console.info("[ellipse] page state change called:" + JSON.stringify(eventData));
        if (data['width'] != null) {
          this.theWidth = data['width'] as string;
        }
        if (data['height'] != null) {
          this.theHeight = data['height'] as string;
        }
      }
    }
}