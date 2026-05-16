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

//测试：Repeat组件和V1装饰器混用场景
@Observed
class RepeatItemV1 {
  public id: number
  public name: string

  constructor(id: number, name: string) {
    this.id = id
    this.name = name
  }
}

@Entry
@Component
struct RepeatVlObject {
  @State simpleList: Array<RepeatItemV1> = [];

  aboutToAppear(): void {
    for (let i = 0; i < 100; i++) {
      this.simpleList.push(new RepeatItemV1(i, 'RepeatItem' + i))
    }
  }

  build() {
    Column() {
      List({ initialIndex: 10 }) {
        Repeat<RepeatItemV1>(this.simpleList)
          .each((obj: RepeatItem<RepeatItemV1>) => {
            ListItem() {
              Text('Item id=' + obj.item).id('repeat1' + `${obj.index}`)
                .fontSize(9)
            }
          })
          .key((item: RepeatItemV1, index: number) => {
            return item + '';
          })
          .virtualScroll({ totalCount: this.simpleList.length })
          .templateId((item: RepeatItemV1, index: number) => 'default')
          .template('default', (ri) => {
            ListItem() {
              Column() {
                Text('Item id =' + ri.item.name).id('repeat2_vo' + `${ri.index}`)
                  .fontSize(9)
              }
            }
            .border({ width: 1 })
          }, { cachedCount: 3 })
      }
      .cachedCount(1)
      .border({ width: 1 })
      .width('90%')
      .height('70%')
    }
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}