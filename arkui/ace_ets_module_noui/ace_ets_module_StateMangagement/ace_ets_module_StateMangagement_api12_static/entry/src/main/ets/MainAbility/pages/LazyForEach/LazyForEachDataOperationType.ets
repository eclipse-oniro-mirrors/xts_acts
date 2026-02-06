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
  Scroller,
  Color,
  BarState,
  Alignment,
  Margin,
  Reusable,
  DataAddOperation,
  DataExchangeOperation,
  DataDeleteOperation
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
  count: number
}
interface Start {
  start: number
  end: number
}
interface Dta2 {
  type: DataOperationType
  index: Start
}
class BasicDataSource implements IDataSource<string> {
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

class MyDataSource extends BasicDataSource {
  public dataArray: string[] = [];

  public totalCount(): int {
    return this.dataArray.length;
  }

  public getData(index: int): string {
    return this.dataArray[index as int ];
  }

  public addData(index: int): void {
    this.dataArray.splice(index, 0, 'Hello A');
    let dat: DataAddOperation = {type: DataOperationType.ADD, index: index,count:1}
    let dta: DataOperation[] = [dat]
    this.notifyDatasetChange(dta);
    console.log("=====================================this.totalCount() " + this.totalCount());
  }
  public DeleteData(index: int): void {
    this.dataArray.splice(index, 1);
    let dat1: DataDeleteOperation = {type: DataOperationType.DELETE, index: index,count:1}
    let dta1: DataOperation[] = [dat1]
    this.notifyDatasetChange(dta1);
    this.totalCount()
  }
  public ExChangeData(): void {
    let temp = this.dataArray[1];
    this.dataArray[1] = this.dataArray[2];
    this.dataArray[2] = temp
    let dat2: DataExchangeOperation = {type: DataOperationType.EXCHANGE, index: {start:1,end:2 }}
    let dta2: DataOperation[] = [dat2]
    this.notifyDatasetChange(dta2);
  }
  public pushData(data: string): void {
    this.dataArray.push(data);
  }

}

@Entry
@Component
struct LazyForEachDataOperationType {
  private data: MyDataSource = new MyDataSource();
  @State message:string=''
  @State message1:string=''
  @State length1: number = 0
  aboutToAppear() {
    for (let i = 0; i <= 2; i++) {
      this.data.pushData(`Hello ${i}`)
    }
    let uiContext = this.getUIContext();
    try {
      let router = uiContext.getRouter();
      AppStorage.setOrCreate<Router>('CombinationState2', router);
    } catch (error) {
      console.log('error ' + error);
    }
  }

  build() {
    Column() {
      Text('Text:'+ this.message1)
        .id('DataOperationType_0')
      Text('Length:'+ this.length1)
        .id('DataOperationType_1')
      Button('ADD')
        .id('DataOperationType_2')
        .onClick((e: ClickEvent) => {
          this.data.addData(0)
          this.length1 = this.data.dataArray.length
        })
      Button('DELETE')
        .id('DataOperationType_3')
        .onClick((e: ClickEvent) => {
          this.data.DeleteData(0)
          this.length1 = this.data.dataArray.length
        })
      Button('EXCHANGE')
        .id('DataOperationType_4')
        .onClick((e: ClickEvent) => {
        this.data.ExChangeData()
          this.message1=this.data.dataArray[1]
      })
      List() {
        LazyForEach(this.data, (item: string,index:int) => {
          ListItem() {
            Row() {
              Text(item)
                .id('indexA'+index)
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