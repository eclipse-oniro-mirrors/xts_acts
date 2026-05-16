'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import {
  Entry,
  Column,DataOperationType,
  Component,DataChangeOperation,DataMoveOperation,DataExchangeOperation,DataReloadOperation,
  Button,BarState,DataAddOperation,DataDeleteOperation,
  ClickEvent,List,Alignment,Color,ListItem,LazyForEach,
  ForEach,FlexWrap,FlexDirection,MoveIndex,ComponentV2,
  Text,DataOperation,TextAlign,Reusable,Repeat,RepeatItem,FlexAlign,
  IDataSource,DataChangeListener,Scroller,Flex,Row
} from '@ohos.arkui.component'
import {
  State,
  Watch,Param,
  Link,Monitor,Trace,ObservedV2,Event,
  StorageLink,IMonitor,IMonitorValue,Local,AppStorage
} from '@ohos.arkui.stateManagement'
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

export default class StringDataSource extends BasicDataSource implements DataMoveOperation {
  public type: DataOperationType;
  public index: MoveIndex;
  public key?: string | undefined;

  constructor() {
    super();
    this.type = DataOperationType.MOVE;
    this.index = {
      from: 0, to: 0
    };
    this.key = 'move_0_0';
  }


  public dataArray: string[] = ['','','','','',''];

  public totalCount(): int {
    return this.dataArray.length;
  }

  public getData(index: int): string {
    return this.dataArray[index as int];
  }

  public addData(index: int, data: string): void {
    this.dataArray.splice(index, 0, data);
    this.notifyDataAdd(index );
  }

  public pushData(data: string): void {
    this.dataArray.push(data);
  }

  public moveData(from: int, to: int): void {
    let temp: string = this.dataArray[from];
    this.dataArray[from] = this.dataArray[to];
    this.dataArray[to] = temp;
    this.notifyDataMove(from, to);
    this.type = DataOperationType.MOVE;
    this.index.from = from;
    this.index.to = to;
    this.key = 'move_' + from + '_' + to;
  }

  public moveDataWithoutNotify(from: int, to: int): void {
    let tmp = this.dataArray.splice(from, 1);
    this.dataArray.splice(to, 0, tmp[0])
  }

  public changeData(index: int, data: string): void {
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
struct RepeatLazyForEachString {
  @Local dataList: Array<string> = [];
  @Local dataSource: Array<StringDataSource> = [
    new StringDataSource(),new StringDataSource(),new StringDataSource(),new StringDataSource(),new StringDataSource(),
    new StringDataSource(),new StringDataSource(),new StringDataSource(),new StringDataSource(),new StringDataSource()
  ]

  aboutToAppear(): void {
    for (let i = 0; i < 10; i++) {
      if (this.dataSource[i] === undefined) {
        this.dataSource[i] = new StringDataSource();
      }

      this.dataList.push('Item' + i);

      if (i % 3 == 0) {
        this.dataSource[i].pushData('Math Science Chinese English');
      } else if (i % 3 == 1) {
        this.dataSource[i].pushData('Math Science');
      } else {
        this.dataSource[i].pushData('Math Science PE');
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
                Text(obj.item).id('repeat_move' + `${obj.index}`)
                  .height('3%')
                  .fontSize(9)
                LazyForEach(this.dataSource[obj.index as int ], (item: string) => {
                  Text('' + item).id('lazyForeach_move' + `${obj.index}`)
                    .height('3%')
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

      Button('Move Data')
        .id('moveButton')
        .width('10%')
        .height('3%')
        .fontSize(9)
        .onClick(():void => {
          let lastIndex = this.dataSource.length - 1;
          this.dataSource[1].moveData(0, 1);
          let from = this.dataSource[1].index.from;
          let to = this.dataSource[1].index.to;
          let key = this.dataSource[1].key;
          let type = this.dataSource[1].type;
          this.dataList.push('Item' + (lastIndex + 1));
          this.dataSource.push(new StringDataSource());
          this.dataSource[this.dataSource.length-1].addData(0, from.toString() + to.toString() + key + type);
        })
    }
    .justifyContent(FlexAlign.Center)
  }
}