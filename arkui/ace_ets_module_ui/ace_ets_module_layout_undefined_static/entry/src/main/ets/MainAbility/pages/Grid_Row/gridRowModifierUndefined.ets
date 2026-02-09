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

import {  ItemAlign,  GridCol,  ForEach,  GridRowDirection,  BreakpointsReference,
  GridRow,  Color,  Stack,  Row,  Alignment,  VerticalAlign,
  HorizontalAlign,  RelativeContainer,  Entry,  Text,  Column,
  Component,  Button,  ClickEvent,  AttributeModifier,  GridRowAttribute } from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

@Observed
export class MyModifier1 implements AttributeModifier<GridRowAttribute> {
  public isAlignItems: boolean = true;

  applyNormalAttribute(instance: GridRowAttribute): void {
    instance
      .alignItems(this.isAlignItems ? ItemAlign.End : undefined)
  }
}

@Observed
export class MyModifier2 implements AttributeModifier<GridRowAttribute> {
  public currentBp: string = 'unknown';
  public isDef: boolean =  true;

  applyNormalAttribute(instance: GridRowAttribute): void {
    instance
      .onBreakpointChange(this.isDef ? (breakpoint: string) => {
        console.log('onBreakpointChange trigger')
        this.currentBp = breakpoint
      } : undefined)
  }
}

@Entry
@Component
struct GridColExample {
  @State bgColors: Color[] = [Color.Red, Color.Orange, Color.Yellow, Color.Green, Color.Pink,
   Color.Grey, Color.Blue, Color.Brown]
  @State myModifier1: MyModifier1 = new MyModifier1();
  @State myModifier2: MyModifier2 = new MyModifier2();
  @State widthArray: string[] = ['100vp', '300vp', '500vp', '650vp'];
  @State widthIndex: int = 0

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
        .id('MyGridRowModifier1')
        .onBreakpointChange((breakpoint) => {
          this.myModifier2.currentBp = breakpoint
        })
        .attributeModifier(this.myModifier1)
      }.width('80%').margin(10).height(200)
      .border({ color: '#880606', width: 2 })
      Column() {
        Button('isAlignItems = ' + this.myModifier1.isAlignItems)
          .onClick(() => {
            this.myModifier1.isAlignItems = !this.myModifier1.isAlignItems;
          })
          .height(30)
          .id('GridRowModifier_AlignItems')
      }

      Column() {
        Text(this.myModifier2.currentBp).fontSize(30).id('GridRowModifier_Text');
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
        .attributeModifier(this.myModifier2)

      }.width('100%').margin(10).height(200)
      .border({ color: '#880606', width: 2 })

      Button('22、onBreakpointChange:' + this.myModifier2.isDef).onClick((e: ClickEvent) => {
        this.myModifier2.isDef = !this.myModifier2.isDef
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