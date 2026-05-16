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

import events_emitter from '@ohos.events.emitter'
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
  Image,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  Alignment,
  TextAlign,
  TextOverflow,
  ProgressStyle,
  Progress,
  RowOptions,
  ProgressType
} from '@ohos.arkui.component';
import { State, AppStorage, StoragePropRef } from '@ohos.arkui.stateManagement';
import { ClickEvent } from '@ohos.arkui.component';
import { UIContext } from '@ohos.arkui.UIContext';

@Entry
@Component
struct ProgressExample {
  @StoragePropRef('value') value: number = 20
  @StoragePropRef('total') total: number = 100
  @State style: ProgressStyle = ProgressStyle.Linear

  onPageShow() {
    console.info('progress page show called');
  }

  build() {
    Column({ space: 15 } as ColumnOptions) {
      Text('Linear Progress').fontSize(9).fontColor('0xCCCCCC').width('90%')
      Progress({ value: 20, type: ProgressType.Linear }).width(200).value(this.value).key('LPValue')
      Progress({ value: 20, total: 150, type: ProgressType.Linear }).color(Color.Red).width(200)

      Text('Eclipse Progress').fontSize(40).fontColor('0x0F0F0F').width('90%')
      Row({ space: 40 } as RowOptions) {
        Progress({ value: 25, type: ProgressType.Eclipse }).width(100).value(this.value).key('EPValue')
        Progress({ value: 20, total: 150, type: ProgressType.Eclipse }).color(Color.Grey).width(110)
      }

      Text('Capsule Progress').fontSize(19).fontColor('0xEE2C2C').width('90%')
      Row({ space: 40 } as RowOptions) {
        Progress({ value: 27, type: ProgressType.Capsule }).width(100).value(this.value).key('CPValue')
        Progress({ value: 20, total: 150, type: ProgressType.Capsule }).color(Color.Grey).value(50).width(120)
      }
    }.width('100%').margin({ top: 30 } as Margin)
  }
}