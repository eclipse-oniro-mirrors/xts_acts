'use static';
/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
  EdgeEffect,
  Scroller,
  ScrollState,
  Edge,
  Flex,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  Text,
  Scroll,
  Alignment,
  TextAlign,
  TextOverflow,
  ForEach,
  ScrollDirection,
  OnScrollFrameBeginHandlerResult,
  Margin,
  BarState,
  Color,
  ScrollSource
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

import events_emitter from '@ohos.events.emitter'
import Log from '../../common/Log';
import { RecordData } from '@ohos.base';

const TAG = 'ets_apiLack_add';

@Entry
@Component
struct ScrollOnScrollBegin {
  @State edgeEffect: EdgeEffect = EdgeEffect.None;
  @State alwaysEnabled: boolean = false
  scroller: Scroller = new Scroller()
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9] as number[]

  aboutToAppear() {
    Log.showInfo(TAG, `aboutToAppear ScrollOnScrollBegin start`)
  }

  aboutToDisappear() {
    Log.showInfo(TAG, `aboutToDisAppear ScrollOnScrollBegin end`)
  }

  private stateChangCallBack: (eventData: events_emitter.EventData) => void = (eventData: events_emitter.EventData) => {
    console.info("scroll page state change called:" + JSON.stringify(eventData));
    if (eventData != null && eventData.data != null) {
      const data = eventData.data as Record<String,RecordData>
      if (data['alwaysEnabled'] != null) {
        this.alwaysEnabled = data['alwaysEnabled'] as boolean;
      }
    }
  }

  onPageShow() {
    console.info('scroll page show called');
    let stateChangeEvent: events_emitter.InnerEvent = {
      eventId: 323,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack);
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
          ForEach(this.arr, (item: number, index: int) => {
            Text(item.toString())
              .width('90%')
              .height(150)
              .backgroundColor(0xFFFFFF)
              .borderRadius(15)
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .margin({ top: 10 } as Margin)
          }, (item: number, index: int) => String(item))
        }.width('100%')
      }
      .scrollable(ScrollDirection.Vertical)
      .onScrollFrameBegin((offset: number, state: ScrollState): OnScrollFrameBeginHandlerResult => {
        console.info('offset=' + offset)
        return { offsetRemain: offset } as OnScrollFrameBeginHandlerResult
      })
      .scrollBar(BarState.On)
      .scrollBarColor(Color.Gray)
      .scrollBarWidth(30)
      .edgeEffect(this.edgeEffect, { alwaysEnabled: this.alwaysEnabled })
      .onWillScroll((xOffset: number, yOffset: number, scrollState: ScrollState, scrollSource: ScrollSource) => {
        console.info(xOffset + ' ' + yOffset)
      })
      .onScrollEdge((side: Edge): void => {
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

