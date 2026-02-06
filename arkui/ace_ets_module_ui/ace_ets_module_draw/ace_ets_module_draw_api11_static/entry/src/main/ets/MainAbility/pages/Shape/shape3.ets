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
  LineCapStyle,
  LineJoinStyle,
  Margin,
  Path,
  Polygon,
  PolygonAttribute,
  Polyline,
  PolylineAttribute,
  Position,
  Rect,
  Shape,
  Text,
  TextAlign,
  TextOverflow,
} from '@ohos.arkui.component';
import { Link, PropRef, State, } from '@ohos.arkui.stateManagement';
import { RecordData } from '@ohos.base';

@Entry
@Component
struct ShapeExample {
  @State strokeDashOffset: number = 0;
  @State strokeLineCap: LineCapStyle = LineCapStyle.Butt;
  @State strokeLineJoin: LineJoinStyle = LineJoinStyle.Miter;
  @State strokeMiterLimit: number = 4;
  @State strokeOpacity: number = 1;
  @State strokeWidth: number = 1;
  @State antiAlias: boolean = true;
  @State strokeDashArray: Array<Length> = [20, 20, 2, 3] as Array<Length>;
  @State fillOpacity: number = 0;
  @State strokeValue: string = '#FF000000';

  onPageShow() {
    console.info('qrCode page show called');
    let stateChangeEvent: emitter.InnerEvent = {
      eventId: 192,
      priority: emitter.EventPriority.LOW
    }
    emitter.on(stateChangeEvent, this.stateChangCallBack);
    console.log('test get data is: ' + this.antiAlias)
  }

  build() {
    Column({ space: 2 } as ColumnOptions) {
      Text('basic').fontSize(30).fontColor('0xCCCCCC').width(320)
      Shape() {
        Rect().width(300).height(50)
        Ellipse().width(300).height(50).offset({ x: 0, y: 60 } as Position)
        Path().width(300).height(10).commands('M0 0 L900 0').offset({ x: 0, y: 120 } as Position)
      }
      .key('shape')
      .viewPort({
        x: -2,
        y: -2,
        width: 304,
        height: 130
      })
      .fill('0x317Af7')
      .stroke(this.strokeValue)
      .strokeDashArray(this.strokeDashArray)
      .strokeDashOffset(this.strokeDashOffset)
      .strokeLineCap(this.strokeLineCap)
      .strokeLineJoin(this.strokeLineJoin)
      .strokeMiterLimit(this.strokeMiterLimit)
      .strokeOpacity(this.strokeOpacity)
      .strokeWidth(this.strokeWidth)
      .antiAlias(this.antiAlias)
      .fillOpacity(this.fillOpacity)
      .mesh([], 1, 1)
    }.width('100%').margin({ top: 15 } as Margin)
  }

  private stateChangCallBack: (eventData: emitter.EventData) => void =
    (eventData: emitter.EventData): void => {
      if (eventData != null) {
        console.info("text page state change called:" + JSON.stringify(eventData));
        const data: Record<String,RecordData> =
          eventData.data as Record<String,RecordData>
        if (data['strokeDashOffset'] != null) {
          this.strokeDashOffset = parseInt(data['strokeDashOffset']?.toString() as string);
        }
        if (data['strokeLineCap'] != null) {
          this.strokeLineCap = data['strokeLineCap'] as LineCapStyle;
        }
        if (data['strokeLineJoin'] != null) {
          this.strokeLineJoin = data['strokeLineJoin'] as LineJoinStyle;
        }
        if (data['strokeMiterLimit'] != null) {
          this.strokeMiterLimit = data['strokeMiterLimit'] as number;
        }
        if (data['strokeOpacity'] != null) {
          this.strokeOpacity = parseInt(data['strokeOpacity']?.toString() as string);
        }
        if (data['fillOpacity'] != null) {
          this.fillOpacity = parseInt(data['fillOpacity']?.toString() as string);
        }
        if (data['antiAlias'] != null) {
          console.log('test get data is: ' + data['antiAlias'])
          this.antiAlias = data['antiAlias'] as boolean;
        }
        if (data['strokeDashArrayOne'] != null) {
          this.strokeDashArray[0] = parseInt(data['strokeDashArrayOne']?.toString() as string);
        }
        if (data['strokeDashArrayTwo'] != null) {
          this.strokeDashArray[1] = parseInt(data['strokeDashArrayTwo']?.toString() as string);
        }
        if (data['strokeDashArrayThree'] != null) {
          this.strokeDashArray[2] = parseInt(data['strokeDashArrayThree']?.toString() as string);
        }
        if (data['stroke'] != null) {
          this.strokeValue = data['stroke'] as string;
        }
      }
    }
}
