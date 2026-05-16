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

@Entry
@ComponentV2
struct RepeatWaterFlowNumber {
  @Local simpleList1: Array<number> = [];
  @Local simpleList2: Array<number> = [];
  @Local tmp1: number = 0;
  @Local tmp2: number = 0;
  scroller: Scroller = new Scroller();
  scroller1: Scroller = new Scroller();

  aboutToAppear(): void {
    for (let i = 0; i < 30; i++) {
      this.simpleList1.push(i);
      this.simpleList2.push(i);
    }
  }

  build() {
    Column({ space: 10 }) {
      Text('Non-VirtualScroll场景 父容器WaterFlow组件')
        .fontSize(15)
        .fontColor(Color.Gray)
      WaterFlow({ scroller: this.scroller }) {
        Repeat<number>(this.simpleList1)
          .each((ri) => {
            FlowItem() {
              Text(ri.item.toString() + ' index:' + ri.index.toString() + ':' + this.tmp2.toString())
                .id('Text1_WN' + ri.index.toString())
                .fontSize(20)
                .height('20%')
            }
            .width('100%')
            .border({ width: 1 })

          })
          .key((service: number, index: number): string => index + service.toString())
      }
      .columnsTemplate('1fr')
      .columnsGap(10)
      .rowsGap(5)
      .width('100%')
      .height('30%')
      .border({ width: 1 })

      Row() {
        Button('next1 page').id('Button1_WN')
          .onClick(() => {
            this.scroller.scrollToIndex(15);
          })
        Button('next2 page').id('Button2_WN')
          .onClick(() => {
            this.scroller1.scrollToIndex(15);
          })
      }

      Text('Has-VirtualScroll场景 父容器WaterFlow组件')
        .fontSize(15)
        .fontColor(Color.Gray)
      WaterFlow({ scroller: this.scroller1 }) {
        Repeat<number>(this.simpleList2)
          .each((ri) => {
            FlowItem() {
              Text(ri.item.toString() + ' index:' + ri.index.toString() + ':' + this.tmp2.toString())
                .id('Text2_WN' + ri.index.toString())
                .fontSize(20)
                .height('20%')
            }
            .width('100%')
            .border({ width: 1 })
          })
          .key((service: number, index: number): string => index + service.toString())
          .templateId((item, index) => {
            if (index > 15) {
              return 'number'
            } else {
              return 'each'
            }
          })
          .template('number', (r) => {
            FlowItem() {
              Text(r.item.toString() + ' index:' + r.index.toString() + ':' + (this.tmp2 = 100).toString())
                .id('Text2_WN' + r.index.toString())
                .fontSize(20)
                .height('20%')
            }
            .width('100%')
            .border({ width: 1 })
          })
          .virtualScroll()
      }
      .columnsTemplate('1fr')
      .columnsGap(10)
      .rowsGap(5)
      .width('100%')
      .height('30%')
      .border({ width: 1 })
    }
    .width('100%')
    .height('70%')
    .justifyContent(FlexAlign.Center)
  }
}