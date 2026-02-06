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
@ObservedV2
class ArrayCount {
  @Trace public arr: Array<number> = [];

  // constructor，用于初始化数组个数
  constructor(count: number) {
    for (let i = 0; i < count; i++) {
      this.arr.push(i);
    }
  }
}

@Entry
@ComponentV2
export struct displayRepeat {
  @Local temporaryValue: number = 123;
  @Local arrayCount: ArrayCount = new ArrayCount(15);
  @Local totalCount: number = this.arrayCount.arr.length;
  scroller: Scroller = new Scroller();
  private start: number = 1;
  private end: number = 1;

  build() {
    Column() {
      List({ initialIndex: 3, scroller: this.scroller }) {
        Repeat(this.arrayCount.arr)
          .template('number', (r) => {
            ListItem() {
              Text((r.index! + ':' + r.item + 'ReuseNumber' + this.temporaryValue).toString())
                .id(`textNo${r.index}`)
            }
          })
          .template('number1', (r) => {
            ListItem() {
              Text((r.index! + ':' + r.item + 'ReuseNumber' + this.temporaryValue).toString())
                .id(`textNo${r.index}`)
            }
          })
          .template('change', (r) => {
            ListItem() {
              Text((r.index! + ':' + r.item + 'ReuseChange' + (this.temporaryValue = 666)).toString())
                .id(`textNo${r.index}`)
            }
          }, { cachedCount: 4 })
          .each((r) => {
            ListItem() {
              Text((r.index! + ':' + r.item + 'eachMessage' + this.temporaryValue).toString())
                .id(`textNo${r.index}`)
            }
          })
          .key((item: number) => (item).toString())
      }
      .onScrollIndex((start, end) => {
        this.start = start;
        this.end = end;
      })
      .height('100%')
    }
    .width('100%')
  }
}