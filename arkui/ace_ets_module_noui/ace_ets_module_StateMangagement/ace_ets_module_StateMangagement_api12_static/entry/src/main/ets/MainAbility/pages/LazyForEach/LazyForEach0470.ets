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
  ListItem,Scroller,
  Color,HorizontalAlign,DataChangeListener,IDataSource,LazyForEach,
  FlexAlign,ComponentV2,TabsController,Tabs
} from '@ohos.arkui.component'
import {
  State,
  Watch,
  Link,Local,
  StorageLink,ObservedV2,Trace,Param,Event
} from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
class BasicDataSource0470 implements IDataSource<string> {
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

class LazyForEachData0470 extends BasicDataSource0470 {
  public dataArray: string[] = new Array<string>();

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
    let temp: string = this.dataArray[from as int];
    this.dataArray[from as int] = this.dataArray[to as int];
    this.dataArray[to as int] = temp;
    this.notifyDataMove(from, to);
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
struct LazyForEach0470 {
  @Local private oneSource: LazyForEachData0470 = new LazyForEachData0470()
  @Local private twoSource: LazyForEachData0470 = new LazyForEachData0470()
  private scroller: Scroller = new Scroller()
  private swipeStartIndex: int = -1

  aboutToAppear(): void {
    for (let i = 0; i < 50; i++) {
      this.oneSource.pushData('OneItem' + i)
      this.twoSource.pushData('TwoItem' + i)
    }
    let uiContext = this.getUIContext();
    try {
      let router = uiContext.getRouter();
      AppStorage.setOrCreate<Router>('LazyForEach0470', router);
    } catch (error: Error) {
      console.log('error ' + error);
    }
  }

  build() {
    Column() {
      Column() {
        Row() {
          Button('DelOne0')
            .id('btnDelOne0')
            .width('10%')
            .height('3%')
            .fontSize(9)
            .onClick((e: ClickEvent) => {
              this.oneSource.deleteData(0)
            })
          Button('DelTwo49')
            .id('btnDelTwo49')
            .width('10%')
            .height('3%')
            .fontSize(9)
            .onClick((e: ClickEvent) => {
              this.twoSource.deleteData(49)
            })
          Button('DelOne9')
            .id('btnDelOne9')
            .width('10%')
            .height('3%')
            .fontSize(9)
            .onClick((e: ClickEvent) => {
              this.oneSource.deleteData(9)
            })
        }

        Row() {
          Button('InsertOne0')
            .id('btnInsertOne0')
            .width('10%')
            .height('3%')
            .fontSize(9)
            .onClick((e: ClickEvent) => {
              this.oneSource.addData(0, 'HelloOne0')
            })
          Button('InsertTwo49')
            .id('btnInsertTwo49')
            .width('10%')
            .height('3%')
            .fontSize(9)
            .onClick((e: ClickEvent) => {
              this.twoSource.addData(49, 'HelloTwo49')
            })
          Button('InsertOne9')
            .id('btnInsertOne9')
            .width('10%')
            .height('3%')
            .fontSize(9)
            .onClick((e: ClickEvent) => {
              this.oneSource.addData(9, 'HelloOne9')
            })
        }

        Row() {
          Button('MakeOne0')
            .id('btnMakeOne0')
            .width('10%')
            .height('3%')
            .fontSize(9)
            .onClick((e: ClickEvent) => {
              this.oneSource.changeData(0, 'HelloWorldOne0')
            })
          Button('MakeTwo49')
            .id('btnMakeTwo49')
            .width('10%')
            .height('3%')
            .fontSize(9)
            .onClick((e: ClickEvent) => {
              this.twoSource.changeData(49, 'HelloWorldTwo49')
            })
          Button('MakeOne9')
            .id('btnMakeOne9')
            .width('10%')
            .height('3%')
            .fontSize(9)
            .onClick((e: ClickEvent) => {
              this.oneSource.changeData(9, 'HelloWorldOne9')
            })
        }

        Row() {
          Button('Swipe to Top')
            .id('btnSwipeTop')
            .width('10%')
            .height('3%')
            .fontSize(9)
            .onClick((e: ClickEvent) => {
              let rect = this.scroller.getItemRect(this.swipeStartIndex ) // Get child components size and position
              this.scroller.scrollToIndex(0); // Slide to the specified index
              this.scroller.scrollBy(0, -rect.y); // Slide a specified distance
            })

          Button('Swipe to Bottom')
            .id('btnSwipeBottom')
            .width('10%')
            .height('3%')
            .fontSize(9)
            .onClick((e: ClickEvent) => {
              let rect = this.scroller.getItemRect(this.swipeStartIndex ) // Get child components size and position
              this.scroller.scrollToIndex(this.oneSource.totalCount() - 1 + this.twoSource.totalCount() -
                1); // Slide to the specified index
              this.scroller.scrollBy(0, -rect.y); // Slide a specified distance
            })
        }
      }

      List({ scroller: this.scroller }) {
        ListItem() {
          Text('Header1')
            .height('3%')
            .fontSize(9)
        }

        ListItem() {
          Text('Header2')
            .height('3%')
            .fontSize(9)
        }

        LazyForEach(this.oneSource, (item: string) => {
          ListItem() {
            Text(item)
              .height('3%')
              .fontSize(9)
          }
        }, (item: string) => item)
        LazyForEach(this.twoSource, (item: string) => {
          ListItem() {
            Text(item)
              .height('3%')
              .fontSize(9)
          }
        }, (item: string) => item)
        ListItem() {
          Text('Footer1')
            .height('3%')
            .fontSize(9)
        }

        ListItem() {
          Text('Footer2')
            .height('3%')
            .fontSize(9)
        }
      }
      .layoutWeight(1)
      .onScrollIndex((start: int, end: int):void => {
        this.swipeStartIndex = start
      })
    }
  }
}