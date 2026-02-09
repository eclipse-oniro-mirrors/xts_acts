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

import { BusinessError } from '@ohos.base';
import events_emitter from '@ohos.events.emitter';
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
  CommonShapeMethod,
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
import { CircleShape, EllipseShape, PathShape, RectShape, RectShapeOptions, ShapeSize } from '@ohos.arkui.shape'
import { RecordData } from '@ohos.base';

@Entry
@Component
struct ClipAndMaskExample {
  @State isMaskRect: boolean = true;
  @State isClipCircle: boolean = true;
  @State maskType: CircleShape | EllipseShape | PathShape | RectShape =
    new RectShape({ radius: 10 } as RectShapeOptions);
  @State clipType: CircleShape | EllipseShape | PathShape | RectShape =
    new CircleShape({ width: 280, height: 280 } as ShapeSize);

  onPageShow() {
    console.info('shapeClipping page show called');
    let stateChangeEvent: events_emitter.InnerEvent = {
      eventId: 32,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack);

    let shapeChangeEvent: events_emitter.InnerEvent = {
      eventId: 33,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(shapeChangeEvent, this.shapeChangCallBack);
  }

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Text('clip')
        .fontSize(9)
        .width('90%')
        .fontColor(0xCCCCCC)

      Image('/images/clip.png')
        .clip(true)
        .width('500px')
        .height('280px')
        .key('image_clip')


      Row() {
        Image('/images/clip.png')
          .width('500px')
          .height('280px')
      }
      .clip(true)
      .borderRadius(20)
      .key('image_clip_true')

      Text('mask')
        .fontSize(9)
        .width('90%')
        .fontColor(0xCCCCCC)

      Image('/images/clip.png')
        .maskShape(this.maskType)
        .width('500px').height('280px')
        .key('image_mask')
    }

    .width('100%')
    .margin({ top: 5 } as Margin)
  }

  private stateChangCallBack: (eventData: events_emitter.EventData) => void = (eventData: events_emitter.EventData) => {
    if (eventData != null) {
      const data = eventData.data as Record<String,RecordData>
      console.info("shapeClipping page state change called:" + JSON.stringify(eventData));
      if (data['maskValue'] != null) {
        this.maskType = new CircleShape({ width: 280, height: 280 } as ShapeSize);
      }
    }
  }
  private shapeChangCallBack: (eventData: events_emitter.EventData) => void = (eventData: events_emitter.EventData) => {
    if (eventData != null) {
      const data = eventData.data as Record<String,RecordData>
      console.info("shapeClipping page shape change called:" + JSON.stringify(eventData));
      if (data['clipValue'] != null) {
        this.clipType = new RectShape({ radius: 20 } as RectShapeOptions);
      }
    }
  }
}