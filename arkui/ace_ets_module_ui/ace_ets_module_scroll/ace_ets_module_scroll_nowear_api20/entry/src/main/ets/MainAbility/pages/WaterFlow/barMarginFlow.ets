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
import { LengthMetrics } from '@ohos.arkui.node';
@Entry
@Component
struct scrollBarMarginWaterFlow {
  scroller: Scroller = new Scroller();
  @State colors: number[] = [0xFFC0CB, 0xDA70D6, 0x6B8E23, 0x6A5ACD, 0x00FFFF, 0x00FF7F];
  @State arr: string[] = [];

  aboutToAppear(): void {
    for (let i = 0; i < 20; i++) {
      this.arr.push(i.toString());
    }
  }

  build() {
    Column(){
      WaterFlow({ scroller:this.scroller }) {
        ForEach(this.arr, (item: number, index: number) => {
          FlowItem() {
            Text('N' + item)
              .width('100%')
              .height('20%')
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .borderRadius(10)
          }
          .width('80%')
          .backgroundColor(this.colors[item % 5])
        }, (item: string) => item)
      }
      .id('flow_bar_margin')
      .width('90%')
      .height('50%')
      .columnsTemplate('1fr 1fr')
      .columnsGap(10)
      .rowsGap(5)
      .scrollBarColor(Color.Blue)
      .scrollBarWidth(20)
      .scrollBarMargin({
        start: LengthMetrics.px(40),
        end: LengthMetrics.vp(20)
      })
      .edgeEffect(EdgeEffect.Spring)
      .direction(Direction.Ltr)
      .border({
        color:Color.Red,
        width:4
      })
    }.backgroundColor(0xDCDCDC)

  }
}