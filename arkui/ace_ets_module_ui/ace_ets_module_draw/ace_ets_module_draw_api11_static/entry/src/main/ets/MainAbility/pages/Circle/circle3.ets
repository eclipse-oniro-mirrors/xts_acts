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
  $r,
  $rawfile,
  Alignment,
  Circle,
  Color,
  Column,
  ColumnOptions,
  Component,
  Entry,
  Flex,
  FlexAlign,
  FlexDirection,
  Image,
  ItemAlign,
  Margin,
  Text,
  TextAlign,
  TextOverflow,
} from '@ohos.arkui.component';
import { Link, PropRef, State, } from '@ohos.arkui.stateManagement';
import { RecordData } from '@ohos.base';

@Entry
@Component
struct CircleExample {
  @State theWidth: string = "450px";
  @State theHeight: string = "450px";

  onPageShow() {
    console.info('[circle] page show called');
    let stateChangeEvent: emitter.InnerEvent = {
      eventId: 77,
      priority: emitter.EventPriority.LOW
    }
    console.info('[circle] page show calledA');
    emitter.on(stateChangeEvent, this.stateChangCallBack);
  }

  build() {
    Flex({ justifyContent: FlexAlign.SpaceAround }) {
      Circle({ width: 150, height: 150 })
      Circle()
        .width(`${this.theWidth}`)
        .height(`${this.theHeight}`)
        .key('circle')
    }.width('100%').height('100%').margin({ top: 5 } as Margin)
  }

  private stateChangCallBack: (eventData: emitter.EventData) => void =
    (eventData: emitter.EventData): void => {
      console.info("[circle] page stateChangCallBack");
      const data: Record<String,RecordData> =
        eventData.data as Record<String,RecordData>
      if (eventData != null) {
        console.info("[circle] page state change called:" + JSON.stringify(eventData));
        if (data['height'] != null) {
          this.theHeight = data['height'] as string;
        }
        if (data['width'] != null) {
          this.theWidth = data['width'] as string;
        }
      }
    }
}
