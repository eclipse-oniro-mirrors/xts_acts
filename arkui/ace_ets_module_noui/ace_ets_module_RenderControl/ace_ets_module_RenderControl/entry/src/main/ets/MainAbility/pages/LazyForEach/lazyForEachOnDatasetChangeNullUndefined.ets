/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { ExpandMode } from '@kit.ArkUI';

class BasicDataSource implements IDataSource {
  private listeners: DataChangeListener[] = [];
  private originDataArray: string[] = [];

  public totalCount(): number {
    return 0;
  }

  public getData(index: number): string {
    return this.originDataArray[index];
  }

  registerDataChangeListener(listener: DataChangeListener): void {
    if (this.listeners.indexOf(listener) < 0) {
      console.info('add listener');
      this.listeners.push(listener);
    }
  }

  unregisterDataChangeListener(listener: DataChangeListener): void {
    const pos = this.listeners.indexOf(listener);
    if (pos >= 0) {
      console.info('remove listener');
      this.listeners.splice(pos, 1);
    }
  }

  notifyDataReload(): void {
    this.listeners.forEach(listener => {
      listener.onDataReloaded();
    })
  }

  notifyDataAdd(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataAdd(index);
    })
  }

  notifyDataChange(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataChange(index);
    })
  }

  notifyDataDelete(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataDelete(index);
    })
  }

  notifyDataMove(from: number, to: number): void {
    this.listeners.forEach(listener => {
      listener.onDataMove(from, to);
    })
  }

  notifyDatasetChange(operations: DataOperation[]): void {
    this.listeners.forEach(listener => {
      listener.onDatasetChange(operations);
    })
  }
  notifyDatasetChange1(): void {
    this.listeners.forEach(listener => {
      listener.onDatasetChange([]);
    })
  }
  notifyDatasetChange2(): void {
    this.listeners.forEach(listener => {
      listener.onDatasetChange(null);
    })
  }
  notifyDatasetChange3(): void {
    this.listeners.forEach(listener => {
      listener.onDatasetChange(undefined);
      listener.onDatasetChange(undefined);
    })
  }

}

class MyDataSource extends BasicDataSource {
  private dataArray: string[] = [];

  public totalCount(): number {
    return this.dataArray.length;
  }

  public getData(index: number): string {
    return this.dataArray[index];
  }

  public addData(index: number, data: string): void {
    this.dataArray.splice(index, 0, data);
    this.notifyDataAdd(index);
  }

  public pushData(data: string): void {
    this.dataArray.push(data);
    this.notifyDataAdd(this.dataArray.length - 1);
  }
}

@Entry
@Component
struct lazyForEachOnDatasetChangeNullUndefined {
  @State vis: Visibility = Visibility.Visible
  @State isShow: boolean = true
  private data: MyDataSource = new MyDataSource();
  private data1: MyDataSource = new MyDataSource();
  @State arr: Array<string> = [];

  @State getChildValue:string = '5'
  @State getFirstChildIndexWithoutExpandValue:string = '1'
  @State getLastChildIndexWithoutExpandValue:string = '9'

  aboutToAppear() {
    for (let i = 0; i <= 10; i++) {
      this.data.pushData(`Hello${i}`)
    }
    for (let i = 0; i <= 10; i++) {
      this.data1.pushData(`TTT${i}`)
    }
    for (let i = 0; i <= 10; i++) {
      this.arr.push(`World${i}`)
    }
  }

  build() {
    Scroll() {
      Column({ space: 15 }) {
        Column() {
          Scroll() {
            Column() {
              List({ space: 3 }) {
                LazyForEach(this.data1, (item1: string) => {
                  ListItem() {
                    Row() {
                      Text(item1).fontSize(20).id(item1)
                        .onAppear(() => {
                          console.info('appear:' + item1)
                        })
                    }.margin({ left: 10, right: 10 })
                  }.id('LazyForEachListItem_' + item1)
                }, (item1: string) => item1)
              }
              .margin(8)
              .id('lazyForEachOnDatasetChangeNullUndefined')
              .borderWidth(2)
              .cachedCount(2)
              .height(105)
            }
          }.scrollBarColor(Color.Transparent)
        }
        .width('100%')
        .backgroundColor(Color.Gray)
        .id('Column_TS')
      }
      .width('100%')
    }.scrollBarColor(Color.Transparent)
  }
}