'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import {
  Entry,
  Column,
  Component,
  Button,
  ClickEvent,
  ForEach,
  Text,
  Row,LazyForEach,
  List,IDataSource,DataChangeListener,Repeat,RepeatItem,
  ListItem,Divider,Alignment,BarState,RouteType,
  Color,Scroll,PageTransitionEnter,PageTransitionExit,
  FlexAlign,ComponentV2,TabsController,Tabs
} from '@ohos.arkui.component'
import {
  State,Provider,
  Watch,Param,
  Link,Monitor,Trace,ObservedV2,Event,Consumer,
  StorageLink,IMonitor,IMonitorValue,Local
} from '@ohos.arkui.stateManagement'

class BasicDataSource implements IDataSource<number> {
  private listeners: DataChangeListener[] = [];
  private originDataArray: Array<number> = [];

  public totalCount(): int {
    return 0;
  }

  public getData(index: int): number {
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

  notifyDataReload(): void {
    this.listeners.forEach(listener => {
      listener.onDataReloaded();
    })
  }

  notifyDataAdd(index: int): void {
    this.listeners.forEach(listener => {
      listener.onDataAdd(index );
    })
  }

  notifyDataChange(index: int): void {
    this.listeners.forEach(listener => {
      listener.onDataChange(index );
    })
  }

  notifyDataDelete(index: int): void {
    this.listeners.forEach(listener => {
      listener.onDataDelete(index );
    })
  }

  notifyDataMove(from: int, to: int): void {
    this.listeners.forEach(listener => {
      listener.onDataMove(from, to);
    })
  }
}

export default class NumberDataSource extends BasicDataSource {
  public dataArray: Array<number> = [];

  public totalCount(): int {
    return this.dataArray.length;
  }

  public getData(index: int): number {
    return this.dataArray[index as int];
  }

  public addData(index: int, data: number): void {
    this.dataArray.splice(index, 0, data);
    this.notifyDataAdd(index );
  }

  public pushData(data: number): void {
    this.dataArray.push(data);
  }

  public moveData(from: int, to: int): void {
    let temp: number = this.dataArray[from as int];
    this.dataArray[from as int] = this.dataArray[to as int];
    this.dataArray[to as int] = temp;
    this.notifyDataMove(from, to);
  }

  public moveDataWithoutNotify(from: int, to: int): void {
    let tmp = this.dataArray.splice(from, 1);
    this.dataArray.splice(to, 0, tmp[0])
  }

  public changeData(index: int, data: number): void {
    this.dataArray.splice(index, 1, data);
    this.notifyDataChange(index );
  }

  public deleteData(index: int): void {
    this.dataArray.splice(index, 1);
    this.notifyDataDelete(index );
  }

  public reloadData(): void {
    this.notifyDataReload();
  }
}

@Entry
@ComponentV2
struct RepeatLazyForEachNumber {
  @Local dataList: Array<string> = [];
  @Local dataSource: Array<NumberDataSource> = [
    new NumberDataSource,new NumberDataSource,new NumberDataSource,new NumberDataSource,new NumberDataSource,
    new NumberDataSource,new NumberDataSource,new NumberDataSource,new NumberDataSource,new NumberDataSource,
    new NumberDataSource,new NumberDataSource,new NumberDataSource,new NumberDataSource,new NumberDataSource,
    new NumberDataSource,new NumberDataSource,new NumberDataSource,new NumberDataSource,new NumberDataSource,
    new NumberDataSource,new NumberDataSource,new NumberDataSource,new NumberDataSource,new NumberDataSource,
    new NumberDataSource,new NumberDataSource,new NumberDataSource,new NumberDataSource,new NumberDataSource,
    new NumberDataSource,new NumberDataSource,new NumberDataSource,new NumberDataSource,new NumberDataSource,
    new NumberDataSource,new NumberDataSource,new NumberDataSource,new NumberDataSource,new NumberDataSource,
    new NumberDataSource,new NumberDataSource,new NumberDataSource,new NumberDataSource,new NumberDataSource,
    new NumberDataSource,new NumberDataSource,new NumberDataSource,new NumberDataSource,new NumberDataSource,
    new NumberDataSource,new NumberDataSource,new NumberDataSource,new NumberDataSource,new NumberDataSource,
    new NumberDataSource,new NumberDataSource,new NumberDataSource,new NumberDataSource,new NumberDataSource,
    new NumberDataSource,new NumberDataSource,new NumberDataSource,new NumberDataSource,new NumberDataSource,
    new NumberDataSource,new NumberDataSource,new NumberDataSource,new NumberDataSource,new NumberDataSource,
    new NumberDataSource,new NumberDataSource,new NumberDataSource,new NumberDataSource,new NumberDataSource,
    new NumberDataSource,new NumberDataSource,new NumberDataSource,new NumberDataSource,new NumberDataSource,
    new NumberDataSource,new NumberDataSource,new NumberDataSource,new NumberDataSource,new NumberDataSource,
    new NumberDataSource,new NumberDataSource,new NumberDataSource,new NumberDataSource,new NumberDataSource,
    new NumberDataSource,new NumberDataSource,new NumberDataSource,new NumberDataSource,new NumberDataSource,
    new NumberDataSource,new NumberDataSource,new NumberDataSource,new NumberDataSource,new NumberDataSource
  ]

  aboutToAppear(): void {
    for (let i = 0; i < 100; i++) {
      if (this.dataSource[i] === undefined) {
        this.dataSource[i] = new NumberDataSource();
      }

      this.dataList.push('Item' + i);

      if (i % 3 == 0) {
        this.dataSource[i].pushData(11111111);
      } else if (i % 3 == 1) {
        this.dataSource[i].pushData(22222222);
      } else {
        this.dataSource[i].pushData(33333333);
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
                Text(obj.item).id('repeat1_LN' + `${obj.index}`)
                  .fontSize(9)
                LazyForEach(this.dataSource[obj.index as int], (item: number, index: int):void => {
                  Text('' + item).id('lazyForeach1_LN' + `${obj.index}`)
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





