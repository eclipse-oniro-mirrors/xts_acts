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
  FlexWrap,
  FlexOptions,
  FlexSpaceOptions,
  Margin,
  Text,
  Flex,Color
} from '@ohos.arkui.component';
import { LengthMetrics } from '@ohos.arkui.node';

@Entry
@Component
struct FlexSpaceMainNumber {
  build() {
    Column() {
      Column({ space: 5 } as ColumnOptions) {
        Text('main：number=10').fontSize(9).fontColor(Color.Red).width('90%')
        Flex({
          wrap: FlexWrap.Wrap,
          space: { main: LengthMetrics.px(10) } as FlexSpaceOptions
        } as FlexOptions) { // 子组件多行布局
          Text('1').width('50%').height(50).backgroundColor(Color.Red)
          Text('2').width('50%').height(50).backgroundColor(Color.Red)
          Text('3').width('50%').height(50).backgroundColor(Color.Red)
        }
        .id("flex_main_number_1")
        .width('90%')
        .padding(10)
        .backgroundColor(Color.Red)

        Text('main：number=0').fontSize(9).fontColor(Color.Red).width('90%')
        Flex({
          wrap: FlexWrap.Wrap,
          space: { main: LengthMetrics.vp(0) } as FlexSpaceOptions
        } as FlexOptions) { // 子组件多行布局
          Text('1').width('50%').height(50).backgroundColor(Color.Red)
          Text('2').width('50%').height(50).backgroundColor(Color.Red)
          Text('3').width('50%').height(50).backgroundColor(Color.Red)
        }
        .id("flex_main_number_2")
        .width('90%')
        .padding(10)
        .backgroundColor(Color.Red)

        Text('main：number=-10').fontSize(9).fontColor(Color.Red).width('90%')
        Flex({
          wrap: FlexWrap.Wrap,
          space: { main: LengthMetrics.px(-10) } as FlexSpaceOptions
        } as FlexOptions) { // 子组件多行布局
          Text('1').width('50%').height(50).backgroundColor(Color.Red)
          Text('2').width('50%').height(50).backgroundColor(Color.Red)
          Text('3').width('50%').height(50).backgroundColor(Color.Red)
        }
        .id("flex_main_number_3")
        .width('90%')
        .padding(10)
        .backgroundColor(Color.Red)

        Text('main：number=undefined').fontSize(9).fontColor(Color.Red).width('90%')
        Flex({ wrap: FlexWrap.Wrap, space: { main: undefined } as FlexSpaceOptions } as FlexOptions) { // 子组件多行布局
          Text('1').width('50%').height(50).backgroundColor(Color.Red)
          Text('2').width('50%').height(50).backgroundColor(Color.Red)
          Text('3').width('50%').height(50).backgroundColor(Color.Red)
        }
        .id("flex_main_number_4")
        .width('90%')
        .padding(10)
        .backgroundColor(Color.Red)

        Text('main：number=3276789').fontSize(9).fontColor(Color.Red).width('90%')
        Flex({
          wrap: FlexWrap.Wrap,
          space: { main: LengthMetrics.px(3276789) } as FlexSpaceOptions
        } as FlexOptions) { // 子组件多行布局
          Text('1').width('50%').height(50).backgroundColor(Color.Red)
          Text('2').width('50%').height(50).backgroundColor(Color.Red)
          Text('3').width('50%').height(50).backgroundColor(Color.Red)
        }
        .id("flex_main_number_5")
        .width('90%')
        .padding(10)
        .backgroundColor(Color.Red)
      }.width('100%').margin({ top: 5 } as Margin)
    }.width('100%')
  }
}