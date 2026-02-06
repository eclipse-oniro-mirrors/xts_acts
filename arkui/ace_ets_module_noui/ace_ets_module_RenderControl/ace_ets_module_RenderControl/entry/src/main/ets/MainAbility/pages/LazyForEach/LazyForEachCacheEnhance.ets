/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

class MyDataSource0427 implements IDataSource {
  private dataArray: string[] = []
  private listeners: DataChangeListener[] = []

  pushData(data: string): void {
    this.dataArray.push(data)
  }

  totalCount(): number {
    return this.dataArray.length;
  }

  getData(index: number): string {
    return this.dataArray[index]
  }

  registerDataChangeListener(listener: DataChangeListener): void {
    if (this.listeners.indexOf(listener) < 0) {
      this.listeners.push(listener)
    }
  }

  unregisterDataChangeListener(listener: DataChangeListener): void {
    const pos = this.listeners.indexOf(listener)
    if (pos >= 0) {
      this.listeners.splice(pos, 1)
    }
  }
}


AppStorage.setOrCreate('reuseCount', 0)

@Entry
@Component
struct LazyForEachCacheEnhanceDemo {
  private data: MyDataSource0427 = new MyDataSource0427();
  private scroller: Scroller = new Scroller();
  @StorageLink('reuseCount') reuseCount: number = 0;

  aboutToAppear(): void {
    for (let i = 1; i <= 1000; i++) {
      this.data.pushData(i.toString());
    }
  }

  build() {
    Column() {
      Row() {
        Button('scroll 1200')
          .id('scroll_1200')
          .height('5%')
          .margin(10)
          .onClick(() => {
            this.scroller.scrollBy(0, 1200);
          })

        Text(`${this.reuseCount}`)
        .id('reuse_count')

      }

      List({ space: 3, initialIndex: 0, scroller: this.scroller }) {
        LazyForEach(this.data, (item: string, idex: number) => {
          ListItem() {
            ChildItem0427({ item: item })
          }
        },
          (item: string, index: number) => item)
      }
      .width('100%')
      .layoutWeight(1)
      .divider({ strokeWidth: 1, color: Color.Gray })
      .scrollBar(BarState.Off)
      .align(Alignment.Center)
    }
  }
}

@Component
@Reusable
struct ChildItem0427 {
  @Prop item: string;
  @StorageLink('reuseCount') reuseCount: number = 0;

  sleep(ms: number) {
    const date = Date.now();
    let currentDate: number;
    do {
      currentDate = Date.now();
    } while ((currentDate - date) < ms)
  }

  getContent() {
    this.sleep(20);
    return this.item;
  }

  aboutToReuse(param: ESObject): void {
    console.error('yulong--- aboutToReuse', param.item)
    this.reuseCount++;
  }

  build() {
    Column() {
      Text(this.getContent()).fontSize(50)
    }.margin({ left: 10, right: 10 })
  }
}