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
import { GridCol, ForEach, GridRowDirection, BreakpointsReference, GridRow,  Color, Stack, Row, Alignment,
  VerticalAlign,  HorizontalAlign, RelativeContainer, Entry, Text, Column,  Component, Button,
  ClickEvent } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Entry
@Component
struct GridColExample {
  @State bgColors: Color[] =
    [Color.Red, Color.Orange, Color.Yellow, Color.Green, Color.Pink, Color.Grey, Color.Blue, Color.Brown]
  @State currentBp: string = 'unknown'

  @State isSpan: boolean = true;
  @State isOrder: boolean = true;
  @State isOffset: boolean = true;

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
            offset: 0,
          }) {
            Row(){Text('undefined')}.width('100%').height('20vp')
          }.borderColor(this.bgColors[0]).borderWidth(2)
          .span(this.isSpan ? 3 : undefined)
          .id('MyGridCol1')

          GridCol({
            offset: 0,
          }) {
            Row(){Text('no set')}.width('100%').height('20vp')
          }.borderColor(this.bgColors[0]).borderWidth(2)


          GridCol({
            offset: 0,
          }) {
            Row(){Text('no set')}.width('100%').height('20vp')
          }.borderColor(this.bgColors[0]).borderWidth(2)

          GridCol({
            span: 2,
            offset: 0,
          }) {
            Row().width('100%').height('20vp')
          }.borderColor(this.bgColors[1]).borderWidth(2)

          GridCol({
            span: 3,
            offset: 0,
          }) {
            Row().width('100%').height('20vp')
          }.borderColor(this.bgColors[2]).borderWidth(2)

          GridCol({
            span: 4,
            offset: 0,
          }) {
            Row().width('100%').height('20vp')
          }.borderColor(this.bgColors[3]).borderWidth(2)

        }.width('100%').height('100%')
        .onBreakpointChange((breakpoint) => {
          this.currentBp = breakpoint
        })
      }.width('80%').margin(10).height(200)
      .border({ color: '#880606', width: 2 })
      Column() {
        Button('isSpan = ' + this.isSpan)
          .onClick(() => {
            this.isSpan = !this.isSpan;
          })
          .height(30)
          .id('GridCol_Span')
      }

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
            span: { xs: 1, sm: 2, md: 3, lg: 4 },
            offset: 0,
          }) {
            Row().width('100%').height('20vp')
          }.borderColor(this.bgColors[0]).borderWidth(2)
          .order(this.isOrder ? 4 : undefined)
          .gridColOffset(this.isOffset ? 4 : undefined)
          .id('MyGridCol2')

          GridCol({
            span: { xs: 1, sm: 2, md: 3, lg: 4 },
            offset: 0,
          }) {
            Row(){Text('undefined')}.width('100%').height('20vp')
          }.borderColor(this.bgColors[0]).borderWidth(2)
          .order(undefined)
          .gridColOffset(undefined)

          GridCol({
            span: { xs: 1, sm: 2, md: 3, lg: 4 },
            offset: 0,
          }) {
            Row(){Text('no set')}.width('100%').height('20vp')
          }.borderColor(this.bgColors[1]).borderWidth(2)

          GridCol({
            span: { xs: 1, sm: 2, md: 3, lg: 4 },
            offset: 0,
            order: 3
          }) {
            Row().width('100%').height('20vp')
          }.borderColor(this.bgColors[2]).borderWidth(2)

          GridCol({
            span: { xs: 1, sm: 2, md: 3, lg: 4 },
            offset: 0,
            order: 5
          }) {
            Row().width('100%').height('20vp')
          }.borderColor(this.bgColors[3]).borderWidth(2)

          GridCol({
            span: { xs: 1, sm: 2, md: 3, lg: 4 },
            offset: 0,
            order: 7
          }) {
            Row().width('100%').height('20vp')
          }.borderColor(this.bgColors[4]).borderWidth(2)
        }.width('100%').height('100%')
        .onBreakpointChange((breakpoint) => {
          this.currentBp = breakpoint
        })
      }.width('80%').margin(10).height(200)
      .border({ color: '#880606', width: 2 })
      Column() {
        Button('isOrder = ' + this.isOrder)
          .onClick(() => {
            this.isOrder = !this.isOrder;
          })
          .height(30)
          .id('GridCol_Order')
      }
      Column() {
        Button('isGridColOffset = ' + this.isOffset)
          .onClick(() => {
            this.isOffset = !this.isOffset;
          })
          .height(30)
          .id('GridCol_Offset')
      }
    }
  }
}