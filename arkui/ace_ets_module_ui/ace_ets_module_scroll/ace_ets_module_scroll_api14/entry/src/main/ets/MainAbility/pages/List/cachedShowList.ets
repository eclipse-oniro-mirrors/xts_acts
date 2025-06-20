/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
@Entry
@Component
struct cachedCountShowListExample {
  private arr: string[] = ['1', '2', '3', '4', '5', '6', '7', '8', '9']
  @State clip1: boolean = false
  @State show1: boolean | null | undefined = true

  onPageShow() {
    console.info('[List] page show called');
    let stateChangeEvent: events_emitter.InnerEvent = {
      eventId: 125,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangClipShow);
  }

  private stateChangClipShow = (eventData: events_emitter.EventData) => {
    console.info('[stateChangClipShow] stateChangeEvent');
    if (eventData != null) {
      console.info('[stateChangClipShow] state change called:' + JSON.stringify(eventData));
      if (eventData.data?.clip1 != null) {
        this.clip1 = eventData.data?.clip1;
      }
      this.show1 = eventData.data?.show1;
    }
  }

  build() {
    Column() {
      List({ initialIndex: 0 }) {
        ForEach(this.arr, (item: string) => {
          ListItem() {
            Text(item)
              .id('show_list_' + item)
              .width('100%')
              .height('34%')
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .borderRadius(10)
              .backgroundColor(0xFFFFFF)
          }
        }, (item: string) => item)
      }
      .id('cachedCount_show_list')
      .clip(this.clip1)
      .cachedCount(2, this.show1)
      .border({width:1})
      .width('90%')
      .height('40%')
      .friction(0.6)
      .padding('3%')
      .scrollBar(BarState.On)
      .edgeEffect(EdgeEffect.Spring) // 边缘效果设置为Spring
      .onScrollIndex((firstIndex: number, lastIndex: number, centerIndex: number) => {
        console.info('first' + firstIndex)
        console.info('last' + lastIndex)
        console.info('center' + centerIndex)
      })
      .onScrollVisibleContentChange((start: VisibleListContentInfo, end: VisibleListContentInfo) => {
        console.log(' start index: ' + start.index +
          ' start item group area: ' + start.itemGroupArea +
          ' start index in group: ' + start.itemIndexInGroup)
        console.log(' end index: ' + end.index +
          ' end item group area: ' + end.itemGroupArea +
          ' end index in group: ' + end.itemIndexInGroup)
      })
      .onDidScroll((scrollOffset: number, scrollState: ScrollState) => {
        console.info(`onScroll scrollState = ScrollState` + scrollState + `, scrollOffset = ` + scrollOffset)
      })
    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xDCDCDC)
    .padding({ top: 5 })
  }
}