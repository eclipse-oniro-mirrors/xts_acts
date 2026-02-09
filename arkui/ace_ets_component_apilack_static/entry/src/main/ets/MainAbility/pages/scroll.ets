'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import events_emitter from '@ohos.events.emitter'
import Log from '../common/Log';
import {
  $rawfile,
  Alignment,
  BarState,
  ClickEvent,
  Color,
  Column,
  Component,
  Edge,
  EdgeEffect,
  Entry,
  Flex,
  FlexAlign,
  FlexDirection,
  FontWeight,
  ForEach,
  Image,
  ItemAlign,
  Margin,
  Path,
  Scroll,
  ScrollDirection,
  Scroller,
  ScrollState,
  SearchController,
  Text,
  TextAlign,
  TextOverflow
} from '@ohos.arkui.component';
import { State, StoragePropRef, AppStorage } from '@ohos.arkui.stateManagement';

const TAG = 'ets_apiLack_add';

@Entry
@Component
struct ScrollOnScrollBegin {
  @State edgeEffect: EdgeEffect = EdgeEffect.None;
  @StoragePropRef('alwaysEnabled') alwaysEnabled: boolean = false
  scroller: Scroller = new Scroller()
  private arr: Array<number> = new Array<number>(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)

  aboutToAppear() {
    Log.showInfo(TAG, `aboutToAppear ScrollOnScrollBegin start`)
  }

  aboutToDisappear() {
    Log.showInfo(TAG, `aboutToDisAppear ScrollOnScrollBegin end`)
  }

  onPageShow() {
    console.info('scroll page show called');
    AppStorage.setOrCreate('alwaysEnabled', false);
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {

      Text("scroll-OnScrollBegin")
        .width(100)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("onScrollBeginText")
      Scroll(this.scroller) {
        Column() {
          ForEach(this.arr, (item: number) => {
            Text(item.toString())
              .width('90%')
              .height(150)
              .backgroundColor(0xFFFFFF)
              .borderRadius(15)
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .margin({ top: 10 } as Margin)
          }, (item: number) => item!.toString())
        }.width('100%')
      }
      .scrollable(ScrollDirection.Vertical)
      .onScrollFrameBegin((offset: number, state: ScrollState) => {
        console.info('offset=' + offset)
        return { offsetRemain: offset }
      })
      .scrollBar(BarState.On)
      .scrollBarColor(Color.Gray)
      .scrollBarWidth(30)
      .edgeEffect(this.edgeEffect, { alwaysEnabled: this.alwaysEnabled })
      .onDidScroll((xOffset: number, yOffset: number) => {
        console.info(xOffset + ' ' + yOffset)
      })
      .onScrollEdge((side: Edge) => {
        console.info('To the edge')
      })
      .onScrollStop(() => {
        console.info('Scroll Stop')
      })
      .key("Scroll")
      .width("100%")
      .height("100%")
    }.width("100%").height("100%")
  }
}

