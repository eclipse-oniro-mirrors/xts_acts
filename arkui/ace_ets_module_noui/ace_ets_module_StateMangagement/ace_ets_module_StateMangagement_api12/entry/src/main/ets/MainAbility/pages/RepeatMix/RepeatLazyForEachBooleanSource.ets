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

//测试：Repeat组件和LazyForEach组件混用场景

class BasicDataSource implements IDataSource {
  private listeners: DataChangeListener[] = [];
  private originDataArray: Array<boolean> = [];

  public totalCount(): number {
    return 0;
  }

  public getData(index: number): boolean {
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

export default class BooleanDataSource extends BasicDataSource {
  public dataArray: Array<boolean> = [];

  public totalCount(): number {
    return this.dataArray.length;
  }

  public getData(index: number): boolean {
    return this.dataArray[index];
  }

  public addData(index: number, data: boolean): void {
    this.dataArray.splice(index, 0, data);
    this.notifyDataAdd(index);
  }

  public pushData(data: boolean): void {
    this.dataArray.push(data);
  }

  public moveData(from: number, to: number): void {
    let temp: boolean = this.dataArray[from];
    this.dataArray[from] = this.dataArray[to];
    this.dataArray[to] = temp;
    this.notifyDataMove(from, to);
  }

  public moveDataWithoutNotify(from: number, to: number): void {
    let tmp = this.dataArray.splice(from, 1);
    this.dataArray.splice(to, 0, tmp[0])
  }

  public changeData(index: number, data: boolean): void {
    this.dataArray.splice(index, 1, data);
    this.notifyDataChange(index);
  }

  public deleteData(index: number): void {
    this.dataArray.splice(index, 1);
    this.notifyDataDelete(index);
  }

  public reloadData(): void {
    this.notifyDataReload();
  }
}

@Entry
@ComponentV2
struct RepeatLazyForEachBoolean {
  @Local dataList: Array<string> = [];
  @Local dataSource: Array<BooleanDataSource> = []

  aboutToAppear(): void {
    for (let i = 0; i < 100; i++) {
      if (this.dataSource[i] === undefined) {
        this.dataSource[i] = new BooleanDataSource();
      }

      this.dataList.push('Item' + i);

      if (i % 3 == 0) {
        this.dataSource[i].pushData(true);
      } else if (i % 3 == 1) {
        this.dataSource[i].pushData(false);
      } else {
        this.dataSource[i].pushData(false);
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
                Text(obj.item).id('repeat1_LB' + `${obj.index}`)
                  .fontSize(9)
                LazyForEach(this.dataSource[obj.index], (item: string) => {
                  Text('' + item).id('lazyForeach1_LB' + `${obj.index}`)
                    .fontSize(9)
                    .fontColor(Color.Orange)
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
      .width('90%')
    }
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}





