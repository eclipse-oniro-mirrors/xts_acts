'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import observer from '@ohos.arkui.observer';
import { Entry, Component, Column, Text, Row, Image, Color, TextAlign, Padding, Button, ClickEvent, ColumnOptions, Scroller, Margin, ForEach, Scroll} from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement'
@Entry
@Component
struct scrollEventScrollIndex {
  scroller: Scroller = new Scroller();
  options: observer.ObserverOptions = { id: 'testScroll' } as observer.ObserverOptions;
  private arr: Array<number> = new Array<number>(0, 1, 2, 3, 4, 5)
  @State Id1: string = '0'
  @State uniqueId1: number = 0
  @State text1:number = 0
  @State offset1: number = 0

  build() {
    Column() {
      Column(){
        Text('id: ' + this.Id1).id('scroll_observer_id')
        Text('uniqueId: ' + this.uniqueId1).id('scroll_observer_uniqueId')
        Text('scrollEvent: ' + this.text1).id('scroll_observer_scrollEvent')
        Text('offset: ' + this.offset1).id('scroll_observer_offset')
        Row() {
          Button('ObserverId on')
            .id('scroll_observer_on')
            .onClick((e: ClickEvent) => {
              console.log('+++++++++++++++++++++1')
              let observer = this.getUIContext().getUIObserver();
              console.log('+++++++++++++++++++++2')
              observer.onScrollEvent(this.options, (info: observer.ScrollEventInfo) => {
                  this.Id1 = info.id
                  this.uniqueId1 = info.uniqueId
                  this.text1 = info.scrollEvent
                  this.offset1 = info.offset
                  console.info('scrollEventInfo', JSON.stringify(info));
                  console.info('scrollEventInfo id', JSON.stringify(info.id));
                  console.info('scrollEventInfo uniqueId', JSON.stringify(info.uniqueId));
                  console.info('scrollEventInfo scrollEvent', JSON.stringify(info.scrollEvent));
                  console.info('scrollEventInfo offset', JSON.stringify(info.offset));
                })
              console.log('+++++++++++++++++++++3')
            })
          Button('ObserverId off')
            .id('scroll_observer_off')
            .onClick((e: ClickEvent) => {
              let observer = this.getUIContext().getUIObserver();
              observer.offScrollEvent( this.options);
            })
        }
      }.margin({top:5} as Margin)

      Column() {
        Scroll(this.scroller) {
          Column() {
            ForEach(this.arr, (item: number) => {
              Text(item.toString())
                .width('90%')
                .height(150)
                .backgroundColor(Color.Pink)
                .borderRadius(15)
                .fontSize(16)
                .textAlign(TextAlign.Center)
                .margin({ top: 10 } as Margin)
            })
          }.width('100%')
        }
        .id('testScroll')
        .height('60%')
      }
      .width('100%')

    }
    .height('100%')
  }
}