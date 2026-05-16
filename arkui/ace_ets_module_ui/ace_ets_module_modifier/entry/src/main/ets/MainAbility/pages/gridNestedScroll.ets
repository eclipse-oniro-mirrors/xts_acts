/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import Utils from '../../test/Utils';
import { GridModifier } from "@ohos.arkui.modifier";
import { BusinessError } from '@ohos.base';

class CustomModifier extends GridModifier {
  applyNormalAttribute(instance: GridAttribute): void {
    super.applyNormalAttribute?.(instance);
  }
}

@Entry
@Component
struct GridNestedScroll {
  scroller: Scroller = new Scroller()
  private numbers: String[] = ['0', '1', '2', '3', '4', '5', '7', '8']
  @State customModifier: GridModifier = new CustomModifier()
    .nestedScroll({
      scrollForward: NestedScrollMode.PARALLEL,
      scrollBackward: NestedScrollMode.PARALLEL,
    })
  @State selfScrollTime: number = 0
  @State parentScrollTime: number = 0

  @Styles
  listCard() {
    .backgroundColor(Color.White)
    .height(72)
    .width("100%")
    .borderRadius(12)
  }
  build() {
    Column() {
      Button("NestedScrollOptionsScroll click")
        .key('gridNestedScrollOptionsScrollTestButton')
        .onClick(async () => {
          console.info("Grid NestedScrollOptionsScroll  onClick start ");
          try {
            try {
              let backData: events_emitter.EventData = {
                data: {
                  "ACTION": this.parentScrollTime > 0 && this.selfScrollTime > 0,
                  "parentScrollTime": this.parentScrollTime,
                  "selfScrollTime": this.selfScrollTime
                }
              }
              let backEvent: events_emitter.InnerEvent = {
                eventId: 77001,
                priority: events_emitter.EventPriority.LOW
              }
              console.info("Grid NestedScrollOptionsScroll start to emit action state");
              events_emitter.emit(backEvent, backData);
            } catch (err) {
              console.info("Grid NestedScrollOptionsScroll emit action state err: " + JSON.stringify(err));
            }
          } catch (error) {
            console.error(`Grid NestedScrollOptionsScroll ErrorCode: ${(error as BusinessError)?.code},  Message: ${(error as Error)?.message}`);
          }
          console.info("Grid NestedScrollOptionsScroll  onClick end ");
        })

      Scroll(this.scroller) {
        Column() {
          Column().width('100%').height('20%').backgroundColor(Color.Green)

          Grid(this.scroller) {
            ForEach(this.numbers, (day: string) => {
              ForEach(this.numbers, (day: string) => {
                GridItem() {
                  Text(day)
                    .fontSize(16)
                    .backgroundColor(0xF9CF93)
                    .width('100%')
                    .height(80)
                    .textAlign(TextAlign.Center)
                }
              }, (day: string) => day)
            }, (day: string) => day)
          }
          .columnsTemplate('1fr 1fr 1fr 1fr')
          .attributeModifier(this.customModifier as CustomModifier)
          .height('90%')
          .onScroll((xOffset: number, yOffset: number) => {
            console.info("WebView onScroll x = " + xOffset)
            console.info("WebView onScroll y = " + yOffset)
            if ((xOffset != 0 || yOffset != 0) && this.selfScrollTime == 0) {
              this.selfScrollTime = Utils.getSystemTime()
            }
          })

          Column().width('100%').height('20%').backgroundColor(Color.Red)

        }.width('100%')
      }.onScroll((xOffset: number, yOffset: number) => {
        console.info('ParentScroll:' + xOffset + ' ' + yOffset)
        if ((xOffset != 0 || yOffset != 0) && this.parentScrollTime == 0) {
          this.parentScrollTime = Utils.getSystemTime()
        }
      })
      .width('100%')
      .height('70%')
    }.key('ColumnSize')
  }
}