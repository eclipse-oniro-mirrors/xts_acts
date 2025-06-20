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

@Entry
@Component
struct scrollAxisVerticalIndex {
  scroller: Scroller = new Scroller();
  options: observer.ObserverOptions = { id: 'axisVertical' };
  private arr: number[] = [0, 1, 2, 3, 4, 5]
  @State Id1: string = '0'
  @State axis1: Axis | undefined = undefined

  build() {
    Column() {
      Column(){
        Text('id: ' + this.Id1).id('scroll_axisVertical_id')
        Text('axis: ' + this.axis1).id('scroll_axis_vertical')
        Row() {
          Button('observer on')
            .onClick(() => {
              observer.on('scrollEvent', (info) => {
                console.info('scrollEventInfo', JSON.stringify(info));
                console.info('scrollEventInfo axis', JSON.stringify(info.axis));
              });
            })
          Button('observer off')
            .onClick(() => {
              observer.off('scrollEvent');
            })
        }

        Row() {
          Button('observerWithId on')
            .id('axisVertical_on')
            .onClick(() => {
              observer.on('scrollEvent', this.options, (info: observer.ScrollEventInfo) => {
                this.Id1 = info.id
                this.axis1 = info.axis
                console.info('scrollEventInfo', JSON.stringify(info));
                console.info('scrollEventInfo axis', JSON.stringify(info.axis));
              });
            })
          Button('observerWithId off')
            .id('axisVertical_off')
            .onClick(() => {
              observer.off('scrollEvent', this.options);
            })
        }
      }.margin({top:5})

      Column() {
        Scroll(this.scroller) {
          Column() {
            ForEach(this.arr, (item: number) => {
              Text(item.toString())
                .width('100%')
                .height('20%')
                .backgroundColor(Color.Pink)
                .borderRadius(15)
                .fontSize(16)
                .textAlign(TextAlign.Center)
                .margin({ top: 10 })
            }, (item: string) => item)
          }.width('90%')
        }
        .id('axisVertical')
        .height('60%')
        .scrollable(ScrollDirection.Vertical)
      }
      .width('100%')

    }
    .height('100%')
  }
}