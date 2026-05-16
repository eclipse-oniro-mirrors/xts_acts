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

import { Entry, Component, Column,Button,ColumnOptions,Color,Text,Flex,Direction,FlexDirection,FlexWrap,FlexAlign,ItemAlign,FlexOptions,HorizontalAlign,Margin } from '@ohos.arkui.component';
import { State,AppStorage } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct flex {
  private content: string = "Flex Page"

  onPageShow() {
    console.info('Flex page show called');
  }

  onBuildDone() {
    console.info('Flex page build done called');
  }

  build() {
    Column() {
      Column({ space: 2 } as ColumnOptions) {
        Text('direction:Column').fontSize(9).fontColor(Color.Red).width('90%')
        Flex({
          direction: FlexDirection.Column,
          wrap: FlexWrap.NoWrap,
          justifyContent: FlexAlign.Center,
          alignItems: ItemAlign.Start,
          alignContent: FlexAlign.Start,
        } as FlexOptions) {
          Text('1').width('100%').height(20).backgroundColor(Color.Red)
          Text('2').width('100%').height(20).backgroundColor(Color.Red)
          Text('3').width('100%').height(20).backgroundColor(Color.Red)
        }
        .key('flex')
        .height(70)
        .width('90%')
        .padding(10)
        .backgroundColor(Color.Red)

        Text('direction:Row').fontSize(9).fontColor(Color.Red).width('90%')
        Flex({
          direction: FlexDirection.Row,
          wrap: FlexWrap.Wrap,
          justifyContent: FlexAlign.Start,
          alignItems: ItemAlign.Start,
          alignContent: FlexAlign.Center,
        } as FlexOptions) {
          Text('1').width('20%').height(20).backgroundColor(Color.Red)
          Text('2').width('20%').height(20).backgroundColor(Color.Red)
          Text('3').width('20%').height(20).backgroundColor(Color.Red)
        }
        .key('flex1')
        .height(70)
        .width('90%')
        .padding(10)
        .backgroundColor(Color.Red)

        Text('direction:RowReverse').fontSize(9).fontColor(Color.Red).width('90%')
        Flex({
          direction: FlexDirection.RowReverse,
          wrap: FlexWrap.Wrap,
          justifyContent: FlexAlign.End,
          alignItems: ItemAlign.End,
          alignContent: FlexAlign.End,
        } as FlexOptions) {
          Text('1').width('50%').height(20).backgroundColor(Color.Red)
          Text('2').width('50%').height(20).backgroundColor(Color.Red)
          Text('3').width('50%').height(20).backgroundColor(Color.Red)
        }
        .key('flex2')
        .height(90)
        .width('90%')
        .padding(10)
        .backgroundColor(Color.Red)

        Text('justifyContent:SpaceBetween').fontSize(9).fontColor(Color.Red).width('90%')
        Flex({
          justifyContent: FlexAlign.SpaceBetween,
          wrap: FlexWrap.Wrap,
        } as FlexOptions) {
          Text('1').width('100%').height(20).backgroundColor(Color.Red)
          Text('2').width('100%').height(20).backgroundColor(Color.Red)
          Text('3').width('100%').height(20).backgroundColor(Color.Red)
        }
        .key('flex3')
        .height(100)
        .width('90%')
        .padding(10)
        .backgroundColor(Color.Red)

        Text('justifyContent AND alignContent').fontSize(9).fontColor(Color.Red).width('90%')
        Flex({
          justifyContent: FlexAlign.SpaceEvenly,
          alignContent: FlexAlign.SpaceEvenly,
          wrap: FlexWrap.Wrap,
        } as FlexOptions) {
          Text('1').width('50%').height(20).backgroundColor(Color.Red)
          Text('2').width('50%').height(20).backgroundColor(Color.Red)
          Text('3').width('50%').height(20).backgroundColor(Color.Red)
        }
        .key('flex4')
        .height(90)
        .width('90%')
        .padding(10)
        .backgroundColor(Color.Red)

        Text('justifyContent AND alignContent').fontSize(9).fontColor(Color.Red).width('90%')
        Flex({
          justifyContent: FlexAlign.SpaceAround,
          alignContent: FlexAlign.SpaceAround,
          wrap: FlexWrap.Wrap,
        }as FlexOptions) {
          Text('1').width('50%').height(20).backgroundColor(Color.Red)
          Text('2').width('50%').height(20).backgroundColor(Color.Red)
          Text('3').width('50%').height(20).backgroundColor(Color.Red)
        }
        .key('flex5')
        .height(90)
        .width('90%')
        .padding(10)
        .backgroundColor(Color.Red)
      }.width('100%').margin({ top: 5 } as Margin)
    }.width('100%')
  }
}
