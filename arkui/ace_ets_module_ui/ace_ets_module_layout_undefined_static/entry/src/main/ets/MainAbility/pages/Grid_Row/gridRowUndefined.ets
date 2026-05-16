'use static'
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { ItemAlign, GridCol, ForEach, GridRowDirection, BreakpointsReference, GridRow, Color, Stack, Row, Alignment,
  VerticalAlign, HorizontalAlign, RelativeContainer, Entry, Text, Column, Component, Button,
  ClickEvent } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Entry
@Component
struct GridColExample {
  @State bgColors: Color[] = [Color.Red, Color.Orange, Color.Yellow, Color.Green, Color.Pink, Color.Grey,
         Color.Blue, Color.Brown];
  @State currentBp: string = 'unknown';
  @State isAlignItems: boolean = true;

  @State isDef: boolean =  true;
  @State widthArray: string[] = ['100vp', '300vp', '500vp', '650vp'];
  @State widthIndex: int = 0;

  build() {
    Column() {
      Column() {
        GridRow({
          columns: 5,
          gutter: { x: 5, y: 10 },
          breakpoints: {
            value: ['400vp', '600vp', '800vp'],
            reference: BreakpointsReference.WindowSize
          },
          direction: GridRowDirection.Row
        }) {
          GridCol({
            span: 1,
            offset: 0,
          }) {
            Row().width('100%').height('70%')
          }.borderColor(Color.Red).borderWidth(2)

          GridCol({
            span: 1,
            offset: 0,
          }) {
            Row().width('100%').height('100%')
          }.borderColor(Color.Blue).borderWidth(2)
        }.width('100%').height('100%')
        .id('MyGridRow1')
        .onBreakpointChange((breakpoint) => {
          this.currentBp = breakpoint
        })
        .alignItems(this.isAlignItems ? ItemAlign.End : undefined)
      }.width('80%').margin(10).height(200)
      .border({ color: '#880606', width: 2 })
      Column() {
        Button('isAlignItems = ' + this.isAlignItems)
          .onClick(() => {
            this.isAlignItems = !this.isAlignItems;
          })
          .height(30)
          .id('GridRow_AlignItems')
      }

      Column() {
        Text(this.currentBp).fontSize(30).id('GridRow_Text');
        GridRow({
          columns: 5,
          gutter: { x: 5, y: 10 },
          breakpoints: {
            value: ['200vp', '400vp', '600vp'],
            reference: BreakpointsReference.ComponentSize
          },
          direction: GridRowDirection.Row
        }) {
          GridCol({
            span: {
              xs: 1,
              sm: 2,
              md: 3,
              lg: 4
            },
            offset: 0,
            order: 0
          }) {
            Row().width('100%').height('20vp')
          }.borderColor(this.bgColors[0]).borderWidth(2)

          GridCol({
            span: {
              xs: 1,
              sm: 2,
              md: 3,
              lg: 4
            },
            offset: 0,
            order: 0
          }) {
            Row().width('100%').height('20vp')
          }.borderColor(this.bgColors[1]).borderWidth(2)

          GridCol({
            span: {
              xs: 1,
              sm: 2,
              md: 3,
              lg: 4
            },
            offset: 0,
            order: 0
          }) {
            Row().width('100%').height('20vp')
          }.borderColor(this.bgColors[2]).borderWidth(2)

          GridCol({
            span: {
              xs: 1,
              sm: 2,
              md: 3,
              lg: 4
            },
            offset: 0,
            order: 0
          }) {
            Row().width('100%').height('20vp')
          }.borderColor(this.bgColors[3]).borderWidth(2)

        }.width(this.widthArray[this.widthIndex])
        .onBreakpointChange(this.isDef ? (breakpoint: string) => {
          console.log('onBreakpointChange trigger')
          this.currentBp = breakpoint
        } : undefined)

      }.width('100%').margin(10).height(200)
      .border({ color: '#880606', width: 2 })

      Button('22、onBreakpointChange:' + this.isDef).onClick((e: ClickEvent) => {
        this.isDef = !this.isDef
      })
        .id('GridRow_onBreakpointChange')

      Button('02, changeWidth=' + this.widthArray[this.widthIndex] + ',index=' + this.widthIndex)
        .onClick((event: ClickEvent) => {
          if (this.widthIndex >= this.widthArray.length - 1) {
            this.widthIndex = 0;
          } else {
            this.widthIndex = this.widthIndex + 1;
          }
        })
        .id('ChangeBreakpoint')
    }
  }
}