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
  NodeContainer,
  ListScroller,
  Builder,
  wrapBuilder,
  DataReloadOperation
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
import { BuilderNode, NodeController, FrameNode } from '@ohos.arkui.node';
import common from '@ohos.app.ability.common';

interface Type1 {type: DataOperationType}

class BasicDataSourceB implements IDataSource<string> {
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

class MyDataSourceB extends BasicDataSourceB {
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

  public reloadData(): void {
    let typeA: DataReloadOperation = {type: DataOperationType.RELOAD}
    let typeAry: DataOperation[] =[typeA]
    this.notifyDatasetChange(typeAry);
  }

  public modifyAllData(): void {
    this.dataArray = this.dataArray.map((item: string) => {
      return item + '0';
    })
  }
}

@Entry
@Component
struct MyLazyReload {
  private data: MyDataSourceB = new MyDataSourceB();
  @State message: string ='reload'

  aboutToAppear() {
    for (let i = 0; i <= 2; i++) {
      this.data.pushData(`Hello ${i}`)
    }
    let uiContext = this.getUIContext();
    try {
      let router = uiContext.getRouter();
      AppStorage.setOrCreate<Router>('lazyReload', router);
    } catch (error: Error) {
      console.log('error ' + error);
    }
  }

  build() {
    Column() {
      Text('reload: '+ this.message)
        .id('reload_Data')

      Button('RELOAD')
        .id('reload_Type')
        .onClick((e: ClickEvent) => {
          this.data.modifyAllData();
          this.data.reloadData();
          this.message = this.data.dataArray[1]
        })

      List() {
        LazyForEach(this.data, (item: string, index: int) => {
          ListItem() {
            Row() {
              Text(item)
                .fontSize(9)
                .onAppear(() => {
                  console.info("appear:" + item)
                })
            }
          }

        }, (item: string) => item)
      }.cachedCount(5)
    }
  }
}