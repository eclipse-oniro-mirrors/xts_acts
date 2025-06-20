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
}

export default class StringDataSource extends BasicDataSource implements DataDeleteOperation {
  public type: DataOperationType.DELETE;
  public index: number;
  public count?: number | undefined;

  constructor() {
    super();
    this.type = DataOperationType.DELETE;
    this.index = 0;
    this.count = 0;
  }

  public dataArray: string[] = [];

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
  }

  public moveData(from: number, to: number): void {
    let temp: string = this.dataArray[from];
    this.dataArray[from] = this.dataArray[to];
    this.dataArray[to] = temp;
    this.notifyDataMove(from, to);
  }

  public moveDataWithoutNotify(from: number, to: number): void {
    let tmp = this.dataArray.splice(from, 1);
    this.dataArray.splice(to, 0, tmp[0])
  }

  public changeData(index: number, data: string): void {
    this.dataArray.splice(index, 1, data);
    this.notifyDataChange(index);
  }

  public deleteData(index: number): void {
    this.dataArray.splice(index, 1);
    this.notifyDataDelete(index);
    this.index = index;
    if (this.count != undefined) {
      this.count++;
    }
  }

  public reloadData(): void {
    this.notifyDataReload();
  }
}

@Entry
@ComponentV2
struct RepeatLazyForEachString {
  @Local dataList: Array<string> = [];
  @Local dataSource: Array<StringDataSource> = []

  aboutToAppear(): void {
    for (let i = 0; i < 10; i++) {
      if (this.dataSource[i] === undefined) {
        this.dataSource[i] = new StringDataSource();
      }

      this.dataList.push('Item' + i);

      if (i % 3 == 0) {
        this.dataSource[i].pushData('Math Science Chinese English');
      } else if (i % 3 == 1) {
        this.dataSource[i].pushData('Math Science');
      } else {
        this.dataSource[i].pushData('Math Science PE');
      }
    }
  }

  build() {
    Column() {
      List({ initialIndex: 10 }) {
        Repeat<string>(this.dataList)
          .each((obj: RepeatItem<string>) => {
            ListItem() {
              Row() {
                Text(obj.item).id('repeat_delete' + `${obj.index}`)
                  .height('3%')
                  .fontSize(9)
                LazyForEach(this.dataSource[obj.index], (item: string) => {
                  Text('' + item).id('lazyForeach_delete' + `${obj.index}`)
                    .height('3%')
                    .fontSize(9)
                })
              }
            }
          })
          .key((item: string) => {
            return item;
          })
      }

      .cachedCount(1)
      .border({ width: 1 })
      .layoutWeight(1)

      Button('Delete Data')
        .id('deleteButton')
        .width('10%')
        .height('3%')
        .fontSize(9)
        .onClick(() => {
          let lastIndex = this.dataSource.length - 1;
          this.dataSource[1].deleteData(0)
          let index = this.dataSource[1].index;
          let count = this.dataSource[1].count;
          let type = this.dataSource[1].type;
          this.dataList.push('Item' + (lastIndex + 1));
          this.dataSource.push(new StringDataSource());
          this.dataSource[this.dataSource.length-1].addData(0, index.toString() + count + type)
        })
    }
    .justifyContent(FlexAlign.Center)
  }
}