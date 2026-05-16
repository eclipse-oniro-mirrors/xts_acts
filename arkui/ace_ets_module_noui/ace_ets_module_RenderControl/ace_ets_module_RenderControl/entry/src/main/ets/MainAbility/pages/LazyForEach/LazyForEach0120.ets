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
class BasicDataSource0120 implements IDataSource {
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

  notifyDatasetChange(operations: DataOperation[]): void {
    this.listeners.forEach(listener => {
      listener.onDatasetChange(operations);
    })
  }
}

class MyDataSource0120 extends BasicDataSource0120 {
  public dataArray: string[] = [];

  public totalCount(): number {
    return this.dataArray.length;
  }

  public getData(index: number): string {
    return this.dataArray[index];
  }

  public addData(index: number, count: number, key: Array<string>): void {
    this.dataArray.splice(index, 0, 'HelloA');
    this.notifyDatasetChange([{
      type: DataOperationType.ADD,
      index: index,
      count: count,
      key: key
    }]);
  }

  public ExChangeData(): void {
    let temp = this.dataArray[1];
    this.dataArray[1] = this.dataArray[2];
    this.dataArray[2] = temp
    this.notifyDatasetChange([{
      type: DataOperationType.EXCHANGE,
      index: { start: 1, end: 2 },
      key: { start: 'key0120_1', end: 'key0120_2' }
    }]);
  }

  public pushData(data: string): void {
    this.dataArray.push(data);
  }
}

@Entry
@Component
struct LazyForEach0120 {
  private data: MyDataSource0120 = new MyDataSource0120();

  aboutToAppear() {
    for (let i = 0; i < 3; i++) {
      this.data.pushData(`Hello${i}`)
    }
  }

  build() {
    Column() {
      Button('ADD')
        .id('LazyForEach0120_1')
        .height('5%')
        .onClick(() => {
          this.data.addData(0, 1, ['addKey1'])
        })
      Button('EXCHANGE')
        .id('LazyForEach0120_2')
        .height('5%')
        .onClick(() => {
          this.data.ExChangeData()
        })
      List() {
        LazyForEach(this.data, (item: string) => {
          ListItem() {
            Text(item)
              .height('5%')
          }
        }, (item: string) => item)
      }
    }
  }
}