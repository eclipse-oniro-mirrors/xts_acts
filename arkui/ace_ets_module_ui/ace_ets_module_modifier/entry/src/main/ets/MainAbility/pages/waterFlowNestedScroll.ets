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
import { WaterFlowModifier } from "@ohos.arkui.modifier";
class CustomModifier extends WaterFlowModifier {
  applyNormalAttribute(instance: WaterFlowAttribute): void {
    super.applyNormalAttribute?.(instance);
  }
}

export class WaterFlowDataSource {
  dataArray: number[] = []
  constructor() {
    for (let i = 0; i < 100; i++) {
      this.dataArray.push(i)
    }
  }
}
@Entry
@Component
struct WaterflowNestedScroll {
  dataSource: WaterFlowDataSource = new WaterFlowDataSource()
  scroller: Scroller = new Scroller()
  @State customModifier: WaterFlowModifier = new CustomModifier()
    .nestedScroll({
      scrollForward: NestedScrollMode.PARALLEL,
      scrollBackward: NestedScrollMode.PARALLEL,
    })
  @State selfScrollTime: number = 0
  @State parentScrollTime: number = 0

  build() {
    Column() {
      Button("NestedScrollOptionsScroll click")
        .key('waterflowNestedScrollOptionsScrollTestButton')
        .onClick(async () => {
          console.info("WaterFlow NestedScrollOptionsScroll  onClick start ");
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
                eventId: 77003,
                priority: events_emitter.EventPriority.LOW
              }
              console.info("WaterFlow NestedScrollOptionsScroll start to emit action state");
              events_emitter.emit(backEvent, backData);
            } catch (err) {
              console.info("WaterFlow NestedScrollOptionsScroll emit action state err: " + JSON.stringify(err));
            }
          } catch (error) {
            console.error(`WaterFlow NestedScrollOptionsScroll ErrorCode: ${error.code},  Message: ${error.message}`);
          }
          console.info("WaterFlow NestedScrollOptionsScroll  onClick end ");
        })

      Scroll(this.scroller) {
        Column() {
          Column().width('100%').height('20%').backgroundColor(Color.Green)
          WaterFlow() {
            ForEach(this.dataSource.dataArray, (item: number) => {
              FlowItem() {
                Column() {
                  Text("N" + item).fontSize(22).height('26')
                }
              }
              .width('100%')
            }, (item: string) => item)
          }.columnsTemplate('1fr 1fr')
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
    }.key('ColumnSize')
  }
}