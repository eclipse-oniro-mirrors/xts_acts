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
import { UIObserver } from '@kit.ArkUI'

@Entry
@Component
struct scrollEventUIIndex {
  scroller: Scroller = new Scroller()
  observer: UIObserver = new UIObserver()
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7]
  @State message1: string = 'id'
  @State message2: string = 'start'

  build() {
    Column() {
      Column() {
        Text('message1:' + this.message1).id('scrollEvent_ui1')
        Text('message2:' + this.message2).id('scrollEvent_ui2')
        Row() {
          Button('UIObserver on')
            .id('scrollEvent_off_ui')
            .onClick(() => {
              this.observer.on('scrollEvent', (info) => {
                console.info('scrollEventInfo', JSON.stringify(info));
                console.info('scrollEvent id', JSON.stringify(info.id));
                console.info('scrollEvent uniqueId', JSON.stringify(info.uniqueId));
                console.info('scrollEvent offset', JSON.stringify(info.offset));
                console.info('scrollEvent scrollEvent', JSON.stringify(info.scrollEvent));
              });
            })
          Button('UIObserver off')
            .id('scrollEvent_off_on')
            .onClick(() => {
              this.observer.off('scrollEvent');
            })
        }

        Row() {
          Button('UIObserverWithId on')
            .id('scrollEvent_uiId_on')
            .onClick(() => {
              this.observer.on('scrollEvent', { id:'testId_uiScroll' }, (info) => {
                console.info('scrollEventInfo options', JSON.stringify(info));
                console.info('scrollEvent options id', JSON.stringify(info.id));
                console.info('scrollEvent options uniqueId', JSON.stringify(info.uniqueId));
                console.info('scrollEvent options offset', JSON.stringify(info.offset));
                console.info('scrollEvent options scrollEvent', JSON.stringify(info.scrollEvent));
                this.message1 = info.id
                if (info.scrollEvent !== 0) {
                  this.message2 = 'scrollEvent'
                }
              });
            })
          Button('UIObserverWithId off')
            .id('scrollEvent_uiId_off')
            .onClick(() => {
              this.observer.off('scrollEvent', { id:'testId_uiScroll' });
            })
        }
        Scroll(this.scroller) {
          Column() {
            ForEach(this.arr, (item: number) => {
              Text(item.toString())
                .width('90%')
                .height('20%')
                .backgroundColor(0xFFFFFF)
                .borderRadius(15)
                .fontSize(16)
                .textAlign(TextAlign.Center)
                .margin({ top: 10 })
            }, (item: string) => item)
          }.width('100%')
        }
        .id('testId_uiScroll')
        .width('90%')
        .height('60%')
        .border({ width: 1, color: Color.Red })
      }
      .width('100%')
    }
    .height('100%')
  }
}
