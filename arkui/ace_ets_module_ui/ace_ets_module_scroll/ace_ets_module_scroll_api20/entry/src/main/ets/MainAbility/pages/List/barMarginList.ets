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
struct scrollBarMarginList {
  listScroller: Scroller = new Scroller();
  @State arr: string[] = [];

  aboutToAppear(): void {
    for (let i = 0; i < 6; i++) {
      this.arr.push(i.toString());
    }
  }

  build() {
    Column(){
      List({ scroller: this.listScroller }) {
        ForEach(this.arr, (item1: number,index:number) => {
          ListItem() {
            Text('item'  + item1)
              .fontSize(16)
              .width('80%')
              .height('20%')
              .borderRadius(10)
              .backgroundColor(Color.Pink)
          }
        }, (item1: number) => `arr_${item1}`)
      }
      .id('list_bar_margin')
      .scrollBarColor(Color.Blue)
      .scrollBarWidth(20)
      .width('90%')
      .height('50%')
      .scrollBarMargin({
        start: LengthMetrics.px(40),
        end: LengthMetrics.vp(20)
      })
      .listDirection(Axis.Vertical)
      .edgeEffect(EdgeEffect.Spring)
      .direction(Direction.Ltr)
      .border({
        color:Color.Red,
        width:4
      })
    }.backgroundColor(0xDCDCDC)

  }
}