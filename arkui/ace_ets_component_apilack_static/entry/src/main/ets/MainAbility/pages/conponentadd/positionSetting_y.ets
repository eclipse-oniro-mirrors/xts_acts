'use static';
/*
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
import { BusinessError } from '@ohos.base';
import {
  Alignment,
  AlignRuleOption,
  Axis,
  BlurStyle,
  BorderStyle,
  Builder,
  Button,
  ClickEvent,
  Color,
  Column,
  ColumnOptions,
  CommonMethod,
  Component,
  Configuration,
  ConstraintSizeOptions,
  Direction,
  Entry,
  Flex,
  FlexAlign,
  FlexDirection,
  FontWeight,
  ForEach,
  GeometryInfo,
  GradientDirection,
  HitTestMode,
  HorizontalAlign,
  HoverEffect,
  Image,
  ItemAlign,
  KeyEvent,
  KeyType,
  Layoutable,
  List,
  ListItem,
  LocalizedAlignRuleOptions,
  Margin,
  Measurable,
  MeasureResult,
  Navigation,
  NavigationTitleMode,
  Position,
  RepeatMode,
  Row,
  RowOptions,
  Search,
  SizeResult,
  Stack,
  TapGesture,
  Text,
  TextAlign,
  TextOverflow,
  VerticalAlign
} from '@ohos.arkui.component';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { RecordData } from '@ohos.base';

@Entry
@Component
struct PositionSetting {
  @State align1: Alignment = Alignment.TopStart;
  @State direction1: Direction = Direction.Rtl;
  @State position1: Position = { x: 25, y: 15 } as Position;
  @State position2: Position = { x: '50%', y: '70%' } as Position;
  @State anchor1: Position = { x: 25, y: 25 } as Position;
  @State offset1: Position = { x: 10, y: 15 } as Position;
  @State span1: Position = { x: 10, y: 15 } as Position;
  @State opacityValue: Int = 1;

  build() {
    Column() {
      Column({ space: 10 } as ColumnOptions) {
        Text('opacity(1)')
          .fontSize(20)
          .fontColor(Color.Black)
          .width('90%')
          .opacity(this.opacityValue)
          .key("opacity")
        Text('top start')
          .align(this.align1)
          .height(50)
          .width('90%')
          .fontSize(20)
          .backgroundColor(0xFFE4C4)
          .key('textAlign')

        Text('direction1').fontSize(20).fontColor(Color.Black).width('90%')
        Row() {
          Text('1').height(50).width('25%').fontSize(20).backgroundColor(0xF5DEB3)
          Text('2').height(50).width('25%').fontSize(20).backgroundColor(0xD2B48C)
          Text('3').height(50).width('25%').fontSize(20).backgroundColor(0xF5DEB3)
          Text('4').height(50).width('25%').fontSize(20).backgroundColor(0xD2B48C)
        }
        .width('90%')
        .direction(this.direction1)
        .key('rowDirection')

        Text('position').fontSize(20).fontColor(Color.Black).width('90%')
        Row({ space: 20 } as RowOptions) {
          Text('1')
            .size({ width: '45%', height: '50' })
            .backgroundColor(0xdeb887)
            .border({ width: 1 })
            .fontSize(20)
          Text(`2 position(${this.position1.x}, ${this.position1.y})`)
            .size({ width: '60%', height: '30' })
            .backgroundColor(0xbbb2cb)
            .border({ width: 1 })
            .fontSize(20)
            .align(Alignment.Start)
            .position({ x: this.position1.x, y: this.position1.y } as Position)
            .key('position1')
          Text('3')
            .size({ width: '45%', height: '50' })
            .backgroundColor(0xdeb887)
            .border({ width: 1 }).fontSize(20)
          Text(`4 position(${this.position2.x}, ${this.position2.y})`)
            .size({ width: '50%', height: '50' })
            .backgroundColor(0xbbb2cb)
            .border({ width: 1 })
            .fontSize(20)
            .position({ x: this.position2.x, y: this.position2.y } as Position)
            .key('position2')
        }.width('90%').height(100).border({ width: 1, style: BorderStyle.Dashed })

        Text('markAnchor').fontSize(20).fontColor(Color.Black).width('90%')
        Stack({ alignContent: Alignment.TopStart }) {
          Row()
            .size({ width: '100', height: '100' })
            .backgroundColor(0xdeb887)
          Image('/images/ic_health_heart.png')
            .size({ width: 25, height: 25 })
            .markAnchor({ x: this.anchor1.x, y: this.anchor1.y } as Position)
            .key('markAnchor')
          Image('/images/ic_health_heart.png')
            .size({ width: 25, height: 25 })
            .markAnchor({ x: 25, y: 25 } as Position)
            .position({ x: '100%', y: '100%' } as Position)
        }.margin({ top: 25 } as Margin).border({ width: 1, style: BorderStyle.Dashed })

        Stack({ alignContent: Alignment.Bottom }) {
          Text('First child, show in bottom').width('90%').height('100%').backgroundColor(0xd2cab3).align(Alignment.Top)
          Text('Second child, show in top').width('70%').height('60%').backgroundColor(0xc1cbac).align(Alignment.Top)
        }.width('100%').height(150).margin({ top: 5 } as Margin)

        Text('offset1').fontSize(20).fontColor(Color.Black).width('90%')
        Row() {
          Text('1').size({ width: '15%', height: '100' }).backgroundColor(0xdeb887).border({ width: 1 }).fontSize(20)
          Text(`2\noffset1(${this.offset1.x}, ${this.offset1.y})`)
            .size({ width: 170, height: '50' })
            .backgroundColor(0xbbb2cb)
            .border({ width: 1 })
            .fontSize(20)
            .align(Alignment.Start)
            .offset({ x: this.offset1.x, y: this.offset1.y } as Position)
            // .span({ x: this.span1.x, y: this.span1.y })
            .key('offset1')
          Text('3').size({ width: '15%', height: '50' }).backgroundColor(0xdeb887).border({ width: 1 }).fontSize(20)
          Text('4\noffset1(-10%, 20%)')
            .size({ width: 170, height: '50' })
            .backgroundColor(0xbbb2cb)
            .border({ width: 1 })
            .fontSize(20)
            .offset({ x: '-10%', y: '50%' } as Position)
        }.width('90%').height(100).border({ width: 1, style: BorderStyle.Dashed })
      }
    }
    .width('100%').margin({ top: 5 } as Margin)
  }

  onPageShow() {
    let stateChangeEvent: events_emitter.InnerEvent = {
      eventId: 25,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack);

    let directionChangeEvent: events_emitter.InnerEvent = {
      eventId: 26,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(directionChangeEvent, this.stateChangCallBack);

    let positionChangeEvent: events_emitter.InnerEvent = {
      eventId: 27,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(positionChangeEvent, this.stateChangCallBack);

    let markAnchorChangeEvent: events_emitter.InnerEvent = {
      eventId: 28,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(markAnchorChangeEvent, this.stateChangCallBack);

    let offsetChangeEvent: events_emitter.InnerEvent = {
      eventId: 29,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(offsetChangeEvent, this.stateChangCallBack);
  }

  stateChangCallBack: (eventData: events_emitter.EventData) => void = (eventData: events_emitter.EventData) => {
    console.info("position page stateChangCallBack" + JSON.stringify(eventData));
    if (eventData) {
      const data = eventData.data as Record<String,RecordData>
      if (data['textAlign']) {
        this.align1 = Alignment.BottomEnd;
      } else if (data['direction1']) {
        this.direction1 = data['direction1'] as Direction;
      } else if (data['position1']) {
        this.position1 = data['position1'] as Position;
        this.position2 = data['position1'] as Position;
      } else if (data['markAnchor']) {
        this.anchor1 = data['markAnchor'] as Position;
      } else if (data['offset1']) {
        this.offset1 = data['offset1'] as Position;
        this.span1 = data['span1'] as Position;
      } else if (data['opacityValue']) {
        this.opacityValue = data['opacityValue'] as Int;
      }
    }
  }
}