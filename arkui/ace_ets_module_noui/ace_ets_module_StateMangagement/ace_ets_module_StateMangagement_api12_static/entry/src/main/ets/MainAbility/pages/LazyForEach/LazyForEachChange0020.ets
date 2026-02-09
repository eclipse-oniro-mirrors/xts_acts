'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
  Scroller,
  Color,
  BarState,
  Alignment,
  Margin,
  Reusable,
  DataChangeOperation
} from '@ohos.arkui.component'
import {
  State,
  Watch,
  Link,
  StorageLink,
  PropRef
} from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';
interface Dta {
  type: DataOperationType
  index: number
  key: string
}
class BasicDataSourceChange0020 implements IDataSource<string> {
  private listeners: DataChangeListener[] = [];
  private originDataArray: string[] = [];

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

class MyDataSourceChange0020 extends BasicDataSourceChange0020 {
  public dataArray: string[] = [];

  public totalCount(): int {
    return this.dataArray.length;
  }

  public getData(index: int): string {
    return this.dataArray[index as int];
  }

  public pushData(data: string): void {
    this.dataArray.push(data);
  }

  public changeData(index: int, data: string): void {
    this.dataArray.splice(index, 1, data);
    let dat: DataChangeOperation = { type: DataOperationType.CHANGE, index: index, key: String(index) }
    let dta: DataOperation[] = [dat]
    this.notifyDatasetChange(dta);
  }
}

@Entry
@Component
struct LazyForEachChange0020 {
  private data: MyDataSourceChange0020 = new MyDataSourceChange0020();
  @State message: string = 'change'

  aboutToAppear() {
    for (let i = 0; i <= 2; i++) {
      this.data.pushData(`Hello ${i}`)
    }
    let uiContext = this.getUIContext();
    try {
      let router = uiContext.getRouter();
      AppStorage.setOrCreate<Router>('LazyForEachChange0020', router);
    } catch (error: Error) {
      console.log('error ' + error);
    }
  }

  build() {
    Column() {
      Button('CHANGE')
        .id('btnChange0020')
        .height('5%')
        .onClick((e: ClickEvent) => {
          this.data.changeData(1, 'HelloWorld')
          this.message = this.data.dataArray[1]
        })
      List() {
        LazyForEach(this.data, (item: string) => {
          ListItem() {
            Row() {
              Text(item)
                .fontSize(9)
            }
          }
        }, (item: string) => item)
      }.cachedCount(5)
    }
  }
}