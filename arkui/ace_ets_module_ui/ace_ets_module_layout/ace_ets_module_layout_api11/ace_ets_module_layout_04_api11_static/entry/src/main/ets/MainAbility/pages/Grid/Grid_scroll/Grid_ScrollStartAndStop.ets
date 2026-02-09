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

import { Entry, Component, Column, Curve, TextAlign, ForEach, ScrollBarDirection, GridItem, BarState, Scroller, ClickEvent, ScrollAnimationOptions, Edge, Alignment, Grid, ScrollBar, ColumnOptions, Button, Text, Stack, Margin } from '@ohos.arkui.component'
import { State,AppStorage } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct Grid_ScorllStartAndStop {
  @State Number01: String[] = ['0', '1', '2', '3', '4'] as string[];
  scroller: Scroller = new Scroller();
  @State text1: string = '';
  @State text2: string = '';

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Button('animation')
        .id('button_grid_scroller_animation')
        .height('5%')
        .onClick((e: ClickEvent) => {
          this.scroller.scrollTo({
            xOffset: 0,
            yOffset: 20,
            animation: {
              duration: 1000,
              curve: Curve.Linear
            } as ScrollAnimationOptions
          })
        })
      Button('no animation')
        .id('button_grid_scroller_noanimation')
        .height('5%')
        .onClick((e: ClickEvent) => {
          this.scroller.scrollTo({
            xOffset: 0,
            yOffset: 40,
          })
        })
      Button('scrollStartAndStop_Reset_bt')
        .id('scrollStartAndStop_Reset_bt')
        .height('5%')
        .onClick((e: ClickEvent) => { 
          this.text1 = ""
          this.text2 = ""
          this.scroller.scrollEdge(Edge.Top);
        })
      Text(this.text1).id('Grid_ScrollStartandStop_tex1')
      Text(this.text2).id('Grid_ScrollStartandStop_tex2')

      Stack({ alignContent: Alignment.BottomEnd }) {
        Grid(this.scroller) {
          ForEach(this.Number01, (day: string) => {
            ForEach(this.Number01, (day: string) => {
              GridItem() {
                Text(day)
                  .fontSize(16)
                  .backgroundColor(0xF9CF93)
                  .width('100%')
                  .height('25%')
                  .textAlign(TextAlign.Center)
              }
            }, (day: string) => day)
          }, (day: string) => day)
        }
        .margin({ right: 25 } as Margin)
        .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
        .columnsGap(10)
        .rowsGap(10)
        .width('80%')
        .backgroundColor(0xFAEEE0)
        .height(300)
        .scrollBar(BarState.Off)
        .onScrollStart(() => {
          this.text1 = 'onScrollStart'
        })
        .onScrollStop(() => {
          this.text2 = 'onScrollStop'
        })
        .id('Grid_ScrollStartandStop_grid')

        ScrollBar({ scroller: this.scroller, direction: ScrollBarDirection.Vertical, state: BarState.On }) {
          Text()
            .width(20)
            .height('60%')
            .borderRadius(10)
            .backgroundColor('#C0C0C0')
        }.width(20).backgroundColor('#ededed')
      }.height(300)
      .id('Grid_ScrollStartandStop_scrollBar')

    }.width('100%').margin({ top: 5 } as Margin)
  }
}