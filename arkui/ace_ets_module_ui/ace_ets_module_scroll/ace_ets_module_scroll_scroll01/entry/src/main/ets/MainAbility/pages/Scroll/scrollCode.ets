/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import events_emitter from '@ohos.events.emitter';

@Entry
@Component
struct scrollCode {
  @State scrollable: ScrollDirection = ScrollDirection.Vertical;
  @State scrollBar: BarState = BarState.On;
  @State scrollBarColor: string = '#FF0000FF';
  @State scrollBarWidth: number = 30;
  scroller: Scroller = new Scroller()
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
  private stateChangCallBack = (eventData: events_emitter.EventData) => {
    if (eventData != null) {
      console.info('scrollCode page state change called:' + JSON.stringify(eventData));
      let scrollableValue: string = eventData.data?.scrollable;
      console.info('scrollableValue:' + scrollableValue);
      if (scrollableValue != null && scrollableValue.length != 0) {
        this.scrollable = ScrollDirection[scrollableValue];
        console.info('this.scrollable:' + this.scrollable);
      } else {
        console.info('scrollableValue is null or empty ' + scrollableValue);
      }
      let scrollBarValue: string = eventData.data?.scrollBar;
      console.info('scrollBarValue:' + scrollBarValue);
      if (scrollBarValue != null && scrollBarValue.length != 0) {
        this.scrollBar = BarState[scrollBarValue];
        console.info('this.scrollBar:' + this.scrollBar);
      } else {
        console.info('scrollBarValue is null or empty ' + scrollBarValue);
      }
      let scrollBarColorValue: string = eventData.data?.scrollBarColor;
      console.info('scrollBarColorValue:' + scrollBarColorValue);
      if (scrollBarColorValue != null && scrollBarColorValue.length != 0) {
        this.scrollBarColor = scrollBarColorValue;
        console.info('this.scrollBarColor:' + this.scrollBarColor);
      } else {
        console.info('scrollBarColorValue is null or empty ' + scrollBarColorValue);
      }
      let scrollBarWidthValue: string = eventData.data?.scrollBarWidth;
      console.info('scrollBarWidthValue:' + scrollBarWidthValue);
      if (scrollBarWidthValue != null && scrollBarWidthValue.length != 0) {
        this.scrollBarWidth = parseInt(scrollBarWidthValue);
        console.info('this.scrollBarWidth:' + this.scrollBarWidth);
      } else {
        console.info('scrollBarWidthValue is null or empty ' + scrollBarWidthValue);
      }
    } else {
      console.info('scrollCode page color not change called:' + JSON.stringify(eventData));
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
          ForEach(this.arr, (item: number) => {
            Text(item.toString())
              .width('90%')
              .height(150)
              .backgroundColor(0xFFFFFF)
              .borderRadius(15)
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .margin({ top: 10 })
          }, (item: string) => item)
        }.width('100%')
      }
      .key('ScrollCode')
      .scrollable(this.scrollable)
      .scrollBar(this.scrollBar)
      .scrollBarColor(this.scrollBarColor)
      .scrollBarWidth(this.scrollBarWidth)
      .onScroll((xOffset: number, yOffset: number) => {
        console.info(xOffset + ' ' + yOffset)
      })
      .onScrollEdge((side: Edge) => {
        console.info('To the edge')
      })
      .onScrollEnd(() => {
        console.info('Scroll Stop')
      })

      Button('scroll 100')
        .onClick(() => {
          this.scroller.scrollTo({ xOffset: 0, yOffset: this.scroller.currentOffset().yOffset + 100 })
        }).margin({ top: 170, left: 20 })
      Button('back top')
        .onClick(() => {
          this.scroller.scrollEdge(Edge.Top)
        })
        .margin({ top: 120, left: 20 })
      Button('next page')
        .backgroundColor(0x2788D9)
        .fontSize(20)
        .onClick((event: ClickEvent) => {
          try {
            let backData: events_emitter.EventData = {
              data: {
                'scrollToIndex': 10,
              }
            }
            let backEvent: events_emitter.InnerEvent = {
              eventId: 189,
              priority: events_emitter.EventPriority.LOW
            }
            console.info('click to emit action state')
            events_emitter.emit(backEvent, backData)
          } catch (err) {
            console.info('click action state err: ' + JSON.stringify((err as Error)?.message))
          }
          this.scroller.scrollPage({ next: true })
        })
        .key('button_scrollIn')
        .margin({ top: 10, left: 20 })
    }.width('100%')
    .height('100%')
    .backgroundColor(0xDCDCDC)
  }
}