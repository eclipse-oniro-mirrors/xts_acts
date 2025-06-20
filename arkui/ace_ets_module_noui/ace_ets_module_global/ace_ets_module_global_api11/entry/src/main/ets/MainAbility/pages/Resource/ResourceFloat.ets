/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
class MyDataFloat implements IDataSource {
  private list: number[] = []

  constructor(list: number[]) {
    this.list = list
  }

  totalCount(): number {
    return this.list.length
  }

  getData(index: number): number {
    return this.list[index]
  }

  registerDataChangeListener(listener: DataChangeListener): void {
  }

  unregisterDataChangeListener() {
  }
}

@Entry
@Component
struct ResourceFloat {
  private swiperController: SwiperController = new SwiperController()
  private data: MyDataFloat = new MyDataFloat([])

  aboutToAppear(): void {
    let list: number[] = []
    for (let i = 0; i <= 4; i++) {
      list.push(i);
    }
    this.data = new MyDataFloat(list)
  }

  build() {
    Column({ space: 5 }) {
      Swiper(this.swiperController) {
        LazyForEach(this.data, (item: string) => {

          Column() {

            Column() {
              Text('float test').fontSize(20)
              Text('float').fontSize($r(`app.float.float_${item.toString()}`)).id('float')
            }.border({ width: 2 }).margin(30)

          }
          .justifyContent(FlexAlign.SpaceEvenly)
          .width(300)
          .height(300)

        }, (item: string) => item)
      }
      .cachedCount(2)
      .index(1)
      .interval(4000)
      .loop(true)
      .duration(1000)
      .itemSpace(0)
      .height('90%')
      .width('100%')

      Row({ space: 12 }) {
        Button('showNext')
          .id('ResourceFloat')
          .onClick(() => {
            this.swiperController.showNext()
          })
        Button('showPrevious')
          .onClick(() => {
            this.swiperController.showPrevious()
          })
      }.margin(5)
    }
    .height('100%')
    .width('100%')
    .margin({ top: 5 })
  }
}