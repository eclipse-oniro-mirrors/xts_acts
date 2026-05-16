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
  Flex,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  Text,
  Button,
  FontWeight,
  ButtonType,
  ClickEvent,
  Margin,
  Color,
  Builder,
  Row,
  DataOperation,
  DataChangeListener,
  IDataSource,
  List,
  ListItem,
  LazyForEach,
  DataOperationType,
  DataChangeOperation
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';
class BasicDataSource implements IDataSource<string> {
  private listeners: DataChangeListener[] = [];
  private originDataArray: Array<string> = new Array<string>();

  public totalCount(): int {
    return 0;
  }

  public getData(index: int): string {
    return this.originDataArray[index.toInt()];
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
      listener.onDataAdd(index as int);
    })
  }

  notifyDataChange(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataChange(index as int);
    })
  }

  notifyDataDelete(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataDelete(index as int);
    })
  }

  notifyDataMove(from: number, to: number): void {
    this.listeners.forEach(listener => {
      listener.onDataMove(from as int, to as int);
    })
  }

  notifyDatasetChange(operations: DataOperation[]): void {
    this.listeners.forEach(listener => {
      listener.onDatasetChange(operations);
    })
  }
}

class MyDataSource extends BasicDataSource {
  private dataArray: Array<string> = new Array<string>();

  public totalCount(): int {
    return this.dataArray.length;
  }

  public getData(index: int): string {
    return this.dataArray[index.toInt()];
  }

  public addData(index: number, data: string): void {
    this.dataArray.splice(index as int, 0, data);
    this.notifyDataAdd(index);
  }

  public pushData(data: string): void {
    this.dataArray.push(data);
    this.notifyDataAdd(this.dataArray.length - 1);
  }

  public deleteData(index: number): void {
    this.dataArray.splice(index as int, 1);
    this.notifyDataDelete(index);
  }

  public changeData(index: number, data: string): void {
    this.dataArray.splice(index as int, 1, data);
    this.notifyDatasetChange([{index: index as int, type: DataOperationType.CHANGE} as DataChangeOperation]);
  }

  public modifyAllData(): void {
    this.dataArray = this.dataArray.map((item: string) => {
      return item + "0";
    })
  }

  public reloadData(): void {
    this.notifyDatasetChange([{type: DataOperationType.RELOAD}]);
  }
}


@Entry
@Component
struct MyComponent {
  private moved: Array<number> = new Array<number>() as Array<number>;
  private data: MyDataSource = new MyDataSource();
  @State value: string = ""

  aboutToAppear() {
    for (let i = 0; i <= 10; i++) {
      this.data.pushData(`Hello ${i}`)
    }
  }

  build() {
    Column(){
      Text(this.value).id("RELOADText")
      List({ space: 3 }) {
        LazyForEach(this.data, (item: string, index: int) => {
          ListItem() {
            Row() {
              Text(item).fontSize(50)
                .onAppear(() => {
                  this.value = "appear:" + item
                  console.info("appear:" + item)
                })
            }.margin({ left: 10, right: 10 } as Margin)
          }
          .id("DataOperationType")
          .onClick((e:ClickEvent) => {
            this.data.modifyAllData();
            this.data.reloadData();
          })
        }, (item: string, index:int) => item)
      }.cachedCount(5)
    }
  }
}