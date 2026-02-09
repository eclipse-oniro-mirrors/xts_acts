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
  Component,
  Column,
  Flex,
  Row,
  Text,
  Color,
  ListScroller,
  Builder,
  Margin,
  List,
  VisibleListContentInfo,
  ScrollState,
  Button,
  ClickEvent,
  Scroller,
  Grid,
  Refresh,
  ForEach,
  EdgeEffect,
  GridItem,
  TextAlign,
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct ListRebound {
  @State Number1: String[] = ['0', '1', '2', '3']
  scroller: Scroller = new Scroller()
  @State isRefreshing: boolean = false

  @Builder
  customBuilder() {
    Column() {
      Text(`Refresh_Text`)
        .backgroundColor(Color.Red)
        .width(60)
        .height(60)
    }
  }

  build() {
    Column() {
      Grid(this.scroller) {
        ForEach(this.Number1, (day1: string) => {
          ForEach(this.Number1, (day2: string) => {
            GridItem() {
              Text(day1 + day2)
                .fontSize(16)
                .backgroundColor(0xF9CF93)
                .width('100%')
                .height(80)
                .textAlign(TextAlign.Center)
            }
            .width(80)
            .height(80)
            .border({ width: 5, color: Color.White })
          }, (day2: string) => day2)
        }, (day1: string) => day1)
      }
      .edgeEffect(EdgeEffect.Spring)
      .columnsTemplate('1fr 1fr 1fr 1fr')
      .backgroundColor(0xd2cab3)
      .width("100%")
      .height(300)
      .multiSelectable(true)
      .margin({ top: 10, bottom: 30 } as Margin)
      .key('MyGrid1')

      Column() {
        Refresh({
          refreshing: this.isRefreshing,
          builder: this.customBuilder
        }) {
          Grid(this.scroller) {
            ForEach(this.Number1, (day1: string, index: int) => {
              ForEach(this.Number1, (day2: string, index: int) => {
                GridItem() {
                  Text(day1 + day2)
                    .fontSize(16)
                    .backgroundColor(0xF9CF93)
                    .width('100%')
                    .height(80)
                    .textAlign(TextAlign.Center)
                }
                .width(80)
                .height(80)
                .border({ width: 5, color: Color.White })
              }, (day2: string) => day2)
            }, (day1: string) => day1)
          }
          .edgeEffect(EdgeEffect.Fade)
          .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
          .backgroundColor(0xd2cab3)
          .width("100%")
          .height(300)
          .multiSelectable(true)
          .margin({ top: 10, bottom: 30 } as Margin)
          .key('MyGrid2')
        }
        .pullDownRatio(1)
      }

      Column() {
        Refresh({
          refreshing: this.isRefreshing,
          builder: this.customBuilder
        }) {
          Grid(this.scroller) {
            ForEach(this.Number1, (day1: string, index: int) => {
              ForEach(this.Number1, (day2: string, index: int) => {
                GridItem() {
                  Text(day1 + day2)
                    .fontSize(16)
                    .backgroundColor(0xF9CF93)
                    .width('100%')
                    .height(80)
                    .textAlign(TextAlign.Center)
                }
                .width(80)
                .height(80)
                .border({ width: 5, color: Color.White })
              }, (day2: string) => day2)
            }, (day1: string) => day1)
          }
          .edgeEffect(EdgeEffect.None)
          .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
          .backgroundColor(0xd2cab3)
          .width("100%")
          .height(300)
          .multiSelectable(true)
          .margin({ top: 10, bottom: 30 } as Margin)
          .key('MyGrid3')
        }
        .pullDownRatio(1)
      }
    }
  }
}

