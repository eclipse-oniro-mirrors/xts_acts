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


@ObservedV2
class WaterFlowItemInfo {
  @Trace public name: string;
  @Trace public url: string;

  constructor(name: string, url: string) {
    this.name = name;
    this.url = url;
  }
}

@Entry
@ComponentV2
struct Repeat0030 {
  @Local itemList: Array<WaterFlowItemInfo> = [];
  @Local swipeStartIndex: number = -1;
  @Local repeat0030_1: string = '-1';
  @Local repeat0030_2: string = '-1';
  @Local isLoading: boolean = true;
  @Local hasError: boolean = false;
  private imagesUrl: Array<string> = [
    'app.media.img1',
    'app.media.img2',
    'app.media.img3',
    'app.media.img4'
  ]
  private scroller: Scroller = new Scroller();

  aboutToAppear(): void {
    for (let i = 0; i < 50; i++) {
      this.itemList.push(new WaterFlowItemInfo('img' + i, this.imagesUrl[i % 4]));
    }
  }

  build() {
    Column({ space: 10 }) {
      Column() {
        Text('waterflow with repeat')
          .height('3%')
        Button('toIndex[2]')
          .id('toIndex[2]')
          .height('3%')
          .onClick(() => {
            this.scroller.scrollToIndex(2)
          })
        Text(this.repeat0030_1)
          .id('repeat0030_1')
          .height('3%')
        Text(this.repeat0030_2)
          .id('repeat0030_2')
          .height('3%')
        Text(this.isLoading && !this.hasError ? 'Normal display' : 'Error display')
          .id('display_status')
          .height('3%')
      }

      WaterFlow({ scroller: this.scroller, layoutMode: 1 }) {
        Repeat<WaterFlowItemInfo>(this.itemList)
          .each((obj: RepeatItem<WaterFlowItemInfo>) => {
            FlowItem() {
              Stack() {
                Image($r(obj.item.url))
                  .onComplete(() => {
                    if (!this.hasError) {
                      this.isLoading = true
                      this.hasError = false
                    }
                  })
                  .onError(() => {
                    this.isLoading = false
                    this.hasError = true
                  })
                Text(obj.item.name)
                  .backgroundColor(Color.White)
                  .border({ width: 10 })
              }
            }
            .height('100%')
            .margin(10)
            .onAttach(() => {
              this.repeat0030_2 = obj.item.name;
            })
            .onDetach(() => {
              this.repeat0030_1 = obj.item.name;
            })
          })
          .virtualScroll({ totalCount: this.itemList.length })
      }
      .columnsTemplate('1fr')
      .onScrollIndex((start: number, end: number) => {
        this.swipeStartIndex = start;
      })
      .cachedCount(0)
      .layoutWeight(1)
    }
  }
}

