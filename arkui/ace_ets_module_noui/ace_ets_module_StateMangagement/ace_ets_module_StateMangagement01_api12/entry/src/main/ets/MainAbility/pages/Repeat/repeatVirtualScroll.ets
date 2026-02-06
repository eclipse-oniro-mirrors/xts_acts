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
    Scroll() {
      Column({ space: 5 }) {
        Text('初始化数据')
          .id('init_repeat')
          .margin(5)
          .width('33%')
          .height('5%')
          .fontColor(Color.Red)
          .onClick(() => {
            this.arrayCount.arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
          })
        List({ scroller: this.scroller }) {
          Repeat(this.arrayCount.arr)
            .virtualScroll({ totalCount: this.totalCount })
            .templateId((item, index) => {
              if (index == 3) {
                return 'string'
              } else if (index == 4) {
                return 'number';
              } else if (index == 12 || index == 13 || index == 14) {
                return 'change';
              } else {
                return 'each'
              }
            })
            .template('number', (r) => {
              ListItem() {
                Text((r.index! + ':' + r.item + 'ReuseNumber' + this.temporaryValue).toString())
                  .id(`text${r.index}`)
                  .height('20%')
              }
            })
            .template('string', (r) => {
              ListItem() {
                Text((r.index! + ':' + r.item + 'ReuseString' + this.temporaryValue).toString())
                  .id(`text${r.index}`)
                  .height('20%')
              }
            })
            .template('change', (r) => {
              ListItem() {
                Text((r.index! + ':' + r.item + 'ReuseChange' + (this.temporaryValue = 666)).toString())
                  .id(`text${r.index}`)
                  .height('20%')
              }
            }, { cachedCount: 4 })
            .each((r) => {
              ListItem() {
                Text((r.index! + ':' + r.item + 'eachMessage' + this.temporaryValue).toString())
                  .id(`text${r.index}`)
                  .height('20%')
              }
            })
            .key((item: number) => (item).toString())
        }
        .onScrollIndex((start, end) => {
          this.start = start;
          this.end = end;
        })
        .height('25%')

        Row() {
          Button('滚至索引5')
            .id('scroll_data1')
            .margin(5)
            .width('33%')
            .height('5%')
            .onClick(() => {
              let rect = this.scroller.getItemRect(this.start); // 获取子组件的大小位置
              this.scroller.scrollToIndex(5); // 滑动到指定index
              this.scroller.scrollBy(0, -rect.y); // 滑动指定距离
            })
          Button('滚至索引7')
            .id('scroll_data2')
            .width('33%')
            .margin(5)
            .height('5%')
            .onClick(() => {
              let rect = this.scroller.getItemRect(this.start); // 获取子组件的大小位置
              this.scroller.scrollToIndex(7); // 滑动到指定index
              this.scroller.scrollBy(0, -rect.y); // 滑动指定距离
            })
          Button('修改第7项')
            .id('repeat_modify')
            .margin(5)
            .width('33%')
            .height('5%')
            .onClick(() => {
              this.arrayCount.arr[7] = 333;
            })
        }

        Row() {
          Button('交换7，8项')
            .id('repeat_2')
            .margin(5)
            .width('50%')
            .height('5%')
            .onClick(() => {
              let temp: number = this.arrayCount.arr[8]
              this.arrayCount.arr[8] = this.arrayCount.arr[7]
              this.arrayCount.arr[7] = temp
            })
          Button('删除第7组值')
            .id('repeat_3')
            .margin(5)
            .width('50%')
            .height('5%')
            .onClick(() => {
              this.arrayCount.arr.splice(7, 1);
            })
        }
      }
    }
    .width('100%')
    .margin({ top: 5 })
  }
}