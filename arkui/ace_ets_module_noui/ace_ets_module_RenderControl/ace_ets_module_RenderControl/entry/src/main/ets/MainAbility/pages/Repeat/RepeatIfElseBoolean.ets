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

//测试：Repeat组件包含if/else混用场景

@Entry
@ComponentV2
struct RepeatIfElseBoolean {
  @Local simpleList: Array<boolean> = [];
  @Local flag: boolean = true;

  aboutToAppear(): void {
    for (let i = 0; i < 100; i++) {
      this.simpleList.push(i % 2 === 0)
    }
  }

  build() {
    Column() {
      Button('switch mode')
        .onClick(() => {
          this.flag = !this.flag
        })
      List({ initialIndex: 10 }) {
        Repeat<boolean>(this.simpleList)
          .each((obj: RepeatItem<boolean>) => {
            ListItem() {
              Text('item1 id = ' + obj.item).id('repeat1_IB' + `${obj.index}`)
                .fontSize(9)
            }
          })
          .key((item: boolean, index: number) => {
            return item + '';
          })
          .virtualScroll({ totalCount: this.simpleList.length })
          .templateId((item: boolean, index: number) => 'default')
          .template('default', (ri) => {
            if (this.flag && ri.item == true) {
              ListItem() {
                Column() {
                  Text(`item2 id ${ri.index} = ` + ri.item).id('repeat2_IB' + `${ri.index}`)
                    .fontSize(9)
                    .fontColor(Color.Gray)
                }
              }
            } else {
              ListItem() {
                Column() {
                  Text(`item3 id ${ri.index} = ` + ri.item).id('repeat3_IB' + `${ri.index}`)
                    .fontSize(9)
                    .fontColor(Color.Red)
                }
              }
            }
          }, { cachedCount: 3 })
      }
      .cachedCount(1)
      .border({ width: 1 })
      .width('90%')
      .layoutWeight(1)
    }
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}