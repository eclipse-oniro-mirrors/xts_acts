'use static'
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
  Entry, Text, Column, Row, Component, Button, ClickEvent, List, ListItem,
  Scroller, Scroll, Stack, ScrollState, Edge, FlexAlign, ForEach, TextAlign,
  Alignment, Margin, Color, EdgeEffect, ScrollDirection, BarState, OffsetResult,
  ScrollSnapOptions, ScrollSnapAlign, OnScrollFrameBeginHandlerResult, NestedScrollOptions,
  NestedScrollMode
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct Scroll1 {
  scroller: Scroller = new Scroller();
  private arr: Array<number> = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
  @State isEdgeEffect: boolean = true;
  @State isEnablePaging: boolean = true;
  @State isScrollSnap: boolean = true;
  @State eventValue: string = 'value';
  @State isOnWillScroll: boolean = false;
  @State isOnDidScroll: boolean = false;
  @State isOnScrollFrameBegin: boolean = false;
  @State isOnScrollStop: boolean = false;
  @State isOnScrollStart: boolean = false;
  @State isOnScrollEdge: boolean = false;
  @State isNestedScroll: boolean = false;
  @State isEnableScrollInteraction: boolean = false;
  @State isFriction: boolean = false;
  @State isScrollable: boolean = false;
  @State isScrollBar: boolean = false;
  @State isScrollBarColor: boolean = false;
  @State isScrollBarWidth: boolean = false;

  build() {
    Column() {
      Column() {
        Text('Scroll')
          .height('30%')
        Scroll(this.scroller) {
          Column() {
            ForEach(this.arr, (item: number) => {
              Text('Item ' + item)
                .width('90%')
                .height(20)
                .backgroundColor(0xFFFFFF)
                .borderRadius(10)
                .fontSize(16)
                .textAlign(TextAlign.Center)
                .margin({ top: 10 } as Margin)
            })
          }
        }
        .id('scroll_action')
        .width('80%')
        .height('70%')
        .initialOffset(undefined)
        .enablePaging(this.isEnablePaging ? true : undefined)
        .edgeEffect(this.isEdgeEffect ? EdgeEffect.Spring : undefined)
        .scrollSnap(this.isScrollSnap ?
          {snapAlign:ScrollSnapAlign.CENTER,
            snapPagination:100,
            enableSnapToStart:false,
            enableSnapToEnd:false} as ScrollSnapOptions : undefined)
        .onWillScroll( this.isOnWillScroll ? (xOffset: number, yOffset: number): OffsetResult => {
          this.eventValue = 'onWillScrollValue';
          return { xOffset: xOffset, yOffset: yOffset};
        } : undefined)
        .onDidScroll(this.isOnDidScroll ? () => {
          this.eventValue = 'onDidScrollValue';
        } : undefined)
        .onScrollFrameBegin(this.isOnScrollFrameBegin ?
          (offset: number, state: ScrollState): OnScrollFrameBeginHandlerResult => {
            this.eventValue = 'onScrollFrameBeginValue';
            return { offsetRemain: offset };
          } : undefined)
        .onScrollStop(this.isOnScrollStop ? () => {
          this.eventValue = 'onScrollStopValue';
        } : undefined)
        .onScrollStart(this.isOnScrollStart ? () => {
          this.eventValue = 'onScrollStartValue';
        } : undefined)
        .onScrollEdge(this.isOnScrollEdge ? () => {
          this.eventValue = 'onScrollEdgeValue';
        } : undefined)
        .nestedScroll(this.isNestedScroll ? {
          scrollForward: NestedScrollMode.PARENT_FIRST,
          scrollBackward: NestedScrollMode.SELF_FIRST
        } as NestedScrollOptions : undefined)
        .enableScrollInteraction(this.isEnableScrollInteraction ? false : undefined)
        .friction(this.isFriction ? 100.0 : undefined)
        .scrollable(this.isScrollable ? ScrollDirection.None : undefined)
        .scrollBar(this.isScrollBar ? BarState.On : undefined)
        .scrollBarColor(this.isScrollBarColor ? '#FFFF0000' : undefined)
        .scrollBarWidth(this.isScrollBarWidth ? 10.0 : undefined)
      }
      .width('100%')
      .height('30%')

      Text(this.eventValue)
        .id('eventValue')

      Row() {
        Button('toTop').onClick((event: ClickEvent) => {
          this.scroller.fling(3000);
        }).margin(5).id('toTop')
        Button('toBottom').onClick((event: ClickEvent) => {
          this.scroller.fling(-3000);
        }).margin(5).id('toBottom')
        Button('resetValue').onClick((event: ClickEvent) => {
          this.eventValue = 'value';
        }).margin(5).id('resetValue')
      }

      Row() {
        Button('0' + this.isEdgeEffect).onClick((event: ClickEvent) => {
          this.isEdgeEffect = !this.isEdgeEffect;
        }).margin(5).id('edgeEffect_action')
        Button('2' + this.isEnablePaging).onClick((event: ClickEvent) => {
          this.isEnablePaging = !this.isEnablePaging;
        }).margin(5).id('enablePaging_action')
        Button('3' + this.isScrollSnap).onClick((event: ClickEvent) => {
          this.isScrollSnap = !this.isScrollSnap;
        }).margin(5).id('scrollSnap_action')
        Button('4' + this.isOnWillScroll).onClick((event: ClickEvent) => {
          this.isOnWillScroll = !this.isOnWillScroll;
        }).margin(5).id('onWillScroll_action')
      }

      Row() {
        Button('5' + this.isOnDidScroll).onClick((event: ClickEvent) => {
          this.isOnDidScroll = !this.isOnDidScroll;
        }).margin(5).id('onDidScroll_action')
        Button('6' + this.isOnScrollFrameBegin).onClick((event: ClickEvent) => {
          this.isOnScrollFrameBegin = !this.isOnScrollFrameBegin;
        }).margin(5).id('onScrollFrameBegin_action')
        Button('7' + this.isOnScrollStop).onClick((event: ClickEvent) => {
          this.isOnScrollStop = !this.isOnScrollStop;
        }).margin(5).id('onScrollStop_action')
        Button('8' + this.isOnScrollStart).onClick((event: ClickEvent) => {
          this.isOnScrollStart = !this.isOnScrollStart;
        }).margin(5).id('onScrollStart_action')
      }

      Row() {
        Button('9' + this.isOnScrollEdge).onClick((event: ClickEvent) => {
          this.isOnScrollEdge = !this.isOnScrollEdge;
        }).margin(5).id('onScrollEdge_action')
        Button('10' + this.isNestedScroll).onClick((event: ClickEvent) => {
          this.isNestedScroll = !this.isNestedScroll;
        }).margin(5).id('nestedScroll_action')
        Button('11' + this.isEnableScrollInteraction).onClick((event: ClickEvent) => {
          this.isEnableScrollInteraction = !this.isEnableScrollInteraction;
        }).margin(5).id('enableScrollInteraction_action')
        Button('12' + this.isFriction).onClick((event: ClickEvent) => {
          this.isFriction = !this.isFriction;
        }).margin(5).id('friction_action')
      }

      Row() {
        Button('13' + this.isScrollable).onClick((event: ClickEvent) => {
          this.isScrollable = !this.isScrollable;
        }).margin(5).id('scrollable_action')
        Button('14' + this.isScrollBar).onClick((event: ClickEvent) => {
          this.isScrollBar = !this.isScrollBar;
        }).margin(5).id('scrollBar_action')
        Button('15' + this.isScrollBarColor).onClick((event: ClickEvent) => {
          this.isScrollBarColor = !this.isScrollBarColor;
        }).margin(5).id('scrollBarColor_action')
        Button('16' + this.isScrollBarWidth).onClick((event: ClickEvent) => {
          this.isScrollBarWidth = !this.isScrollBarWidth;
        }).margin(5).id('scrollBarWidth_action')
      }
    }
    .width('100%')
    .height('100%')
  }
}