'use static';
/**
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
import events_emitter from '@ohos.events.emitter';
import {
  Entry,
  Component,
  Column,
  ScrollDirection,
  BarState,
  Stack,
  Edge,
  ClickEvent,
  Scroller,
  Alignment,
  Scroll,
  Button,
  ForEach,
  Margin,
  Text,
  TextAlign,
  ScrollSource,
  ScrollState
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';
import { RecordData } from '@ohos.base';

@Entry
@Component
struct scrollCode {
  @State scrollable: ScrollDirection = ScrollDirection.Vertical;
  @State scrollBar: BarState = BarState.On;
  @State scrollBarColor: string = "#FF0000FF";
  @State scrollBarWidth: number = 30;
  scroller: Scroller = new Scroller()
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9] as number[]
  private stateChangCallBack: (eventData: events_emitter.EventData) => void = (eventData: events_emitter.EventData) => {
    if (eventData != null && eventData.data != null) {
      const data = eventData.data as Record<String,RecordData>
      console.info("scrollCode page state change called:" + JSON.stringify(eventData));
      let scrollableValue = data['scrollable'];
      console.info("scrollableValue:" + scrollableValue);
      if (scrollableValue != null) {
        if (scrollableValue == "Vertical") {
          this.scrollable = ScrollDirection.Vertical;
        } else if (scrollableValue == "Horizontal") {
          this.scrollable = ScrollDirection.Horizontal;
        } else {
          this.scrollable = ScrollDirection.None;
        }
        console.info("this.scrollable:" + this.scrollable);
      } else {
        console.info("scrollableValue is null or empty " + scrollableValue);
      }
      let scrollBarValue = data['scrollBar'];
      console.info("scrollBarValue:" + scrollBarValue);
      if (scrollBarValue != null) {
        if (scrollBarValue == "Off") {
          this.scrollBar = BarState.Off;
        } else if (scrollBarValue == "On") {
          this.scrollBar = BarState.On;
        } else {
          this.scrollBar = BarState.Auto;
        }
        console.info("this.scrollBar:" + this.scrollBar);
      } else {
        console.info("scrollBarValue is null or empty " + scrollBarValue);
      }
      let scrollBarColorValue = data['scrollBarColor'];
      console.info("scrollBarColorValue:" + scrollBarColorValue);
      if (scrollBarColorValue != null) {
        this.scrollBarColor = scrollBarColorValue as string;
        console.info("this.scrollBarColor:" + this.scrollBarColor);
      } else {
        console.info("scrollBarColorValue is null or empty " + scrollBarColorValue);
      }
      let scrollBarWidthValue = data['scrollBarWidth'];
      console.info("scrollBarWidthValue:" + scrollBarWidthValue);
      if (scrollBarWidthValue != null) {
        this.scrollBarWidth = scrollBarWidthValue as Int;
        console.info("this.scrollBarWidth:" + this.scrollBarWidth);
      } else {
        console.info("scrollBarWidthValue is null or empty " + scrollBarWidthValue);
      }
    } else {
      console.info("scrollCode page color not change called:" + JSON.stringify(eventData));
    }
  }

  onPageShow() {
    console.info('scrollCode page show called');
    let stateChangeEvent1: events_emitter.InnerEvent = {
      eventId: 185,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent1, this.stateChangCallBack);

    let stateChangeEvent2: events_emitter.InnerEvent = {
      eventId: 186,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent2, this.stateChangCallBack);

    let stateChangeEvent3: events_emitter.InnerEvent = {
      eventId: 187,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent3, this.stateChangCallBack);

    let stateChangeEvent4: events_emitter.InnerEvent = {
      eventId: 188,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent4, this.stateChangCallBack);
  }

  build() {
    Stack({ alignContent: Alignment.TopStart }) {
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
      .key("ScrollCode")
      .scrollable(this.scrollable)
      .scrollBar(this.scrollBar)
      .scrollBarColor(this.scrollBarColor)
      .scrollBarWidth(this.scrollBarWidth)
      .onWillScroll((xOffset: number, yOffset: number, scrollState: ScrollState, scrollSource: ScrollSource) => {
        console.info(xOffset + ' ' + yOffset)
      })
      .onScrollEdge((side: Edge): void => {
        console.info('To the edge')
      })
      .onScrollStop(() => {
        console.info('Scroll Stop')
      })

      Button('scroll 100')
        .onClick((e: ClickEvent) => {
          this.scroller.scrollTo({ xOffset: 0, yOffset: this.scroller.currentOffset()!.yOffset + 100 })
        }).margin({ top: 170, left: 20 } as Margin)
      Button('back top')
        .onClick((e: ClickEvent) => {
          this.scroller.scrollEdge(Edge.Top)
        })
        .margin({ top: 120, left: 20 } as Margin)
      Button('next page')
        .backgroundColor(0x2788D9)
        .fontSize(20)
        .onClick((event: ClickEvent) => {
          try {
            let backData: events_emitter.EventData = {
              data: {
                "scrollToIndex": 10,
              } as Record<String,RecordData>
            }
            let backEvent: events_emitter.InnerEvent = {
              eventId: 189,
              priority: events_emitter.EventPriority.LOW
            }
            console.info("click to emit action state")
            events_emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("click action state err: " + JSON.stringify((err as Error)?.message))
          }
          this.scroller.scrollPage({ next: true })
        })
        .key('button')
        .margin({ top: 10, left: 20 } as Margin)
    }.width('100%')
    .height('100%')
    .backgroundColor(0xDCDCDC)
  }
}