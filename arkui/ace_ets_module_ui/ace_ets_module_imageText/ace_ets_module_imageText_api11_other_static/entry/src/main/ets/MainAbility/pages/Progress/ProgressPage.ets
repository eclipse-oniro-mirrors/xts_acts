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
  RowOptions,
  Image,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  Alignment,
  TextAlign,
  TextOverflow,
  ProgressType,
  Progress,
  LinearStyleOptions,
  RingStyleOptions,
  CapsuleStyleOptions,
  ProgressStyleOptions,
  ScaleRingStyleOptions
} from '@ohos.arkui.component';
import { State, AppStorage, StoragePropRef } from '@ohos.arkui.stateManagement';
import { ClickEvent } from '@ohos.arkui.component';
import { UIContext } from '@ohos.arkui.UIContext';

@Entry
@Component
struct ProgressPage {
  @StoragePropRef('value') value: number = 20
  @StoragePropRef('total') total: number = 100
  @StoragePropRef('type') type: ProgressType = ProgressType.Linear
  @StoragePropRef('color') color: Color = Color.Grey
  @StoragePropRef('backColor') backColor: Color = Color.Red
  @StoragePropRef('strokeWidth') strokeWidth: number = 15
  @StoragePropRef('scaleCount') scaleCount: int = 15
  @StoragePropRef('scaleWidth') scaleWidth: number = 5

  onPageShow() {
    console.info('ProgressPage onPageShow')
  }

  build() {
    Column({ space: 15 } as ColumnOptions) {
      Text('Linear Progress').fontSize(9).fontColor(0xCCCCCC).width('90%').key('text')
      Progress({ value: this.value, total: this.total, type: this.type })
        .color(this.color)
        .value(this.value)
        .width(200)

        .backgroundColor(this.backColor)
        .key('pro1')
      Progress({ value: 10 }).width(100).key('pro2')

      Text('Eclipse Progress').fontSize(9).fontColor(0xCCCCCC).width('90%')
      Row({ space: 40 } as RowOptions) {
        Progress({ value: 10, type: ProgressType.Eclipse }).width(100)
        Progress({ value: this.value, total: 150, type: ProgressType.Eclipse }).color(this.color).value(50).width(100)
      }

      Text('ScaleRing Progress').fontSize(9).fontColor(0xCCCCCC).width('90%')
      Row({ space: 40 } as RowOptions) {
        Progress({ value: 10, type: ProgressType.ScaleRing }).width(100)
        Progress({ value: this.value, total: 150, type: ProgressType.ScaleRing })
          .color(this.color)
          .value(50)
          .width(100)
          .style({
            strokeWidth: this.strokeWidth,
            scaleCount: this.scaleCount,
            scaleWidth: this.scaleWidth
          } as ProgressStyleOptions)
          .key('pro3')
      }

      Text('Ring Progress').fontSize(9).fontColor(0xCCCCCC).width('90%')
      Row({ space: 40 } as RowOptions) {
        Progress({ value: 10, type: ProgressType.Ring }).width(100)
        Progress({ value: this.value, total: 150, type: ProgressType.ScaleRing })
          .color(this.color).value(50).width(100)
          .style({ strokeWidth: 20, scaleCount: 30, scaleWidth: 20 } as ProgressStyleOptions)
      }

      Text('Capsule Progress').fontSize(9).fontColor(0xCCCCCC).width('90%')
      Row({ space: 40 } as RowOptions) {
        Progress({ value: 10, type: ProgressType.Capsule }).width(100).height(50)
        Progress({ value: this.value, total: 150, type: ProgressType.Capsule })
          .color(this.color)
          .value(50)
          .width(100)
          .height(50)
        Progress({ value: this.value, total: 150, type: ProgressType.Linear })
          .style({
            strokeWidth: 20,
            scaleCount: 30,
            scaleWidth: 20,
            //strokeRadius: 2
          } as ProgressStyleOptions)
          .color(this.color)
          .value(50)
          .width(100)
          .height(50)
      }
    }.width('100%').margin({ top: 30 } as Margin)
  }
}