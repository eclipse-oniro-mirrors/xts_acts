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
  Text,
  TextAttribute,
  Column,
  Component,
  Button,
  ButtonAttribute,
  ClickEvent,

  Image,
  ImageFit,
  Scroller,
  Scroll,
  ForEach,
  Search,
  SafeAreaType,
  ScrollDirection,
  BarState,
  Color,
  EdgeEffect,
  HorizontalAlign,
  FlexAlign,
  ColumnOptions,
  Row,
  Stack,
  Edge,
  Alignment,
  Grid,
  ScrollBar,
  Margin,
  GridItem,
  TextAlign,
  ScrollBarDirection,
  Visibility,
  ScrollAlign,
  List,
  ListItemGroup,
  ListItem
} from '@ohos.arkui.component'
import {
  State,
  AppStorage
} from '@ohos.arkui.stateManagement'
@Entry
@Component
struct List_scrollToIndex3 {
  private arr: Array<number> = new Array<number>(1, 2, 3, 4, 5, 6, 7, 8, 9);
  private arr2: Array<number> = [0];
  @State visibe: Visibility = Visibility.None;
  private scroller: Scroller = new Scroller();

  build() {
    Column({ space: 2 } as ColumnOptions) {
      Column({ space: 10 } as ColumnOptions) {
        Column() {
          Text('ScrollAlign.START')
          Row() {
            Button('scrollToIndex 0')
              .height('5%')
              .id('List_scrollToIndex3_START0')
              .fontSize(14)
              .onClick((e:ClickEvent) => {
                this.scroller.scrollToIndex(0, false, ScrollAlign.START)
              })
          }
        }

        Column() {
          Text('ScrollAlign.CENTER')
          Row() {
            Button('scrollToIndex 0')
              .height('5%')
              .id('List_scrollToIndex3_CENTER0')
              .fontSize(14)
              .onClick((e:ClickEvent) => {
                this.scroller.scrollToIndex(0, false, ScrollAlign.CENTER)
              })
          }
        }

        Column() {
          Text('ScrollAlign.END')
          Row() {
            Button('scrollToIndex 0')
              .height('5%')
              .id('List_scrollToIndex3_END0')
              .fontSize(14)
              .onClick((e:ClickEvent) => {
                this.scroller.scrollToIndex(0, false, ScrollAlign.END)
              })
          }
        }

        Column() {
          Text('ScrollAlign.AUTO')
          Row() {
            Button('scrollToIndex 0')
              .height('5%')
              .id('List_scrollToIndex3_AUTO0')
              .fontSize(14)
              .onClick((e:ClickEvent) => {
                this.scroller.scrollToIndex(0, false, ScrollAlign.AUTO)
              })
          }
        }

        Button('visibility=' + this.visibe)
          .id('List_scrollToIndex3_visibility')
          .height('5%')
          .onClick((e:ClickEvent) => {
            this.visibe = Visibility.Visible
          })

        Button('scrollBy(0,200)')
          .id('List_scrollToIndex3_scrollBy')
          .height('5%')
          .onClick((e:ClickEvent) => {
            this.scroller.scrollBy(0, 200)
          })
      }
      List({ space: 10, initialIndex: 0, scroller: this.scroller }) {
        ListItemGroup() {
          ForEach(this.arr2, (item: number) => {
            ListItem() {
              Text('ListItemGroup' + item)
                .width('90%')
                .height(40)
                .textAlign(TextAlign.Center)
                .borderRadius(10)
                .backgroundColor(Color.Orange)
            }
          }, (item: number) => item.toString())
        }.visibility(this.visibe)
        .id('List_scrollToIndex3_ListItemGroup')

        ForEach(this.arr, (item: number) => {
          ListItem() {
            Text('ListItem' + item)
              .width('90%')
              .height(40)
              .textAlign(TextAlign.Center)
              .borderRadius(10)
              .backgroundColor(0xFFFFFF)
          }.id('List_scrollToIndex3_ListItem' + item)
        }, (item: number) => item.toString())

      }
      .id('List_scrollToIndex3_List')
      .width('80%')
      .height(230)
      .backgroundColor(Color.Pink)
      .edgeEffect(EdgeEffect.None)
      .scrollBar(BarState.On)

    }.width('100%').height('100%').backgroundColor(0xDCDCDC)

  }
}