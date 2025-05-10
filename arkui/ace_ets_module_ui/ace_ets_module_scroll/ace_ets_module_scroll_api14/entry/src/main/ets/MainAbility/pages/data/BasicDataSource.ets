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
abstract class BasicDataSource <T> implements IDataSource {
  private listeners: DataChangeListener[] = []

  abstract totalCount(): number

  abstract getData(index: number): T

  registerDataChangeListener(listener: DataChangeListener): void {
    if (this.listeners.indexOf(listener) < 0) {
      console.info('add listener')
      this.listeners.push(listener)
    }
  }

  unregisterDataChangeListener(listener: DataChangeListener): void {
    const pos = this.listeners.indexOf(listener);
    if (pos >= 0) {
      console.info('remove listener')
      this.listeners.splice(pos, 1)
    }
  }

  notifyDataReload(): void {
    this.listeners.forEach(listener => {
      listener.onDataReloaded()
    })
  }

  notifyDataAdd(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDatasetChange([{type: DataOperationType.ADD, index: index}]);
    })
  }

  notifyDataChange(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDatasetChange([{type: DataOperationType.CHANGE, index: index}]);
    })
  }

  notifyDataDelete(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDatasetChange([{type: DataOperationType.DELETE, index: index}]);
    })
  }

  notifyDataMove(from: number, to: number): void {
    this.listeners.forEach(listener => {
      listener.onDatasetChange([{type: DataOperationType.MOVE, index: { from: from, to: to }}]);
    })
  }

  notifyDatasetChange(operations: DataOperation[]): void {
    this.listeners.forEach(listener => {
      listener.onDatasetChange(operations);
    })
  }
}

export class MyDataSource <T> extends BasicDataSource<T> {
  private dataArray: T[] = []

  public totalCount(): number {
    return this.dataArray.length
  }

  public getData(index: number): T {
    console.log("zxy List cacheCountTest3 getData = " + index)
    return this.dataArray[index]
  }

  public addData(index: number, data: T): void {
    this.dataArray.splice(index, 0, data) // 在index位置增加data
    // this.notifyDataAdd(index)
    this.notifyDatasetChange([
      {type: DataOperationType.ADD, index: index}])
  }

  public dataReload(): void {
    this.notifyDatasetChange([
      {type: DataOperationType.RELOAD}])
  }

  public pushData(data: T): void {
    this.dataArray.push(data)
    this.notifyDatasetChange([
      {type: DataOperationType.ADD, index: this.dataArray.length - 1}])
    // this.notifyDataAdd(this.dataArray.length - 1)
  }

  public deleteIndex(index: number): void {
    this.dataArray.splice(index, 1) // 在index位置删除1个数据
    this.notifyDatasetChange([
      {type: DataOperationType.DELETE, index: index, count: 1}])
  }

  public deleteData(data: T): void {
    let index = this.dataArray.indexOf(data)
    this.dataArray.splice(index, 1) // 在index位置删除1个数据
    this.notifyDatasetChange([
      {type: DataOperationType.DELETE, index: index, count: 1}])
  }

  public moveData(from: number, to: number) {
    this.notifyDataMove(from, to)
  }

  public changeData(index: number, data: T) {
    this.dataArray[index] = data
    this.notifyDataChange(index)
  }

  public indexOf(data: T): number {
    return this.dataArray.indexOf(data)
  }

  public addOperateData(items: T[]): void {
    this.dataArray.splice(20, 0, ...items);
    this.notifyDatasetChange([
      {type: DataOperationType.ADD, index: 20, count: 100}]);
  }
  public DeloperateData(): void {
    this.dataArray.splice(20, 100);
    this.notifyDatasetChange([
      {type: DataOperationType.DELETE, index: 20, count: 100}]);
  }
}