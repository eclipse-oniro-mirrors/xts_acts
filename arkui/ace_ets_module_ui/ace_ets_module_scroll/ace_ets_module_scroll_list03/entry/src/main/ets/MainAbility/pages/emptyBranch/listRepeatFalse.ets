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
class ListRepeatFalse {
  @Trace arr: Array<number> = [];

  constructor(count: number) {
    for (let i = 0; i < count; i++) {
      this.arr.push(i);
    }
  }
}

@Entry
@ComponentV2
struct ListRepeatFalseComponent {
  @Local listRepeatFalse: ListRepeatFalse = new ListRepeatFalse(30);
  @Local totalCount: number = this.listRepeatFalse.arr.length;

  build() {
    Column() {
      List() {
        Repeat(this.listRepeatFalse.arr)
          .virtualScroll({ totalCount: this.totalCount })
          .templateId((item: number, index: number) => {
            return 'number';
          })
          .each((r) => {
            if (r.index == 7) {

            } else {
              ListItem() {
                Text(`Item: ${r.item}`)
              }
              .id('list_repeat_false_' + r.item)
              .width('100%')
              .height('20%')
              .backgroundColor(0xF5CF53)
            }
          })
      }
      .supportEmptyBranchInLazyLoading(false)
      .lanes(3)
      .width('80%')
      .height('60%')
      .backgroundColor(0xDCDCDC)

    }
    .height('100%')
    .width('100%')
  }
}