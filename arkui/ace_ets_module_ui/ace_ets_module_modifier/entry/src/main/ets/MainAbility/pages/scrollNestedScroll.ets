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
import { ScrollModifier } from "@ohos.arkui.modifier";
import { BusinessError } from '@ohos.base';

class CustomModifier extends ScrollModifier {
  applyNormalAttribute(instance: ScrollAttribute): void {
    super.applyNormalAttribute?.(instance);
  }
}

@Entry
@Component
struct ScrollNestedScroll {
  scroller: Scroller = new Scroller()
  @State customModifier: ScrollModifier = new CustomModifier()
    .nestedScroll({
      scrollForward: NestedScrollMode.PARALLEL,
      scrollBackward: NestedScrollMode.PARALLEL,
    })
  @State selfScrollTime: number = 0
  @State parentScrollTime: number = 0

  build() {
    Column() {
      Button("NestedScrollOptionsScroll click")
        .key('scrollNestedScrollOptionsScrollTestButton')
        .onClick(async () => {
          console.info("scroll NestedScrollOptionsScroll  onClick start ");
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
                eventId: 77004,
                priority: events_emitter.EventPriority.LOW
              }
              console.info("scroll NestedScrollOptionsScroll start to emit action state");
              events_emitter.emit(backEvent, backData);
            } catch (err) {
              console.info("scroll NestedScrollOptionsScroll emit action state err: " + JSON.stringify(err));
            }
          } catch (error) {
            console.error(`scroll NestedScrollOptionsScroll ErrorCode: ${(error as BusinessError)?.code},  Message: ${(error as Error)?.message}`);
          }
          console.info("scroll NestedScrollOptionsScroll  onClick end ");
        })

      Scroll(this.scroller) {
        Column() {
          Text("Scroll Area")
            .width("100%")
            .height("10%")
            .backgroundColor(0X330000FF)
            .fontSize(16)
            .textAlign(TextAlign.Center)

          Scroll(this.scroller) {
            Text("Scroll  Area 2")
              .fontSize(56)
              .width('100%')
              .textAlign(TextAlign.Center)
              .backgroundColor(1234).height('150%')
          }
          .attributeModifier(this.customModifier as CustomModifier)
          .backgroundColor(Color.Black)
          .height('90%')
          .onScroll((xOffset: number, yOffset: number) => {
            console.info("WebView onScroll x = " + xOffset)
            console.info("WebView onScroll y = " + yOffset)
            if ((xOffset != 0 || yOffset != 0) && this.selfScrollTime == 0) {
              this.selfScrollTime = Utils.getSystemTime()
            }
          })

          Text("Scroll Area")
            .width("100%")
            .height("10%")
            .backgroundColor(Color.Yellow)
            .fontSize(16)
            .textAlign(TextAlign.Center)
        }.width('100%')
      }.onScroll((xOffset: number, yOffset: number) => {
        console.info('ParentScroll:' + xOffset + ' ' + yOffset)
        if ((xOffset != 0 || yOffset != 0) && this.parentScrollTime == 0) {
          this.parentScrollTime = Utils.getSystemTime()
        }
      })
      .width('100%')
      .height('70%')
    }.width('100%').height('100%').backgroundColor(0xDCDCDC).key('ColumnSize')
  }
}