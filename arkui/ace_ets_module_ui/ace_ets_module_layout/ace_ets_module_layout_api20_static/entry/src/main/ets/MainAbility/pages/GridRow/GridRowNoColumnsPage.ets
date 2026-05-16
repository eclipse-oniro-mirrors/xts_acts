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
  Column,
  Component,
  Text,
  Color,
  ForEach,
  Row,
  Button,
  GridRow,
  GridRowDirection,
  ForEach,
  GridCol,
  BreakPoints,
  ClickEvent,
  GridRowOptions,
  BreakpointsReference
} from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct GridRowNoColumnsPage {
  @State bgColors: Color[] = [Color.Red, Color.Orange, Color.Yellow, Color.Green, Color.Pink, Color.Grey
    , Color.Blue, Color.Brown, Color.Green, Color.Pink, Color.Grey, Color.Blue, Color.Brown];
  @State currentBp: string = 'unknown'
  @State gridrow_width: number = 260

  build() {
    Column() {
      Text(this.currentBp).id('GridRow_No_Columns_001_currentBp')
      GridRow({
        breakpoints: {
          value: ['130vp', '160vp', '190vp', '220vp', '250vp'],
          reference: BreakpointsReference.ComponentSize
        } as BreakPoints,
        direction: GridRowDirection.Row
      } as GridRowOptions) {
        ForEach(this.bgColors, (color: Color, index?: int) => {
          GridCol({ span: 1 }) {
            Row().width("100%").height("20vp")
          }.borderColor(color).borderWidth(2).key('GridRow_No_Columns_' + index)
        })
      }
      .onBreakpointChange((breakpoint: string) => {
        this.currentBp = breakpoint
      })
      .width(this.gridrow_width)
      .height("50%")
      .key('GridRow_No_Columns_001')

      Row() {
        Button('to xxl').onClick((e: ClickEvent) => {
          this.gridrow_width = 260
        })
          .key('GridRow_No_Columns_001_Btn_1')

        Button('to xl').onClick((e: ClickEvent) => {
          this.gridrow_width = 230
        })
          .key('GridRow_No_Columns_001_Btn_2')

        Button('to lg').onClick((e: ClickEvent) => {
          this.gridrow_width = 200
        })
          .key('GridRow_No_Columns_001_Btn_3')
      }

      Row() {
        Button('to md').onClick((e: ClickEvent) => {
          this.gridrow_width = 170
        })
          .key('GridRow_No_Columns_001_Btn_4')

        Button('to sm').onClick((e: ClickEvent) => {
          this.gridrow_width = 140
        })
          .key('GridRow_No_Columns_001_Btn_5')

        Button('to xs').onClick((e: ClickEvent) => {
          this.gridrow_width = 110
        })
          .key('GridRow_No_Columns_001_Btn_6')
      }
    }.width('90%').height(200)
    .border({ color: '#880606', width: 2 })
  }
}