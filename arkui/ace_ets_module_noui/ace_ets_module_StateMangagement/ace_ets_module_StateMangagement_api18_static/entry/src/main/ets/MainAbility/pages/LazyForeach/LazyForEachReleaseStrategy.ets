'use static'
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

import { Entry, Component, Column, Text, List, ListItem, LazyForEach, IDataSource, DataChangeListener, DataOperation,DataDeleteOperation, DataOperationType, Button, ClickEvent, LazyForEachReleaseStrategy, Scroller } from '@ohos.arkui.component';
import { State, PropRef } from '@ohos.arkui.stateManagement';
import hiTraceMeter from '@ohos.hiTraceMeter';

export class BasicDataSource implements IDataSource<string> { // IDataSource强制要求声明<T>类型
  private listeners: Array<DataChangeListener> = [];
  private originDataArray: Array<string> = [];

  public totalCount(): int {
    return this.originDataArray.length;
  }

  public getData(index: int): string {
    return this.originDataArray[index];
  }

  notifyDataChange(index: int): void {
    this.listeners.forEach(listener => {
      listener.onDataChange(index);
    })
  }

  registerDataChangeListener(listener: DataChangeListener): void {
    if (this.listeners.indexOf(listener) < 0) {
      this.listeners.push(listener);
    }
  }

  unregisterDataChangeListener(listener: DataChangeListener): void {
    const pos = this.listeners.indexOf(listener);
    if (pos >= 0) {
      this.listeners.splice(pos, 1);
    }
  }

  // 通知LazyForEach组件需要重载所有子组件
  notifyDataReload(): void {
    this.listeners.forEach(listener => {
      listener.onDataReloaded();
    });
  }

  notifyDatasetChange(operations: DataOperation[]): void {
    this.listeners.forEach(listener => {
      listener.onDatasetChange(operations);
    });
  }
}

export class TestDataSource extends BasicDataSource {
  private dataArray: Array<string> = [];

  public totalCount(): int {
    return this.dataArray.length;
  }

  public getData(index: int): string {
    return this.dataArray[index];
  }

  public pushData(data: string): void {
    this.dataArray.push(data);
  }

  public changeData(index: int, data: string): void {
    this.dataArray[index] = data;
    this.notifyDataChange(index);
  }

  public modifyAllData(): void {
    this.dataArray = this.dataArray.map((item: string) => {
      return 'Changed ' + item;
    });
    this.notifyDataReload();
  }

  // 删除数据
  public deleteData(index: int, count: int): void {
    this.dataArray.splice(index, count);
    this.notifyDatasetChange([
      { type: DataOperationType.DELETE, index: index, count: count } as DataDeleteOperation
    ]);
  }
}

@Entry
@Component
struct LazyForEachPage {
  @State data: TestDataSource = new TestDataSource();
  scroller: Scroller = new Scroller();
  @State h: number = 50

  aboutToAppear() {
    for (let i = 0; i < 5000; i++) {
      this.data.pushData(`lazy ${i}`);
    }
  }

  build() {
    Column() {
      Button('ScrollToIndex 20')
        .onClick(() => {
          this.scroller.scrollToIndex(20); // 滑动场景
        })
        .height(20)

      Button('modifyAllData')
        .onClick(() => {
          this.data.modifyAllData(); //
        })
        .height(20)

      Button('deleteData(0, 5)')
        .onClick(() => {
          this.data.deleteData(0, 5); //
        })
        .height(20)

      Button('height(50)')
        .onClick(() => {
          this.h = 50
        })
        .height(20)

      Button('height(20)')
        .onClick(() => {
          this.h = 20
        })
        .height(20)

      List({ scroller: this.scroller }) {
        LazyForEach(this.data, (item: string, index: int) => {
          ListItem(undefined) {
            ChildNode({ item: item, h: this.h }).borderWidth(1)
          }
        }, (item: string, index: int) => {
          return `__${item}`;
        }, {releaseStrategy: LazyForEachReleaseStrategy.PROGRESSIVE})
      }.cachedCount(5)
      .height(50)
      .borderWidth(1)
      .id('LazyForEach_Item_0')

      List({ scroller: this.scroller }) {
        LazyForEach(this.data, (item: string, index: int) => {
          ListItem(undefined) {
            ChildNode({ item: item, h: this.h }).borderWidth(1)
          }
        }, (item: string, index: int) => {
          return `__${item}`;
        }, {releaseStrategy: LazyForEachReleaseStrategy.BATCH})
      }.cachedCount(5)
      .height(50)
      .borderWidth(1)
      .id('LazyForEach_Item_1')
    }
  }
}

@Component
struct ChildNode {
  @PropRef item: string = ''
  @PropRef h: number;

  aboutToAppear() {
    console.log(`jyy Item: ${this.item} appeare`);
  }

  aboutToDisappear() {
    hiTraceMeter.startTrace('aboutToDisappear', 1024)
    console.log(`jyy Item: ${this.item} disappeared with delay`);
    hiTraceMeter.finishTrace('aboutToDisappear', 1024)
  }

  build() {
    Text(`${this.item}`)
      .fontSize(20)
      .width('50%')
      .height(this.h)
  }
}
