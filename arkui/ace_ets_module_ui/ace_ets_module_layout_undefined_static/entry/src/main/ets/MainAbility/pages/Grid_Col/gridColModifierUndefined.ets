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

import {  GridCol,  ForEach,  GridRowDirection,  BreakpointsReference,  GridRow,
  Color,  Stack,  Row,  Alignment,  VerticalAlign,
  HorizontalAlign,  RelativeContainer,  Entry,  Text,  Column,
  Component,  Button,  ClickEvent,  AttributeModifier,  GridColAttribute } from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

@Observed
export class MyModifier1 implements AttributeModifier<GridColAttribute> {
  public isSpan: boolean = true;
  applyNormalAttribute(instance: GridColAttribute): void {
    instance
      .span(this.isSpan ? 3 : undefined)
  }
}

@Observed
export class MyModifier2 implements AttributeModifier<GridColAttribute> {
  public isOrder: boolean = true;
  public isOffset: boolean = true;
  applyNormalAttribute(instance: GridColAttribute): void {
    instance
      .order(this.isOrder ? 4 : undefined);
    instance
      .gridColOffset(this.isOffset ? 4 : undefined)
  }
}

@Entry
@Component
struct GridColExample {
  @State bgColors: Color[] =
    [Color.Red, Color.Orange, Color.Yellow, Color.Green, Color.Pink, Color.Grey, Color.Blue, Color.Brown]
  @State currentBp: string = 'unknown'
  @State myModifier1: MyModifier1 = new MyModifier1();
  @State myModifier2: MyModifier2 = new MyModifier2();

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
          .attributeModifier(this.myModifier1)
          .id('MyGridColModifier1')

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
        Button('isSpan = ' + this.myModifier1.isSpan)
          .onClick(() => {
            this.myModifier1.isSpan = !this.myModifier1.isSpan;
          })
          .height(30)
          .id('GridColModifier_Span')
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
          .attributeModifier(this.myModifier2)
          .id('MyGridColModifier2')

          GridCol({
            span: { xs: 1, sm: 2, md: 3, lg: 4 },
            offset: 0,
          }) {
            Row(){Text('undefined')}.width('100%').height('20vp')
          }.borderColor(this.bgColors[6]).borderWidth(2)
          .order(undefined)

          GridCol({
            span: { xs: 1, sm: 2, md: 3, lg: 4 },
            offset: 0,
          }) {
            Row(){Text('no set')}.width('100%').height('20vp')
          }.borderColor(this.bgColors[5]).borderWidth(2)

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
          }.borderColor(this.bgColors[2]).borderWidth(2)

          GridCol({
            span: { xs: 1, sm: 2, md: 3, lg: 4 },
            offset: 0,
            order: 7
          }) {
            Row().width('100%').height('20vp')
          }.borderColor(this.bgColors[2]).borderWidth(2)
        }.width('100%').height('100%')
        .onBreakpointChange((breakpoint) => {
          this.currentBp = breakpoint
        })
      }.width('80%').margin(10).height(200)
      .border({ color: '#880606', width: 2 })
      Column() {
        Button('isOrder = ' + this.myModifier2.isOrder)
          .onClick(() => {
            this.myModifier2.isOrder = !this.myModifier2.isOrder;
          })
          .height(30)
          .id('GridCol_Order')
      }
      Column() {
        Button('isGridColOffset = ' + this.myModifier2.isOffset)
          .onClick(() => {
            this.myModifier2.isOffset = !this.myModifier2.isOffset;
          })
          .height(30)
          .id('GridCol_Offset')
      }
    }
  }
}