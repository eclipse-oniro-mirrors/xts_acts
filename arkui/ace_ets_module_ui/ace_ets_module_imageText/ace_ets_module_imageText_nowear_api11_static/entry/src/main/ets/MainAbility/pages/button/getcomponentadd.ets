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
  Entry, Component, Column, Text, Margin, Alignment, Direction, Flex, BarState, ScrollDirection, InputType, ScrollBarDirection,
  ColumnOptions, Color, Row, Stack, RowOptions, Image, BorderStyle, IconOptions, FontWeight, ForEach, TextAlign, GridItem,
  Position, Scroller, Button, Checkbox, Radio, Scroll, ScrollBar, Select, Grid, List, TextInput, Margin, ButtonType,
  Axis, EdgeEffect, $r, FlexDirection, ListItem
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
@Entry
@Component
struct getcomponentadd {
  private scroller: Scroller = new Scroller();
  private arr: Array<number> = new Array<number>(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15)
  @State aryNum: Array<String> = new Array<String>('0', '1', '2', '3', '4')
  @State message: string = 'Hello World';
  build() {
    Row() {
      Column() {

        Button("") {
          Text('next page')
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
        }
        .type(ButtonType.Capsule)
        .key('ArkUX_Get_component_add_0010')
        .margin({
          top: 20
        } as Margin)
        .backgroundColor('#0D9FFB')
        .width('35%')
        .height('5%')

        Checkbox({ name: 'checkbox1', group: 'checkboxGroup' })
          .select(true)
          .selectedColor(Color.Red)
          .position({ x: 100, y: 100 } as Position)
          .key('ArkUX_Get_component_add_0020')

        Image($r('app.media.icon'))
          .width(110)
          .height(110)
          .border({ width: 1 })
          .borderStyle(BorderStyle.Dashed)
          .overlay('png', { align: Alignment.Bottom, offset: { x: 0, y: 20 } })
          .position({ x: 200, y: 200 } as Position)
          .key('ArkUX_Get_component_add_0030')

        Text('Radio1')
        Radio({ value: 'Radio1', group: 'radioGroup' })
          .checked(true)
          .height(50)
          .width(50)
          .position({ x: 300, y: 300 } as Position)
          .key('ArkUX_Get_component_add_0040')

        Scroll(this.scroller) {
          Flex({ direction: FlexDirection.Column }) {
            ForEach(this.arr, (item: number) => {
              Row() {
                Text(String(item))
                  .width('80%')
                  .height(60)
                  .backgroundColor('#3366CC')
                  .borderRadius(15)
                  .fontSize(16)
                  .textAlign(TextAlign.Center)
                  .margin({ top: 5 } as Margin)
              }
            })
          }.margin({ right: 15 } as Margin)
        }
        .width('90%')
        .scrollBar(BarState.Off)
        .scrollable(ScrollDirection.Vertical)

        ScrollBar({ scroller: this.scroller, direction: ScrollBarDirection.Vertical, state: BarState.Auto }) {
          Text()
            .width(20)
            .height(100)
            .borderRadius(10)
            .backgroundColor('#C0C0C0')
        }.width(20).backgroundColor('#ededed')
        .position({ x: 400, y: 400 } as Position)
        .key('ArkUX_Get_component_add_0050')

        Select([{ value: 'aaa' }, { value: 'bbb' }, { value: 'ccc' }])
          .selected(2)
          .value('TTTTT')
          .font({ size: 16, weight: 500 })
          .fontColor('#182431')
          .selectedOptionFont({ size: 16, weight: 400 })
          .optionFont({ size: 16, weight: 400 })
          .position({ x: 500, y: 500 } as Position)
          .key('ArkUX_Get_component_add_0060')

        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .position({ x: 600, y: 600 } as Position)
          .key('ArkUX_Get_component_add_0070')

        Grid() {
          ForEach(this.aryNum, (day: string) => {
            ForEach(this.aryNum, (day: string) => {
              GridItem() {
                Text(day)
                  .fontSize(16)
                  .backgroundColor(Color.Red)
                  .width('100%')
                  .height('100%')
                  .textAlign(TextAlign.Center)
              }
            }, (day: string) => day)
          }, (day: string) => day)
        }
        .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
        .rowsTemplate('1fr 1fr 1fr 1fr 1fr')
        .columnsGap(10)
        .rowsGap(10)
        .width('90%')
        .backgroundColor(Color.Red)
        .height(300)
        .position({ x: 700, y: 700 } as Position)
        .key('ArkUX_Get_component_add_0080')


        List({ space: 20, initialIndex: 0 }) {
          ForEach(this.arr, (item: number) => {
            ListItem() {
              Text('' + item)
                .width('100%')
                .height(100)
                .fontSize(16)
                .textAlign(TextAlign.Center)
                .borderRadius(10)
                .backgroundColor(Color.Red)
            }
          })
        }
        .position({ x: 800, y: 800 } as Position)
        .key('ArkUX_Get_component_add_0090')
        .listDirection(Axis.Vertical)
        .divider({ strokeWidth: 2, color: Color.Red, startMargin: 20, endMargin: 20 })
        .edgeEffect(EdgeEffect.Spring)
        .onScrollIndex((firstIndex: int, lastIndex: int): void => {
          console.info('first' + firstIndex)
          console.info('last' + lastIndex)
        })
        .width('90%')

        TextInput({ placeholder: 'input your password...' })
          .width(400)
          .height(40)
          .margin(20)
          .type(InputType.Password)
          .maxLength(9)
          .showPasswordIcon(true)
          .position({ x: 900, y: 900 } as Position)
          .key('ArkUX_Get_component_add_0100')

        Button('') {
          Text('next page')
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
        }.type(ButtonType.Capsule)
        .key('ArkUX_Get_component_add_0110')
      }.width('100%')
    }.height('100%')
  }
}