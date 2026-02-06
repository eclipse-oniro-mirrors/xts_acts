'use static';
/*
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
import {
  Entry,
  Text,
  Column,
  Row,
  Component,
  ColumnOptions,
  FlexWrap,
  RowOptions,
  $r,
  Color
} from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct RowSpaceResourcePage {
  build() {
    Column({ space: 2 } as ColumnOptions) {

      Row({ space: 10 } as RowOptions) {
        Row() {
          Text('1')
        }.width('20%').height('90%').backgroundColor(0xAFEEEE).id('RowSpaceResource_Row1_01')

        Row() {
          Text('2')
        }.width('20%').height('90%').backgroundColor(0x00FFFF).id('RowSpaceResource_Row1_02')

        Row() {
          Text('3')
        }.width('20%').height('90%').backgroundColor(0xAFEEEE).id('RowSpaceResource_Row1_03')
      }.width('90%').height('30%').backgroundColor(Color.Pink).id('RowSpaceResource_Row1')

      Row({ space: 10 } as RowOptions) {
        Row() {
          Text('1')
        }.width('20%').height('90%').backgroundColor(0xAFEEEE).id('RowSpaceResource_Row2_01')

        Row() {
          Text('2')
        }.width('20%').height('90%').backgroundColor(0x00FFFF).id('RowSpaceResource_Row2_02')

        Row() {
          Text('3')
        }.width('20%').height('90%').backgroundColor(0xAFEEEE).id('RowSpaceResource_Row2_03')
      }.width('90%').height('30%').backgroundColor(Color.Pink).id('RowSpaceResource_Row2')

      Row({ space: 10.9 } as RowOptions) {
        Row() {
          Text('1')
        }.width('20%').height('90%').backgroundColor(0xAFEEEE).id('RowSpaceResource_Row3_01')

        Row() {
          Text('2')
        }.width('20%').height('90%').backgroundColor(0x00FFFF).id('RowSpaceResource_Row3_02')

        Row() {
          Text('3')
        }.width('20%').height('90%').backgroundColor(0xAFEEEE).id('RowSpaceResource_Row3_03')
      }.width('90%').height('30%').backgroundColor(Color.Pink).id('RowSpaceResource_Row3')
    }.width('100%').height('100%')
  }
}