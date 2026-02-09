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
  Column,DataOperationType,
  Component,DataChangeOperation,DataMoveOperation,DataExchangeOperation,DataReloadOperation,
  Button,BarState,DataAddOperation,DataDeleteOperation,
  ClickEvent,List,Alignment,Color,ListItem,LazyForEach,
  ForEach,FlexWrap,FlexDirection,
  Text,DataOperation,TextAlign,Reusable,
  IDataSource,DataChangeListener,Scroller,Flex,
  ReuseObject
} from '@ohos.arkui.component'
import {
  State,
  Watch,Param,
  Link,Monitor,Trace,ObservedV2,Event,
  StorageLink,IMonitor,IMonitorValue,Local,AppStorage
} from '@ohos.arkui.stateManagement'

class BasicDataSourceInterface implements IDataSource<string> {
  private listeners: DataChangeListener[] = [];
  private dataArray: string[] = [];

  public getData(index: int): string {
    return this.dataArray[index as int ];
  }

  public totalCount(): int {
    return this.dataArray.length;
  }

  public totalArray(): string[] {
    return this.dataArray;
  }

  pushData(data: string): void {
    this.dataArray.push(data)
    this.notifyDataReload()
  }

  public deleteData(index: int): void {
    this.dataArray.splice(index, 1);
    this.notifyDataDelete(index );
  }

  public moveData(from: int, to: int): void {
    let temp: string = this.dataArray[from as int];
    this.dataArray[from as int] = this.dataArray[to as int];
    this.dataArray[to as int ] = temp;
    this.notifyDataMove(from, to);
  }



  public operateData(): void {
    console.info(`[${this.dataArray.join(', ')}]`);
    this.dataArray.splice(4, 0, this.dataArray[1]);
    this.dataArray.splice(1, 1);
    let temp = this.dataArray[4];
    this.dataArray[4] = this.dataArray[6];
    this.dataArray[6] = temp;
    this.dataArray.splice(8, 0, 'Hello 1', 'Hello 2');
    this.dataArray.splice(12, 2);
    console.info(`[${this.dataArray.join(', ')}]`);
    this.notifyDatasetChange([
      { type: DataOperationType.MOVE, index: { from: 1, to: 3 } } as DataMoveOperation,
      { type: DataOperationType.EXCHANGE, index: { start: 4, end: 6 } } as DataExchangeOperation,
      { type: DataOperationType.ADD, index: 8, count: 2 } as DataAddOperation,
      { type: DataOperationType.DELETE, index: 10, count: 2 } as DataDeleteOperation]);
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
    });
  }

  notifyDataAdd(index: int): void {
    this.listeners.forEach(listener => {
      listener.onDataAdd(index );
    });
  }

  notifyDataChange(index: int): void {
    this.listeners.forEach(listener => {
      listener.onDataChange(index );
    });
  }

  notifyDataDelete(index: int): void {
    this.listeners.forEach(listener => {
      listener.onDataDelete(index );
    });
  }

  notifyDataMove(from: int, to: int): void {
    this.listeners.forEach(listener => {
      listener.onDataMove(from, to);
    });
  }

  notifyDatasetChange(operations: DataOperation[]): void {
    this.listeners.forEach(listener => {
      listener.onDatasetChange(operations);
    });
  }
}


@Entry
@Component
struct LazyForEachInterface {
  @State data: BasicDataSourceInterface = new BasicDataSourceInterface();
  @State switch1:boolean = true
  scroller: Scroller = new Scroller()
  @State parentInfo: string = 'parentInfo';
  static { AppStorage.setOrCreate('reuseCount', 0) }

  aboutToAppear(): void {
    for (let i = 1; i <= 50; i++) {
      this.data.pushData(i.toString());
    }
  }

  build() {
    Column() {
      Flex({ direction: FlexDirection.Row, wrap: FlexWrap.Wrap }) {
        Button('switch')
          .id('switch')
          .height('5%')
          .padding(5)
          .fontSize(12)
          .onClick(():void => {
            this.switch1 = !this.switch1
          })
        Button('pushData')
          .id('pushData')
          .height('5%')
          .padding(5)
          .fontSize(12)
          .onClick(():void => {
            for (let i = 1; i <= 15; i++) {
              this.data.pushData((this.data.totalCount() + 1).toString());
            }
          })
        Button('deleteData')
          .id('deleteData')
          .height('5%')
          .padding(5)
          .fontSize(12)
          .onClick(():void => {
            this.data.deleteData(2)
          })
        Button('moveData')
          .id('moveData')
          .height('5%')
          .padding(5)
          .fontSize(12)
          .onClick(():void => {
            this.data.moveData(2, 0)
          })
        Button('operateData')
          .id('operateData')
          .height('5%')
          .padding(5)
          .fontSize(12)
          .onClick(():void => {
            this.data.operateData()
          })

      }
      Text(this.parentInfo).id('interfaceInfo')
      if(this.switch1){
        List({ space: 3, initialIndex: 0 ,scroller:this.scroller}) {
          LazyForEach(this.data, (item: string, index: int) => {
            ListItem() {
              ChildViewShow({ message: item,childInfo:this.parentInfo})
            }
          }, (item: string, index: int) => item + index )
        }
        .width('100%')
        .layoutWeight(1)
        .divider({ strokeWidth: 1, color: Color.Gray })
        .scrollBar(BarState.Off)
        .align(Alignment.Center)
      }
    }
  }
}

@Reusable
@Component
struct ChildViewShow {
  @State message: string = '';
  @Link childInfo: string;

  aboutToReuse(params: ReuseObject) {
    console.info('aboutToReuse Child')
    console.log("================================== " + JSON.stringify(params));
    setTimeout(() => {
 	  	this.childInfo = 'aboutToReuse'
 	  }, 0);
 	  	this.message = String (params['message'])
 	}

  aboutToRecycle(): void {
 	  console.info('Recycle Child')
 	  setTimeout(() => {
 	  	this.childInfo = 'aboutToRecycle'
 	  }, 0);
 	}

  build() {
    Column() {
      Text(this.message)
        .id(this.message)
        .width('100%')
        .height('5%')
        .textAlign(TextAlign.Center)
    }
    .borderWidth(2)
  }
}