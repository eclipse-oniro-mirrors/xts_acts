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

import {
  Entry,
  Column,
  Component,
  ColumnOptions,
  Margin,
  Text,
  Flex,
  FlexDirection,
  FlexWrap,
  FlexAlign,
  FlexOptions,
  FlexSpaceOptions,
  ItemAlign,Color
} from '@ohos.arkui.component';
import { LengthMetrics } from '@ohos.arkui.node';

@Entry
@Component
struct SpaceMain5JustifyContent {
  build() {
    Column() {
      Column({ space: 5 } as ColumnOptions) {
        Text('main：5,FlexWrap.NoWrap').fontSize(9).fontColor(Color.Red).width('90%')
        Flex({
          direction: FlexDirection.Row,
          wrap: FlexWrap.NoWrap,
          space: { main: LengthMetrics.vp(5) } as FlexSpaceOptions
        } as FlexOptions) { // 子组件多行布局
          Text('1').width('50%').height(50).backgroundColor(Color.Red)
          Text('2').width('50%').height(50).backgroundColor(Color.Red)
          Text('3').width('50%').height(50).backgroundColor(Color.Red)
        }
        .id("SpaceMain5NoWrap_1")
        .width('90%')
        .padding(10)
        .backgroundColor(Color.Red)

        Text('main：5, justifyContent: FlexAlign.Start').fontSize(9).fontColor(Color.Red).width('90%')
        Flex({
          direction: FlexDirection.RowReverse,
          wrap: FlexWrap.Wrap,
          justifyContent: FlexAlign.Start,
          space: { main: LengthMetrics.vp(5) } as FlexSpaceOptions
        } as FlexOptions) {
          Text('1').width('50%').height(50).backgroundColor(Color.Red)
          Text('2').width('50%').height(50).backgroundColor(Color.Red)
          Text('3').width('50%').height(50).backgroundColor(Color.Red)
        }
        .id("SpaceMain5JustifyContent_Start")
        .width('90%')
        .padding(10)
        .backgroundColor(Color.Red)

        Text('main：5, justifyContent: FlexAlign.Center').fontSize(9).fontColor(Color.Red).width('90%')
        Flex({
          direction: FlexDirection.RowReverse,
          wrap: FlexWrap.Wrap,
          justifyContent: FlexAlign.Center,
          space: { main: LengthMetrics.vp(5) } as FlexSpaceOptions
        } as FlexOptions) {
          Text('1').width('50%').height(50).backgroundColor(Color.Red)
          Text('2').width('50%').height(50).backgroundColor(Color.Red)
          Text('3').width('50%').height(50).backgroundColor(Color.Red)
        }
        .id("SpaceMain5JustifyContent_Center")
        .width('90%')
        .padding(10)
        .backgroundColor(Color.Red)

        Text('main：5, justifyContent: FlexAlign.End').fontSize(9).fontColor(Color.Red).width('90%')
        Flex({
          direction: FlexDirection.RowReverse,
          wrap: FlexWrap.Wrap,
          justifyContent: FlexAlign.End,
          space: { main: LengthMetrics.vp(5) } as FlexSpaceOptions
        } as FlexOptions) {
          Text('1').width('50%').height(50).backgroundColor(Color.Red)
          Text('2').width('50%').height(50).backgroundColor(Color.Red)
          Text('3').width('50%').height(50).backgroundColor(Color.Red)
        }
        .id("SpaceMain5JustifyContent_End")
        .width('90%')
        .padding(10)
        .backgroundColor(Color.Red)

        Text('main：5, justifyContent: FlexAlign.SpaceBetween').fontSize(9).fontColor(Color.Red).width('90%')
        Flex({
          direction: FlexDirection.RowReverse,
          wrap: FlexWrap.Wrap,
          justifyContent: FlexAlign.SpaceBetween,
          space: { main: LengthMetrics.vp(5) } as FlexSpaceOptions
        } as FlexOptions) {
          Text('1').width('50%').height(50).backgroundColor(Color.Red)
          Text('2').width('50%').height(50).backgroundColor(Color.Red)
          Text('3').width('50%').height(50).backgroundColor(Color.Red)
        }
        .id("SpaceMain5JustifyContent_SpaceBetween")
        .width('90%')
        .padding(10)
        .backgroundColor(Color.Red)

        Text('main：5, justifyContent: FlexAlign.SpaceAround').fontSize(9).fontColor(Color.Red).width('90%')
        Flex({
          direction: FlexDirection.RowReverse,
          wrap: FlexWrap.Wrap,
          justifyContent: FlexAlign.SpaceAround,
          space: { main: LengthMetrics.vp(5) } as FlexSpaceOptions
        } as FlexOptions) {
          Text('1').width('50%').height(50).backgroundColor(Color.Red)
          Text('2').width('50%').height(50).backgroundColor(Color.Red)
          Text('3').width('50%').height(50).backgroundColor(Color.Red)
        }
        .id("SpaceMain5JustifyContent_SpaceAround")
        .width('90%')
        .padding(10)
        .backgroundColor(Color.Red)

        Text('main：5, justifyContent: FlexAlign.SpaceEvenly').fontSize(9).fontColor(Color.Red).width('90%')
        Flex({
          direction: FlexDirection.RowReverse,
          wrap: FlexWrap.Wrap,
          justifyContent: FlexAlign.SpaceEvenly,
          space: { main: LengthMetrics.vp(5) } as FlexSpaceOptions
        } as FlexOptions) {
          Text('1').width('50%').height(50).backgroundColor(Color.Red)
          Text('2').width('50%').height(50).backgroundColor(Color.Red)
          Text('3').width('50%').height(50).backgroundColor(Color.Red)
        }
        .id("SpaceMain5JustifyContent_SpaceEvenly")
        .width('90%')
        .padding(10)
        .backgroundColor(Color.Red)
      }.width('100%').margin({ top: 5 } as Margin)
    }.width('100%')
  }
}