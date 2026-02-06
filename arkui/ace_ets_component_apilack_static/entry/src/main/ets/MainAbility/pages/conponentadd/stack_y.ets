'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { BusinessError } from '@ohos.base';
import Log from '../../common/Log';
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

const TAG = 'ets_apiLack_add';

@Entry
@Component
struct StackAlignContent {
  aboutToAppear() {
    Log.showInfo(TAG, `aboutToAppear StackAlignContent start`)
  }

  aboutToDisappear() {
    Log.showInfo(TAG, `aboutToDisAppear StackAlignContent end`)
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {

      Text("stack-AlignContent")
        .width(100)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("alignContentText")


      Stack({ alignContent: Alignment.Bottom }) {
        Text('First child, show in bottom')
          .width('95%')
          .width('90%')
          .height('100%')
          .backgroundColor(0xd2cab3)
          .align(Alignment.Top)
        Text('Second child, show in top')
          .width('70%')
          .height('60%')
          .backgroundColor(0xc1cbac)
          .align(Alignment.Top)
      }.key("Stack")
      .width('100%').height(150).margin({ top: 5 } as Margin)

    }.width("100%").height("100%")
  }
}

