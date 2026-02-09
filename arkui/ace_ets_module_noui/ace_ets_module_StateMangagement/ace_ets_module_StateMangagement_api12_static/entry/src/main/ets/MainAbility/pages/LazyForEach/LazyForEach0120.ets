'use static';
/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import {
  Entry,
  Column,
  Component,
  Button,
  ClickEvent,
  ForEach,
  Text,
  Row,
  List,
  ListItem,
  DataChangeListener,
  DataOperation,
  LazyForEach,
  IDataSource,
  DataOperationType,
  DataAddOperation,
  DataExchangeOperation
} from '@ohos.arkui.component'
import {
  State,
  Watch,
  Link,
  StorageLink
} from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';
interface Dta {
  type: DataOperationType
  index: number
  count: number
  key: string[]
}
interface Index1 {
  start: number
  end: number
}
interface Key1 { start: string, end: string }
interface Dta1 {
  type: DataOperationType
  index: Index1
  key: Key1
}
class BasicDataSource0120 implements IDataSource<string> {
  private listeners: DataChangeListener[] = new Array<DataChangeListener>();
  private originDataArray: string[] = new Array<string>();

  public totalCount(): int {
    return 0;
  }

  public getData(index: int): string {
    return this.originDataArray[index as int];
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
  public dataArray: string[] = new Array<string>();

  public totalCount(): int {
    return this.dataArray.length;
  }

  public getData(index: int): string {
    return this.dataArray[index as int];
  }

  public addData(index: int, count: int, key: Array<string>): void {
    this.dataArray.splice(index, 0, 'HelloA');
    let dat: DataAddOperation = {
      type: DataOperationType.ADD,
      index: index,
      count: count,
      key: key
    }
    let dta: DataOperation[] = [dat]
    this.notifyDatasetChange(dta);
  }

  public ExChangeData(): void {
    let temp = this.dataArray[1];
    this.dataArray[1] = this.dataArray[2];
    this.dataArray[2] = temp
    let dat1: DataExchangeOperation = {
      type: DataOperationType.EXCHANGE,
      index: { start: 1, end: 2 },
      key: { start: 'key0120_1', end: 'key0120_2' }
    }
    let dta1: DataOperation[] = [dat1]
    this.notifyDatasetChange(dta1);
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
    let uiContext = this.getUIContext();
    try {
      let router = uiContext.getRouter();
      AppStorage.setOrCreate<Router>('LazyForEach0120', router);
    } catch (error) {
      console.log('error ' + error);
    }
  }

  build() {
    Column() {
      Button('ADD')
        .id('LazyForEach0120_1')
        .height('5%')
        .onClick((e: ClickEvent) => {
          this.data.addData(0, 1, ['addKey1'])
        })
      Button('EXCHANGE')
        .id('LazyForEach0120_2')
        .height('5%')
        .onClick((e: ClickEvent) => {
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