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
@ObservedV2
class ArrayRepeatTrue {
  @Trace arr: Array<number> = [];

  constructor(count: number) {
    for (let i = 0; i < count; i++) {
      this.arr.push(i);
    }
  }
}

@Entry
@ComponentV2
struct GridRepeatTrueComponent {
  @Local arrayRepeatTrue: ArrayRepeatTrue = new ArrayRepeatTrue(30);
  @Local totalCount: number = this.arrayRepeatTrue.arr.length;

  build() {
    Column() {
      Grid() {
        Repeat(this.arrayRepeatTrue.arr)
          .virtualScroll({ totalCount: this.totalCount })
          .templateId((item: number, index: number) => {
            return 'number';
          })
          .each((r) => {
            if (r.index == 7) {

            } else {
              GridItem() {
                Text(`Item: ${r.item}`)
              }
              .id('grid_repeat_true_' + r.item)
              .width('100%')
              .height('20%')
              .backgroundColor(0xF5CF53)
            }
          })
      }
      .supportEmptyBranchInLazyLoading(true)
      .columnsTemplate('1fr 1fr 1fr')
      .rowsGap(5)
      .width('80%')
      .height('60%')
      .backgroundColor(0xDCDCDC)

    }
    .height('100%')
    .width('100%')
  }
}