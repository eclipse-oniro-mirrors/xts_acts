'use static'
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
import {
  Entry,
  Component,
  Column,
  Text,
  Margin,
  ColumnOptions,
  ContentSlot,
  IDataSource,
  DataChangeListener,
  DataOperation,
  Visibility,
  Scroll,
  List,
  LazyForEach,
  Row,
  ListItem,
  Margin,
  Color
} from '@ohos.arkui.component'
import { CommonView } from '../componet/CommonView';
import { Content, NodeContent } from '@ohos.arkui.node';
import { State } from '@ohos.arkui.stateManagement';
import {LibUtil} from '../LibUtil'

class BasicDataSource implements IDataSource<string> {
  private listeners: DataChangeListener[] = [];
  private originDataArray: string[] = [];

  public totalCount(): Int {
    return 0;
  }

  public getData(index: Int): string {
    return this.originDataArray[index];
  }

  // 该方法为框架侧调用，为LazyForEach组件向其数据源处添加listener监听
  registerDataChangeListener(listener: DataChangeListener): void {
    if (this.listeners.indexOf(listener) < 0) {
      console.info('add listener');
      this.listeners.push(listener);
    }
  }

  // 该方法为框架侧调用，为对应的LazyForEach组件在数据源处去除listener监听
  unregisterDataChangeListener(listener: DataChangeListener): void {
    const pos = this.listeners.indexOf(listener);
    if (pos >= 0) {
      console.info('remove listener');
      this.listeners.splice(pos, 1);
    }
  }

  // 通知LazyForEach组件需要重载所有子组件
  notifyDataReload(): void {
    this.listeners.forEach(listener => {
      listener.onDataReloaded();
    })
  }

  // 通知LazyForEach组件需要在index对应索引处添加子组件
  notifyDataAdd(index: Int): void {
    this.listeners.forEach(listener => {
      listener.onDataAdd(index);
    })
  }

  // 通知LazyForEach组件在index对应索引处数据有变化，需要重建该子组件
  notifyDataChange(index: Int): void {
    this.listeners.forEach(listener => {
      listener.onDataChange(index);
    })
  }

  // 通知LazyForEach组件需要在index对应索引处删除该子组件
  notifyDataDelete(index: Int): void {
    this.listeners.forEach(listener => {
      listener.onDataDelete(index);
    })
  }

  // 通知LazyForEach组件将from索引和to索引处的子组件进行交换
  notifyDataMove(from: Int, to: Int): void {
    this.listeners.forEach(listener => {
      listener.onDataMove(from, to);
    })
  }

  notifyDatasetChange(operations: DataOperation[]): void {
    this.listeners.forEach(listener => {
      listener.onDatasetChange(operations);
    })
  }
}

class MyDataSource extends BasicDataSource {
  private dataArray: string[] = [];

  public totalCount(): Int {
    return this.dataArray.length;
  }

  public getData(index: Int): string {
    return this.dataArray[index];
  }

  public addData(index: Int, data: string): void {
    this.dataArray.splice(index, 0, data);
    this.notifyDataAdd(index);
  }

  public pushData(data: string): void {
    this.dataArray.push(data);
    this.notifyDataAdd(this.dataArray.length - 1);
  }
}
@Entry
@Component
struct TestLazyForEachExpandMode009 {
  PAGE_TAG: string = 'TestLazyForEachExpandMode009';
  @State vis: Visibility = Visibility.Visible
  @State isShow: boolean = true
  private data: MyDataSource = new MyDataSource();
  private data1: MyDataSource = new MyDataSource();
  @State arr: string[] = [] as string[];
  private index_: Int = 0
  libUtil:LibUtil = new LibUtil();
  rootSlot: Content = new NodeContent() as Content;

  aboutToAppear() {
    for (let i = 0; i <= 10; i++) {
      this.data.pushData(`Hello${i}`)
    }
    for (let i = 0; i <= 10; i++) {
      this.data1.pushData(`TTT${i}`)
    }
    for (let i = 0; i <= 10; i++) {
      this.arr.push(`World${i}`)
    }
    this.libUtil.testLazyForEachExpandMode009(this.rootSlot);
  }

  build() {
    Scroll() {
      Column() {
        Column() {
          Scroll() {
            Column() {
              List({ space: 3 }) {
                LazyForEach(this.data1, (item1: string) => {
                  ListItem() {
                    Row() {
                      Text(item1).fontSize(20).id(item1)
                        .onAppear(() => {
                          console.info('appear:' + item1)
                        })
                    }.margin({ left: 10, right: 10 } as Margin)
                  }.id('ListAItem_' + item1)
                }, (item1: string) => item1)
              }
              .margin(8)
              .id('ListA')
              .borderWidth(2)
              .cachedCount(2)
              .height(105)
            }
          }.scrollBarColor(Color.Transparent)
        }
        .width('100%')
        .height('50%')
        .backgroundColor(Color.Gray)
        Column() {
          CommonView({
            pageTag: this.PAGE_TAG,
            rootSlot:this.rootSlot
          })
        }.height('50%')
      }
      .width('100%')
      .height('100%')
    }.scrollBarColor(Color.Transparent)
  }
}