/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
struct RepeatLazy0150 {
  @Local dataArr: string[] = []
  private scroller: Scroller = new Scroller()

  build() {
    Column({ space: 1 }) {
      Button('Swipe to Bottom')
        .id('btnRepeatLazy0150')
        .height('5%')
        .onClick(() => {
          this.scroller.scrollToIndex(0); // Slide to the specified index
        })
      List({ scroller: this.scroller, initialIndex: 80 }) {
        Repeat<string>(this.dataArr)
          .each((ri) => {
            ListItem() {
              Text('item_' + ri.item)
                .height('5%')
            }
          })
          .virtualScroll({
            onTotalCount: ()=> {return 100},
            onLazyLoading: (index: number) => {
              this.dataArr[index] = index.toString()
            }
          })
      }
      .layoutWeight(1)
      .cachedCount(1)
    }
  }
}