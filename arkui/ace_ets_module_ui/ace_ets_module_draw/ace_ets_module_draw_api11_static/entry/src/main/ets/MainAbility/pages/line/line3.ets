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
  Length,
  Line,
  Margin,
  ShapePoint,
  Text,
  TextAlign,
  TextOverflow
} from '@ohos.arkui.component';
import { AppStorage, Link, PropRef, State } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { RecordData } from '@ohos.base';

@Entry
@Component
struct LineExample {
  @State startPoint: ShapePoint = [0, 0] as ShapePoint
  @State endPoint: ShapePoint = [50, 100] as ShapePoint

  build() {
    Column() {
      Line({ width: 50, height: 100 })
        .startPoint(this.startPoint as ShapePoint)
        .endPoint(this.endPoint as ShapePoint)
        .key('line')
    }.margin({ top: 5 } as Margin)
  }

  onPageShow() {
    console.info('line page show called');
    let stateChangeEvent: emitter.InnerEvent = {
      eventId: 131,
      priority: emitter.EventPriority.LOW
    }
    emitter.on(stateChangeEvent, this.stateChangCallBack);
  }

  private stateChangCallBack: (eventData: emitter.EventData) => void =
    (eventData: emitter.EventData): void => {
      if (eventData != null) {
        const data: Record<String,RecordData> =
          eventData.data as Record<String,RecordData>
        console.info("line page state change called:" + JSON.stringify(eventData));
        if (data['startPoint'] != null && data['startPointOne'] != null) {
          console.log('test start startPoint is: ' + data['startPoint'])
          this.startPoint = [data['startPoint'] as Length, data['startPointOne'] as Length];
          console.log('test start startPoint1 is: ' + this.startPoint[0])
        }

        // if (data['startPointOne'] != null) {
        //   console.log('test start startPointOne is: ' + data['startPointOne'])
        //   this.startPoint[1] = data['startPointOne'] as Length;
        //   console.log('test start startPointOne1 is: ' + this.startPoint[1])
        // }

        if (data['endPointOne'] != null && data['endPoint'] != null) {
          console.log('test start endPointOne is: ' + data['endPointOne'])
          this.endPoint = [data['endPoint'] as Length, data['endPointOne'] as Length];
          console.log('test start endPointOne1 is: ' + this.endPoint[1])
        }

        // if (data['endPoint'] != null) {
        //   console.log('test start endPoint is: ' + data['endPoint'])
        //   this.endPoint[0] = data['endPoint'] as Length;
        //   console.log('test start endPoint1 is: ' + this.endPoint[0])
        // }
      }
    }
}