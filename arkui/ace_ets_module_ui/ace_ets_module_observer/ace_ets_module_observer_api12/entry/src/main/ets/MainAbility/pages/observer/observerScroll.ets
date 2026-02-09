/**
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
import observer from '@ohos.arkui.observer'

@Entry
@Component
struct scrollEvent1 {
  scroller: Scroller = new Scroller();
  options: observer.ObserverOptions = { id: "testId" };
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7]
  @State message1: string = ''
  @State message2: string = ''
  build() {
    Row() {
      Column({ space: 10 }) {
        Text('message1:' + this.message1).id('scrollEvent_1')
        Text('message2:' + this.message2).id('scrollEvent_2')
        Row() {
          Button('UIObserver on')
            .id('scrollEvent_3')
            .onClick(() => {
              observer.on('scrollEvent', (info) => {
                console.info('scrollEventInfo', JSON.stringify(info));
                if (observer.ScrollEventType.SCROLL_START == info.scrollEvent) {
                  this.message1 = 'SCROLL_START'
                }
                if (observer.ScrollEventType.SCROLL_STOP == info.scrollEvent) {
                  this.message2 = 'SCROLL_STOP'
                }
              });
            })
          Button('UIObserver off')
            .id('scrollEvent_5')
            .onClick(() => {
              observer.off('scrollEvent', (info) => {
                console.info('off scrollEvent', JSON.stringify(info));
              })
            })
        }
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
        .id('scrollEvent_4')
        .border({ width: 1, color: Color.Red })
        .height('80%')
      }
      .width('100%')

    }
    .height('100%')
  }
}